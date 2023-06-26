Return-Path: <SRS0=g2Nc=CO=offog.org=ats@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F583EB64D7
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Jun 2023 15:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CEC43C433C9; Mon, 26 Jun 2023 15:08:55 +0000 (UTC)
Received: from alt2.a-painless.mh.aa.net.uk (a-painless.mh.aa.net.uk [81.187.30.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 952C7C433C8
	for <linux-firmware@kernel.org>; Mon, 26 Jun 2023 15:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 952C7C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=offog.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=offog.org
Received: from cartman.offog.org ([2001:8b0:83b:b53f::a])
	by painless-a.thn.aa.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ats@offog.org>)
	id 1qDnpj-0007Cb-D1
	for linux-firmware@kernel.org; Mon, 26 Jun 2023 16:08:50 +0100
Received: from ats by cartman.offog.org with local (Exim 4.96)
	(envelope-from <ats@offog.org>)
	id 1qDnpW-00078v-1O;
	Mon, 26 Jun 2023 16:08:38 +0100
From: Adam Sampson <ats@offog.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Adam Sampson <ats@offog.org>
Subject: [PATCH v2 1/1] check_whence: Check link targets are valid
Date: Mon, 26 Jun 2023 16:08:22 +0100
Message-ID: <20230626150833.27414-1-ats@offog.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This should catch a couple of common errors: reversing the two arguments
to Link, and not making the second argument relative to the first.

Signed-off-by: Adam Sampson <ats@offog.org>
---
v2: rebase, as Emil's recent patches merged part of v1 anyway

 check_whence.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/check_whence.py b/check_whence.py
index 2e6950a8..d45d90f8 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -91,6 +91,24 @@ def main():
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
2.41.0

