Return-Path: <SRS0=nzBv=MA=intel.com=John.C.Harrison@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C57DC07E96
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Jul 2021 17:50:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 62A8961874; Thu,  8 Jul 2021 17:50:34 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D971616EB;
	Thu,  8 Jul 2021 17:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D971616EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=John.C.Harrison@intel.com
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="273397158"
X-IronPort-AV: E=Sophos;i="5.84,224,1620716400"; 
   d="scan'208";a="273397158"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2021 10:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,224,1620716400"; 
   d="scan'208";a="428464698"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
  by orsmga002.jf.intel.com with ESMTP; 08 Jul 2021 10:50:25 -0700
From: John.C.Harrison@Intel.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: PR for new GuC v62.0.3 and HuC v7.9.3 binaries
Date: Thu,  8 Jul 2021 10:50:25 -0700
Message-Id: <20210708175025.333468-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit d79c26779d459063b8052b7fe0a48bce4e08d0d9:

  amdgpu: update vcn firmware for green sardine for 21.20 (2021-06-29 07:26:03 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware guc_62.0_huc_7.9

for you to fetch changes up to f4d897acd200190350a5f2148316c51c6c57bc9b:

  firmware/i915/guc: Add HuC v7.9.3 for TGL & DG1 (2021-06-29 14:20:03 -0700)

----------------------------------------------------------------
John Harrison (3):
      firmware/i915/guc: Add GuC v62.0.0 for all platforms
      firmware/i915/guc: Add GuC v62.0.3 for ADL-P
      firmware/i915/guc: Add HuC v7.9.3 for TGL & DG1

 WHENCE                   |  38 +++++++++++++++++++++++++++++++++++++-
 i915/adlp_guc_62.0.3.bin | Bin 0 -> 336704 bytes
 i915/bxt_guc_62.0.0.bin  | Bin 0 -> 199616 bytes
 i915/cml_guc_62.0.0.bin  | Bin 0 -> 200448 bytes
 i915/dg1_guc_62.0.0.bin  | Bin 0 -> 315648 bytes
 i915/dg1_huc_7.9.3.bin   | Bin 0 -> 589888 bytes
 i915/ehl_guc_62.0.0.bin  | Bin 0 -> 327488 bytes
 i915/glk_guc_62.0.0.bin  | Bin 0 -> 200000 bytes
 i915/icl_guc_62.0.0.bin  | Bin 0 -> 327488 bytes
 i915/kbl_guc_62.0.0.bin  | Bin 0 -> 200448 bytes
 i915/skl_guc_62.0.0.bin  | Bin 0 -> 199552 bytes
 i915/tgl_guc_62.0.0.bin  | Bin 0 -> 326016 bytes
 i915/tgl_huc_7.9.3.bin   | Bin 0 -> 589888 bytes
 13 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 i915/adlp_guc_62.0.3.bin
 create mode 100644 i915/bxt_guc_62.0.0.bin
 create mode 100644 i915/cml_guc_62.0.0.bin
 create mode 100644 i915/dg1_guc_62.0.0.bin
 create mode 100644 i915/dg1_huc_7.9.3.bin
 create mode 100644 i915/ehl_guc_62.0.0.bin
 create mode 100644 i915/glk_guc_62.0.0.bin
 create mode 100644 i915/icl_guc_62.0.0.bin
 create mode 100644 i915/kbl_guc_62.0.0.bin
 create mode 100644 i915/skl_guc_62.0.0.bin
 create mode 100644 i915/tgl_guc_62.0.0.bin
 create mode 100644 i915/tgl_huc_7.9.3.bin
