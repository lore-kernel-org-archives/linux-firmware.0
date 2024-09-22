Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4D9CF9C76
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D504C4CEDC; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70DECC4CED5;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036273;
	bh=DTwEcIVZSUgGda1GqDbPTj2Dvcq/OAJsRBDAnHDIZAs=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=QnGeMH5gVIy94nMF0B0+mc9p0+PAX14iORordo9R9U1T/sdTF4nkSaIhoUPQlZ9C2
	 MV90xRU92IUO+FZpwAuvp2XdU+gysVNCbtrgAEW/NoRc+unrs0/ABSAnYuFx5JVDec
	 5pqUK9ZzmynxXhHUMHWv4YqCNPa+CNKURe9N7UyAjUwAuxp4jXPOTyZT5WBiZ/d/HJ
	 7jl0NselAA/p3SGV/xnMRX+jBjt6AAtAkHzboCW8NLWrqyhl1aVOa6S2h2kSLmAEbt
	 UzZbNOR/4oo+Bs4wdsrHNzq2vjkDaBI6O8/YsfbC5JXmWuhUPZVQEWWGdsrsgMOaJs
	 XJz4I8sDFyhdA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6796BCF9C64;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:41 +0100
Subject: [PATCH 06/16] Style update yaml files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-6-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=2390;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=D3r7VDxVgMX1puFG4ztKGYc90o6Oa/2niv3K/sqOewM=;
 b=3dOEmjZYKNEPukdPIJ8rvTnegqR63Nq+Ift8fXbJ335of/UgsY4X/2W8pu6ZizSCGzQASKcLj
 kPcZslIIbOUBIFBYyXpR2wz2f0WMvkjKJQz6MzIfsedL7+U/i2aCgqT
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 .gitlab-ci.yml          |  2 +-
 .pre-commit-config.yaml | 38 +++++++++++++++++++-------------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ae96f7d859fc34ebc74c93a93993f623e05d78a2..e05ef3bb81c8f15049a3b068daac9fff35184d17 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -11,7 +11,7 @@ check-commits:
   stage: test
   image: registry.gitlab.com/kernel-firmware/linux-firmware
   rules:
-   - if: $CI_MERGE_REQUEST_ID
+    - if: $CI_MERGE_REQUEST_ID
   script:
     - ci-fairy check-commits --signed-off-by --textwidth=0
 
diff --git a/.pre-commit-config.yaml b/.pre-commit-config.yaml
index 7a49d063250e755b531059fe24b5a571d311005f..370a2970616bda3a340ebe523cd2ee2bb57759c1 100644
--- a/.pre-commit-config.yaml
+++ b/.pre-commit-config.yaml
@@ -1,30 +1,30 @@
 default_stages: [commit]
 repos:
--   repo: https://github.com/pre-commit/pre-commit-hooks
+  - repo: https://github.com/pre-commit/pre-commit-hooks
     rev: v4.0.1
     hooks:
-    -   id: check-executables-have-shebangs
-    -   id: forbid-new-submodules
-    -   id: check-yaml
-    -   id: check-symlinks
-    -   id: destroyed-symlinks
--   repo: https://github.com/shellcheck-py/shellcheck-py
+      - id: check-executables-have-shebangs
+      - id: forbid-new-submodules
+      - id: check-yaml
+      - id: check-symlinks
+      - id: destroyed-symlinks
+  - repo: https://github.com/shellcheck-py/shellcheck-py
     rev: v0.9.0.5
     hooks:
-    -   id: shellcheck
--   repo: https://github.com/ambv/black
+      - id: shellcheck
+  - repo: https://github.com/ambv/black
     rev: 22.6.0
     hooks:
-    - id: black
--   repo: https://github.com/igorshubovych/markdownlint-cli
+      - id: black
+  - repo: https://github.com/igorshubovych/markdownlint-cli
     rev: v0.33.0
     hooks:
-    - id: markdownlint
-      args: ['--fix']
--   repo: local
+      - id: markdownlint
+        args: ['--fix']
+  - repo: local
     hooks:
-    - id: check-whence
-      name: Check whence
-      files: 'WHENCE'
-      language: script
-      entry: ./check_whence.py
+      - id: check-whence
+        name: Check whence
+        files: 'WHENCE'
+        language: script
+        entry: ./check_whence.py

-- 
2.46.1


