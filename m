Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1BDCF9C7B
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DC4BBC4CEDF; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6807C4CED2;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036273;
	bh=KT7DEahXq0Wp2xwi46SOTpPuaqpNRyYXqrSNuTV02QM=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=IrI0PpSE3xv7YaeIsxbwhyhKCZZF/F+GIpFfCceL4xbTSdyWfpAYpe7ALrSnNBhvC
	 hwe7I2vs+AvLMnieXIcLGIg5QcnBvZpTiNwOym5CwFiMPHGnfAag+hYvAbShz9qIWt
	 tZ/FvcnjsjZwxQI3D/QxgmKf3IYY5lzmawvVIJ6JzZQVy45BHEWcMs4nlZo+l2UVjY
	 tGGTyFhjiFpwQYJRkY5evv+P8MT1EJM00SOznYtWeMpgce1LcseiaBViH41oM8/gJP
	 aRYTibGV5prWgwDNxVZdIE2MN8RpGT9NzV1mlDuAjrSuZsDK3NPat/D+PmN5CFgXNa
	 pmVCoIlJe4pYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB01DCF9C6D;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:46 +0100
Subject: [PATCH 11/16] copy-firmware.sh: warn if the destination folder is
 not empty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-11-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=1132;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=FpS17/OqKat6PLGck0ZbQlIe9L7HVVTzBwCJ1Wi0jZE=;
 b=PxnqTIJFf142W8cXglmcY+1+Mt9+rrnfD3xJWLel8G+e8W/I+3R3Nw+zsbtOkq3s+1g9nVZ83
 h0G+yPofh65CgYyulC9sM1Yg7sXpmh8cmj/VLut5C9Qf3MZmwZj6C90
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

If the user provides their existing /usr/lib/firmware/ there is a high chance
we'll overwrite existing files. That may or may not be what they wanted.

Throw a warning about it.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index f59d8403ab3f4c6928f6976069c134dfb98b1246..dc959cbad3be3e79a1174afd0ff68b8d6c0567a5 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -15,6 +15,10 @@ err() {
     exit 1
 }
 
+warn() {
+    echo "WARNING: $*"
+}
+
 while test $# -gt 0; do
     case $1 in
         -v | --verbose)
@@ -62,6 +66,10 @@ if test -z "$destdir"; then
     err "destination directory was not specified"
 fi
 
+if test -d "$destdir"; then
+    find "$destdir" -type d -empty >/dev/null && warn "destination folder is not empty."
+fi
+
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g' | while read k f; do
     test -f "$f" || continue

-- 
2.46.1


