Return-Path: <SRS0=2KGV=JH=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC977C47DB3
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jan 2024 17:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96DEDC43390; Mon, 29 Jan 2024 17:04:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53566C433F1
	for <linux-firmware@kernel.org>; Mon, 29 Jan 2024 17:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53566C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706547867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EEloEjJ/OatNkNSqOL2UUYsE8K3k/u5kWTWRux5Tlgg=;
	b=Rz1xaU7bxc5ebSvcZPz22cG1lXtlO7WU31Osz5x+K5WK2UU0NsCo6V6U3ReBM5fDyBnqCt
	UCVeYz4UAF6gKlC9H9Hqg1P879Li3zPvOdOuJT1u6lcz+Zn9dq2j6Da315MBkHStFbbYSl
	vS8Fk/oyXceNBsTYGhYYGPtaRtl8WE8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-m9v1tBFJMJeChrDtkSTZ4w-1; Mon,
 29 Jan 2024 12:04:24 -0500
X-MC-Unique: m9v1tBFJMJeChrDtkSTZ4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84DD729AA2F8;
	Mon, 29 Jan 2024 17:04:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D40691C060AF;
	Mon, 29 Jan 2024 17:04:22 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>,
	Mario Limonciello <superm1@gmail.com>,
	linux-firmware@kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH linux-firmware] brcm: Add brcmfmac43430-sdio.xxx.txt nvram for the Chuwi Hi8 (CWI509) tablet
Date: Mon, 29 Jan 2024 18:04:22 +0100
Message-ID: <20240129170422.48797-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add a NVRAM file for the brcmfmac43430[a1] wifi/bt chip found on some
versions of the Chuw Hi8 (CWI509) tablet. This is based on copy of
the existing brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt NVRAM file with some
the calibration values adjusted for the Chuwi Hi8 tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 WHENCE                                 |  1 +
 brcm/brcmfmac43430-sdio.ilife-S806.txt | 50 ++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 brcm/brcmfmac43430-sdio.ilife-S806.txt

diff --git a/WHENCE b/WHENCE
index c3a59846..3fc8a53c 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2842,6 +2842,7 @@ Link: brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt -> brcmfmac43430-sdio.A
 Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-r0.txt -> brcmfmac43430-sdio.AP6212.txt
 File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
+File: "brcm/brcmfmac43430-sdio.ilife-S806.txt"
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
 Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
diff --git a/brcm/brcmfmac43430-sdio.ilife-S806.txt b/brcm/brcmfmac43430-sdio.ilife-S806.txt
new file mode 100644
index 00000000..162b1e70
--- /dev/null
+++ b/brcm/brcmfmac43430-sdio.ilife-S806.txt
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0+
+# (C) Copyright 2018 Linaro Ltd
+# NVRAM config file for the 43430A1 WiFi/BT chip as found on the Chuwi Hi8
+# tablet's mainboard
+aa2g=1
+ag0=255
+AvVmid_c0=0x0,0xc8
+boardflags=0x00404201
+# boardflags3 is not set
+boardnum=22
+boardrev=0x1101
+boardtype=0x0726
+# btc_params is not set
+cckbw202gpo=0x5555
+cckpwroffset0=5
+ccode=X2
+# cldo_pwm is not set
+deadman_to=0xffffffff
+devid=0x43e2
+extpagain2g=0
+hostrdy=0x41
+hostwake=0x40
+il0macaddr=00:90:4c:c5:12:38
+legofdmbw202gpo=0x77777777
+macaddr=00:90:4c:c5:12:38
+manfid=0x2d0
+maxp2ga0=90
+mcsbw202gpo=0xaaaaaaaa
+nocrc=1
+ofdmdigfilttype=7
+pa0itssit=0x20
+pa2ga0=-168,7161,-820
+# pacalidx2g is not set
+# papdendidx is not set
+# papdepsoffset is not set
+papdmode=2
+# papdvalidtest is not set
+prodid=0x0726
+# propbw202gpois not set
+sd_gpdc=0
+sd_gpout=0
+sd_gpval=1
+# spurconfig is not set
+sromrev=11
+txpwrbckof=6
+usbrdy=0x03
+usbrdydelay=100
+vendid=0x14e4
+wl0id=0x431b
+xtalfreq=26000
-- 
2.43.0

