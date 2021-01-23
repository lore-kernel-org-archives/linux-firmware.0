Return-Path: <SRS0=5OBI=G2=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C03C433E0
	for <linux-firmware@archiver.kernel.org>; Sat, 23 Jan 2021 10:26:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 65E3F22D5A; Sat, 23 Jan 2021 10:26:32 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0F2622D57;
	Sat, 23 Jan 2021 10:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0F2622D57
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-wr1-f42.google.com with SMTP id l12so7457919wry.2;
        Sat, 23 Jan 2021 02:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xq5KFVYZicx2iKGlTECnoVpP6lpOCiI51x0/PJIY7AY=;
        b=Wr1g/ccrSuC7R2MG1pYT6fD4jjz8y8wtfPFQcShCmaichWyqFnqqYl700ORAtKGNtK
         XPYmOneNeDfqnGC3aXtTAFnug2sLuusRIWv6Wzak3Khavif3l8qTRlgnlJhBGbwVdDxu
         NpkgiOFxB9ZIFczV1WmfxVWCkA+2Y/NJwEGqqDA7q2T5qX8wS0VjHiuldbEZGw5WVdQ/
         yZqWFayrkGnurEwLTRxc1/cebABPxV+KQTQ6quDw0xrNYZ1laJOsDZ6swbmBwDTjdiHi
         ncjo4Q4Of1hGWfS38WP7KQeuTSYD1xr9NJrR1IDvYdmRr4uJy3Hwujfz29knS/PWwKI/
         lHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xq5KFVYZicx2iKGlTECnoVpP6lpOCiI51x0/PJIY7AY=;
        b=nHmDXOfJrLm9yEc68qWcZDn0lp3K20W/WmcDfcQvEvXO/wFjPmKBXNuhoozCK+kdg/
         HyW3gWebuZmXlspfoz+FhPj6LimZCK3Z0qNeogpPqhXa7j5HlhT/4Qv33A4ynfDS8iAd
         6Bf9VpGBF7N8e4vQYCqKu5DOq1XYTl2i5vBkp7Yvvi52oUkzo+C54Iy2jWXcfIFSRxzS
         +HyqZr1nwQPFRLAP8iNaFLFmDHlTkmrlwAGVTrF7VbBqJaUBpeF9XK1KPDgKp4arZJtB
         oNmcH29X0ui4f6dnL28d7DoPMR5htgUQB9CpbAKv1aTX63l5bC/FMVhBaH6ycf4wb/br
         nzAw==
X-Gm-Message-State: AOAM533tq1IQJB6k7TWVWYjMTq5r9zqflHnGxZrk+VtRAudDm1mit0rP
	6N2wRd/hMIxjr9yrX3lY6I98Gw5O7Ok=
X-Google-Smtp-Source: ABdhPJwz5xA51PVXVOGUUDlauW4rydzZl7ksvVi5kEn9ll7D4l0DNVBBMlK6hEmSFoxpSZRfQ24rYg==
X-Received: by 2002:a5d:53c3:: with SMTP id a3mr8308159wrw.43.1611397590562;
        Sat, 23 Jan 2021 02:26:30 -0800 (PST)
Received: from morpheus.home.roving-it.com (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
        by smtp.googlemail.com with ESMTPSA id p18sm14156133wmc.31.2021.01.23.02.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jan 2021 02:26:29 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2] Add support for compressing firmware in copy-firmware.sh
Date: Sat, 23 Jan 2021 10:26:25 +0000
Message-Id: <20210123102625.589472-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As of kernel 5.3 there's initial support for loading compressed firmware.
At this stage the only supported compression methis is "xz -C crc32" but
this option brings significant benefits.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

v2: quote filename for xz command

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
index 9b46b63..0dd2e5c 100755
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
+       xz -C crc32 "$f"
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

