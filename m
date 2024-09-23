Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D26CF9C69
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C46C3C4CEE6; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CB43C4CEDE;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096983;
	bh=QRGL1udGShpjR8R55yA3DhNL1QMB2g95B8irQC/wYN8=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=jMVZHWIuOehhE0TssG+tGTRXnn7Hkap5A8q1rNCgK7H9GyMCHV0oVZdYSKnnlhc6R
	 hKGPuP2PHG0VO7tzL3VOxrzRQpw1maq2mEs8YtBFzarwNYqcR38LxuHHD1e4ozqI5p
	 qHchoPRIHksIgh7UAHdxNszisSjTU3Eu01KzUdIwhs4KielIT0hkWb59lNFiv5eg01
	 kONtpHt/kfGG7fHSAGZGLiyszH1+AvNM0RtqY7G/trdEA88Zl/GIExDfttncL3thG4
	 DBaey4Axf/9+0UtI+mCBLBPdxR4yx8oVxU7Kbdo32cm9Exg6uk/9N+qnTsf1CTXgzc
	 l09s0pMWzSwZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811B3CF9C6F;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 23 Sep 2024 14:09:38 +0100
Subject: [PATCH v2 10/16] copy-firmware.sh: fix indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-misc-fixes-v2-10-397f23443628@gmail.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=989;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=+r5WUVjJ+XuyJapH4H1mtRiqcqINneESKVagNaYTEaA=;
 b=wLzMK8FyFj3WDGVvkP9C0C/IAStNUSCkflVnArIVYOnS6ur8ajLONbBGDq4ybuCruKtt+UHQe
 fp/7HbAaP5YD/zheVwAsB5V3q/XC7W3gPF1QyGu7GXbxpRV1xaqbes0
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 65a1b39b93293d1f876ea0cd2991e811247e9ecd..f83b4775cd2ce873b0f6fa76c4d61df3bcf1b5df 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -58,8 +58,8 @@ while test $# -gt 0; do
 done
 
 if test -z "$destdir"; then
-	echo "ERROR: destination directory was not specified"
-	exit 1
+    echo "ERROR: destination directory was not specified"
+    exit 1
 fi
 
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
@@ -115,9 +115,9 @@ done
 
 # Verify no broken symlinks
 if test "$(find "$destdir" -xtype l | wc -l)" -ne 0 ; then
-        echo "ERROR: Broken symlinks found:"
-        find "$destdir" -xtype l
-        exit 1
+    echo "ERROR: Broken symlinks found:"
+    find "$destdir" -xtype l
+    exit 1
 fi
 
 exit 0

-- 
2.46.1


