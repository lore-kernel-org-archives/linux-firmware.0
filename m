Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60C0CF9C78
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C953EC4CEDE; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3B95C4CED0;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036273;
	bh=Tra9g9JoJAgi05+oLmc6pRWVYAsrJ/27lr0BziDagu4=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=HPgK9BsZIXHIABQoclIdjufD8/WsQlry7KAcm/Qhf6West46ywI7P9mEqHs1Tlcrw
	 efepIBrd+vHTtnQc7oWjkMU4VLlq8M+1kO1zgXiEHv53CemEzFy7wbLNdtIZmqZXM0
	 8Vv25BqEemlU1i4pByBZsviaL9TOxg1Bp8rhg4Lnb+TmzUU0TOGGMeZg/QyJHzpw8q
	 DT7ApMO1r/Mk5yLR6Mf7WtzHcJpuMflwrd3R8TEHKVIxil3b0FjIPH8aIWNo5NP+yM
	 skjpDLKQJvvMmShxTd82+77YQK2IexF3G2l/Brsu6n6KEVxAvLR8q+a71PSggSx2y2
	 flyNt+h4zoOJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA58DCF9C78;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:45 +0100
Subject: [PATCH 10/16] copy-firmware.sh: add err() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-10-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=2187;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=EJ089N84vDRdbLAQhH8BQRLgcvQ7Br4Tp+pP9zwM87c=;
 b=dSQz5WRCq2SUhhkFcWy/Xb4ihMv9S9+y7oeySXT/f8oBL0rDX3MH1nIQ+EYKgYyK9IeHqaOHw
 FV3atA8aRcxA5H0B2yMMGAAYH2pT6PvLYVL+PMMQSZcMo3QLXoXCm5N
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index e46bb9926f86a813bc76f1da1604c1b7a4980848..f59d8403ab3f4c6928f6976069c134dfb98b1246 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -10,6 +10,11 @@ prune=no
 compress=cat
 compext=
 
+err() {
+    echo "ERROR: $*"
+    exit 1
+}
+
 while test $# -gt 0; do
     case $1 in
         -v | --verbose)
@@ -25,8 +30,7 @@ while test $# -gt 0; do
 
         --xz)
             if test "$compext" = ".zst"; then
-                echo "ERROR: cannot mix XZ and ZSTD compression"
-                exit 1
+                err "cannot mix XZ and ZSTD compression"
             fi
             compress="xz --compress --quiet --stdout --check=crc32"
             compext=".xz"
@@ -35,8 +39,7 @@ while test $# -gt 0; do
 
         --zstd)
             if test "$compext" = ".xz"; then
-                echo "ERROR: cannot mix XZ and ZSTD compression"
-                exit 1
+                err "cannot mix XZ and ZSTD compression"
             fi
             # shellcheck disable=SC2209
             compress="zstd --compress --quiet --stdout"
@@ -46,8 +49,7 @@ while test $# -gt 0; do
 
         *)
             if test "x$destdir" != "x"; then
-                echo "ERROR: unknown command-line options: $*"
-                exit 1
+                err "unknown command-line options: $*"
             fi
 
             destdir="$1"
@@ -57,8 +59,7 @@ while test $# -gt 0; do
 done
 
 if test -z "$destdir"; then
-    echo "ERROR: destination directory was not specified"
-    exit 1
+    err "destination directory was not specified"
 fi
 
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
@@ -114,9 +115,7 @@ done
 
 # Verify no broken symlinks
 if test "$(find "$destdir" -xtype l | wc -l)" -ne 0 ; then
-    echo "ERROR: Broken symlinks found:"
-    find "$destdir" -xtype l
-    exit 1
+    err "Broken symlinks found:\n$(find "$destdir" -xtype l)"
 fi
 
 exit 0

-- 
2.46.1


