Return-Path: <SRS0=4gA8=JX=intel.com=kiran.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC97CC43460
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Apr 2021 06:30:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B21A5611F0; Mon, 26 Apr 2021 06:30:02 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 820A260FE5
	for <linux-firmware@kernel.org>; Mon, 26 Apr 2021 06:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 820A260FE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=kiran.k@intel.com
IronPort-SDR: Z504FZAqDgM7+Ablxx5tjxTdAF4hqOabNEVVHrAmbiLE1TPOzFPUYm+TlsYrJU/0dXcr/NpZXD
 YVvG0I/BHyyg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="216984327"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="216984327"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 23:30:01 -0700
IronPort-SDR: fDQ9JFFofomlIk3NR40O61atKjW/gLrVqymnCU0j2+p7KTRCTNa/7nOBwh07WG3wejGR8S0Ugt
 GbsmeG78q2hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="457047155"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmsmga002.fm.intel.com with ESMTP; 25 Apr 2021 23:29:59 -0700
From: Kiran K <kiran.k@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	Kiran K <kiran.k@intel.com>
Subject: [PATCH v1 2/7] linux-firmware: Intel BT 7265: Fix Security Issues
Date: Mon, 26 Apr 2021 12:03:49 +0530
Message-Id: <20210426063354.14844-2-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426063354.14844-1-kiran.k@intel.com>
References: <20210426063354.14844-1-kiran.k@intel.com>

This is firmware patch for Intel Bluetooth 7265 (StP D1)
StP D1 FW Patch Version: 0x42(66)

This patch contains the following fixes on previous 0x41(65)
- Security Issues

Signed-off-by: Kiran K <kiran.k@intel.com>
---
 WHENCE                                     |   2 +-
 intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq | Bin 45954 -> 46817 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/WHENCE b/WHENCE
index 2052f743856d..f15b5acd4fef 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3630,7 +3630,7 @@ Version: BT_StonePeak_C0_REL_59_0001
 File: intel/ibt-hw-37.8.10-fw-1.10.3.11.e.bseq
 Version: BT_StonePeak_D0_REL_50_0002
 File: intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq
-Version: BT_StonePeak_D1_REL_65_00001
+Version: BT_StonePeak_D1_REL_66_1167
 File: intel/ibt-11-5.ddc
 Version: LnP/SfP_REL0522
 File: intel/ibt-11-5.sfi
diff --git a/intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq b/intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq
index 903cd32f3573b42808d10c28a75829e266e0bab5..263296cdfefe84c803765ed399d0ded0bff46827 100644
GIT binary patch
delta 10733
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

delta 9964
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

-- 
2.17.1

