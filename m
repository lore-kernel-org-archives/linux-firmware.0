Return-Path: <SRS0=UhXm=R7=intel.com=John.C.Harrison@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8543FC433EF
	for <linux-firmware@archiver.kernel.org>; Sat, 15 Jan 2022 00:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B68EC36AED; Sat, 15 Jan 2022 00:03:55 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29B30C36AE7;
	Sat, 15 Jan 2022 00:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 29B30C36AE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642205034; x=1673741034;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fRBRqTxEx+BL3S0gUUc8sK1XSmUMURLrleL6ieCDm3Y=;
  b=KfpRLc7CHguu66SJZxYLpjzX7QKh1mY6pCWWKhE1lrNbaPJ3ju1Go3EA
   2LQWWOqWo6XFyBa4gD2gDf01P05OfWeQCyRw/9KPdT505H7KSzAKeHUlx
   jRhcxGjBdI+Rt2TsnJ3zWJM0Xs0f2fM/Iv6wwqwjyRojzR4UzbYJe9Y9j
   wh6iklSL2QvQ7EH62/6yXmfwu10+Ssqi+m3sdsoNG1d9I0vUpapnRSmCL
   taHp/2M2rPoC7bDQdEjxFpxms4m1jyc976g3GN1kcFQ0pgiL5bnsQfah2
   ZjcT/2t4jxFQsq0u+fan+HkTbogzOkeE/AJTssiZjqSubS3/vD2G+GCvA
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="243169055"
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; 
   d="scan'208";a="243169055"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2022 16:03:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; 
   d="scan'208";a="614500477"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jan 2022 16:03:53 -0800
From: John.C.Harrison@Intel.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: [CI] PR for new GuC v69.0.3
Date: Fri, 14 Jan 2022 16:03:53 -0800
Message-Id: <20220115000353.1812714-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b0e898fbaf377c99a36aac6fdeb7250003648ca4:

  linux-firmware: Update firmware file for Intel Bluetooth 9462 (2021-11-23 12:31:45 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware guc_v69.0.3

for you to fetch changes up to 548b304a35b77cd43c1242e0eae68f775bd0df2a:

  i915: Add GuC v69.0.3 for all platforms (2021-12-15 13:28:54 -0800)

----------------------------------------------------------------
John Harrison (1):
      i915: Add GuC v69.0.3 for all platforms

 WHENCE                   |  30 ++++++++++++++++++++++++++++++
 i915/adlp_guc_69.0.3.bin | Bin 0 -> 356416 bytes
 i915/bxt_guc_69.0.3.bin  | Bin 0 -> 216768 bytes
 i915/cml_guc_69.0.3.bin  | Bin 0 -> 217664 bytes
 i915/dg1_guc_69.0.3.bin  | Bin 0 -> 323968 bytes
 i915/ehl_guc_69.0.3.bin  | Bin 0 -> 343360 bytes
 i915/glk_guc_69.0.3.bin  | Bin 0 -> 217216 bytes
 i915/icl_guc_69.0.3.bin  | Bin 0 -> 343360 bytes
 i915/kbl_guc_69.0.3.bin  | Bin 0 -> 217664 bytes
 i915/skl_guc_69.0.3.bin  | Bin 0 -> 216704 bytes
 i915/tgl_guc_69.0.3.bin  | Bin 0 -> 343296 bytes
 11 files changed, 30 insertions(+)
 create mode 100644 i915/adlp_guc_69.0.3.bin
 create mode 100644 i915/bxt_guc_69.0.3.bin
 create mode 100644 i915/cml_guc_69.0.3.bin
 create mode 100644 i915/dg1_guc_69.0.3.bin
 create mode 100644 i915/ehl_guc_69.0.3.bin
 create mode 100644 i915/glk_guc_69.0.3.bin
 create mode 100644 i915/icl_guc_69.0.3.bin
 create mode 100644 i915/kbl_guc_69.0.3.bin
 create mode 100644 i915/skl_guc_69.0.3.bin
 create mode 100644 i915/tgl_guc_69.0.3.bin
