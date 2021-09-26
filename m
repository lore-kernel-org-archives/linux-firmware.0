Return-Path: <SRS0=XsoU=OQ=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40767C433EF
	for <linux-firmware@archiver.kernel.org>; Sun, 26 Sep 2021 10:50:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1863961019; Sun, 26 Sep 2021 10:50:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D39F16108E
	for <linux-firmware@kernel.org>; Sun, 26 Sep 2021 10:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D39F16108E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632653437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AGpKzBFXznTj59hWhSGZ/94aKIjtpoDINQfxEJqLJjU=;
	b=gykX9kK9Xqda94e78ONI4CtRydCpLDL4bEEvDEuoBmmvHk3ewIAD59mJTrVWoEumiqD7Gz
	cwttOh7Wd5BrR4Frj3OoIH5IS0jXsxfq2UdCAkbTZwe62W7SHq8/Gf455sTK7f6niJxwKM
	q2hauLDOQOMMGDstZcD9O9pSX/WIihs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-WJiV44cbMIaxnY8L2aiaig-1; Sun, 26 Sep 2021 06:50:33 -0400
X-MC-Unique: WJiV44cbMIaxnY8L2aiaig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3EB9802947;
	Sun, 26 Sep 2021 10:50:32 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE56C5BAE7;
	Sun, 26 Sep 2021 10:50:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>,
	linux-firmware@kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] brcm: Add 43455 based AP6255 NVRAM for the ACEPC T8 Mini PC
Date: Sun, 26 Sep 2021 12:50:30 +0200
Message-Id: <20210926105030.6198-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Add a NVRAM file for the Ampak AP6255 Wifi/BT module as used
on the ACEPC T8 Mini PC This file is based on the existing
"brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt" NVRAM file with
the values adjusted for the Minix Neo Z83-4 Mini PC

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 WHENCE                               |  1 +
 brcm/brcmfmac43455-sdio.acepc-t8.txt | 73 ++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 brcm/brcmfmac43455-sdio.acepc-t8.txt

diff --git a/WHENCE b/WHENCE
index 3321033..16eaaa4 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2847,6 +2847,7 @@ File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
 Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
+File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
 File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
 Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
 File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
diff --git a/brcm/brcmfmac43455-sdio.acepc-t8.txt b/brcm/brcmfmac43455-sdio.acepc-t8.txt
new file mode 100644
index 0000000..8698316
--- /dev/null
+++ b/brcm/brcmfmac43455-sdio.acepc-t8.txt
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0+
+# (C) Copyright 2018 Linaro Ltd
+# NVRAM config file for the Ampak AP6255 43455 WiFi/BT module found on the
+# ACEPC T8 (aka W8 pro) and the T11, as well as for the Cyberbook T116 tablet
+AvVmid_c0=0,157,1,126,1,126,1,126,1,126
+aa2g=1
+aa5g=1
+boardflags2=0x40000000
+boardflags3=0x48200100
+boardflags=0x00080201
+boardrev=0x1304
+boardtype=0x6e4
+ccode=X2
+deadman_to=481500000
+devid=0x43ab
+dot11agofdmhrbw202gpo=0x1553
+ed_thresh2g=-54
+ed_thresh5g=-54
+extpagain2g=2
+extpagain5g=2
+femctrl=0
+itrsw=1
+ltecxfnsel=0x22
+ltecxgcigpio=0x32
+ltecxmux=0
+ltecxpadnum=0x0504
+macaddr=00:90:4c:c5:12:38
+manfid=0x2d0
+maxp2ga0=64
+maxp5ga0=80,82,76,77
+mcsbw202gpo=0x99355533
+mcsbw205ghpo=0x99855000
+mcsbw205glpo=0x99755000
+mcsbw205gmpo=0x9df55000
+mcsbw405ghpo=0xd9755000
+mcsbw405glpo=0xb8555000
+mcsbw405gmpo=0xed955000
+mcsbw805ghpo=0xd9555000
+mcsbw805glpo=0xc8555000
+mcsbw805gmpo=0xe9555000
+nocrc=1
+ofdmlrbw202gpo=0x0033
+pa2ga0=-112,6296,-662
+pa2ga1=-165,3699,-515
+pa5ga0=-143,6016,-683,-141,6013,-678,-137,5988,-670,-136,5982,-670
+pa5ga1=-161,3544,-499,-166,3543,-497,-169,3569,-497,-171,3598,-498
+pdoffset2g40ma0=10
+pdoffset40ma0=0xaaaa
+pdoffset80ma0=0xaaaa
+prodid=0x06e4
+regrev=1
+rxchain=1
+rxgains2gelnagaina0=0
+rxgains2gtrelnabypa0=0
+rxgains2gtrisoa0=0
+rxgains5gelnagaina0=0
+rxgains5gtrelnabypa0=0
+rxgains5gtrisoa0=0
+sd_gpout=0
+sd_gpval=0
+sromrev=11
+swctrlmap_2g=0x00040004,0x00020002,0x00040004,0x010a02,0x1ff
+swctrlmap_5g=0x00100010,0x00200020,0x00100010,0x010a02,0x2f4
+swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x000
+swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x000
+tssipos2g=1
+tssipos5g=1
+tworangetssi2g=1
+tworangetssi5g=1
+txchain=1
+vcodivmode=1
+vendid=0x14e4
+xtalfreq=37400
-- 
2.31.1

