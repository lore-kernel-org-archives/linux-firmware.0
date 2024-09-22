Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273FFCF9C7F
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E7B1C4CEC4; Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 087A2C4CED8;
	Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036274;
	bh=kCekqG2YMV0v07m8C5Hg2auqDomfxzL6gZ4BPGuBcBQ=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=HiCri7rYAXRv9qaqnGEcKaneD4R6V4WGq5AZLfgWKamDbIENa6NvcUc6cKBdd9Bjs
	 vF/Iu8yADg+Mom1F4qDGqa9ayBpdshWmSpuliEJ3nyagbt06826TSpVv1dw+j7rDol
	 QuvT9VIig+/CkEj+DvhLxJLKH2K9tVYhgglNpkm85HyvoggcX4ibTkZl0wATt9Tfo+
	 uFEH4CahRWaTdFkkvBG0O0cLSoA0TEnM7o+GondpWaeBV8rPQpFbGPoJ4KSNsqAmOD
	 vbA8aaxKh6ortHDKU6mI8Hn5HOkAkupJzd36AgQjEoaJMMsi1i9aaeteHT/L1hv5ir
	 Da8d27TusB6aQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02184CF9C79;
	Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:50 +0100
Subject: [PATCH 15/16] copy-firmware.sh: rename variables in symlink
 hanlding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-15-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=1507;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=Lwbfw1gfw57DT39acdMAoSlHSzYFoe0hiVfBm47rRQE=;
 b=5S+QE7TLkEggvb4+g4QfA3IJ98KNZBUC1YqoAzpUmPJ/J5t8fEBgXIo/Ocm8C71NdtfmdZcQ4
 T8DHrMbldkCB9wlPfwVrgRMIGCE/WSLVABOLDWkrweeB6UIHrPiuyVi
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Currently we use f(ile) and d(irectory), over the more common ones t(arget) and
l(ink). Rename things appropriately.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 8de3774153d783d6a79443aa789f03da5f04b2c7..7713328a15dcce5f6136ee8e3c0bad045ae9101f 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -80,16 +80,16 @@ grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g'
 done
 
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
-grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
-    directory="$destdir/$(dirname "$f")"
+grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read l t; do
+    directory="$destdir/$(dirname "$l")"
     install -d "$directory"
-    target="$(cd "$directory" && realpath -m -s "$d")"
+    target="$(cd "$directory" && realpath -m -s "$t")"
     if test -e "$target"; then
-        $verbose "creating link $f -> $d"
-        ln -s "$d" "$destdir/$f"
+        $verbose "creating link $l -> $t"
+        ln -s "$t" "$destdir/$l"
     else
-        $verbose "creating link $f$compext -> $d$compext"
-        ln -s "$d$compext" "$destdir/$f$compext"
+        $verbose "creating link $l$compext -> $t$compext"
+        ln -s "$t$compext" "$destdir/$l$compext"
     fi
 done
 

-- 
2.46.1


