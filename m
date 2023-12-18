Return-Path: <SRS0=RO8a=H5=linux.intel.com=sakari.ailus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB6FC35274
	for <linux-firmware@archiver.kernel.org>; Mon, 18 Dec 2023 21:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A50EBC433C9; Mon, 18 Dec 2023 21:16:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C42DC433C7
	for <linux-firmware@kernel.org>; Mon, 18 Dec 2023 21:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C42DC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702934199; x=1734470199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ble2IgRu4xLYTwYoApPa8VJAPh7C3WB88wztpq8xWvw=;
  b=HvREGU4AXpPhMmf1I4+EXq0EZ/is8VqZft7KZEFFLc3rhEShBO9YOwIH
   w9mVD7vFTD42FnzPp4se4GuXEf5pt8hHcIyXG286O/43x7GoXmo+hSSSC
   snF+OkfcK4+p2PmGpM/IKUu3+inOnQ1CP9fkQM34BURVqprWLZcAjxBlZ
   UfesZwS2yrJUnvYUEFbTzbrjcZbQB68I/YGfOKx2alO2FFlZT2o57ORN9
   RXdprBP5+9jfwvLbC0wCiE9Znls4NlEcNOzghrtWP7BOpHrDRLKQx6k8R
   CRjEh0PZc8itDuDlUSCZ5t8oO/sT8pTiKusy9/bnV7S0P0kBM3hEHWBYu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="14254813"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="14254813"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 13:16:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="809969163"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="809969163"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 13:16:37 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4C2CA11FC43;
	Mon, 18 Dec 2023 23:16:34 +0200 (EET)
Date: Mon, 18 Dec 2023 21:16:34 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>
Subject: [GIT PULL] Intel Visual Sensing Controller firmware
Message-ID: <ZYC2sqDmHb3jiI9I@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi folks,

This PR adds firmware binaries for Intel Visual Sensing Controller (VSC).
The driver for the device has been recently merged to the char-misc tree
and is expected to make it to Linux 6.8.

Please pull.


The following changes since commit c156e6be6d4a0a2290e7059bc74fb0612aa19693:

  Merge branch 'robot/pr-0-1702625169' into 'main' (2023-12-15 12:16:57 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ivsc-2023-12-18

for you to fetch changes up to cfc997c664f076c6800b749ed7ef315b1e8e76fd:

  intel: vsc: Add firmware for Visual Sensing Controller (2023-12-18 22:59:39 +0200)

----------------------------------------------------------------
Add Intel Visual Sensing Controller firmware

----------------------------------------------------------------
Sakari Ailus (1):
      intel: vsc: Add firmware for Visual Sensing Controller

 LICENSE.ivsc                           |  38 +++++++++++++++++++++++++++++++++
 WHENCE                                 |  36 +++++++++++++++++++++++++++++++
 intel/vsc/ivsc_fw.bin                  | Bin 0 -> 966560 bytes
 intel/vsc/ivsc_pkg_hi556_0.bin         | Bin 0 -> 767068 bytes
 intel/vsc/ivsc_pkg_himx11b1_0.bin      | Bin 0 -> 730204 bytes
 intel/vsc/ivsc_pkg_himx2170_0.bin      | Bin 0 -> 771164 bytes
 intel/vsc/ivsc_pkg_himx2172_0.bin      | Bin 0 -> 799836 bytes
 intel/vsc/ivsc_pkg_int3537_0.bin       | Bin 0 -> 767068 bytes
 intel/vsc/ivsc_pkg_ovti01a0_0.bin      | Bin 0 -> 726108 bytes
 intel/vsc/ivsc_pkg_ovti01af_0.bin      | Bin 0 -> 726108 bytes
 intel/vsc/ivsc_pkg_ovti01as_0.bin      | Bin 0 -> 726108 bytes
 intel/vsc/ivsc_pkg_ovti02c1_0.bin      | Bin 0 -> 762972 bytes
 intel/vsc/ivsc_pkg_ovti02e1_0.bin      | Bin 0 -> 791644 bytes
 intel/vsc/ivsc_pkg_ovti2740_0.bin      | Bin 0 -> 726108 bytes
 intel/vsc/ivsc_pkg_ovti5678_0.bin      | Bin 0 -> 726108 bytes
 intel/vsc/ivsc_pkg_ovti9734_0.bin      | Bin 0 -> 730204 bytes
 intel/vsc/ivsc_pkg_ovti9738_0.bin      | Bin 0 -> 730204 bytes
 intel/vsc/ivsc_skucfg_hi556_0_1.bin    | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_himx11b1_0_1.bin | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_himx2170_0_1.bin | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_himx2172_0_1.bin | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_int3537_0_1.bin  | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_ovti01a0_0_1.bin | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_ovti01af_0_1.bin | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_ovti01as_0_1.bin | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_ovti02c1_0_1.bin | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_ovti02e1_0_1.bin | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_ovti2740_0_1.bin | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_ovti5678_0_1.bin | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_ovti9734_0_1.bin | Bin 0 -> 4100 bytes
 intel/vsc/ivsc_skucfg_ovti9738_0_1.bin | Bin 0 -> 4100 bytes
 31 files changed, 74 insertions(+)
 create mode 100644 LICENSE.ivsc
 create mode 100644 intel/vsc/ivsc_fw.bin
 create mode 100644 intel/vsc/ivsc_pkg_hi556_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_himx11b1_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_himx2170_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_himx2172_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_int3537_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_ovti01a0_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_ovti01af_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_ovti01as_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_ovti02c1_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_ovti02e1_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_ovti2740_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_ovti5678_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_ovti9734_0.bin
 create mode 100644 intel/vsc/ivsc_pkg_ovti9738_0.bin
 create mode 100644 intel/vsc/ivsc_skucfg_hi556_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_himx11b1_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_himx2170_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_himx2172_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_int3537_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_ovti01a0_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_ovti01af_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_ovti01as_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_ovti02c1_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_ovti02e1_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_ovti2740_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_ovti5678_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_ovti9734_0_1.bin
 create mode 100644 intel/vsc/ivsc_skucfg_ovti9738_0_1.bin

-- 
Kind regards,

Sakari Ailus
