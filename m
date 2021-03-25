Return-Path: <SRS0=in8J=IX=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2799FC433C1
	for <linux-firmware@archiver.kernel.org>; Thu, 25 Mar 2021 22:15:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EE0E461A32; Thu, 25 Mar 2021 22:15:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 941B361937
	for <linux-firmware@kernel.org>; Thu, 25 Mar 2021 22:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 941B361937
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616710557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pHdeZYI+gxwynfKqwh+dsQcBaTMf/O/58stIM12HoIk=;
	b=HXptuVKHQqN66pLhBoUW3UKas6e3/cxNvo3E5aGTNlKgFYCiQIJcDveboElFh9kRpnWvxg
	SSvbtcJYXu3K+JecuCGb7A8N47RpsGM+IoHUiffumbrvGP6qNrSEQysFnMXxTqk6OP1NsM
	oq42nArRClRkMMhk4u1X299QLIiSThs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-tpqtbxz_P8mT2YNayqN4Lw-1; Thu, 25 Mar 2021 18:15:55 -0400
X-MC-Unique: tpqtbxz_P8mT2YNayqN4Lw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1320C1922960;
	Thu, 25 Mar 2021 22:15:55 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-54.ams2.redhat.com [10.36.112.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89DDF6B8F7;
	Thu, 25 Mar 2021 22:15:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>,
	linux-firmware@kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/3] brcm: Add nvram for the Predia Basic tablet
Date: Thu, 25 Mar 2021 23:15:45 +0100
Message-Id: <20210325221547.22966-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Add a NVRAM file for the brcmfmac43340 wifi/bit chip found on the
predia-basic tablet. This is based on copy of the existing
brcm/brcmfmac43340-sdio.meegopad-t08.txt NVRAM file with some the
calibration values adjusted for the Predia Basic tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 WHENCE                                   |  1 +
 brcm/brcmfmac43340-sdio.predia-basic.txt | 98 ++++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 brcm/brcmfmac43340-sdio.predia-basic.txt

diff --git a/WHENCE b/WHENCE
index 61fe385..ccef965 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2747,6 +2747,7 @@ Licence: Redistributable. See LICENCE.cypress for details.
 File: "brcm/brcmfmac4330-sdio.Prowise-PT301.txt"
 File: "brcm/brcmfmac43340-sdio.meegopad-t08.txt"
 File: "brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt"
+File: "brcm/brcmfmac43340-sdio.predia-basic.txt"
 File: "brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt"
 Link: brcm/brcmfmac43362-sdio.lemaker,bananapro.txt -> brcmfmac43362-sdio.cubietech,cubietruck.txt
 File: "brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt"
diff --git a/brcm/brcmfmac43340-sdio.predia-basic.txt b/brcm/brcmfmac43340-sdio.predia-basic.txt
new file mode 100644
index 0000000..c899475
--- /dev/null
+++ b/brcm/brcmfmac43340-sdio.predia-basic.txt
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0+
+# (C) Copyright 2018 Linaro Ltd
+# NVRAM config file for the Ampak AP6234 43340 WiFi/BT module found on the
+# Predia Basic tablet
+aa2g=1
+ag0=255
+boardflags=0x0090201
+boardnum=22
+boardrev=0x1203
+boardtype=0x0653
+btc_flags=71
+btc_params22=8000
+btc_params83=9000
+btc_params84=4500
+btc_params8=15000
+cck2gpo=0x2222 
+cckPwrOffset=3
+cckpapden=0
+ccode=X2
+dacrate2xen=1
+devid=0x4386
+dlocalidx5g=70
+dlorange_lowlimit=5
+gain=32
+gain_settle_dly_2g=4
+gain_settle_dly_5g=4
+iqcalidx5g=50
+iqlocalidx5g=40
+loflag=0
+lpbckmode5g=1 
+macaddr=00:90:4c:c5:12:38
+manfid=0x2d0
+maxp2ga0=76
+maxp5ga0=68
+maxp5gha0=68
+maxp5gla0=68
+mcs2gpo0=0x5555
+mcs2gpo1=0x5555
+mcs5ghpo0=0x7777
+mcs5ghpo1=0x7777
+mcs5glpo0=0x7777
+mcs5glpo1=0x7777
+mcs5gpo0=0x8888
+mcs5gpo1=0x8888
+nocrc=1
+noise_cal_high_gain_2g=73
+noise_cal_high_gain_5g=73
+noise_cal_nf_substract_val_2g=346
+noise_cal_nf_substract_val_5g=346
+noise_cal_po_2g=-1
+noise_cal_po_40_2g=-1
+noise_cal_po_40_5g=-1
+noise_cal_po_5g=-1
+ofdm2gpo=0x333333333
+ofdm5ghpo=0x66666666
+ofdm5glpo=0x66666666
+ofdm5gpo=0x66666666
+pa0b0=6957 default
+pa0b1=-808
+pa0b2=-178
+pa0itssit=0x20
+pa1b0=5372 
+pa1b1=-671
+pa1b2=-212
+pa1hib0=5620
+pa1hib1=-663
+pa1hib2=-179
+pa1lob0=5859
+pa1lob1=-693
+pa1lob2=-178
+papden2g=1
+papden5g=1
+prodid=0x0653
+rssisav2g=0x1
+rssisav5g=0x3
+rssismc2g=0x8
+rssismc5g=0x7
+rssismf2g=0xf
+rssismf5g=0xf
+rxpo5g=0
+sd_gpdc=0
+sd_gpout=4
+sd_gpval=1
+sromrev=3
+swctrlmap_2g=0x00080008,0x00100010,0x00080008,0x011010,0x11f
+swctrlmap_5g=0x00040004,0x00020002,0x00040004,0x011010,0x2fe
+triso2g=8
+triso5g=8
+tssifloor2g=69
+tssifloor5gh=74
+tssifloor5gl=77
+tssifloor5gm=77
+txalpfbyp=1
+txalpfpu=1
+txiqlopapu2g=0
+txiqlopapu5g=0
+vendid=0x14e4
+xtalfreq=37400
-- 
2.30.2

