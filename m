Return-Path: <SRS0=1pox=BZ=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05489C7EE2C
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Jun 2023 14:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5FF4C4339B; Mon,  5 Jun 2023 14:14:25 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AAD56C433D2
	for <linux-firmware@kernel.org>; Mon,  5 Jun 2023 14:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AAD56C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30c4775d05bso3573300f8f.2
        for <linux-firmware@kernel.org>; Mon, 05 Jun 2023 07:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685974462; x=1688566462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfFiXASLzxX6BT6F4umZyYHYE1zfvgUldb9y+I++IAg=;
        b=A1zX95bqGuomGUk8UVFycTPQWlmcvAwuXq1nu/jIxi+fCxm51yZicBv3sA6VJN+KK6
         ohzuV+MePuqlvb6fI+ktQpyMmYJXCd/nlt/4g3RdtmAmvvglnEtBG3hgYVzQQ4k3WCBN
         6cZqZI9aMK98o/f5/Wm6hytoTUv1wwn9lXomEdeoY6LgRQbCGUNGvWMsKxRwauJkLOaz
         mOv01gull5k1SvIpyqeU1O9pOODoOzBrgTuaeiVw93RTqijjJMW4Y7mUi0uarBySBJT6
         HJGjIm371fs7A0HFhGvT2YZ+wywCKKFxMJi2SvCP3Vh5rKZ1GZdhjI1UQrK61I4mw/5J
         yeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685974462; x=1688566462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfFiXASLzxX6BT6F4umZyYHYE1zfvgUldb9y+I++IAg=;
        b=R/wCD/1jxFIJCIUaPGK+D4gddAme+Z+wo5IKzxg2m+ipQiTcXm6wWY20uNXQDNIt5+
         TvHDrxrdXcQ9wylrMwICfnkn659xvg5TQRCfvgRXDdxAN1DE71CQ7BYluISVr+kO5P7/
         EUJe72IChK/UsrPIobvHpwaVtIkXP4aaDQV7QUkZK0D2lSd672Xz0EZeIoHu2iuzBvLb
         vHoFkTGd12mrK1j5r+g5TaIevHDejIxEnYi3X8n210p0ofKHcn59vYemqPMt1J6MBxNf
         g9Deh6W9gtGAfD/JD60hXUYj1EPxlLqeGFfexoUlHjQ5hog2PMONZfgYIn2qk7buesDf
         pi/g==
X-Gm-Message-State: AC+VfDxacWWTtLq11vTb21jaTMlk995TRVoQcPjcmjAmyh7mfq+qOIKN
	QBh6nio72fppNE/Q5xFWYzmxSwGrVjw=
X-Google-Smtp-Source: ACHHUZ7xVgkcYPQEFE2lA2Spu1k4Q4y2B8XvyaJSpV4u/A7WmpVp8B8+mANv2EWSo4Q2VI6pGR/0XA==
X-Received: by 2002:a05:6000:11c7:b0:30a:e3a2:7e9 with SMTP id i7-20020a05600011c700b0030ae3a207e9mr4386768wrx.0.1685974462545;
        Mon, 05 Jun 2023 07:14:22 -0700 (PDT)
Received: from localhost ([2a00:5f00:102:0:3110:4340:17af:8ab1])
        by smtp.gmail.com with UTF8SMTPSA id z17-20020a5d4c91000000b0030647449730sm9956790wrs.74.2023.06.05.07.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 07:14:22 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH v3 7/8] copy-firmware: silence the last shellcheck warnings
Date: Mon,  5 Jun 2023 14:58:11 +0100
Message-ID: <20230605141343.880621-9-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230605141343.880621-2-emil.l.velikov@gmail.com>
References: <20230605141343.880621-2-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 31e372ab..40cec04e 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -10,6 +10,7 @@ prune=no
 while test $# -gt 0; do
     case $1 in
         -v | --verbose)
+            # shellcheck disable=SC2209
             verbose=echo
             shift
             ;;
@@ -21,7 +22,7 @@ while test $# -gt 0; do
 
         *)
             if test "x$destdir" != "x"; then
-                echo "ERROR: unknown command-line options: $@"
+                echo "ERROR: unknown command-line options: $*"
                 exit 1
             fi
 
@@ -31,6 +32,7 @@ while test $# -gt 0; do
     esac
 done
 
+# shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep '^File:' WHENCE | sed -e 's/^File: *//g;s/"//g' | while read f; do
     test -f "$f" || continue
     $verbose "copying file $f"
@@ -38,6 +40,7 @@ grep '^File:' WHENCE | sed -e 's/^File: *//g;s/"//g' | while read f; do
     cp -d "$f" "$destdir/$f"
 done
 
+# shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
     if test -L "$f"; then
         test -f "$destdir/$f" && continue
-- 
2.41.0

