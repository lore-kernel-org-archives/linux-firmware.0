Return-Path: <SRS0=36QC=JZ=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A697C48260
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Feb 2024 11:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42E50C433F1; Fri, 16 Feb 2024 11:17:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE343C433C7
	for <linux-firmware@kernel.org>; Fri, 16 Feb 2024 11:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE343C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708082252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sqomQCHJ+kYPnBOt3sHFtxnJ/E9CMvcRGAzmpRK5K6o=;
	b=CVlssE8XQwoFOgpd8O5GTsP7rGL4E/vlzsGoOpt4+I9tJGQj6Dy4HmorcGRSN1+IjURLmH
	bBj5uztkOE1ZS1L2Hd4869v3MdBSrmu1shZ4PWQv32Xw6wTrhrEZ20M4hA8EjeB4iQmGIx
	j1R2Kh5R68epFr5ezMmV1VjWzdaAEdQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-KKfd2PkMMo6TVCvdVNA_5g-1; Fri,
 16 Feb 2024 06:17:29 -0500
X-MC-Unique: KKfd2PkMMo6TVCvdVNA_5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9048B3C14943;
	Fri, 16 Feb 2024 11:17:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6A5A40C9444;
	Fri, 16 Feb 2024 11:17:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>,
	Mario Limonciello <superm1@gmail.com>,
	linux-firmware@kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH linux-firmware] brcm: Add nvram for the Asus Memo Pad 7 ME176C tablet
Date: Fri, 16 Feb 2024 12:17:20 +0100
Message-ID: <20240216111720.105373-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add a NVRAM file for the brcmfmac43362 wifi/bt chip found on the Asus
Memo Pad 7 ME176C tablet. This is based on copy of the existing
brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt file with some
of the values adjusted for the Asus Memo Pad 7 ME176C tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 WHENCE                                        |  1 +
 ...3362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 brcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt

diff --git a/WHENCE b/WHENCE
index d9bed25d..ba9baa17 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2838,6 +2838,7 @@ File: "brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
 File: "brcm/brcmfmac43340-sdio.meegopad-t08.txt"
 File: "brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt"
 File: "brcm/brcmfmac43340-sdio.predia-basic.txt"
+File: "brcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt"
 File: "brcm/brcmfmac43362-sdio.WC121.txt"
 File: "brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt"
 Link: brcm/brcmfmac43362-sdio.kobo,aura.txt -> brcmfmac43362-sdio.WC121.txt
diff --git a/brcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt b/brcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt
new file mode 100644
index 00000000..0d05d420
--- /dev/null
+++ b/brcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt	
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0+
+# (C) Copyright 2018 Linaro Ltd
+# NVRAM config file for the Ampak AP6476A 43362 WiFi/BT module found on the
+# Asus Memo Pad 7 ME176C tablet
+aa2g=1
+ag0=2
+boardflags2=0x80
+boardflags=0x80201
+boardnum=777
+boardrev=0x1207
+boardtype=0x0598
+btc_flags=0x7
+btc_params0=5000
+btc_params1=1000
+btc_params6=63
+cck2gpo=0x2222
+cckPwrIdxCorr=-8
+cckPwrOffset=4
+ccode=X2
+devid=0x4343
+edoffthd=-71
+edonthd=-65
+initxidx2g=45
+logen_mode=0x0,0x02,0x1b,0x0,0x1b
+macaddr=00:90:4c:c5:12:38
+manfid=0x2d0
+maxp2ga0=74
+mcs2gpo0=0x8888
+mcs2gpo1=0x8888
+noise_cal_dbg.fab.3=1
+noise_cal_enable_2g=0
+noise_cal_high_gain.fab.3=76
+noise_cal_nf_substract_val.fab.3=356
+noise_cal_po_2g.fab.3=4
+noise_cal_po_2g=4
+ofdm2gpo=0x66666666
+ofdmdigfilttype=4
+pa0b0=0x12AD
+pa0b1=0xFDE2
+pa0b2=0xFF71
+pa0itssit=62
+pa0maxpwr=80
+pa1itssit=62
+prodid=0x492
+rfreg033=0x19
+rfreg033_cck=0x1f
+rssisav2g=0x7
+rssismc2g=0x3
+rssismf2g=0xa
+sd_gpout=1
+sd_gpval=0
+sd_oobonly=0
+spuravoid_enable2g=1
+sromrev=3
+swctrlmap_2g=0x04040404,0x02020202,0x02020202,0x010101,0x1ff
+temp_add=29767
+temp_mult=425
+temp_q=10
+triso2g=0
+tssitime=1
+vendid=0x14e4
+wl0id=0x431b
+xtalfreq=26000
-- 
2.43.0

