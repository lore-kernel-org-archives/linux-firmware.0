Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C09CF9C7E
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6180C4AF09; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8657CC4CED9;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096983;
	bh=N/RbeQeL0phNyWx4sr4I+dYeC15FA+8BK33Tm7DcnUE=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=tbrktEkI44p9KEM2ILLr8+7IeBmIMWcI/ZmYb7GKWn9unAJOIjU4y+wBYoGKcGFvP
	 3RNoUSD722dueIsMDpslQq+P/fDhx3fEf1LfleEv7su2ZbdJagEDf6MtuglP35zy+a
	 hHHTH/OORgS3fRHf18jwnl+MT4gcA8rzNBcu3I0zrxjVcIxWe9q2N+ZqXAKizPKaLj
	 Lcc2ewfkOEiQ6X5xFCm3eFEzxK2kZ9Q9W9Kf60VqGf6eTx+Zg4vPBGZFI4VVxgBRTY
	 JK3PgM/H1sPgDQ/W9BXq/H3udXmTGKxIzYF12J3yLMtmdNwO/JS96CptKIUZPcKO3y
	 hPK30Xz4aRIKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AAECF9C72;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 23 Sep 2024 14:09:36 +0100
Subject: [PATCH v2 08/16] Revert "copy-firmware: Support additional
 compressor options"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-misc-fixes-v2-8-397f23443628@gmail.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Juerg Haefliger <juerg.haefliger@canonical.com>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=1362;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=iRKIMyz4ufu7c2aKu9PXL7X97R+u9oj8I+WBz/xsAo8=;
 b=kYKHT9wIK3mpUebzgu4kNtInfEaQ54vmbiSLhmtXn3tNIuzNSSEPX/ws8SaRLo/El3vR6R/pk
 B5FfIMiLlTrAU3v810qhXFX20HUZEv2wrZgMjdt8DnaDDMna4+06wnD
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

This reverts commit 2bad80e7edd3c0f84718545d9338c8edfed16513.

The commit effectively added accidental command injection, while it was aiming
to control the compression flags.

In practise you'd want to use ZSTD_CLEVEL and ZSTD_NBTHREADS for zstd. As
documented in zstd(1) it allows for up-to level 19, which is fine since the
kernel does not support higher levels.

Arch, Alpine and likely other distributions have been using this approach
since day one.

The other compressors like xz have equivalent.

Cc: Juerg Haefliger <juerg.haefliger@canonical.com>
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 344f478db74a7080b34c264645d6bcd9a80384a8..21ed20d5886fe71588b923914265f992cf5c29b0 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -44,14 +44,6 @@ while test $# -gt 0; do
             shift
             ;;
 
-        -*)
-            if test "$compress" = "cat"; then
-                echo "ERROR: unknown command-line option: $1"
-                exit 1
-            fi
-            compress="$compress $1"
-            shift
-            ;;
         *)
             if test "x$destdir" != "x"; then
                 echo "ERROR: unknown command-line options: $*"

-- 
2.46.1


