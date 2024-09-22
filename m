Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180FFCF9C7D
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B5C5C4CEDC; Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E89D0C4CED1;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036273;
	bh=cxvld4e3r2pAbs7MAihsGnyjuy69bLK0eVIrNVkFH5g=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=tg/pqEb6953yKFYgDJv6RQuqW0V3wlCAfaYIc+xhsLDOkCVLZaXBXiWiMQgJJrjcc
	 4+yprgIsKRiLL8k+YP8ObJSPPsomjNLkP9yc8JbQKJP9Fuaof8jZu7BzDx0FDqooJN
	 VqkfJZAKFujJ3GsqWTrwbZ5NK37oETb7qJ6ZaL4r9cada7Y8pFWJA25GLHBRzZxHBH
	 Y2pYtFwiV3symOqQkamd7KacKI/iots7DR46V/cy0NEtyORFHuawJ4Fyj2JWAWpB+2
	 fWQiLf0nvMOvwa9UF6hDH7UbOlhytP1B+obJe0pPthG3LMiB05iDiDhxi3g+8B3x+7
	 s6gk6TEGMl7Sw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCEDCF9C6D;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:48 +0100
Subject: [PATCH 13/16] copy-firmware.sh: remove no longer reachable test -f
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-13-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=919;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=t8fMalUkOjIwVjj7TfNU6qNxywuo+7I6qOlYq5VYSx4=;
 b=gZ3n93HLYXpuw9326PL76Fz9Jb5Bi64hD4so/Kat7LLRpC3ZhSRCcCrbH1fZoKWvJVnp6+b/u
 6Y98bwJKvNUDRKNByToc/qlHHNDVO3z8CB8jrZn/Px1UVOPAKqLPadj
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

With previous commit we call check_whence.py, which ensures that all files
listed are available. Drop the now dead code test -f.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index ff3124d9d055f1f72351f472609d0158bd91dfb7..d1d526f43d2c71a5f1456ed6c09ed94a73a1229e 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -75,7 +75,6 @@ $verbose "Checking that WHENCE file is formatted properly"
 
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g' | while read k f; do
-    test -f "$f" || continue
     install -d "$destdir/$(dirname "$f")"
     $verbose "copying/compressing file $f$compext"
     if test "$compress" != "cat" && test "$k" = "RawFile"; then

-- 
2.46.1


