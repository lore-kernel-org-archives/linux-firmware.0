Return-Path: <SRS0=/qOD=6B=intel.com=amit.k.bag@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBDAC3815B
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Apr 2020 09:49:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A002321D95; Fri, 17 Apr 2020 09:49:34 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58BFF21D94
	for <linux-firmware@kernel.org>; Fri, 17 Apr 2020 09:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58BFF21D94
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=amit.k.bag@intel.com
IronPort-SDR: FrWnX+xiXJhusZs51QQ0g/wDqa5J2EZYvxWNRqakrKWckZoAltIGusZp+m/ZDkAwuiy9pSpAWY
 t2ioqsrZcX6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 02:49:33 -0700
IronPort-SDR: vtAduAWaXsnZj9E/r8Y3yNNZsMdOdxCJLM+KXbARVpEXKn4/Y9K40dRJ/gvmFtnUGnDIA/MRoM
 BfbLH3HiY65g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
   d="scan'208";a="242961362"
Received: from unknown (HELO intel-Lenovo-Legion-Y540-15IRH-PG0.iind.intel.com) ([10.224.186.95])
  by orsmga007.jf.intel.com with ESMTP; 17 Apr 2020 02:49:31 -0700
From: Amit K Bag <amit.k.bag@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	"Hegde, Raghuram" <raghuram.hegde@intel.com>,
	Amit K Bag <amit.k.bag@intel.com>
Subject: [PATCH 1/2] Bluetooth: btusb: Add support for Intel Bluetooth Device Typhoon Peak (8087:0032)
Date: Fri, 17 Apr 2020 15:20:11 +0530
Message-Id: <20200417095012.8443-1-amit.k.bag@intel.com>
X-Mailer: git-send-email 2.17.1

From: "Hegde, Raghuram" <raghuram.hegde@intel.com>

Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 09913cadd1ca..7a71d851b6c9 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -340,6 +340,8 @@ static const struct usb_device_id blacklist_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x8087, 0x0029), .driver_info = BTUSB_INTEL_NEW |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x8087, 0x0032), .driver_info = BTUSB_INTEL_NEW |
+                                                     BTUSB_WIDEBAND_SPEECH},
 	{ USB_DEVICE(0x8087, 0x07da), .driver_info = BTUSB_CSR },
 	{ USB_DEVICE(0x8087, 0x07dc), .driver_info = BTUSB_INTEL },
 	{ USB_DEVICE(0x8087, 0x0a2a), .driver_info = BTUSB_INTEL },
-- 
2.17.1

