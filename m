Return-Path: <SRS0=G7qU=WR=manjaro.org=strit@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D45C43334
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Jun 2022 11:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4CB3AC3411D; Fri, 10 Jun 2022 11:43:48 +0000 (UTC)
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A7E6C34114
	for <linux-firmware@kernel.org>; Fri, 10 Jun 2022 11:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A7E6C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=manjaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=manjaro.org
From: Dan Johansen <strit@manjaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dan Johansen <strit@manjaro.org>
Subject: [PATCH] brcm: Add NVRAM file for Pinebook Pro from Pine64
Date: Fri, 10 Jun 2022 13:40:52 +0200
Message-Id: <20220610114051.2663502-1-strit@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This file is based on the existing "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt" NVRAM file.
Also update the WHENCE file.

The new batch of Pine64 Pinebook Pro ships with a new wifi/bt module, that uses this firmware, so add the config file to get it detected.

Signed-off-by: Dan Johansen <strit@manjaro.org>
---
 WHENCE                                        |  1 +
 ...brcmfmac43455-sdio.pine64,pinebook-pro.txt | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt

diff --git a/WHENCE b/WHENCE
index 776dd8b..853bed6 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2952,6 +2952,7 @@ File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
 Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
 File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
+File: "brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt"
 File: "brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"
 File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
 Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
diff --git a/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt b/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt
new file mode 100644
index 0000000..83ca9f4
--- /dev/null
+++ b/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0+
+# (C) Copyright 2018 Raspberry Pi (Trading) Ltd.
+# NVRAM config file for the BCM43455 WiFi/BT chip as found on the
+# Pine64 Pinebook Pro
+aa2g=1
+aa5g=1
+AvVmid_c0=1,165,2,100,2,100,2,100,2,100
+boardflags=0x00480201
+boardflags2=0x40800000
+boardflags3=0x44200100
+boardrev=0x1304
+boardtype=0x6e4
+btc_mode=1
+btc_params1=0x7530
+btc_params8=0x4e20
+btc_params50=0x972c
+cbfilttype=1
+cckPwrIdxCorr=3
+cckTssiDelay=150
+deadman_to=481500000
+devid=0x43ab
+dot11agofdmhrbw202gpo=0x4442
+dot11b_opts=0x3aa85
+ed_thresh2g=-54
+ed_thresh5g=-54
+eu_edthresh2g=-54
+eu_edthresh5g=-54
+extpagain2g=2
+extpagain5g=2
+fdsslevel_ch11=6
+femctrl=0
+itrsw=1
+ldo1=4
+ltecxfnsel=0x22
+ltecxgcigpio=0x32
+ltecxmux=0
+ltecxpadnum=0x0504
+macaddr=b8:27:eb:74:f2:6c
+manfid=0x2d0
+maxp2ga0=80
+maxp5ga0=82,82,82,82
+mcsbw202gpo=0x98444422
+mcsbw205ghpo=0xb9555000
+mcsbw205glpo=0xb9555000
+mcsbw205gmpo=0xb9555000
+mcsbw402gpo=0x98444422
+mcsbw405ghpo=0xb9555000
+mcsbw405glpo=0xb9555000
+mcsbw405gmpo=0xb9555000
+mcsbw805ghpo=0xb9555000
+mcsbw805glpo=0xb9555000
+mcsbw805gmpo=0xb9555000
+nocrc=1
+ofdmlrbw202gpo=0x0022
+ofdmTssiDelay=150
+pa2ga0=-129,6525,-718
+pa2ga1=-149,4408,-601
+pa5ga0=-185,6836,-815,-186,6838,-815,-184,6859,-815,-184,6882,-818
+pa5ga1=-202,4285,-574,-201,4312,-578,-196,4391,-586,-201,4294,-575
+pdoffset2g40ma0=16
+pdoffset2gperchan=0,-2,1,0,1,0,1,1,1,0,0,-1,-1,0
+pdoffset40ma0=0x8888
+pdoffset80ma0=0x8888
+pdoffsetcckma0=2
+phycal_tempdelta=15
+prodid=0x06e4
+rawtempsense=0x1ff
+rxchain=1
+sromrev=11
+swctrlmap_2g=0x00000000,0x00000000,0x00000000,0x010000,0x3ff
+swctrlmap_5g=0x00100010,0x00200020,0x00200020,0x010000,0x3fe
+swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x3
+swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x3
+tssipos2g=1
+tssipos5g=1
+tworangetssi2g=1
+tworangetssi5g=1
+txchain=1
+txpwr2gAdcScale=1
+txpwr5gAdcScale=1
+vcodivmode=1
+vendid=0x14e4
+xtalfreq=37400
-- 
2.36.1

