Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7976C64EC4
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90FAFC433EF; Sat, 18 Feb 2023 18:46:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1874C4339C
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1874C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id c12so1152436wrx.12
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAZzYEz3ATJP90h5WBUP5PGgXFZ2kkXXYC19NdD8CIE=;
        b=EIDM1RdFc1BcEwe87m+6O+RUNsi1lZ3SuXWAEW8T42ZpcilLTSpiw+4m66p/ryK/mo
         lqpyVrVcrwj9u9MT3jN4x9lt4RNdQboZlCkZupg2sLgNgh1ZMBFP3/Ix0adMnnjSs2QJ
         /El+REujzWV7Ey4t/21CxwP2OP7YBWfA8wXBAqQ0ZdjKyBh9cBZ2QTMsAlq6ksiD9UWD
         R7u3d6boPPOdwDvtgkAyJP2ypHzMWWfdezhx/YvaW6Uid0oKxk5II8Vp16xO9QyR7W1Y
         FavhgIa74Dwjk4oRUMQsgZWpOufnFK5fYM5M+h4SegZzWSiGTaTrvGq0JNhuTgHyshd2
         tJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAZzYEz3ATJP90h5WBUP5PGgXFZ2kkXXYC19NdD8CIE=;
        b=Fbo+Oc2r4HSxmN3P0CIK4/1DO5ovrev4UstFPHHfJgHFYc1miGN2sI+FfKHM2tKYhp
         smuoBSQl3uani3bt4ItqbQMZMvBT8/4P/zPmdBQzUhj44SAsInUG5WOqwJbG10nZ05lR
         7jEj2POFcqjYA6MWOu3K7v32+QzdJF3RDMqUnk/Ic9BsJeDwBs8HzfG1irmSUBWMtfla
         fhBMRkMv5/rLINtWleCbcw6O9aYmNbFDRf1PlXF2KzfHSqWgjtV9pj4bcug3O2HxzOUP
         Zfg4xGHq2chAQM3r3vA3e4eiptRY5f04JuC4FrfsJ25nbidNwZka6JMCkWTUcvfn7eEn
         smiQ==
X-Gm-Message-State: AO0yUKXVbWCZW0ZLCOClcOE5V75v0qvtVh6Li9feSnpZRbQFB8i/rHm3
	NaM8s9JhdLE2MePncq6gQMIoFB3mZlE=
X-Google-Smtp-Source: AK7set+wPTebJWfXeTgZmJ5EsAkwa1ZrhJh8y2e4cJqWoTqj7K+NVHha80kRRDsh7RyMRtwNOI97wg==
X-Received: by 2002:a5d:5503:0:b0:2c5:8b9d:37dd with SMTP id b3-20020a5d5503000000b002c58b9d37ddmr6631019wrv.10.1676745996978;
        Sat, 18 Feb 2023 10:46:36 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id c11-20020adffb0b000000b002c5503a8d21sm1524162wrr.70.2023.02.18.10.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:36 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 10/15] copy-firmware: remove unreachable symlink workarounds
Date: Sat, 18 Feb 2023 18:46:16 +0000
Message-Id: <20230218184621.2026504-11-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

