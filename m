Return-Path: <SRS0=UFbd=U5=intel.com=John.C.Harrison@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F54DC433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Apr 2022 23:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD7F9C385AC; Tue, 19 Apr 2022 23:46:05 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50993C385A7;
	Tue, 19 Apr 2022 23:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50993C385A7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650411963; x=1681947963;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CC5BS3IDiw66ikE+4i0Fy4VBauecCw5PynyA2Tgo1vo=;
  b=l/d13tpLIgSHsAeVOcLi2rlkqEA3GcbIFTDh8RJPDiabHt4w1+tqbtz/
   SOFz8wz9hm3DB82tFyIqS1Jriv1ydR27zcw+TsuNSzEo7CHwZk6a3kIOg
   kXbgwoeumn8OmYqJyqVmQYYBuXNh3C4+TNvJLflHDiBJNVJh+OU/NpMtd
   PaLderDI2/ZHjJ87sqkxQuGcF70+uiFrsgltlqY0LmLYjCITGgqL5qOUH
   G1HU3F3FJGBe8DtwpPOyePK0gxOGTRLMZzOCA12RI+lwOJyY9Ll58qAzb
   nbVmOyWcgC0mnsJLv4NFGdWiYvPq4xSBmIUOC+9Hnzzsw+AcaM6qzirWg
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="324341088"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="324341088"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2022 16:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="657838216"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
  by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2022 16:46:02 -0700
From: John.C.Harrison@Intel.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: PR for new GuC v70.1.1
Date: Tue, 19 Apr 2022 16:46:01 -0700
Message-Id: <20220419234601.3075232-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 681281e49fb6778831370e5d94e6e1d97f0752d6:

  amdgpu: update PSP 13.0.8 firmware (2022-03-18 07:35:54 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware guc_v70.1.1

for you to fetch changes up to ab0d8c137d4235dbb09ac4c76dd5477719cd73f1:

  i915: Add GuC v70.1.1 for all platforms (2022-04-07 13:14:24 -0700)

----------------------------------------------------------------
John Harrison (1):
      i915: Add GuC v70.1.1 for all platforms

 WHENCE                   |  30 ++++++++++++++++++++++++++++++
 i915/adlp_guc_70.1.1.bin | Bin 0 -> 289472 bytes
 i915/bxt_guc_70.1.1.bin  | Bin 0 -> 206464 bytes
 i915/cml_guc_70.1.1.bin  | Bin 0 -> 206976 bytes
 i915/dg1_guc_70.1.1.bin  | Bin 0 -> 265152 bytes
 i915/ehl_guc_70.1.1.bin  | Bin 0 -> 274496 bytes
 i915/glk_guc_70.1.1.bin  | Bin 0 -> 206784 bytes
 i915/icl_guc_70.1.1.bin  | Bin 0 -> 274496 bytes
 i915/kbl_guc_70.1.1.bin  | Bin 0 -> 206976 bytes
 i915/skl_guc_70.1.1.bin  | Bin 0 -> 206208 bytes
 i915/tgl_guc_70.1.1.bin  | Bin 0 -> 277440 bytes
 11 files changed, 30 insertions(+)
 create mode 100644 i915/adlp_guc_70.1.1.bin
 create mode 100644 i915/bxt_guc_70.1.1.bin
 create mode 100644 i915/cml_guc_70.1.1.bin
 create mode 100644 i915/dg1_guc_70.1.1.bin
 create mode 100644 i915/ehl_guc_70.1.1.bin
 create mode 100644 i915/glk_guc_70.1.1.bin
 create mode 100644 i915/icl_guc_70.1.1.bin
 create mode 100644 i915/kbl_guc_70.1.1.bin
 create mode 100644 i915/skl_guc_70.1.1.bin
 create mode 100644 i915/tgl_guc_70.1.1.bin
