Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E69CF9C75
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 80207C4CEDA; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66357C4CED4;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036273;
	bh=VU8SpJLWRURLJ/EY7K6uNmlO3MQcIplje3n/r46NHyc=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=g8cVhaceTuBcJm/T/5Awm8PTs0DhmzVuulHLr8Oks6J20/F/9jzhROrMYzOmKywoz
	 bgzT/6QnQP9m+j96aXRCDZj89KWP2OlTzweaSvpWW559Hg06cYNh5VSMVH04Uw4ZRk
	 cDBDFiAmgqIga4q5c9awBD6ofNOw3w650E/I/zrh5rrUkK0LFOM3hhGAm5R7bc7K+N
	 SPzeXgac4uPDCUjwDoGwj0hB10vwB44aWP/+5cJU3RDr1w4mocH0m+t1AE65OEICd1
	 9CDPcCwXsh0LnF6lKmlL4ydpDjdtfWKEIhMfswkaVW746ms6M0TuaEh7IdE/E4vyyd
	 1KPNTsBxxh3Tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E02FCF9C6D;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:40 +0100
Subject: [PATCH 05/16] editorconfig: add initial config file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-5-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=1450;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=QOHlBI2CZfjGlafZozbvBaFvhuBf7UyiCXDnO8wkb8g=;
 b=MhqZ0jcrNFDzohKn1O1plhr9Z5LylZ2y28Ah98aG/yI/WAhALgByrm1lAZCgP6ADAv55JRVDA
 YHM6ld9vMPJDW6xaoZE9ISfKZp58ckY4mde7ZoJw2eRMHFQARa6KPSW
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

It's a simple format supported by practically every supported platform or
program out there.

Add an initial configuration file, so we don't get notable style variations like
the ones we have in-tree.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 .editorconfig   | 21 +++++++++++++++++++++
 check_whence.py |  1 +
 2 files changed, 22 insertions(+)

diff --git a/.editorconfig b/.editorconfig
new file mode 100644
index 0000000000000000000000000000000000000000..2da3ba9694341dd4f1f5db9c3ad946ac96c5bdac
--- /dev/null
+++ b/.editorconfig
@@ -0,0 +1,21 @@
+# To use this config on you editor, follow the instructions at:
+# http://editorconfig.org
+
+root = true
+
+[*]
+charset = utf-8
+insert_final_newline = true
+tab_width = 8
+max_line_length = 80
+
+[Makefile]
+indent_style = tab
+
+[*.{sh,py}]
+indent_style = space
+indent_size = 4
+
+[*.{yml,yaml}]
+indent_style = space
+indent_size = 2
diff --git a/check_whence.py b/check_whence.py
index 64dc133551a68aeb24dbf7f02f617ea3913477b2..afe97a76cf5ed609117d07387a19c2092fa00c6c 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -74,6 +74,7 @@ def main():
     known_files = set(name for name in whence_list if not name.endswith("/")) | set(
         [
             ".codespell.cfg",
+            ".editorconfig",
             ".gitignore",
             ".gitlab-ci.yml",
             ".pre-commit-config.yaml",

-- 
2.46.1


