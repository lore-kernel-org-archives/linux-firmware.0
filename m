Return-Path: <SRS0=1pox=BZ=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB735C77B73
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Jun 2023 14:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3E2AC433D2; Mon,  5 Jun 2023 14:14:27 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 864A4C433EF
	for <linux-firmware@kernel.org>; Mon,  5 Jun 2023 14:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 864A4C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f505aace48so6215932e87.0
        for <linux-firmware@kernel.org>; Mon, 05 Jun 2023 07:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685974464; x=1688566464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9IS61wMlkeh7XNKvKtzKTb+QtzfhZ8OlIN4YIHVegY=;
        b=dEeN4SCIEIyaag8UmsUh5tdkvpgk5eyAPsnJut7i8GmS3w2eg2rB19GstXoBbhLsuf
         p00BBd4fqf2xmXAf+Zg+7bBWqjxdpufkFRaTIKt/Wq5AdTTLXp2hvJ9w3uUf3LsXN24u
         efamLIG1sqf/MOqVWwR8SIeJ1sXXFPFZ9jNjfkQg42XqfttFUGu+ylBIQQpOU8l8UIw5
         FZsgTScbtY3Ff8oMI8vbdPxvDJ1uSJqB4DnOJ7x2rMV9ZcfVcrqMmRyz898EcbWj4PFl
         LN69Be2DHvdMX7n0bC5+fz9rDVVxrLUZWSHOBavl3dCa8jBNQe24dKBH0N5ISLQv29q2
         R2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685974464; x=1688566464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9IS61wMlkeh7XNKvKtzKTb+QtzfhZ8OlIN4YIHVegY=;
        b=LKcoAs1F1O8OUdDeLNg6gHopkbih1mufO7WVL2/oBzabRilNOcvP/EwHLzf2eXYmUy
         QH40Z3e966D5NCI+WyQRJrebcn6JDPCmtGjVkzUa8ZWRRGgmDNFoM5TYW02XJxMOCWJ/
         v3D4HLeY7PCmswolMQcT9AOR3AkGf8FNUH/FH4hypGk8ZxV82+o2PBYnATC3Clsu9+Hq
         3kwHtG7v6fqZ8yNSp/w5TtFCjM97my9s2TViA9kvby3khTFL51Wo0c4c/jmEX4Wokj9i
         bsFDatzFnaL3dxGgTTQaHD5Rs/udhEsQwTQNO8JVrzNsNshF2h7azkLjkmbZsI+1SW2H
         QA+A==
X-Gm-Message-State: AC+VfDx1PrjlGKFjUAxqUFegJaNd9jm+U2g/A3cWsgYb12wctjkqnGNq
	Up708SFHTAwYdKmy1keodH38E7E/K/0=
X-Google-Smtp-Source: ACHHUZ7i1pitE8QByeCnKYWPFseZ/5jRFY3kAPTNG5PcFtcs/bBqE07Ym4vV8BZHQIDEWiJiunLOOg==
X-Received: by 2002:a19:ae05:0:b0:4f2:6651:7c7b with SMTP id f5-20020a19ae05000000b004f266517c7bmr4522846lfc.61.1685974463591;
        Mon, 05 Jun 2023 07:14:23 -0700 (PDT)
Received: from localhost ([2a00:5f00:102:0:3110:4340:17af:8ab1])
        by smtp.gmail.com with UTF8SMTPSA id m11-20020a7bce0b000000b003f1958eeadcsm14465112wmc.17.2023.06.05.07.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 07:14:23 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v3 8/8] Makefile, copy-firmware: support xz/zstd compressed firmware
Date: Mon,  5 Jun 2023 14:58:12 +0100
Message-ID: <20230605141343.880621-10-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230605141343.880621-2-emil.l.velikov@gmail.com>
References: <20230605141343.880621-2-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel has supported compressed firmware for quite some time. So
let's add a couple of targets to produce that. In practical terms this
means it we'll use ~5x times less space on disk.

Reportedly the amd ucode, needs to be uncompressed _within_ the
initrd in order to work. Using compressed ucode in late load just works.
Ideally this will be addressed by the initrd generators, but considering
the files are tiny in size let's skip the compression.

v2
 - commit message, skip compression for files annotated as Raw

v3
 - rebase

Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 Makefile         |  8 ++++++++
 WHENCE           |  5 +++++
 copy-firmware.sh | 48 +++++++++++++++++++++++++++++++++++++++---------
 3 files changed, 52 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 83a0ec60..50a4c29b 100644
--- a/Makefile
+++ b/Makefile
@@ -11,3 +11,11 @@ check:
 install:
 	install -d $(DESTDIR)$(FIRMWAREDIR)
 	./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
+
+install-xz:
+	install -d $(DESTDIR)$(FIRMWAREDIR)
+	./copy-firmware.sh --xz $(DESTDIR)$(FIRMWAREDIR)
+
+install-zst:
+	install -d $(DESTDIR)$(FIRMWAREDIR)
+	./copy-firmware.sh --zstd $(DESTDIR)$(FIRMWAREDIR)
diff --git a/WHENCE b/WHENCE
index accbd9a6..abd00d87 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3890,14 +3890,19 @@ License: Redistributable. See LICENSE.amd-sev for details
 Driver: microcode_amd - AMD CPU Microcode Update Driver for Linux
 
 File: amd-ucode/microcode_amd.bin
+Raw: amd-ucode/microcode_amd.bin
 Version: 2013-07-10
 File: amd-ucode/microcode_amd_fam15h.bin
+Raw: amd-ucode/microcode_amd_fam15h.bin
 Version: 2018-05-24
 File: amd-ucode/microcode_amd_fam16h.bin
+Raw: amd-ucode/microcode_amd_fam16h.bin
 Version: 2014-10-28
 File: amd-ucode/microcode_amd_fam17h.bin
+Raw: amd-ucode/microcode_amd_fam17h.bin
 Version: 2023-04-13
 File: amd-ucode/microcode_amd_fam19h.bin
+Raw: amd-ucode/microcode_amd_fam19h.bin
 Version: 2023-01-31
 File: amd-ucode/README
 
diff --git a/copy-firmware.sh b/copy-firmware.sh
index 40cec04e..0f120f50 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -6,6 +6,9 @@
 
 verbose=:
 prune=no
+# shellcheck disable=SC2209
+compress=cat
+compext=
 
 while test $# -gt 0; do
     case $1 in
@@ -20,6 +23,28 @@ while test $# -gt 0; do
             shift
             ;;
 
+        --xz)
+            if test "$compext" == ".zst"; then
+                echo "ERROR: cannot mix XZ and ZSTD compression"
+                exit 1
+            fi
+            compress="xz --compress --quiet --stdout --check=crc32"
+            compext=".xz"
+            shift
+            ;;
+
+        --zstd)
+            if test "$compext" == ".xz"; then
+                echo "ERROR: cannot mix XZ and ZSTD compression"
+                exit 1
+            fi
+            # shellcheck disable=SC2209
+            verbose=echo
+            compress="zstd --compress --quiet --stdout"
+            compext=".zst"
+            shift
+            ;;
+
         *)
             if test "x$destdir" != "x"; then
                 echo "ERROR: unknown command-line options: $*"
@@ -35,18 +60,23 @@ done
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep '^File:' WHENCE | sed -e 's/^File: *//g;s/"//g' | while read f; do
     test -f "$f" || continue
-    $verbose "copying file $f"
     install -d "$destdir/$(dirname "$f")"
-    cp -d "$f" "$destdir/$f"
+    $verbose "copying/compressing file $f$compext"
+    if test "$compress" != "cat" && grep -q "^Raw: $f\$" WHENCE; then
+        $verbose "compression will be skipped for file $f"
+        cat "$f" > "$destdir/$f"
+    else
+        $compress "$f" > "$destdir/$f$compext"
+    fi
 done
 
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
-    if test -L "$f"; then
-        test -f "$destdir/$f" && continue
-        $verbose "copying link $f"
+    if test -L "$f$compext"; then
+        test -f "$destdir/$f$compext" && continue
+        $verbose "copying link $f$compext"
         install -d "$destdir/$(dirname "$f")"
-        cp -d "$f" "$destdir/$f"
+        cp -d "$f$compext" "$destdir/$f$compext"
 
         if test "x$d" != "x"; then
             target="$(readlink "$f")"
@@ -58,16 +88,16 @@ grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
                     $verbose "WARNING: unneeded symlink detected: $f"
                 else
                     $verbose "WARNING: pruning unneeded symlink $f"
-                    rm -f "$f"
+                    rm -f "$f$compext"
                 fi
             fi
         else
             $verbose "WARNING: missing target for symlink $f"
         fi
     else
-        $verbose "creating link $f -> $d"
         install -d "$destdir/$(dirname "$f")"
-        ln -sf "$d" "$destdir/$f"
+        $verbose "creating link $f$compext -> $d$compext"
+        ln -s "$d$compext" "$destdir/$f$compext"
     fi
 done
 
-- 
2.41.0

