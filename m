Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC83C87FDD
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F34CC43445; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 162BDC433EF;
	Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696979;
	bh=XsWOicGojaS73/tREUsBUY9lpjLvTg9VYYxZTCb7z3g=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=gFefodyg8BVe9njOdR+cun4d4dDloVIh9qiBo/MEAP8rG+6IB4FeCzuEIrijKMjBO
	 hZj/x4wzXMdGPqVxE360vBzFVLsyph6/PvwwRvPUGnDzSLRfLGcCXtVCvCJXm//36f
	 yvmAmBEyuGMXCfEB0o14S+aGXwA6XErNsTPGxB+tAjlZ/N3go8TEj3/uzoj3DU0DI+
	 4Op3yVEMVzRVrl5YyarGKAPwit1fXaEGqQxnbyQvUkjVFkaLP3Yyo5OT9SVkzkBOVA
	 GCgN1dxOY/5bPrS99BFdSRreaWUXrzQhKD+kBiXk6ZtZupgqKryqQq9Y0JDZxSHdHC
	 P1aczEGQW+MJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4C3C83005;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:25 +0000
Subject: [PATCH RESEND v2 11/16] copy-firmware: remove unreachable symlink
 workarounds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-11-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=2246;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=RL0zpnggXIgb9Xy5qAr/DytoDfNyL33IoJUaYjrhiP0=;
 b=pEEXp/3on07Bb85RWjExtvboH8jUoL8KCpf9KYwhr8/tAUiUYvTU2jKS1jyl3Ldah7IfX35n6
 aZ0UZDFvMsZCBsBFN5YMAzrMCphLNF+wAhsTODqK1CaMwsqkyuD7znp
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

There are no symlinks in-tree and the earlier commit to check_whence.py
ensures new ones don't get added. Thus we can remove the consistency
checks and pruning code.

With this done we can also drop:
 - the --force argument for ln
 - the prune argument and related handling

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 36 +++---------------------------------
 1 file changed, 3 insertions(+), 33 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index e3f3176..0132244 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -5,7 +5,6 @@
 #
 
 verbose=:
-prune=no
 
 while test $# -gt 0; do
     case $1 in
@@ -14,11 +13,6 @@ while test $# -gt 0; do
             shift
             ;;
 
-        -P | --prune)
-            prune=yes
-            shift
-            ;;
-
         *)
             if test "x$destdir" != "x"; then
                 echo "ERROR: unknown command-line options: $@"
@@ -38,33 +32,9 @@ grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
 done
 
 grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do
-    if test -L "$f"; then
-        test -f "$destdir/$f" && continue
-        $verbose "copying link $f"
-        install -d $destdir/$(dirname "$f")
-        cp -d "$f" $destdir/"$f"
-
-        if test "x$d" != "x"; then
-            target=`readlink "$f"`
-
-            if test "x$target" != "x$d"; then
-                $verbose "WARNING: inconsistent symlink target: $target != $d"
-            else
-                if test "x$prune" != "xyes"; then
-                    $verbose "WARNING: unneeded symlink detected: $f"
-                else
-                    $verbose "WARNING: pruning unneeded symlink $f"
-                    rm -f "$f"
-                fi
-            fi
-        else
-            $verbose "WARNING: missing target for symlink $f"
-        fi
-    else
-        $verbose "creating link $f -> $d"
-        install -d $destdir/$(dirname "$f")
-        ln -sf "$d" "$destdir/$f"
-    fi
+    $verbose "creating link $f -> $d"
+    install -d $destdir/$(dirname "$f")
+    ln -s "$d" "$destdir/$f"
 done
 
 exit 0

-- 
2.39.2

