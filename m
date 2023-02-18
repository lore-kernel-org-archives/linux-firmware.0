Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8605EC6379F
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B886C4339C; Sat, 18 Feb 2023 18:46:42 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93EEDC433EF
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93EEDC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id bg25-20020a05600c3c9900b003e21af96703so541191wmb.2
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0DL8SL2JqGdIicadq/ijdRJ2ELebIoW4Xml8tvQY0o=;
        b=OngNzRKzCMQTuolmnXHMULGewh5TR6FMt+0pc35Pqpy8qD2dZXSRjkvNhEEL8VzO/R
         jyuTB3dUwWxwQKDyH7jqJGvM/bvcs3EKQ7LqHYtocIvVPLFAXYs61MxQY7Kd5nByNZWw
         EnJnE0j1yX+fYOElDeTwlSdswTrbhKX0V8WkMWTc6DC2FF5RCjD+08/vLXDo6kjctbGQ
         CQsW6WXc1m/v6F02SwkXx0YmdN3nCQ74/TLDo3SZ4jd7dzUA2RBTWJwjIiWKTkyRqUYt
         XAvbpnYC/wkm5pjk6Fi1dzndEA6t51BhLYB5kTeQtxZaOBg1qzR/WZHfZFQzq3uKwrze
         Z7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0DL8SL2JqGdIicadq/ijdRJ2ELebIoW4Xml8tvQY0o=;
        b=CR7dxYyC295Jw3x6HKQlIUlmpJLwsXwicnP+GLS2PLuONBajF5cLz9fZJ4/k42XG0m
         EQXHuDwSavXt1AZYSiYi8+BZr8lEMcD6hs9hNwJ6e3XDRfDDT3FJC6bu/GYKzvCE1spl
         Id96DSK16gYun/66acZ4n1KYWaRgaEq5x6V2tiT9FeqxOfw7GpGY7+q662bGb/v7Meqw
         FxxQby0R4xn1i9hXm31Z45cxHcI2wPQWI8Zqg+U+nepY459ghiXQ2IdHAlybDHeH03dk
         rYQy0C5xoU1MOrTwjyIZZyPwsZOXfS2D4dWqW/BGSnbA2uAdGFVzCAekNVloE/cIvH++
         Y+xg==
X-Gm-Message-State: AO0yUKW/woV/Ot9uhA5tXNJGiD6sSVaKRAQVNwhFjJMyLIQlfj/XbF8n
	Quq2Qt706vJUZIQ3+oZol0Aq4kzql5o=
X-Google-Smtp-Source: AK7set/eGI715XjKUIJagRTWuJO6jBrSfJqzQiN0dU2ff8HXKAjUTtFwmOcR+pfJOy+vpt4a3DDbVQ==
X-Received: by 2002:a05:600c:920:b0:3df:e6bb:768 with SMTP id m32-20020a05600c092000b003dfe6bb0768mr3337115wmp.24.1676746000906;
        Sat, 18 Feb 2023 10:46:40 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id bi23-20020a05600c3d9700b003e200d3b2d1sm8937207wmb.38.2023.02.18.10.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:40 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 13/15] copy-firmware: quote the output of dirname
Date: Sat, 18 Feb 2023 18:46:19 +0000
Message-Id: <20230218184621.2026504-14-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As highlighted by shellcheck - as-is one could get word splitting. That
isn't an issue, yet, since none of the in-tree directories have space in
their name.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 722227f..5a5e1a8 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -27,13 +27,13 @@ done
 
 grep '^File:' WHENCE | sed -e 's/^File: *//g' | while read f; do
     $verbose "copying file $f"
-    install -d "$destdir"/$(dirname "$f")
+    install -d "$destdir/$(dirname "$f")"
     cp "$f" "$destdir/$f"
 done
 
 grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
     $verbose "creating link $f -> $d"
-    install -d "$destdir"/$(dirname "$f")
+    install -d "$destdir/$(dirname "$f")"
     ln -s "$d" "$destdir/$f"
 done
 
-- 
2.39.2

