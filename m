Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB4ECF9C74
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9199DC4CEDD; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55D76C4CED6;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096983;
	bh=vvveL+VhTvblJVkjiJCzcHg+zMGJWmO+/8yBPRzNC4s=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=SatXWsORJW8H/tRb3Wcxe+uRBIH4fxKYw15C2Xs4MDMSNmW9ZHGOnVf6VQwd/Afnd
	 jXnwXPIENEjaA6Rlip9Clr45OWbsY/vzv2XhUJuLYrAAcotrcjrF2gj8ED5EUzMrcT
	 mxqyvPQrmpJd1mBe+ltuBttWPz3Vc1RNCBaNSVEogIWpOAuMMBb3VhMSOzyKznreHW
	 ZdWIQxKG6DxjUODX60hyBCRShgoZpc2XLDF/x+jtYIFwGOBFuQx4DIu8jn1jNSzaYq
	 oF3utPZvmUK5D3KU32G5T1g48u6Ctpvy5Xnqpuwiu/mlb4CcSrk0UU+PHo6yvbZMjZ
	 qPOcjT3nBz7Yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24939CF9C69;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 23 Sep 2024 14:09:31 +0100
Subject: [PATCH v2 03/16] check_whence.py: LC_ALL=C sort -u the filelist
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-misc-fixes-v2-3-397f23443628@gmail.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=1536;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=vmlCVRJbxEfo1wLPvzNCwHFHCqtETXk1ay13BZyXJX0=;
 b=5eozgF/r2TDlM3mTVAQi7Pb1pH6pg5Z+8UIsJAEK6H4TUHpim6rSGOSjrZjxnY9WiSx5T2C8V
 ojxeJ9IP+zeARBuQQMqRdz1+zseXhsZo+xmybn70EA0f28BkGXcLmFL
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Sort the file list, so it's easier to manage.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 check_whence.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/check_whence.py b/check_whence.py
index d7742f1ed951acab6efc89916c7f6621ba56881b..dbbb68f7ab51b8db52c1d2334a6d4d20962bbef8 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -73,23 +73,23 @@ def main():
     whence_links = list(zip(*links_list))[0]
     known_files = set(name for name in whence_list if not name.endswith("/")) | set(
         [
-            ".gitignore",
             ".codespell.cfg",
+            ".gitignore",
             ".gitlab-ci.yml",
             ".pre-commit-config.yaml",
-            "build_packages.py",
-            "check_whence.py",
-            "configure",
+            "Dockerfile",
             "Makefile",
             "README.md",
-            "copy-firmware.sh",
             "WHENCE",
-            "Dockerfile",
+            "build_packages.py",
+            "check_whence.py",
+            "configure",
+            "contrib/process_linux_firmware.py",
             "contrib/templates/debian.changelog",
             "contrib/templates/debian.control",
             "contrib/templates/debian.copyright",
             "contrib/templates/rpm.spec",
-            "contrib/process_linux_firmware.py",
+            "copy-firmware.sh",
         ]
     )
     known_prefixes = set(name for name in whence_list if name.endswith("/"))

-- 
2.46.1


