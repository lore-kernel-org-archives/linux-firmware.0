Return-Path: <SRS0=HjLZ=PB=intel.com=daniele.ceraolospurio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F96BC3DA4A
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Aug 2024 17:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7574EC4AF0F; Fri,  2 Aug 2024 17:59:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E104C4AF09
	for <linux-firmware@kernel.org>; Fri,  2 Aug 2024 17:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E104C4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722621598; x=1754157598;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9FIQ97N7/vfYBav7zrBpsLEIlOBsQebPw9pi9lWuOho=;
  b=U2Qo1mfXZRbCKcMuOPZUDHdqREuXrn3oC6lyQDQYz4i/bzLU7qFAkl/X
   eNC/g5jUe9GeIZUjoIsB6J0wzUL0HqPdHkVouQk2yGKdKoxUdSQ47ak8p
   /T/zFi0Vv4mPi2WVHWkWLsgK2BE7jZeiXTRGM4zt5kNctTf+p/0thzyKd
   SnQGSNTx16EOk/ZT1LqwY4tZWOd4nFX/UO5MVEaEDW8mgYHObzzlD0ZkT
   3RackCqlLo+ifGtcAUZ+qOMpwsoterk0DcBjGAxt8OEZTiQFMVaoqnnhh
   DbeFMDKe/SvdbNmKeTUsSaD6fFp9h37Eus8bAhfsjWDy6IwUWyM8SD8nJ
   Q==;
X-CSE-ConnectionGUID: zy7BexcSRo+gmerC0sL2jA==
X-CSE-MsgGUID: SqcALA5vRH+Q5K5uQRpYfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20326691"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="20326691"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 10:59:41 -0700
X-CSE-ConnectionGUID: x1Fv5axaTNGk4N1tYMy1TA==
X-CSE-MsgGUID: k4MgQKkBQgGJNgVLzbo2kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="55411093"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 10:59:41 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	gustavo.sousa@intel.com,
	John.C.Harrison@Intel.com
Subject: PR for new i915 and Xe binaries
Date: Fri,  2 Aug 2024 10:59:32 -0700
Message-ID: <20240802175932.784781-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bulk update of several binaries in the i915 and Xe folders.

- GuC:
    - All TGL+ binaries updated to v70.29.2
    - New binary added for BMG, also v70.29.2

- HuC:
    - DG2 binary updated to latest rev (v7.10.16)
    - New binaries added for LNL (v9.4.13) and BMG (v8.2.10)

- GSC:
    - MTL binary updated to v102.0.10.1878
    - New binary added for LNL, v104.0.0.1161

- DMC:
    - MTL binary updated to v2.22

The following changes since commit 65c5d9b1a4808462f5e885447dae1a133c96abec:

  Merge branch 'amdgpu-20240726' into 'main' (2024-07-28 14:28:08 +0000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/firmware.git tags/intel-2024-08-02

for you to fetch changes up to 95c414d44c8e60880be787822d5020a010044a49:

  xe: First GuC release v70.29.2 for BMG (2024-08-01 11:11:04 -0700)

----------------------------------------------------------------
Daniele Ceraolo Spurio (5):
      i915: update DG2 HuC to v7.10.16
      xe: Add LNL HuC 9.4.13
      xe: Add GSC 104.0.0.1161 for LNL
      xe: Add BMG HuC 8.2.10
      i915: update MTL GSC to v102.0.10.1878

Dnyaneshwar Bhadane (1):
      i915: Update MTL DMC v2.22

Julia Filipchuk (3):
      i915: Add GuC v70.29.2 for ADL-P, DG1, DG2, MTL, and TGL
      xe: Add GuC v70.29.2 for LNL
      xe: First GuC release v70.29.2 for BMG

 WHENCE               |  30 +++++++++++++++++++++---------
 i915/adlp_guc_70.bin | Bin 347584 -> 328768 bytes
 i915/dg1_guc_70.bin  | Bin 321472 -> 302656 bytes
 i915/dg2_guc_70.bin  | Bin 410368 -> 369408 bytes
 i915/dg2_huc_gsc.bin | Bin 630784 -> 630784 bytes
 i915/mtl_dmc.bin     | Bin 52476 -> 52700 bytes
 i915/mtl_gsc_1.bin   | Bin 1142784 -> 1134592 bytes
 i915/mtl_guc_70.bin  | Bin 332544 -> 303872 bytes
 i915/tgl_guc_70.bin  | Bin 335168 -> 316352 bytes
 xe/bmg_guc_70.bin    | Bin 0 -> 406272 bytes
 xe/bmg_huc.bin       | Bin 0 -> 585728 bytes
 xe/lnl_gsc_1.bin     | Bin 0 -> 1155072 bytes
 xe/lnl_guc_70.bin    | Bin 336640 -> 316160 bytes
 xe/lnl_huc.bin       | Bin 0 -> 643072 bytes
 14 files changed, 21 insertions(+), 9 deletions(-)
 create mode 100644 xe/bmg_guc_70.bin
 create mode 100644 xe/bmg_huc.bin
 create mode 100644 xe/lnl_gsc_1.bin
 create mode 100644 xe/lnl_huc.bin
