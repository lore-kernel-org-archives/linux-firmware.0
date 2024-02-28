Return-Path: <SRS0=iiZZ=KF=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BDFC47DD9
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Feb 2024 22:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 462BEC43390; Wed, 28 Feb 2024 22:30:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C6C5C433C7
	for <linux-firmware@kernel.org>; Wed, 28 Feb 2024 22:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1C6C5C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709159452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cWjgE1iD8aNPcaIyy4I1v8bHuMHSmRqDwFIpo+fTxwA=;
	b=Gal+DwUjgzKhxrLhUBnLsnCDbgEDe5ah7DqL0WHPKS2SKMzd2S6L8jOnogDKzhqnbW1xGd
	AObvYEQsXs0rzRtq3R3dfdNKJDRd6iuZi/VwplDmJ0VJtl/M+Id6AQgAxWbD48HMCVG8Zx
	FD8NOVOues3aXIrVjP89Hq5X5C7xiK4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-Ek0GVfAIPjetmsHg4rT-hg-1; Wed, 28 Feb 2024 17:30:51 -0500
X-MC-Unique: Ek0GVfAIPjetmsHg4rT-hg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F272383B86B;
	Wed, 28 Feb 2024 22:30:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C1B7C04323;
	Wed, 28 Feb 2024 22:30:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>,
	Mario Limonciello <superm1@gmail.com>,
	linux-firmware@kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH linux-firmware] brcm: Add nvram for the Acer Iconia One 7 B1-750 tablet
Date: Wed, 28 Feb 2024 23:30:49 +0100
Message-ID: <20240228223049.40959-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add a NVRAM file for the brcmfmac43340 wifi/bt chip found on the Acer
Iconia One 7 B1-750 tablet. This is based on copy of the existing
'brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt' file with
some of the values adjusted for the Acer Iconia One 7 B1-750 tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 WHENCE                                    |  1 +
 brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt | 96 +++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt

diff --git a/WHENCE b/WHENCE
index 576f8d73..ffa5b6b2 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2833,6 +2833,7 @@ Licence: Redistributable. See LICENCE.cypress for details.
 File: "brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt"
 File: "brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt"
 File: "brcm/brcmfmac4330-sdio.Prowise-PT301.txt"
+File: "brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt"
 File: "brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
 File: "brcm/brcmfmac43340-sdio.meegopad-t08.txt"
 File: "brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt"
diff --git a/brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt b/brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt
new file mode 100644
index 00000000..cb930518
--- /dev/null
+++ b/brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0+
+# (C) Copyright 2018 Linaro Ltd
+# NVRAM config file for the 43430 WiFi/BT chip as found on the Acer Iconia
+# One 7 B1-750 tablet's mainboard
+aa2g=1
+aci_detect_en_2g=1
+ag0=255
+boardflags=0x0090201
+boardnum=22
+boardrev=0x1203
+boardtype=0x0653
+btc_params95=0x9
+cck2gpo=0x0000 
+cckPwrOffset=3
+cckpapden=0
+ccode=XZ
+dacrate2xen=1
+devid=0x4386
+dlocalidx5g=70
+dlorange_lowlimit=5
+gain=32
+gain_settle_dly_2g=4
+gain_settle_dly_5g=4
+interference=3
+iqcalidx5g=50
+iqlocalidx5g=40
+loflag=0
+lpbckmode5g=1 
+macaddr=00:90:4c:c5:12:38
+manfid=0x2d0
+maxp2ga0=0x38
+maxp5ga0=0x38
+maxp5gha0=0x38
+maxp5gla0=0x38
+mcs2gpo0=0x6666
+mcs2gpo1=0x6666
+mcs5ghpo0=0x2000
+mcs5ghpo1=0x6622
+mcs5glpo0=0x2000
+mcs5glpo1=0x6622
+mcs5gpo0=0x2000
+mcs5gpo1=0x6622
+nocrc=1
+noise_cal_high_gain_2g=73
+noise_cal_high_gain_5g=73
+noise_cal_nf_substract_val_2g=346
+noise_cal_nf_substract_val_5g=346
+noise_cal_po_2g=-1
+noise_cal_po_40_2g=-1
+noise_cal_po_40_5g=-1
+noise_cal_po_5g=-1
+ofdm2gpo=0x00000000
+ofdm5ghpo=0x66222000
+ofdm5glpo=0x66222000
+ofdm5gpo=0x66222000
+pa0b0=0x1bba
+pa0b1=0xfcae
+pa0b2=0xff4a
+pa0itssit=0x20
+pa1b0=0xac8
+pa1b1=0xfe4e
+pa1b2=0xff59
+pa1hib0=0xaf6
+pa1hib1=0xfe48
+pa1hib2=0xff7b
+pa1lob0=0xbb9
+pa1lob1=0xfe3d
+pa1lob2=0xFF44
+papden2g=1
+papden5g=1
+prodid=0x0653
+regrev=1
+rssisav2g=0x1
+rssisav5g=0x3
+rssismc2g=0x8
+rssismc5g=0x7
+rssismf2g=0xf
+rssismf5g=0xf
+rxpo5g=0
+sd_gpout=4
+sd_oobonly=1
+sromrev=3
+swctrlmap_2g=0x00080008,0x00100010,0x00080008,0x011010,0x11f
+swctrlmap_5g=0x00020002,0x00040004,0x00020002,0x011010,0x2fe
+triso2g=8
+triso5g=8
+tssifloor2g=63
+tssifloor5gh=27
+tssifloor5gl=28
+tssifloor5gm=28
+txalpfbyp=1
+txalpfpu=1
+txiqlopapu2g=0
+txiqlopapu5g=0
+vendid=0x14e4
+xtalfreq=37400
-- 
2.43.2

