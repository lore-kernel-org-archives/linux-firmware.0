Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F077CF9C79
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11CB1C4CED4; Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F01D9C4CED3;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036274;
	bh=BLo6RjOZfJRd7YCfBozn8Pcfctdchj57R27dfodTc0w=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=VWT6+L0UCgfWHUMPdrwqQ2lsf9exbRfymNVJjrvorPg1GgR3TW3MWzNbN85ARpdyJ
	 GbKUTsQykUZmk3mP/ZP04oO4xMOXxqUKVv6H4yZOKsJPCSoGdjyzd9AFB8NfYWhOyR
	 1XNpzpeC83ygqUy1ASjs+E5hv6G6+VwXQJZ0o9zhVEsmaQJnhaTieEV6bHTRx1W3Po
	 xVTSNaY7L/28G6dop4271tTDaXJqsfrkxwOZBEFxiUc/sNUQP/5dtet9HOkgicIl7/
	 WfaKd/CP7FypPvEtV7z20I7ob1SXIqv+yWLIQ/fixzJ7Ac3zye8oTwen2jsFRZhd6M
	 StUF4atTS0MxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB761CF9C7C;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:49 +0100
Subject: [PATCH 14/16] copy-firmware.sh: remove no longer reachable test -L
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-14-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=2811;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=6JIJTB67rL7JBtr8PvNUbCbQP5/EbanpD2p2MG/PEYM=;
 b=pIeGFiqXAzHE/NrB7ROZwKJL5HHeZ6/M+I077rRoB5LYCslJ5PzCQkHdXtHAEOUoLa4hccuDl
 1sNpLTuFd8gD1ybUpjXrx8J2faVPR9/HL2gCjRyUvsFsXlqZTf4m3s6
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

The check_whence.py script ensures that links defined in WHENCE are not in-tree.
Since we're calling the script, we no longer need the convoluted path and
associated --prune tag.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 46 ++++++++--------------------------------------
 1 file changed, 8 insertions(+), 38 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index d1d526f43d2c71a5f1456ed6c09ed94a73a1229e..8de3774153d783d6a79443aa789f03da5f04b2c7 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -5,7 +5,6 @@
 #
 
 verbose=:
-prune=no
 # shellcheck disable=SC2209
 compress=cat
 compext=
@@ -27,11 +26,6 @@ while test $# -gt 0; do
             shift
             ;;
 
-        -P | --prune)
-            prune=yes
-            shift
-            ;;
-
         --xz)
             if test "$compext" = ".zst"; then
                 err "cannot mix XZ and ZSTD compression"
@@ -87,39 +81,15 @@ done
 
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
-    if test -L "$f$compext"; then
-        test -f "$destdir/$f$compext" && continue
-        $verbose "copying link $f$compext"
-        install -d "$destdir/$(dirname "$f")"
-        cp -d "$f$compext" "$destdir/$f$compext"
-
-        if test "x$d" != "x"; then
-            target="$(readlink "$f")"
-
-            if test "x$target" != "x$d"; then
-                $verbose "WARNING: inconsistent symlink target: $target != $d"
-            else
-                if test "x$prune" != "xyes"; then
-                    $verbose "WARNING: unneeded symlink detected: $f"
-                else
-                    $verbose "WARNING: pruning unneeded symlink $f"
-                    rm -f "$f$compext"
-                fi
-            fi
-        else
-            $verbose "WARNING: missing target for symlink $f"
-        fi
+    directory="$destdir/$(dirname "$f")"
+    install -d "$directory"
+    target="$(cd "$directory" && realpath -m -s "$d")"
+    if test -e "$target"; then
+        $verbose "creating link $f -> $d"
+        ln -s "$d" "$destdir/$f"
     else
-        directory="$destdir/$(dirname "$f")"
-        install -d "$directory"
-        target="$(cd "$directory" && realpath -m -s "$d")"
-        if test -e "$target"; then
-            $verbose "creating link $f -> $d"
-            ln -s "$d" "$destdir/$f"
-        else
-            $verbose "creating link $f$compext -> $d$compext"
-            ln -s "$d$compext" "$destdir/$f$compext"
-        fi
+        $verbose "creating link $f$compext -> $d$compext"
+        ln -s "$d$compext" "$destdir/$f$compext"
     fi
 done
 

-- 
2.46.1


