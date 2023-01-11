Return-Path: <SRS0=LWFL=5I=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7F1C46467
	for <linux-firmware@archiver.kernel.org>; Wed, 11 Jan 2023 20:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86277C433F0; Wed, 11 Jan 2023 20:55:46 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC92BC433D2
	for <linux-firmware@kernel.org>; Wed, 11 Jan 2023 20:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AC92BC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ietUBY8JFpC5kaxIYgR6Q5C423hRwtunmkXfdE5FPNA=; b=1nFWQt1Jv5ce0MCDnSB0+g0aY/
	KcALEYMi8bi3QO12T7X7LmTL8phTdUAquYqF193p1L0SstEE9ieWeDAmeP52Y/UtiCRiTmELuiA8a
	YjVbziRE+fSgir0QkIhpz4N3Wh/5Oz/M3KJOUwVJ0s23sRzldBeNc48wNijAClAyuaewu60cpH7UH
	4hKIeDHZe5d0EveOpcxMx3faB0In7+aYmiP3wQG9oCSEuGMSfo/xI7ia0oAIIhtqmmdaoHb8tW4Ko
	IGDTAx5hlecJcB2U+gCMtnwV2V6H2/auWrpdJ4cM2z13NYqHngqcgB2q8NBSlbQy0Ni4XObTQUtjy
	wWBKgjfw==;
Received: from p200300ccff07a8001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff07:a800:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1pFi8M-0000Ah-AC; Wed, 11 Jan 2023 21:55:42 +0100
Received: from andi by aktux with local (Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1pFi8L-008pg9-Qs; Wed, 11 Jan 2023 21:55:41 +0100
From: Andreas Kemnade <andreas@kemnade.info>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] brcm: add configuration files for CyberTan WC121
Date: Wed, 11 Jan 2023 21:55:25 +0100
Message-Id: <20230111205525.2105230-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These chips are found in some ebook readers with
devicetree in mainline kernel.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 WHENCE                            |  3 +++
 brcm/brcmfmac43362-sdio.WC121.txt | 36 +++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 brcm/brcmfmac43362-sdio.WC121.txt

diff --git a/WHENCE b/WHENCE
index f31fa30..b84f426 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2930,7 +2930,10 @@ File: "brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
 File: "brcm/brcmfmac43340-sdio.meegopad-t08.txt"
 File: "brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt"
 File: "brcm/brcmfmac43340-sdio.predia-basic.txt"
+File: "brcm/brcmfmac43362-sdio.WC121.txt"
 File: "brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt"
+Link: brcm/brcmfmac43362-sdio.kobo,aura.txt -> brcmfmac43362-sdio.WC121.txt
+Link: brcm/brcmfmac43362-sdio.kobo,tolino-shine2hd.txt -> brcmfmac43362-sdio.WC121.txt
 Link: brcm/brcmfmac43362-sdio.lemaker,bananapro.txt -> brcmfmac43362-sdio.cubietech,cubietruck.txt
 File: "brcm/brcmfmac43430a0-sdio.ilife-S806.txt"
 File: "brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt"
diff --git a/brcm/brcmfmac43362-sdio.WC121.txt b/brcm/brcmfmac43362-sdio.WC121.txt
new file mode 100644
index 0000000..9a2aa1b
--- /dev/null
+++ b/brcm/brcmfmac43362-sdio.WC121.txt
@@ -0,0 +1,36 @@
+aa2g=1
+boardflags=0xa00
+boardnum=777
+boardrev=0x1207
+boardtype=0x0598
+cckPwrOffset=4
+ccode=0
+devid=0x4343
+edoffthd=-71
+edonthd=-65
+initxidx2g=45
+macaddr=00:90:4c:07:7${maclo12}
+manfid=0x2d0
+maxp2ga0=74
+mcs2gpo0=0x4444
+mcs2gpo1=0x6444
+noise_cal_enable_2g=0
+ofdm2gpo=0x44111111
+pa0b0=5447
+pa0b1=-658
+pa0b2=-175
+pa0itssit=62
+pa0maxpwr=80
+pa1itssit=62
+prodid=0x492
+rssisav2g=0x7
+rssismc2g=0x3
+rssismf2g=0xa
+sromrev=3
+swctrlmap_2g=0x04040404,0x02020202,0x04040404,0x010101,0x1ff
+temp_add=29767
+temp_mult=425
+temp_q=10
+triso2g=0
+vendid=0x14e4
+xtalfreq=26000
-- 
2.30.2

