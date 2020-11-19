Return-Path: <SRS0=wEzN=EZ=intel.com=kiran.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E45C63798
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Nov 2020 11:33:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C5ABA2168B; Thu, 19 Nov 2020 11:33:26 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 872C52100A
	for <linux-firmware@kernel.org>; Thu, 19 Nov 2020 11:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 872C52100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=kiran.k@intel.com
IronPort-SDR: qYLV7mmyLibo1SgX1w417tZ/5VrqDq5Ji0vx1sROF3Pnh8+CLLBTERVjG7Itv+I9th+uTY501P
 eAe0jhv0ZfvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="171442950"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="171442950"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 03:33:25 -0800
IronPort-SDR: kWLPOm0dD6p8QnKSD0wmugvjLdhrdAZbQIgsegbdLhyGjo/nZQSBNsry57Ux/qgsOFZHfkubCL
 TzWKT9eH1Q3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="533142967"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmsmga006.fm.intel.com with ESMTP; 19 Nov 2020 03:33:23 -0800
From: Kiran K <kiran.k@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	sathish.narasimman@intel.com,
	Kiran K <kiran.k@intel.com>
Subject: [PATCH v8 1/5] Bluetooth: btintel: Fix endianness issue for TLV version information
Date: Thu, 19 Nov 2020 17:04:46 +0530
Message-Id: <20201119113450.13771-1-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1

do __le32_to_cpu to tlv data fields to make sure driver runs
correctly when running on big endian system.

Signed-off-by: Kiran K <kiran.k@intel.com>
Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
---
 drivers/bluetooth/btintel.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 88ce5f0ffc4b..41ff2071d7ef 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -437,31 +437,38 @@ int btintel_read_version_tlv(struct hci_dev *hdev, struct intel_version_tlv *ver
 		tlv = (struct intel_tlv *)skb->data;
 		switch (tlv->type) {
 		case INTEL_TLV_CNVI_TOP:
-			version->cnvi_top = get_unaligned_le32(tlv->val);
+			version->cnvi_top =
+				__le32_to_cpu(get_unaligned_le32(tlv->val));
 			break;
 		case INTEL_TLV_CNVR_TOP:
-			version->cnvr_top = get_unaligned_le32(tlv->val);
+			version->cnvr_top =
+				__le32_to_cpu(get_unaligned_le32(tlv->val));
 			break;
 		case INTEL_TLV_CNVI_BT:
-			version->cnvi_bt = get_unaligned_le32(tlv->val);
+			version->cnvi_bt =
+				__le32_to_cpu(get_unaligned_le32(tlv->val));
 			break;
 		case INTEL_TLV_CNVR_BT:
-			version->cnvr_bt = get_unaligned_le32(tlv->val);
+			version->cnvr_bt =
+				__le32_to_cpu(get_unaligned_le32(tlv->val));
 			break;
 		case INTEL_TLV_DEV_REV_ID:
-			version->dev_rev_id = get_unaligned_le16(tlv->val);
+			version->dev_rev_id =
+				__le16_to_cpu(get_unaligned_le16(tlv->val));
 			break;
 		case INTEL_TLV_IMAGE_TYPE:
 			version->img_type = tlv->val[0];
 			break;
 		case INTEL_TLV_TIME_STAMP:
-			version->timestamp = get_unaligned_le16(tlv->val);
+			version->timestamp =
+				__le16_to_cpu(get_unaligned_le16(tlv->val));
 			break;
 		case INTEL_TLV_BUILD_TYPE:
 			version->build_type = tlv->val[0];
 			break;
 		case INTEL_TLV_BUILD_NUM:
-			version->build_num = get_unaligned_le32(tlv->val);
+			version->build_num =
+				__le32_to_cpu(get_unaligned_le32(tlv->val));
 			break;
 		case INTEL_TLV_SECURE_BOOT:
 			version->secure_boot = tlv->val[0];
-- 
2.17.1

