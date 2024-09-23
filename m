Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EDFCF9C7A
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5705C4AF0E; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94382C4AF0B;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096983;
	bh=HUiHd215sJ4tiRuV5Os7+5P6j/URZFJn8SFMVlvFC3w=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=G476Oz7WV+Z4vYT1xo6iH8iyIvhu+3QCJHEwlEmAiLyCdIHvSjOWQ1mVAzupFtqMs
	 BfJDxtNftfvJgGb85aaYfkud6DdUGP2vx/o9KiTV5gxLXDizISrNDpUk5g09rDUeLj
	 mEP0boj5igNvELBDtjYEuP1T7KTstyxxRI/rEZJAdFXH8jBtD7BQw/n3NfpgLI6Rc/
	 x37Fek2UfhBggT40yf3QtqhjtT5sSGV6KHR1Ngw2v6M35gZz4XGyqXqzUrRsJWWeP2
	 WIWB+tkae1XlD6xe0tlciZzkGAM7BupFNCLRAaZJ5PFFxAp8qM3Kv1qy4x7Cvyh9pE
	 hf9ShEKGhq/Bg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72870CF9C79;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 23 Sep 2024 14:09:37 +0100
Subject: [PATCH v2 09/16] copy-firmware.sh: reset and consistently handle
 destdir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-misc-fixes-v2-9-397f23443628@gmail.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=1306;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=UVkupopnR361tFh5PRnEldcqkJUyBqzhIYg5b+Y+tiY=;
 b=bEjMLniJQxAyhV0QjYZtRm9RDAN33D33wNA85AWF5npQ4+beAbqcDXoCpg4hb8H6hGprsM9ly
 hhKmdooPRi3DfsXk7pm+aOk502NjW3Hk6RipRXlfVoUGyOjgad0/czj
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Currently we don't reset/override the destdir variable, so we end up inheriting
whatever the caller's environment has for it. While it may work, it's not
particularly consistent (be that within the script or other tools) nor is it
obvious.

While in here, ensure we handle the variable with test -z/-n instead of varying
other constructs.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 21ed20d5886fe71588b923914265f992cf5c29b0..65a1b39b93293d1f876ea0cd2991e811247e9ecd 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -9,6 +9,7 @@ prune=no
 # shellcheck disable=SC2209
 compress=cat
 compext=
+destdir=
 
 while test $# -gt 0; do
     case $1 in
@@ -45,7 +46,7 @@ while test $# -gt 0; do
             ;;
 
         *)
-            if test "x$destdir" != "x"; then
+            if test -n "$destdir"; then
                 echo "ERROR: unknown command-line options: $*"
                 exit 1
             fi
@@ -56,7 +57,7 @@ while test $# -gt 0; do
     esac
 done
 
-if [ -z "$destdir" ]; then
+if test -z "$destdir"; then
 	echo "ERROR: destination directory was not specified"
 	exit 1
 fi

-- 
2.46.1


