Return-Path: <SRS0=uw+e=WV=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DC5CCA47A
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Jun 2022 12:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46A23C3411D; Tue, 14 Jun 2022 12:37:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67024C3411B;
	Tue, 14 Jun 2022 12:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67024C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id e5so4596704wma.0;
        Tue, 14 Jun 2022 05:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfrv2RROS+B3A6Q0/QMltLANvmFoU82h30nny/RhW70=;
        b=OAMLJu7LLtowkx89JnPSfTRGIZfqzC/iEb8E0qvB2vMPQ9jTUNU8BaIWxIxN/Qt9Hl
         CJYZxWf9MGTHzTjpNKasiLGAH0LaM80Bj6OQRkFA8h+crHDp1+rSBrG55XR30t8VKm6D
         tOv0ecAp3QE9Sf9uOFDwFyybE/eBSCQQBurfSOVSe+Qf4uFUvmhRoL1UTZivEBVUWzLa
         3l2QoFPe/JnaqsmOm1SyGJfnKVqI2uvp4/7+GjmbSJ0WYrHZWAxRnZDuErg+36gygi1f
         nJUbsD33sSfDnwI56btcHK9V+ULACbnPbEWn58/5pscrH7wdJGHkEzJ4kG5bvoaF1ggW
         6SxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfrv2RROS+B3A6Q0/QMltLANvmFoU82h30nny/RhW70=;
        b=N2Jn7oK3K2kPxTiKOizKYJ+pTHstQC4sx2zGvQXudkqOiytwMTZ/0sEo7n9MXru/bC
         2nEgbKWQDgLhmIfS0cUA4RjbQaANiGN9n+5pz52MUZG1pRLnJY3BnemOiGAo85Qabnaq
         rov9vvZrhdwxJTT5R3EO4X/mtK4q4PgjI9wmREIB0yfoW+X5S2Ik1XxdTd2Nx0vTMp1H
         FX8zBc73Qhu5/dtAse8BNDC3VclSbhhmgyCat8KYqqqJ3DB8Y5aHyg1p5fgXL04N42V2
         5IZUMcQk3jpbGvrjSmN/v+WVyYlcK3F2rh+St1an4NcOdjfrlVx9+TA5H9ynHP9qW/VT
         +73w==
X-Gm-Message-State: AOAM533VGfy6qgFEa/CAIO4ajbxEJ1r+q7M8jlwwGnT00HFfVt3VY992
	qnK4B4WsxzI8K6Xa0LD5mB3D1TznVzM=
X-Google-Smtp-Source: ABdhPJzxi5g0qJ/cb1txjldxFRDIoz6JbB9Tey9M5xJBEgQS4KKvwLZz+TFsaVtHMrkzKLdTp6UIcw==
X-Received: by 2002:a05:600c:acb:b0:397:bdb:ffea with SMTP id c11-20020a05600c0acb00b003970bdbffeamr3991639wmr.56.1655210248428;
        Tue, 14 Jun 2022 05:37:28 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id h7-20020a05600016c700b0020c7ec0fdf4sm13928642wrf.117.2022.06.14.05.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 05:37:28 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] Remove the Pine64 Quartz copy of the RPi NVRAM
Date: Tue, 14 Jun 2022 13:37:18 +0100
Message-Id: <20220614123718.3946267-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can't just copy the Rasperry Pi NVRAM, their modules are custom
made so they have their own special NVRAMs for their variant. While
they may work for other modules it could put them out of compliance
or worse. We need to add an appropraite AzureWave AW-CM256SM NVRAM.

Even if it was the right one it should have just been linked rather
than actually copying it again too.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 WHENCE                                        |  1 -
 brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt | 83 -------------------
 2 files changed, 84 deletions(-)
 delete mode 100644 brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt

diff --git a/WHENCE b/WHENCE
index 776dd8b..cc37751 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2952,7 +2952,6 @@ File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
 Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
 File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
-File: "brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"
 File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
 Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
 File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
diff --git a/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt b/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
deleted file mode 100644
index abaf544..0000000
--- a/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
+++ /dev/null
@@ -1,83 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0+
-# (C) Copyright 2018 Raspberry Pi (Trading) Ltd.
-# NVRAM config file for the BCM43455 WiFi/BT chip as found on the
-# Pine64 Quartz64 Model B
-aa2g=1
-aa5g=1
-AvVmid_c0=1,165,2,100,2,100,2,100,2,100
-boardflags=0x00480201
-boardflags2=0x40800000
-boardflags3=0x44200100
-boardrev=0x1304
-boardtype=0x6e4
-btc_mode=1
-btc_params1=0x7530
-btc_params8=0x4e20
-btc_params50=0x972c
-cbfilttype=1
-cckPwrIdxCorr=3
-cckTssiDelay=150
-deadman_to=481500000
-devid=0x43ab
-dot11agofdmhrbw202gpo=0x4442
-dot11b_opts=0x3aa85
-ed_thresh2g=-54
-ed_thresh5g=-54
-eu_edthresh2g=-54
-eu_edthresh5g=-54
-extpagain2g=2
-extpagain5g=2
-fdsslevel_ch11=6
-femctrl=0
-itrsw=1
-ldo1=4
-ltecxfnsel=0x22
-ltecxgcigpio=0x32
-ltecxmux=0
-ltecxpadnum=0x0504
-macaddr=b8:27:eb:74:f2:6c
-manfid=0x2d0
-maxp2ga0=80
-maxp5ga0=82,82,82,82
-mcsbw202gpo=0x98444422
-mcsbw205ghpo=0xb9555000
-mcsbw205glpo=0xb9555000
-mcsbw205gmpo=0xb9555000
-mcsbw402gpo=0x98444422
-mcsbw405ghpo=0xb9555000
-mcsbw405glpo=0xb9555000
-mcsbw405gmpo=0xb9555000
-mcsbw805ghpo=0xb9555000
-mcsbw805glpo=0xb9555000
-mcsbw805gmpo=0xb9555000
-nocrc=1
-ofdmlrbw202gpo=0x0022
-ofdmTssiDelay=150
-pa2ga0=-129,6525,-718
-pa2ga1=-149,4408,-601
-pa5ga0=-185,6836,-815,-186,6838,-815,-184,6859,-815,-184,6882,-818
-pa5ga1=-202,4285,-574,-201,4312,-578,-196,4391,-586,-201,4294,-575
-pdoffset2g40ma0=16
-pdoffset2gperchan=0,-2,1,0,1,0,1,1,1,0,0,-1,-1,0
-pdoffset40ma0=0x8888
-pdoffset80ma0=0x8888
-pdoffsetcckma0=2
-phycal_tempdelta=15
-prodid=0x06e4
-rawtempsense=0x1ff
-rxchain=1
-sromrev=11
-swctrlmap_2g=0x00000000,0x00000000,0x00000000,0x010000,0x3ff
-swctrlmap_5g=0x00100010,0x00200020,0x00200020,0x010000,0x3fe
-swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x3
-swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x3
-tssipos2g=1
-tssipos5g=1
-tworangetssi2g=1
-tworangetssi5g=1
-txchain=1
-txpwr2gAdcScale=1
-txpwr5gAdcScale=1
-vcodivmode=1
-vendid=0x14e4
-xtalfreq=37400
-- 
2.36.1

