Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F1BC6379F
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FE2EC4339E; Sat, 18 Feb 2023 18:46:33 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BD86C433D2
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BD86C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id bg7-20020a05600c3c8700b003dc57ea0dfeso915342wmb.0
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qg6UnpdAvNycjsvBIoS3dNLQfJMO2n6scFC6n1Qu/0=;
        b=kPP7gAkL0TIzS1leyxj6ZEb7Su9Uawf2fUkjnVu0lMix489st7uVQ7gV+/Rk1A5MZn
         pXntZpR86FCftE/IwmL0R8Fo/K53ixDeG/WgKi/CkARrEmWjOA+yd/Nmgi2+NdsqGWzE
         oz/dKB5bhuIPofLqPLNO279uByY+3BLS3xhePHtluNSj/3Ok6bVPZVtWrIWIo5qzA3NW
         VGqB046BItUzxrUr2idshW59qGgLBd+rSHD1OwYDTE0uyul780Y+B5kEpM2q0YncZTjr
         OCtQdrvWbUKB/7UQnhtLppmkbe0F/W59pAO/P0Y40Qz8GgnD5D6f9d0DJlQkp2jrscIQ
         KpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qg6UnpdAvNycjsvBIoS3dNLQfJMO2n6scFC6n1Qu/0=;
        b=rtONXSfJdZ3sSqXUycUTswT/r3xkh/7g7OTTvr8fRyixagS0x5hjs/GHc4mqCGHbI5
         VaeaVG1XD8fs6avgwKwF3Xad2hd2BWWzC9MJQ03qDkH0vZccagh5sUqcKK17xG8NaQe7
         Len+Hc+UIjXgs3rTQmM4tw7uJ2zVsIsaxVtRNa7y2MF86+jZHRBxG4mZeAz8JZVBiCys
         bdHmDrtRMlXiTVRfCBNMoCKAjiB4d27g6Gv/22PyMwqu6UDX3ZDM2VUTr1HQyN8EmKU5
         hIru9wZhSGosU/jTjkDOhKXXX5/b/QVUHnCD8cSi2BO9MWzdtD9GTMbiLyPVIXl2ojT1
         CELg==
X-Gm-Message-State: AO0yUKUvOAdyJLxyUtuVdI7V8TplJDZvrwyuzfRGEzYt6xkysalUHX1R
	bJ8kSzYeaCN+GYCTHtJpxks8ARU1SYY=
X-Google-Smtp-Source: AK7set8D8+7Bip9tYFOTnNB5S8umvWm8GQ6vOfAIeJL/cKnDgenT9v1/KZCRNmaPgyWMy4ZJP/cUYQ==
X-Received: by 2002:a1c:7203:0:b0:3db:2098:17c0 with SMTP id n3-20020a1c7203000000b003db209817c0mr4240032wmc.29.1676745991485;
        Sat, 18 Feb 2023 10:46:31 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id fm18-20020a05600c0c1200b003c6bbe910fdsm4205951wmb.9.2023.02.18.10.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:31 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 06/15] check_whence: error on directory listed as File
Date: Sat, 18 Feb 2023 18:46:12 +0000
Message-Id: <20230218184621.2026504-7-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No occurrences in-tree, but it makes sense to sanity check that.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 check_whence.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/check_whence.py b/check_whence.py
index 7ff21f6..130966e 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -47,6 +47,11 @@ def main():
     known_prefixes = set(name for name in whence_list if name.endswith('/'))
     git_files = set(list_git())
 
+    for name in set(name for name in whence_files if name.endswith('/')):
+        sys.stderr.write('E: %s listed in WHENCE as File, but is directory\n' %
+                         name)
+        ret = 1
+
     for name in set(fw for fw in whence_files if whence_files.count(fw) > 1):
         sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
         ret = 1
-- 
2.39.2

