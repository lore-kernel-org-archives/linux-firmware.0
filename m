Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FC2C83005
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1363AC433A0; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F154EC4331F;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696979;
	bh=bOdi0stFuN9H42vL31/g0G5SnykFHAe0WM+USiXQL7o=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=l4zq2UJR5JJyEVpefSAQOv3XqU3916BD1rxQBMYQmlM3/3GNfjBUGaSQzxgfxtVNn
	 bQeQe/uI3TiM77/AeMh3edn1n+BvsRCABMn/+ofh7NRnjG042XlJs4pBv05iP7ekTN
	 IM6emJU7r8qpCYAsAB7j5SRuRxcAYVRwNaaqSIN/550yGjNyjFqkTKfSzbcOyqYXZA
	 ypMxDs9CCi95vEmwY7MQ1iWDC+iwV51fdaztrDZPm2/shQrMTcfCLjd7fpbs0ukWzA
	 VDS8r0EmMmRo+A2woD5JPfKc0uV8xR6U3t6EpEK+oHE4Wjlfp7gRJQyVJSCJk371tV
	 43QlnHxvcYYWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BE2C7EE43;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:24 +0000
Subject: [PATCH RESEND v2 10/16] check_whence: error if symlinks are
 in-tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-10-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=2491;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=TDRX1rTSLi9ZIfkbg2hlz0zLxWY1jhNr+LbgA2nv804=;
 b=ACfNK2R00ga7yN9M09wriaGCnjr2U1f/H2D0TirjzXBk2RoS34mvxbVAVFPkvIjZsLdKI8GFE
 5vQ9W/KGdhSBoR/hV9bgfgBkyLBCf6RNCL9mzNLhX5Fn8qy58bII5t5
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

Currently we have no symlinks in-tree. Add a simple check, ensuring they
don't get added in the future.

This allows us to remove the clunky symlink checking code in
copy-firmware.sh

v2:
 - tweak helper to produce link and target (based off Adam's patch)

Cc: Adam Sampson <ats@offog.org>
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Adam, you should be able to use this helper with your fixes.

Note that symlinks should not point to another symlink, so you might
want to tweak your patch to check and error out in such cases.

HTH o/
---
 check_whence.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/check_whence.py b/check_whence.py
index 92b104e..f94037d 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -32,6 +32,23 @@ def list_whence_files():
                 yield match.group(1).replace("\ ", " ")
                 continue
 
+def list_links_list():
+    with open('WHENCE', encoding='utf-8') as whence:
+        for line in whence:
+            match = re.match(r'Link:\s*(.*)', line)
+            if match:
+                linkname, target = match.group(1).split("->")
+
+                linkname = linkname.strip().replace("\ ", " ")
+                target = target.strip().replace("\ ", " ")
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
@@ -41,6 +58,7 @@ def main():
     ret = 0
     whence_list = list(list_whence())
     whence_files = list(list_whence_files())
+    links_list = list(list_links_list())
     known_files = set(name for name in whence_list if not name.endswith('/')) | \
                   set(['check_whence.py', 'configure', 'Makefile',
                        'README', 'copy-firmware.sh', 'WHENCE'])
@@ -61,6 +79,10 @@ def main():
                          name)
         ret = 1
 
+    for name in set(link[0] for link in links_list if os.path.islink(link[0])):
+        sys.stderr.write('E: %s listed in WHENCE as Link, is in tree\n' % name)
+        ret = 1
+
     for name in sorted(list(known_files - git_files)):
         sys.stderr.write('E: %s listed in WHENCE does not exist\n' % name)
         ret = 1

-- 
2.39.2

