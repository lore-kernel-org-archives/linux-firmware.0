Return-Path: <SRS0=6k34=2E=intel.com=daniele.ceraolospurio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C98C433FE
	for <linux-firmware@archiver.kernel.org>; Mon,  3 Oct 2022 20:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FA9CC43470; Mon,  3 Oct 2022 20:39:44 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5C61C433D6;
	Mon,  3 Oct 2022 20:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5C61C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664829582; x=1696365582;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fo65/YujDfdPb7m+QTcyhTARI9Sg+dGo7Mt8qrtaSyw=;
  b=B1q9Lt+eamZ1WeFz4kPx0FzQ3NSGzBBytAds27O6uQBwFkr2Tja0r0Bo
   IszPWZU494xDaOb7/ppWD4dZJ5cGR3FJLAokpC7K/IuKZ1adWIIPDSy6I
   alJkBzcHNHDwBROZytpeDbTn++sL/U/d5EvP90G+pbPoWpHZHer+lYjaF
   4+VSz9XEJa//AikPW2bQ8iDsel2LmdXubm1sZMfaRFHnYa3Y9PmWwEUvA
   219pR/nexdBuHsnA868Zg5ZhGw3kgsNuqhXP9EspbRf9U6+3mqEOqu8iG
   iR2Z38fSYR2wyfnsaZqvtSx7kUbeIAwtF2VHQ+n5/h1tBqVM3ryAf5laL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="300356671"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="300356671"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 13:39:41 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="798879424"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="798879424"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 13:39:41 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	intel-gfx@lists.freedesktop.org,
	kyle@kernel.org,
	ben@decadent.org.uk
Subject: PR for DG2 HuC v7.10.6
Date: Mon,  3 Oct 2022 13:41:07 -0700
Message-Id: <20221003204107.1105725-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fdf1a65258522edf18a0a1768fbafa61ed07e598:

  linux-firmware: Update AMD cpu microcode (2022-09-30 17:33:35 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware dg2_huc_7.10.6_pr

for you to fetch changes up to b3110904e23e0032f6b6c72af84547066a5c4f26:

  i915: add HuC 7.10.6 for DG2 (2022-10-03 13:32:30 -0700)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      i915: add HuC 7.10.6 for DG2

 WHENCE               |   3 +++
 i915/dg2_huc_gsc.bin | Bin 0 -> 626688 bytes
 2 files changed, 3 insertions(+)
 create mode 100755 i915/dg2_huc_gsc.bin
