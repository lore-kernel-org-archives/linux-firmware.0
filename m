Return-Path: <SRS0=Zeuh=45=intel.com=amit.k.bag@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA83BC10DCE
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Mar 2020 10:21:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D33822072F; Thu, 12 Mar 2020 10:21:17 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B69420674
	for <linux-firmware@kernel.org>; Thu, 12 Mar 2020 10:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B69420674
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=amit.k.bag@intel.com
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 03:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; 
   d="scan'208";a="236589931"
Received: from unknown (HELO intel-Lenovo-Legion-Y540-15IRH-PG0.iind.intel.com) ([10.224.186.95])
  by fmsmga008.fm.intel.com with ESMTP; 12 Mar 2020 03:21:13 -0700
From: Amit K Bag <amit.k.bag@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	Sukumar Ghorai <sukumar.ghorai@intel.com>,
	Amit K Bag <amit.k.bag@intel.com>
Subject: [PATCH] Bluetooth: print fw build version in power-on boot
Date: Thu, 12 Mar 2020 15:51:42 +0530
Message-Id: <20200312102142.26538-1-amit.k.bag@intel.com>
X-Mailer: git-send-email 2.17.1
Message-ID: <20200312102142.EAba1DKlOXQ7hl1ZIQJj2CfPfGstc56mj5TCa5Wr7kE@z>

From: Sukumar Ghorai <sukumar.ghorai@intel.com>

To determine the build version of Bluetooth firmware to ensure reported
issue related to a particular release. This is very helpful for every fw
downloaded to BT controller and issue reported from field test.

Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
---
 drivers/bluetooth/btusb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index f5924f3e8b8d..d4328008a714 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -1930,7 +1930,12 @@ static int btusb_setup_intel(struct hci_dev *hdev)
 	if (err)
 		return err;
 
-	bt_dev_info(hdev, "Intel firmware patch completed and activated");
+       /* Need build number for downloaded fw patches in every power-on boot */
+       err = btintel_read_version(hdev, &ver);
+       if (err)
+               return err;
+       BT_INFO("%s: Intel Bluetooth fw patch 0x%02x completed and activated",
+               hdev->name, ver.fw_patch_num);
 
 	goto complete;
 
-- 
2.17.1

