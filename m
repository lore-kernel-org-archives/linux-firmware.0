Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA40CCF9C70
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2273C4CEC4; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C417C4CEDB;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036273;
	bh=ObukuOjiqo0iqNVDmyqI0oCu1OWdXW1Q5gCcWQzzl4I=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=m4c/kOApfYGy3zBHmUtNf67h/fNrGbzUWNB8xltT1H2vgmKbvZ0YQAvUnmtkrkSmz
	 0EuxUjY2IGCr7SOzgXscueiIAnR8Ps/Vq52IeOViEqec8A4UGrsZzkgHMqz8VyHc91
	 CsWp2ApMKLDn9iUvivNpDx9P1fUwzOtSDJe/ajrV1HCGWAgdHq+lcoYdypQhSMfNGV
	 GLJnrWURkVtpuqVss0/W1Qb8+MWRsKgupldiB9AH7H1GSrZQArP02Ta4EY3ibV4bcA
	 Hs8FY6eq0dEGMiFr5EDEKQXiH1OPn9dXcNAQgRRvWSGcnIOzwmAyQBQY5Up449K+qW
	 8X4PVlJoaPdeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C91CF9C6D;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:43 +0100
Subject: [PATCH 08/16] Revert "copy-firmware: Support additional compressor
 options"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-8-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Juerg Haefliger <juerg.haefliger@canonical.com>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=1377;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=uKcSV4YdwVinyW5T4fyiK7n8r68VrubCm2yqPycfyws=;
 b=RqIF9CxL42ZSNoIrDqUlv3LPcGB7/BO/Pqvq0xEqQl8ubU49BbboYBQE595X4TIjuqmLY3Ydp
 8MBWFK3tvp4BEtt6cSR6nve48KdpcOMhTm9ZQlrsA9Uv5mrtahyCknZ
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

In practise you'd want to use ZSTD_CLEVEL and ZSTD_NBTHREADS for zstd as
documented in man(1)zstd it allows for up-to level 19, which is fined since the
kernel does not support higher levels.

Arch, Alpine and likely other distributions have been using this since day one.

The other compressors like xz have equivalent environment variables.

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


