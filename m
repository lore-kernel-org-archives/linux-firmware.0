Return-Path: <SRS0=in8J=IX=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A2FC433C1
	for <linux-firmware@archiver.kernel.org>; Thu, 25 Mar 2021 22:16:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1675C61A2D; Thu, 25 Mar 2021 22:16:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC8EF61937
	for <linux-firmware@kernel.org>; Thu, 25 Mar 2021 22:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC8EF61937
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616710568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=49x5QXkvtZYrc/fDYk1ddT4lCME6gwlclx5JiRa+AYs=;
	b=ZFiYP6+2rFBY5OaKkZfY6bg2KoJMSNf6MA6inDEIjR/wFuwNURiA0LGnxgdJiijylwBkYs
	jQ7RgXvRGzcaVN+2XBz5Eo0srMxcf6miWVk3ent3yHIl7uG8HpcQjFQPhG4jUL4hf6ZuHU
	caTkAHIaVcCDmJRM8IolFQKIiViQPnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-lWWwb_NMMEyfYiGATOof7A-1; Thu, 25 Mar 2021 18:16:06 -0400
X-MC-Unique: lWWwb_NMMEyfYiGATOof7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 666D310AF38F;
	Thu, 25 Mar 2021 22:16:05 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-54.ams2.redhat.com [10.36.112.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 579EE764F1;
	Thu, 25 Mar 2021 22:15:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>,
	linux-firmware@kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/3] brcm: Add nvram for the Chuwi Hi8 (CWI509) tablet
Date: Thu, 25 Mar 2021 23:15:46 +0100
Message-Id: <20210325221547.22966-2-hdegoede@redhat.com>
In-Reply-To: <20210325221547.22966-1-hdegoede@redhat.com>
References: <20210325221547.22966-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Add a NVRAM file for the brcmfmac43430a0 wifi/bit chip found on the
Chuw Hi8 (CWI509) tablet. This is based on copy of the existing
brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt NVRAM file with some
the calibration values adjusted for the Chuwi Hi8 tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 WHENCE                                   |  1 +
 brcm/brcmfmac43430a0-sdio.ilife-S806.txt | 47 ++++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 brcm/brcmfmac43430a0-sdio.ilife-S806.txt

diff --git a/WHENCE b/WHENCE
index ccef965..4483297 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2750,6 +2750,7 @@ File: "brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt"
 File: "brcm/brcmfmac43340-sdio.predia-basic.txt"
 File: "brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt"
 Link: brcm/brcmfmac43362-sdio.lemaker,bananapro.txt -> brcmfmac43362-sdio.cubietech,cubietruck.txt
+File: "brcm/brcmfmac43430a0-sdio.ilife-S806.txt"
 File: "brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt"
 File: "brcm/brcmfmac43430a0-sdio.ONDA-V80 PLUS.txt"
 File: "brcm/brcmfmac43430-sdio.AP6212.txt"
diff --git a/brcm/brcmfmac43430a0-sdio.ilife-S806.txt b/brcm/brcmfmac43430a0-sdio.ilife-S806.txt
new file mode 100644
index 0000000..c0ec873
--- /dev/null
+++ b/brcm/brcmfmac43430a0-sdio.ilife-S806.txt
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0+
+# (C) Copyright 2018 Linaro Ltd
+# NVRAM config file for the 43430a0 WiFi/BT chip found on the Chuwi Hi8 tablet
+aa2g=1
+ag0=255
+AvVmid_c0=0x0,0xc8
+boardflags=0x00404201
+# boardflags3 is not set
+boardnum=22
+boardrev=0x1101
+boardtype=0x0726
+# btc_params is not set
+cckbw202gpo=0
+cckpwroffset0=5
+ccode=X2
+# cldo_pwm is not set
+deadman_to=0xffffffff
+devid=0x43e2
+extpagain2g=0
+il0macaddr=00:90:4c:c5:12:38
+legofdmbw202gpo=0x66111111
+macaddr=00:90:4c:c5:12:38
+manfid=0x2d0
+maxp2ga0=90
+mcsbw202gpo=0x77711111
+muxenab=0x1
+nocrc=1
+ofdmdigfilttype=18
+ofdmdigfilttypebe=18
+pa0itssit=0x20
+pa2ga0=-168,7161,-820
+# pacalidx2g is not set
+# papdendidx is not set
+# papdepsoffset is not set
+papdmode=1
+# papdvalidtest is not set
+prodid=0x0726
+# propbw202gpois not set
+sd_gpdc=0
+sd_gpout=0
+sd_gpval=1
+# spurconfig is not set
+sromrev=11
+txpwrbckof=6
+vendid=0x14e4
+wl0id=0x431b
+xtalfreq=26000
-- 
2.30.2

