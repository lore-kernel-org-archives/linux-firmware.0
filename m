Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B256BC6379F
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94EA7C4339C; Sat, 18 Feb 2023 18:46:29 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96A6DC4339B
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96A6DC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id bg7-20020a05600c3c8700b003dc57ea0dfeso915240wmb.0
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JM9EU1SjQfGYwyazPBfTvzmxLfo5p1j+ckaCilR86mY=;
        b=F+G9AtSYZT53QM4kNASjzKVgZMU2cOJLouBpiThTjcyfHszSFo7EKBrZVEMMsXeZTC
         IY7d6lT+Qei2ECudTNB9yMeFw0WLK3R4eKDoJX2K7U2xNarHjqODus7mi10mGpfHKLkh
         gHlrwn5ZRrWUoMrSXHh4l0mWV7xjzlZa55XCnw14hoW9gXdDytAUmGVpieuN4nGo7Qpj
         5jkr4SOeSf9G11McY9S4fMQIlzp0Jx+fAwe9JtkIcHhroebT3emu+mu2Enz+PyYPTw+D
         A40+lTtELRevN+2/s71gtPU1JqiVoOqEG1BdjuHBndk3N/h3PvFklD+5PSnl3ulm4AC4
         lQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JM9EU1SjQfGYwyazPBfTvzmxLfo5p1j+ckaCilR86mY=;
        b=jgP1q+/0Y2Wy1nXNtL5rC9ld70Zg4tZCOP6DUihsQjtxSS7XsbbQrNzD9swhLu2q6s
         olQOMntQLgzkg43aI7GgMXF0oycwqa0aymjErE+CWjedL4bKk9FAC/Q7RMUqiU8FJ9wy
         iiB731ADm46DKM8wzdU4C7yvv5pNk4E5orb7469BKIHBW1qegb/68g+cl2HHMllEkD0f
         hn7u6H86stVAbufu85ywSaUnB+rsVoTZWLkrfdT3UvrpbzVZWn1QrvG5KYxE2DcCCuU3
         yjVgfaLI9uo2QkXZw0c4B+2NAAY+O+5lvBZ24fVz2j/+ju2tMDkmSWNVqqL0uyS+7TzA
         Rh2A==
X-Gm-Message-State: AO0yUKU6hGSV3vFTs/LUO7Azuzx38x3WNgsI76rV4hJyn8AzLVPFKV0O
	1J+4MmmyW0Qn7LAJCvR2iaeqC1LugPc=
X-Google-Smtp-Source: AK7set9v0+qjPM1aH9H165z9sZ7uu5Y9ZqSgOJ9GxW9TZ30Ok3a3ENe2DscPCXavudPoNSB8+BBbCA==
X-Received: by 2002:a05:600c:a287:b0:3e2:180f:382a with SMTP id hu7-20020a05600ca28700b003e2180f382amr6321624wmb.1.1676745986176;
        Sat, 18 Feb 2023 10:46:26 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id y11-20020a05600c364b00b003dc0cb5e3f1sm8311347wmq.46.2023.02.18.10.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:25 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 02/15] WHENCE: remove unnecessary filename quotation
Date: Sat, 18 Feb 2023 18:46:08 +0000
Message-Id: <20230218184621.2026504-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 WHENCE | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/WHENCE b/WHENCE
index 23c8847..fe5e423 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2691,20 +2691,20 @@ Link: brcm/brcmfmac54591-pcie.clm_blob -> ../cypress/cyfmac54591-pcie.clm_blob
 Licence: Redistributable. See LICENCE.cypress for details.
 
 File: "brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt"
-File: "brcm/brcmfmac4330-sdio.Prowise-PT301.txt"
+File: brcm/brcmfmac4330-sdio.Prowise-PT301.txt
 File: "brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
-File: "brcm/brcmfmac43340-sdio.meegopad-t08.txt"
-File: "brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt"
-File: "brcm/brcmfmac43340-sdio.predia-basic.txt"
-File: "brcm/brcmfmac43362-sdio.WC121.txt"
-File: "brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt"
+File: brcm/brcmfmac43340-sdio.meegopad-t08.txt
+File: brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt
+File: brcm/brcmfmac43340-sdio.predia-basic.txt
+File: brcm/brcmfmac43362-sdio.WC121.txt
+File: brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt
 Link: brcm/brcmfmac43362-sdio.kobo,aura.txt -> brcmfmac43362-sdio.WC121.txt
 Link: brcm/brcmfmac43362-sdio.kobo,tolino-shine2hd.txt -> brcmfmac43362-sdio.WC121.txt
 Link: brcm/brcmfmac43362-sdio.lemaker,bananapro.txt -> brcmfmac43362-sdio.cubietech,cubietruck.txt
-File: "brcm/brcmfmac43430a0-sdio.ilife-S806.txt"
-File: "brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt"
+File: brcm/brcmfmac43430a0-sdio.ilife-S806.txt
+File: brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt
 File: "brcm/brcmfmac43430a0-sdio.ONDA-V80 PLUS.txt"
-File: "brcm/brcmfmac43430-sdio.AP6212.txt"
+File: brcm/brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-plus.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
@@ -2713,19 +2713,19 @@ Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt -> brcmfmac43430-sdio.AP
 Link: brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-r0.txt -> brcmfmac43430-sdio.AP6212.txt
-File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
-File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
-File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
+File: brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt
+File: brcm/brcmfmac43430-sdio.MUR1DX.txt
+File: brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt
 Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
 Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-2-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
-File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
-File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
+File: brcm/brcmfmac43455-sdio.acepc-t8.txt
+File: brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
 Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
-File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
+File: brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
 Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
 Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
 File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
-File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
+File: brcm/brcmfmac4356-pcie.gpd-win-pocket.txt
 File: "brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt"
 File: brcm/brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6356S.txt
-- 
2.39.2

