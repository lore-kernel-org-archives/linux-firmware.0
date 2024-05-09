Return-Path: <SRS0=5M1G=MM=intel.com=gustavo.sousa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B183C25B74
	for <linux-firmware@archiver.kernel.org>; Thu,  9 May 2024 19:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21DA4C32783; Thu,  9 May 2024 19:47:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BAF41C2BD11
	for <linux-firmware@kernel.org>; Thu,  9 May 2024 19:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BAF41C2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284071; x=1746820071;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IVTabDqpuPhlwLB7TiGgxA1XuYB9/hb1y6nnVfyEuSM=;
  b=YhPOQkkYYUpShx/KKr47g1u3enjFqAyFKXCFNS1B5Jcc2ZNGDacFOw4F
   o94e1R8Y5ZhR0VmvciFemYvwP26cmysL5MWqB8abWHDeaEfDdRwRZiZKi
   HaWTNvkmLMic9H4SvuJwNuM39EzHAP+vQk9Z9LXrY8oRxTwV8rruYZyZq
   +lP6J7b8O8bWALyZORWbUEWDrwL5Tx8085WIFGkX7l7fsBmFZEX+I2Et+
   p0T585DlkXXyrQgp8zeTsj6U3ioc649DM4G2At+gXAaAXzlBOk/E9jdPn
   65kp3eanTvd3udsfQbUCGQiLW/OAR7VOe1n9/GGw7WyJ2fVU3tVoDsOeO
   Q==;
X-CSE-ConnectionGUID: edPQv4FYTr6yxWsXeW+/vA==
X-CSE-MsgGUID: SeZInEyvQ8iiMeYJWZddPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11080857"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11080857"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:47:50 -0700
X-CSE-ConnectionGUID: 1rKGOTZuTsitbS8lEH2iNQ==
X-CSE-MsgGUID: JvF0khoESYiO+QR7TLex0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="29457818"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com) ([10.124.223.58])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:47:49 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: PR for BMG DMC v2.06
Date: Thu,  9 May 2024 16:47:40 -0300
Message-ID: <20240509194740.358934-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 93f329774542b9b7d57abb18ea8b6542f2d8feac:

  Merge branch 'robot/pr-0-1709214990' into 'main' (2024-02-29 14:10:53 +0000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/firmware.git tags/intel-2024-05-09

for you to fetch changes up to 8724b227b8999e11cf89601fec9f6f80795d8fa8:

  i915: Add BMG DMC v2.06 (2024-05-09 15:10:44 -0300)

----------------------------------------------------------------
Intel DRM firmware intel-2024-05-09

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      i915: Add DG2 HuC 7.10.15

Dnyaneshwar Bhadane (1):
      i915: Update Xe2LPD DMC to v2.20

Gustavo Sousa (1):
      i915: Add BMG DMC v2.06

 WHENCE               |   7 +++++--
 i915/bmg_dmc.bin     | Bin 0 -> 45964 bytes
 i915/dg2_huc_gsc.bin | Bin 622592 -> 630784 bytes
 i915/xe2lpd_dmc.bin  | Bin 61208 -> 59284 bytes
 4 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 i915/bmg_dmc.bin
 mode change 100755 => 100644 i915/dg2_huc_gsc.bin
