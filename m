Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F68CF9C7C
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9184CC4CEDC; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E590C4CED8;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096983;
	bh=5oty5BI0e5pDXmhR9NvUu5fcgg09jWTlaEnepGg2qCQ=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=ipFZE7JN8PLhQ+JM46XQlYbJV72XzC4Ru/0bkB8RdxnMOhF6VIJ22B/5MqMLbZ680
	 +G7Pglf33HMaJ7YM6N6RDdb9JsJV/p5xJ+tOrWrlg9nkJ2ToSpcbuXZ5JhWc9QeLO7
	 S7KBDGSb11EDctzALNQXpudKkSQMcFVt0Cn7te6EF5/lTK/lNAG29H4dTj56PcE5Pw
	 c7KOYcvI1wLrPenrYWGwMXNiweMSARy3Rkevdu4e/0T3Go+xTjd+wWG6n5GkU8HF5J
	 cjnmY+JZsmHTx48tZdwWkStHMSQbX8R+zBVi03BJSdsXXUnfzuukD4sEIAVcXcShGy
	 wEqAbR6h3y0uQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2D0CF9C74;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 23 Sep 2024 14:09:33 +0100
Subject: [PATCH v2 05/16] editorconfig: add initial config file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-misc-fixes-v2-5-397f23443628@gmail.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=1431;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=7nXGnViA4hCUNMSGxxwriz54l/lbiqgNNrjlTL3v8V0=;
 b=a4DDBPmUlpNsZmNU5/Y5M/X3lxAiKdkajwVtMvESVZtaT3puT/61x8xtxGckON2NH1XB3EXkr
 lAvgEG4Hu23CfAsk+T3X5ja4GPdlGwP0PL1XLoFjGvMIpG5QZwPm9Pe
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

It's a simple format handled by practically every supported platform or program
out there.

Add an initial configuration file, so we reduce the style variation of the files
in-tree.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 .editorconfig   | 21 +++++++++++++++++++++
 check_whence.py |  1 +
 2 files changed, 22 insertions(+)

diff --git a/.editorconfig b/.editorconfig
new file mode 100644
index 0000000000000000000000000000000000000000..100bbcebaac4514cb2b8377c1e0b98f0c6964d9b
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
+max_line_length = 90
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


