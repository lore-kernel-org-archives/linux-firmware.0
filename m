Return-Path: <SRS0=Eztx=6M=offog.org=ats@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BBEC636CC
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Feb 2023 00:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 937FBC4339B; Thu, 16 Feb 2023 00:56:31 +0000 (UTC)
Received: from alt2.a-painless.mh.aa.net.uk (a-painless.mh.aa.net.uk [81.187.30.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9AA9BC433D2
	for <linux-firmware@kernel.org>; Thu, 16 Feb 2023 00:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9AA9BC433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=offog.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=offog.org
Received: from cartman.offog.org ([2001:8b0:83b:b53f::a])
	by painless-a.thn.aa.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ats@offog.org>)
	id 1pSSZV-000hzl-R4
	for linux-firmware@kernel.org; Thu, 16 Feb 2023 00:56:26 +0000
Received: from ats by cartman.offog.org with local (Exim 4.96)
	(envelope-from <ats@offog.org>)
	id 1pSSZL-0004x9-1V;
	Thu, 16 Feb 2023 00:56:15 +0000
From: Adam Sampson <ats@offog.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Adam Sampson <ats@offog.org>
Subject: [PATCH 1/2] check_whence: Check link targets are valid
Date: Thu, 16 Feb 2023 00:56:01 +0000
Message-Id: <20230216005602.18838-1-ats@offog.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This should catch a couple of common errors: reversing the two
arguments, and not making the second argument relative to the first.

Signed-off-by: Adam Sampson <ats@offog.org>
---
 check_whence.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/check_whence.py b/check_whence.py
index 8805e99..654ff59 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -28,6 +28,24 @@ def list_whence():
                         yield match.group(2)
                         continue
 
+def list_whence_links():
+    with open('WHENCE', encoding='utf-8') as whence:
+        for line in whence:
+            fields = line.rstrip()
+            match = re.match(r'Link:\s*(.*)', line)
+            if match:
+                linkname, target = match.group(1).split("->")
+
+                linkname = linkname.strip().replace('\\ ', ' ')
+                target = target.strip().replace('\\ ', ' ')
+
+                # Link target is relative to the link
+                target = os.path.join(os.path.dirname(linkname), target)
+                target = os.path.normpath(target)
+
+                yield (linkname, target)
+                continue
+
 def list_git():
     with os.popen('git ls-files') as git_files:
         for line in git_files:
@@ -36,6 +54,7 @@ def list_git():
 def main():
     ret = 0
     whence_list = list(list_whence())
+    links_list = list(list_whence_links())
     known_files = set(name for name in whence_list if not name.endswith('/')) | \
                   set(['check_whence.py', 'configure', 'Makefile',
                        'README', 'copy-firmware.sh', 'WHENCE'])
@@ -46,6 +65,24 @@ def main():
         sys.stderr.write('E: %s listed in WHENCE does not exist\n' % name)
         ret = 1
 
+    # A link can point to another link, or to a file...
+    valid_targets = set(link[0] for link in links_list) | git_files
+
+    # ... or to a directory
+    for target in set(valid_targets):
+        dirname = target
+        while True:
+            dirname = os.path.dirname(dirname)
+            if dirname == '':
+                break
+            valid_targets.add(dirname)
+
+    for name, target in sorted(links_list):
+        if target not in valid_targets:
+            sys.stderr.write('E: target %s of link %s in WHENCE'
+                             ' does not exist\n' % (target, name))
+            ret = 1
+
     for name in sorted(list(git_files - known_files)):
         # Ignore subdirectory changelogs and GPG detached signatures
         if (name.endswith('/ChangeLog') or
-- 
2.30.2

