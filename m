Return-Path: <SRS0=zT3G=GU=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE6CC433E0
	for <linux-firmware@archiver.kernel.org>; Sun, 17 Jan 2021 12:12:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EBB8422573; Sun, 17 Jan 2021 12:12:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801502253A;
	Sun, 17 Jan 2021 12:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 801502253A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-wm1-f47.google.com with SMTP id o10so4463799wmc.1;
        Sun, 17 Jan 2021 04:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vcZMAwxrwJw678dsY5+Ce2NBIdFRthqXAB7cepzJEsY=;
        b=tKq98Qm9/ND555pyU2IS+pXs7dSJO8obCGnTrJtXMPqgURJO3kvySX8HyO8afP3FxT
         gD3GXVapgoiGH2hUD9CGOyboZ2bjGfZghC7flwTx6CQXXX4YkYb0Ub7PMgG+TabbEKSV
         SLeIx0NbV0KN7+XnV/FR8SDrK8iq7/8OuWhsoyeyvuI1ZY63lfKKgVTSEIE6T8I2pCnR
         M7f1xE7Icr/llq+mGsTca0yhdTKZCL7vpTglCgaiiHaB43sA3kJdCtbeyb0Nwdt7KR4x
         yuQK59y73S/Ci6b1Eg9zjHkVJE4p4sJqJ3Ve2EY9Fl8ESA8ZSJdLrU9z2SqjQ6YVC9Bs
         /b9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vcZMAwxrwJw678dsY5+Ce2NBIdFRthqXAB7cepzJEsY=;
        b=gD2U0C22PItWoU3tDWfmhmOEMnBdCVbxKbTjsj2gZXmNfePSqwVSPz1R3RFN9lBaTk
         d0DxT1qw9tS2T7bysckfxGRnaqy6SSbuYsa9CK6TOMNKHV1bZdMNHvHSKvYSnccAQ0v3
         g12qmO9T5hBiCtLqHB4n/Eaki0HzJfro/VsnXjvWjkFluVrZ/3NJYlOdVLmif4MnNGIS
         qLlOYGlsR667GPF5hun8VOgOkT5cV7scxO9juxQg3mJm2YsHL2gjm4DUBclA20tXua1O
         nIQONmgj6gKR4aSlkeXqY6hY77otPzFKTPlAofb+QwFYtiLy/ilnO+oaXQ2agFwdNRU3
         igSw==
X-Gm-Message-State: AOAM533A80HkCSMisXm7U+1JE/oQnn52/Jg4hnVQ+3paXmWQo/jfptT7
	5rZEF0ZFjt9OTxLSuNX7NKrGhJxnJ8k66Q==
X-Google-Smtp-Source: ABdhPJxQeh9Moy+TrmDP1W+nGnlz2KgovVKPqtnhOQUN8vG+XgjBvGmhdZq/3gPkUcKudtlVX31asQ==
X-Received: by 2002:a05:600c:3548:: with SMTP id i8mr5413740wmq.104.1610885528061;
        Sun, 17 Jan 2021 04:12:08 -0800 (PST)
Received: from morpheus.home.roving-it.com (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
        by smtp.googlemail.com with ESMTPSA id h14sm22837889wrx.37.2021.01.17.04.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 04:12:07 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] Add support for compressing firmware in copy-firmware.sh
Date: Sun, 17 Jan 2021 12:11:52 +0000
Message-Id: <20210117121152.205990-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As of kernel 5.3 there's initial support for loading compressed firmware.
At this stage the only supported compression methis is "xz -C crc32" but
this option brings significant benefits.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 Makefile         |  4 ++++
 copy-firmware.sh | 47 +++++++++++++++++++++++++++++++----------------
 2 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/Makefile b/Makefile
index e1c362f..9a48471 100644
--- a/Makefile
+++ b/Makefile
@@ -11,3 +11,7 @@ check:
 install:
 	mkdir -p $(DESTDIR)$(FIRMWAREDIR)
 	./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
+
+installcompress:
+	mkdir -p $(DESTDIR)$(FIRMWAREDIR)
+	./copy-firmware.sh -C $(DESTDIR)$(FIRMWAREDIR)
diff --git a/copy-firmware.sh b/copy-firmware.sh
index 9b46b63..d154804 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -6,6 +6,7 @@
 
 verbose=:
 prune=no
+compress=no
 
 while test $# -gt 0; do
     case $1 in
@@ -19,6 +20,11 @@ while test $# -gt 0; do
             shift
             ;;
 
+        -C | --compress)
+            compress=yes
+            shift
+            ;;
+
         *)
             if test "x$destdir" != "x"; then
                 echo "ERROR: unknown command-line options: $@"
@@ -31,40 +37,49 @@ while test $# -gt 0; do
     esac
 done
 
+if test "x$compress" = "xyes"; then
+    cmpxtn=.xz
+    grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
+       test -f "$f" || continue
+       $verbose "compressing $f"
+       xz -C crc32 $f
+    done
+fi
+
 grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
-    test -f "$f" || continue
-    $verbose "copying file $f"
-    mkdir -p $destdir/$(dirname "$f")
-    cp -d "$f" $destdir/"$f"
+    test -f "$f$cmpxtn" || continue
+    $verbose "copying file $f$cmpxtn"
+    mkdir -p $destdir/$(dirname "$f$cmpxtn")
+    cp -d "$f$cmpxtn" $destdir/"$f$cmpxtn"
 done
 
 grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do
-    if test -L "$f"; then
-        test -f "$destdir/$f" && continue
-        $verbose "copying link $f"
-        mkdir -p $destdir/$(dirname "$f")
+    if test -L "$f$cmpxtn"; then
+        test -f "$destdir/$f$cmpxtn" && continue
+        $verbose "copying link $f$cmpxtn"
+        mkdir -p $destdir/$(dirname "$f$cmpxtn")
         cp -d "$f" $destdir/"$f"
 
         if test "x$d" != "x"; then
-            target=`readlink "$f"`
+            target=`readlink "$f$cmpxtn"`
 
             if test "x$target" != "x$d"; then
                 $verbose "WARNING: inconsistent symlink target: $target != $d"
             else
                 if test "x$prune" != "xyes"; then
-                    $verbose "WARNING: unneeded symlink detected: $f"
+                    $verbose "WARNING: unneeded symlink detected: $f$cmpxtn"
                 else
-                    $verbose "WARNING: pruning unneeded symlink $f"
-                    rm -f "$f"
+                    $verbose "WARNING: pruning unneeded symlink $f$cmpxtn"
+                    rm -f "$f$cmpxtn"
                 fi
             fi
         else
-            $verbose "WARNING: missing target for symlink $f"
+            $verbose "WARNING: missing target for symlink $f$cmpxtn"
         fi
     else
-        $verbose "creating link $f -> $d"
-        mkdir -p $destdir/$(dirname "$f")
-        ln -sf "$d" "$destdir/$f"
+        $verbose "creating link $f$cmpxtn -> $d$cmpxtn"
+        mkdir -p $destdir/$(dirname "$f$cmpxtn")
+        ln -sf "$d$cmpxtn" "$destdir/$f$cmpxtn"
     fi
 done
 
-- 
2.29.2

