Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACA1C61DA4
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11ED4C433EF; Sat, 18 Feb 2023 18:46:45 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25ECCC433D2
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25ECCC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id 2so952884wrz.9
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIxyt8yQ3q5dHZgI4QYjTXJF6yZv7zoiaolMoz6SkE4=;
        b=fjsm3L0Hemj7Q7fyvE9g5POHQVeDILwOOzFUsfL4dZwK9154oDF+uOx7TZUEGTmcNF
         FbMvXpu5quTO8Vw+hr0JIIZlYCPiP2xzeQk/Z3azXLBBboZyH+ZnTVTFtTP4hck9p1Qe
         lEou2IFzeC2iE79/XR8OYoeZKiBof6Q6f7URQ1+BcmVHlax0gZADcP4/HoqwA6SA3OXt
         QfXpTIJs0DX7hE7AVhOeliZRup4lWGz/kXlPNjcnQ3MMdryg4A/QtkdjpmbH4TdASuaY
         iLKE0kgFATXp9ZiIxHanu9xALyPuQLkJ1WGRqBWzxXvnQgc5LSwBQw4uYUou/BFWdIIy
         tFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIxyt8yQ3q5dHZgI4QYjTXJF6yZv7zoiaolMoz6SkE4=;
        b=Cr8PkFjLZac7ClgvLxAHWKFrz3qyqa1gEK51XY1N6AlzuyeOqH0v+hgRHqz1digetB
         5N0HGd04pkUpNy7u3zL8GiSddoYGGAITx6KitY5L8+F6lOnWa0B7OvsjaWhgBeMOgTqd
         JXYzzD6C+duDRElLVf9YOGKWeIFv+iqtyp/xHy1YIFNi6m1KMXsA9JJsMpWkWziO2gH8
         srtYD5SlyHyOYmyHfO3UfGMr4tBJ3gMP0N6//gNBzILhMws/JDYPueRMhj2FCs5IP1JN
         9fX9r7BBzhuCYqUr6jSsBpc31ZWj3BNIdA7YtJ02XVgvoxZ1FEOyTpSg30NvK8BrXtXp
         qaNg==
X-Gm-Message-State: AO0yUKUqjsZtGuO5J7tdPz8hV0203TjnXGtsfSurx1PvsGXNB/8s5lao
	Kf90a7RNQ0rMUIg2OBGg/yjdlutERfw=
X-Google-Smtp-Source: AK7set8g2d2pLmy8k+8Goo5jrxtKennbeNLh0LI8/vHsvvDR3IexCHb0lJGZh8toBHrNjvyRSOk7Lg==
X-Received: by 2002:a5d:4d4a:0:b0:2c3:e5fa:d5d2 with SMTP id a10-20020a5d4d4a000000b002c3e5fad5d2mr571729wru.50.1676746002172;
        Sat, 18 Feb 2023 10:46:42 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id j2-20020adfea42000000b002c573cff730sm7636469wrn.68.2023.02.18.10.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:41 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 14/15] copy-firmware: silence the last shellcheck warnings
Date: Sat, 18 Feb 2023 18:46:20 +0000
Message-Id: <20230218184621.2026504-15-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 5a5e1a8..a52b847 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -9,13 +9,14 @@ verbose=:
 while test $# -gt 0; do
     case $1 in
         -v | --verbose)
+            # shellcheck disable=SC2209
             verbose=echo
             shift
             ;;
 
         *)
             if test "x$destdir" != "x"; then
-                echo "ERROR: unknown command-line options: $@"
+                echo "ERROR: unknown command-line options: $*"
                 exit 1
             fi
 
@@ -25,12 +26,14 @@ while test $# -gt 0; do
     esac
 done
 
+# shellcheck disable=SC2162
 grep '^File:' WHENCE | sed -e 's/^File: *//g' | while read f; do
     $verbose "copying file $f"
     install -d "$destdir/$(dirname "$f")"
     cp "$f" "$destdir/$f"
 done
 
+# shellcheck disable=SC2162
 grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
     $verbose "creating link $f -> $d"
     install -d "$destdir/$(dirname "$f")"
-- 
2.39.2

