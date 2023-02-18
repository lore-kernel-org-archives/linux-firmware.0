Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FEEC6379F
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E034C4339B; Sat, 18 Feb 2023 18:46:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A14D1C433D2
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A14D1C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id s14so898833wru.10
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtpojaWyjSf6E/3/Sru1h6RawkJBHOWCzUd5e3dddNw=;
        b=DgYKnUkMU5xH4aAc0tA1ScT01F0tcqXlZjXrLGF5mv4tNZj19YRoDcvfX0TB5DpeEC
         6pBq7VuoKYNKGcPHL1dWJjDVvFb+wwenMIcSElG4lnBBAuuxJFreF8h1xB9OlkeNndu6
         y6SaFgZ/R1zyoby4BhAL4s8mR5nugyk46MTMonpCIqh9ifITCEcU6Fsg4yjS7pLrRX5F
         6f1fboIdrc7ajdAVcY8GVxNsl2ncr7em2csLl7ZarMjprT7jmVBqwc/CG2i0VeeHXCY1
         hYHrAMeUpB+4iFCQalC+9jIeoZEG5BlFaK2y/Q5iIYYJa1jnLMEo1au+CocLmTKbiL3n
         Jvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtpojaWyjSf6E/3/Sru1h6RawkJBHOWCzUd5e3dddNw=;
        b=fQg3tWRI+ofSvUU1+A+sIDzJvk/fFcNhNbCexUl5/VzzfVfY41X5Db7a5z70GMuuJ/
         Tza+H1UA9rc4YQ+b0eQ+AxPqDcMV+6SqsX6IQsqe/UaU2UaZUxm7/GIZjiWU06iSaAZK
         PUwRgdiSPzFRLMzc0475NZvS/MqoURJw5Kj/CEFCe9thnWFfpX8JPGxg3gLSteE+Q3Eu
         SBMB2OYUQ3MnqkRtoPsPHQxOMfsrmuoyKr6X6eYkejhbDwHpN0nM77dvMAhpCXEXCRa3
         p5F2MGxVXlO9tHSxHfR9o2QQTjF7ZOr6Oy4d+U9c69MEAVyz6IW/5ynRE4suTh8x+1jX
         HO1w==
X-Gm-Message-State: AO0yUKWQimKjR/ImiYJHQGO3OPZMwqxjwtblpUDPwbXeQK7qd4ZgSYk+
	CQaBD2vyetuhgq97ofZHzDzFQGO6NaU=
X-Google-Smtp-Source: AK7set+JfV3SJy0nnouJTNchCWhhJyLKlMvc5Pj2h5Y/LA5KIdgRdm3cHS5fvvrvJxlZBNA5SvBvsQ==
X-Received: by 2002:a05:6000:108b:b0:2c5:57d4:2c9a with SMTP id y11-20020a056000108b00b002c557d42c9amr3061489wrw.25.1676746003558;
        Sat, 18 Feb 2023 10:46:43 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id w8-20020adfec48000000b002c59f18674asm6131172wrn.22.2023.02.18.10.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:42 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 15/15] Makefile, copy-firmware: support xz/zstd compressed firmware
Date: Sat, 18 Feb 2023 18:46:21 +0000
Message-Id: <20230218184621.2026504-16-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 Makefile         |  8 ++++++++
 copy-firmware.sh | 33 +++++++++++++++++++++++++++++----
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 83a0ec6..50a4c29 100644
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
diff --git a/copy-firmware.sh b/copy-firmware.sh
index a52b847..6c78e27 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -5,6 +5,9 @@
 #
 
 verbose=:
+# shellcheck disable=SC2209
+compress=cat
+compext=
 
 while test $# -gt 0; do
     case $1 in
@@ -14,6 +17,28 @@ while test $# -gt 0; do
             shift
             ;;
 
+        --xz)
+            if test "x$compext" == "x.zst"; then
+                echo "ERROR: cannot mix XZ and ZSTD compression"
+                exit 1
+            fi
+            # shellcheck disable=SC2209
+            compress="xz --compress --quiet --stdout --check=crc32"
+            compext=".xz"
+            shift
+            ;;
+
+        --zstd)
+            if test "x$compext" == "x.xz"; then
+                echo "ERROR: cannot mix XZ and ZSTD compression"
+                exit 1
+            fi
+            # shellcheck disable=SC2209
+            compress="zstd --compress --quiet --stdout"
+            compext=".zst"
+            shift
+            ;;
+
         *)
             if test "x$destdir" != "x"; then
                 echo "ERROR: unknown command-line options: $*"
@@ -28,16 +53,16 @@ done
 
 # shellcheck disable=SC2162
 grep '^File:' WHENCE | sed -e 's/^File: *//g' | while read f; do
-    $verbose "copying file $f"
     install -d "$destdir/$(dirname "$f")"
-    cp "$f" "$destdir/$f"
+    $verbose "copying/compressing file $f$compext"
+    $compress "$f" > "$destdir/$f$compext"
 done
 
 # shellcheck disable=SC2162
 grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
-    $verbose "creating link $f -> $d"
     install -d "$destdir/$(dirname "$f")"
-    ln -s "$d" "$destdir/$f"
+    $verbose "creating link $f$compext -> $d$compext"
+    ln -s "$d$compext" "$destdir/$f$compext"
 done
 
 exit 0
-- 
2.39.2

