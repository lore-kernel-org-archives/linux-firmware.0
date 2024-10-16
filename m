Return-Path: <SRS0=/ugL=RM=terefe.re=tmn505@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368D7D2A538
	for <linux-firmware@archiver.kernel.org>; Wed, 16 Oct 2024 18:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EEE04C4CEC5; Wed, 16 Oct 2024 18:02:59 +0000 (UTC)
Received: from terefe.re (terefe.re [5.255.96.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63FE1C4CECF
	for <linux-firmware@kernel.org>; Wed, 16 Oct 2024 18:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63FE1C4CECF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=terefe.re
Received: from localhost.localdomain (unknown [212.106.161.95])
	by terefe.re (Postfix) with ESMTPSA id 338CF1FFD7;
	Wed, 16 Oct 2024 20:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=terefe.re; s=default;
	t=1729101768; bh=5wwE7idHKUMihrhIzcQYt6HsmtOcG3QElxefT88aYyE=;
	h=From:To:Cc:Subject:Date:From;
	b=UyFuRV/5hQh1H0H8v/5f+2GThin+x7gIZl5jDcHc2xvxlTCkAX143SIJC1RBU6Wq7
	 HXQXiRTnO6UNOvAp2FAE61R9zLxwAUeBde6b6BlgsogPJkdUyPSk4y7RnfXzEiZhKh
	 nXZ+ri3OQRYEReliVfB6rHf8Wks+6qUmqM5YJc6qanj/eP9FTpPL5nPXvQ+6rrXaHC
	 CoLOsiEEzbCP1PytNYu9ilRDAc5Bnel8EwFYv35l4MZNoP4CqhihAmsE1EpibYSeFb
	 7hGdLVv0l6lzXff7Urs2AOZZPTQB1mSKL0+iydtrSlBbGnyTiZeBm6ry4z/LP+2rW0
	 jEF2Ezt/8Z59g==
From: Tomasz Maciej Nowak <tmn505@terefe.re>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Mario Limonciello <superm1@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Tomasz Maciej Nowak <tmn505@gmail.com>
Subject: [PATCH] brcm: replace NVRAM for Jetson TX1
Date: Wed, 16 Oct 2024 20:02:41 +0200
Message-ID: <20241016180241.33004-1-tmn505@terefe.re>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Maciej Nowak <tmn505@gmail.com>

The current version is copied from latest Jetson Linux BSP and it's for
P3310 (TX2) module. While both TX1 and TX2 have same wireless chip,
possibly the SDIO module slightly differ and both have different NVRAM
files provided in separate BSP archives. Although TX1 module wireless
inteface can be brought up with TX2 NVRAM file, the performance is
slightly degraded, simple download test yielded extra 4MiB/s with proper
NVRAM file. Thus, replace it with proper file from R32.7.5 BSP, while
also droping commented-out values, since those are not parsed by the
driver.

Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
---
 brcm/brcmfmac4354-sdio.nvidia,p2371-2180.txt | 61 ++++++++------------
 1 file changed, 25 insertions(+), 36 deletions(-)

diff --git a/brcm/brcmfmac4354-sdio.nvidia,p2371-2180.txt b/brcm/brcmfmac4354-sdio.nvidia,p2371-2180.txt
index 46f7e6748933..60d3dd36a10c 100644
--- a/brcm/brcmfmac4354-sdio.nvidia,p2371-2180.txt
+++ b/brcm/brcmfmac4354-sdio.nvidia,p2371-2180.txt
@@ -1,4 +1,5 @@
 # Sample variables file for BCM94354 WLBGA iPA, iLNA board with SDIO for production package
+# NOTE: UPDATED TSSI PARAMETER FOR JETSON WITH COEX FILTER ON 10/5/2015. SHAILESH SINGH
 NVRAMRev=$Rev: 373428 $
 aa2g=3
 aa5g=3
@@ -11,58 +12,55 @@ AvVmid_c0=2,140,2,145,2,145,2,145,2,145
 AvVmid_c1=2,140,2,145,2,145,2,145,2,145
 AvVmid_c2=0,0,0,0,0,0,0,0,0,0
 boardflags=0x02400201
-boardflags2=0x00808200
-#boardflags2=0xc0800000
+boardflags2=0x00802000
 boardflags3=0x4000000a
-#boardnum=57410
 boardrev=0x1101
 boardtype=0x06db
 btc_params122=0
 btc_params123=0
 cckbw202gpo=0x0000
 cckbw20ul2gpo=0x0000
-ccode=XZ
+ccode=XR
 devid=0x43a3
 disable_olpc=0
 dot11agduphrpo=0x0
 dot11agduplrpo=0x0
-dot11agofdmhrbw202gpo=0x5533
-#enable LNA1 bypass for both 2G & 5G
+dot11agofdmhrbw202gpo=0x6666
 extpagain2g=2
 extpagain5g=2
 femctrl=10
 ltecxmux=0x534201
 macaddr=00:90:4c:16:70:01
 manfid=0x2d0
-maxp2ga0=72
-maxp2ga1=72
-maxp5ga0=72,72,72,72
-maxp5ga1=72,72,72,72
-mcsbw202gpo=0xDAA83311
-mcsbw205ghpo=0xBA442200
-mcsbw205glpo=0xBA442200
-mcsbw205gmpo=0xBA442200
-mcsbw402gpo=0xAAA74422
-mcsbw405ghpo=0xBA442200
-mcsbw405glpo=0xBA442200
-mcsbw405gmpo=0xBA442200
-mcsbw805ghpo=0xBA553300
-mcsbw805glpo=0xBA553300
-mcsbw805gmpo=0xBA553300
+maxp2ga0=74
+maxp2ga1=74
+maxp5ga0=74,74,74,74
+maxp5ga1=74,74,74,74
+mcsbw202gpo=0x99644422
+mcsbw205ghpo=0xdc666663
+mcsbw205glpo=0x88766663
+mcsbw205gmpo=0xd8666663
+mcsbw402gpo=0x99644422
+mcsbw405ghpo=0xaa666663
+mcsbw405glpo=0x88666663
+mcsbw405gmpo=0x88666663
+mcsbw805ghpo=0xdd666665
+mcsbw805glpo=0xbb666665
+mcsbw805gmpo=0xcc666665
 mcslr5ghpo=0x0000
 mcslr5glpo=0x0000
 mcslr5gmpo=0x0000
 muxenab=0x11
 nocrc=1
-ofdmlrbw202gpo=0x0000
+ofdmlrbw202gpo=0x0022
 olpc_anchor2g=0
 olpc_anchor5g=0
 olpc_thresh=0
 otpimagesize=502
-pa2ga0=0XFF3E,0X1433,0XFD75
-pa2ga1=0XFF41,0X14C5,0XFD69
-pa5ga0=0XFF39,0X1732,0XFD27,0XFF31,0X16A5,0XFD33,0XFF28,0X158F,0XFD49,0XFF45,0X16F3,0XFD25
-pa5ga1=0XFF3A,0X1707,0XFD2A,0XFF31,0X166C,0XFD38,0XFF22,0X149A,0XFD62,0XFF49,0X1696,0XFD33
+pa2ga0=-164,5202,-656
+pa2ga1=-180,5157,-654
+pa5ga0=-181,6179,-745,-180,6166,-740,-176,6025,-728,-175,5877,-718
+pa5ga1=-199,5842,-726,-198,5855,-728,-191,5691,-712,-170,5809,-715
 paprdis=1
 pdgain2g=4
 pdgain5g=4
@@ -73,9 +71,8 @@ pdoffset80ma1=0x0000
 pdoffsetcckma0=0x4
 pdoffsetcckma1=0x4
 phycal_tempdelta=255
-#prodid=0x052e
 rawtempsense=0x1ff
-regrev=996
+regrev=122
 rssicorrnorm5g_c0=1,2,3,1,2,3,6,6,8,6,6,8
 rssicorrnorm5g_c1=1,2,3,2,2,2,7,7,8,7,7,8
 rssicorrnorm_c0=4,4
@@ -85,9 +82,7 @@ rxgains2gelnagaina0=0
 rxgains2gelnagaina1=0
 rxgains2gtrelnabypa0=0
 rxgains2gtrelnabypa1=0
-#rxgains2gtrisoa0=3
 rxgains2gtrisoa0=7
-#rxgains2gtrisoa1=3
 rxgains2gtrisoa1=7
 rxgains5gelnagaina0=0
 rxgains5gelnagaina1=0
@@ -95,23 +90,17 @@ rxgains5ghelnagaina0=0
 rxgains5ghelnagaina1=0
 rxgains5ghtrelnabypa0=0
 rxgains5ghtrisoa0=12
-#rxgains5ghtrisoa0=4
 rxgains5ghtrisoa1=11
-#rxgains5ghtrisoa1=4
 rxgains5gmelnagaina0=0
 rxgains5gmelnagaina1=0
 rxgains5gmtrelnabypa0=0
 rxgains5gmtrelnabypa1=0
 rxgains5gmtrisoa0=13
-#rxgains5gmtrisoa0=4
 rxgains5gmtrisoa1=11
-#rxgains5gmtrisoa1=4
 rxgains5gtrelnabypa0=0
 rxgains5gtrelnabypa1=0
 rxgains5gtrisoa0=11
-#rxgains5gtrisoa0=4
 rxgains5gtrisoa1=10
-#rxgains5gtrisoa1=4
 sb20in40hrpo=0x0
 sb20in40lrpo=0x0
 sb20in80and160hr5ghpo=0x0
-- 
2.47.0

