Return-Path: <SRS0=wEzN=EZ=intel.com=kiran.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E6FC388F9
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Nov 2020 11:33:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BB1652100A; Thu, 19 Nov 2020 11:33:34 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84A4120867
	for <linux-firmware@kernel.org>; Thu, 19 Nov 2020 11:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84A4120867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=kiran.k@intel.com
IronPort-SDR: +z/RWzEdJh4t0TUquduHUgyFY+77sOnZCg/oHOsq/1qOA3VrgXPkqz/2xICWVMN6TKJOOcitle
 MrWv82jN82Eg==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="171442964"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="171442964"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 03:33:34 -0800
IronPort-SDR: bCgkzwbF5ZbB3gFatUdKk8/rOjy7vQPQXcMuzyBtSq6Oc/q6vM9EEsd8jCazSfIlRhpZrhCFxV
 2MTzgH7uTIiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="533143025"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmsmga006.fm.intel.com with ESMTP; 19 Nov 2020 03:33:32 -0800
From: Kiran K <kiran.k@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	sathish.narasimman@intel.com,
	Kiran K <kiran.k@intel.com>
Subject: [PATCH v8 5/5] Bluetooth: btusb: Map Typhoon peak controller to BTUSB_INTEL_NEWGEN
Date: Thu, 19 Nov 2020 17:04:50 +0530
Message-Id: <20201119113450.13771-5-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119113450.13771-1-kiran.k@intel.com>
References: <20201119113450.13771-1-kiran.k@intel.com>

Map Typhoon peak Intel controller to BTUSB_INTEL_NEWGEN

Signed-off-by: Kiran K <kiran.k@intel.com>
---
 drivers/bluetooth/btusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b3d470ec2622..4bab93f56677 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -366,7 +366,7 @@ static const struct usb_device_id blacklist_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x8087, 0x0029), .driver_info = BTUSB_INTEL_NEW |
 						     BTUSB_WIDEBAND_SPEECH },
-	{ USB_DEVICE(0x8087, 0x0032), .driver_info = BTUSB_INTEL_NEW |
+	{ USB_DEVICE(0x8087, 0x0032), .driver_info = BTUSB_INTEL_NEWGEN |
 						     BTUSB_WIDEBAND_SPEECH},
 	{ USB_DEVICE(0x8087, 0x07da), .driver_info = BTUSB_CSR },
 	{ USB_DEVICE(0x8087, 0x07dc), .driver_info = BTUSB_INTEL },
-- 
2.17.1

