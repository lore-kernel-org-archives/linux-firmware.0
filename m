Return-Path: <SRS0=X6yi=JZ=intel.com=John.C.Harrison@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AA2C48260
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Feb 2024 21:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAD11C43399; Fri, 16 Feb 2024 21:16:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EB2CC433F1;
	Fri, 16 Feb 2024 21:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4EB2CC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708118214; x=1739654214;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0yZ8zrzJpCExwY+veE2cWY4w/utip4VIvJ8BOgtSJn0=;
  b=OySVwDv9808vRiJpiG1vN15RMyyb6TOpeQwPZHKDlxO4L4aCJPI22TzS
   yYfF/2SvO/knUrWqRcBaoqZLv5f3cqsd2ZuC09Yq0Boi97/SzDza9W2r/
   EAbOPJs+ztOKPmN/6JZmgCIjLstKb5x6SoLYGsQgV4oPGxRw8SjHske7H
   KH7Kr8Mxnp8Xs78LK8CaO5bsV2AV7GNKTuG11gn505MZ7obM7xZ7QCAzT
   isOQ3eDzmrZmFAzJZAgiXbO24EsAKyBF8Bd/vdWJDXFG/010095v/oye3
   cQcLYEKC5J4TevQTJ+mAjP9Cks7fktRyT7BISMm/HP8mVe4GEq271QY75
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="19683349"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="19683349"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 13:16:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="27105854"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Feb 2024 13:16:52 -0800
From: John.C.Harrison@Intel.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: PR for new GuC v70.20.0 binaries
Date: Fri, 16 Feb 2024 13:14:32 -0800
Message-ID: <20240216211432.519411-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fbef4d381e3d0143427e1a8c924be8e738c0fc2d:

  Merge branch 'main' into 'main' (2024-02-08 12:24:01 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware guc_70.20.0

for you to fetch changes up to 28c2472d37d089edb56c75e3af83511babaa756c:

  xe: First GuC release for LNL and Xe (2024-02-14 16:28:32 -0800)

----------------------------------------------------------------
John Harrison (2):
      i915: Add GuC v70.20.0 for ADL-P, DG1, DG2, MTL and TGL
      xe: First GuC release for LNL and Xe

 LICENSE.xe           |  39 +++++++++++++++++++++++++++++++++++++++
 WHENCE               |  20 ++++++++++++++------
 i915/adlp_guc_70.bin | Bin 342848 -> 347584 bytes
 i915/dg1_guc_70.bin  | Bin 272512 -> 321472 bytes
 i915/dg2_guc_70.bin  | Bin 443200 -> 410368 bytes
 i915/mtl_guc_70.bin  | Bin 365376 -> 332544 bytes
 i915/tgl_guc_70.bin  | Bin 330304 -> 335168 bytes
 xe/lnl_guc_70.bin    | Bin 0 -> 336640 bytes
 8 files changed, 53 insertions(+), 6 deletions(-)
 create mode 100644 LICENSE.xe
 create mode 100644 xe/lnl_guc_70.bin
