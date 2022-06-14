Return-Path: <SRS0=uw+e=WV=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7552C43334
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Jun 2022 12:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78E68C3411F; Tue, 14 Jun 2022 12:48:21 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE747C3411B;
	Tue, 14 Jun 2022 12:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE747C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id k19so11124683wrd.8;
        Tue, 14 Jun 2022 05:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfrv2RROS+B3A6Q0/QMltLANvmFoU82h30nny/RhW70=;
        b=lbBGzUNE6CAdRxjCWR1qYzUBLZyqqjnUnTFIp5+pfmJAVJiHwA7rpK2uTJjtmt5Gv2
         Kj1IV6aB3pn8WV8K1ol51JyMvpgC6VVpjrp1MrIJIZWx8rahr7hSfQQ0/TaezgOQotNl
         dlYE/yqczaqtkqhqLc8klqX7Qk4S+zSC+BVRcun+O93Mi8sUzR70CORakFSVm3h0fzDM
         G6KdjvnM2dAG2OQkWCYO0ndYccd9LOsSFUaJsM25MOXBY1DHeFXe52N4usSVVpHgbj0q
         vhLLnPUTPAYaCVvWJd8K4d1f3VnwXMfeD2t57BjpC4D42/Fb9Js0JiLuPkHR2GhC5x5a
         uq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfrv2RROS+B3A6Q0/QMltLANvmFoU82h30nny/RhW70=;
        b=kHvLdSbwGWqDEEG8+kWpGrcCqM4ERpbIKuuSkTPAHcYXhfIl4uIInyMOXPN6oVkGlo
         SXaXlknTcUAduCEnlZ8h4JcHCw+s5+JBNHAGoP8BvnIC8bMdB58wtLPCogzGN+k+tnpJ
         0k/p/plyIbQJuj4DXOhEJ2WcpdGew8DpDiXOzliXl7sAidlEFwJKuhnn9rPCHf4BPZBO
         44MFKwKKyZzlTXcwddY4XoZ9TmoLuO7CpBFiC9sUmdqcJPJ8eClYSgO3T3Q+Vb8Lbuna
         tXhR24aMe0HyjYwdKDvwOQVx/gHNcaaCRg12hM929V4tNkpr94l5hJLgWmSEArdX7Cxn
         ZQMg==
X-Gm-Message-State: AJIora9R3iljuNnEMbRXp9VDweoJFCrCidCpzG1Wf5GV9Yg30D/Tkm8a
	hqDIIHVfj2x6+5CsxVwiWHXGOAsWP6c=
X-Google-Smtp-Source: AGRyM1t3AJcQOvuLXc1VAKJTaJoYuo/oU84CHWPCFnKvBlBLfRB9EhjTZq93mFPFJcglCWOPc/XCXg==
X-Received: by 2002:a5d:4c86:0:b0:210:2e6e:3a93 with SMTP id z6-20020a5d4c86000000b002102e6e3a93mr4829519wrs.185.1655210898986;
        Tue, 14 Jun 2022 05:48:18 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id l29-20020a05600c1d1d00b0039c3056c3dfsm22569349wms.27.2022.06.14.05.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 05:48:18 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] Remove the Pine64 Quartz copy of the RPi NVRAM
Date: Tue, 14 Jun 2022 13:48:16 +0100
Message-Id: <20220614124816.3948304-1-pbrobinson@gmail.com>
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

