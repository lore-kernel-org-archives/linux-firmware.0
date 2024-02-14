Return-Path: <SRS0=xp8S=JX=linux.intel.com=sakari.ailus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE49C48BEB
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Feb 2024 08:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 998EDC433C7; Wed, 14 Feb 2024 08:40:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83FBDC433F1
	for <linux-firmware@kernel.org>; Wed, 14 Feb 2024 08:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83FBDC433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707900048; x=1739436048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7GsB5pTvvlnKCU91csrk8917X/UZ6L9ys/GwpLLYbks=;
  b=UMD2c/nPtZ6eckjghJMEJ/8ouS2nRkMK1YjT1K1z3DN4YFbfC5aJtxu9
   UvNgSdixz83LtJKU9Jt+thwVyXopaNpK1yT5WEzV0NMhBG890fhptOju4
   sr+UP3p8pd/reFSvgwoABN3jaPosTWwuq9bGAvs+YBodWzl7ZA5Pokpdy
   Zo4wk3OIpQ4ggBR+RZJbWrGGNqp86xgduraUUBa6gYAuLC++0RTob6KhU
   dHgpsWDmXnrhc5/kP8ODX7NFtxT90DlqHRSdhL7bZGm0J+UdKxaD9ot1c
   /jPgShH7L4t2zKb5TaqQzI/YyAXeeyDVNb6IQf2YcTWBswLILObmGPfmU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27381155"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="27381155"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 00:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3419520"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 00:40:45 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5008C11F86A;
	Wed, 14 Feb 2024 10:40:43 +0200 (EET)
Date: Wed, 14 Feb 2024 08:40:43 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL v2] Intel Image Processing Unit 6 firmware
Message-ID: <Zcx8i978Bx7QRSNJ@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi folks,

This PR moves Intel IPU firmware files under ipu subdirectory for easier
packaging. WHENCE is updated for IPU3 ImgU firmware links.

since v1:

- Rebase on the Gitlab repository main branch. The one in git.kernel.org
  was not up to date. :-(

Please pull.


The following changes since commit 8acf0a98dbe1606cf696b0ee61bcce7eed5db80f:

  Merge branch 'robot/patch-10-1707787255' into 'main' (2024-02-13 01:31:56 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu6-2024-02-14-2

for you to fetch changes up to 08ab13d5d079c90dc21145710a2cc42326562aee:

  Intel IPU3 ImgU: Move firmware file under intel/ipu (2024-02-14 10:37:57 +0200)

----------------------------------------------------------------
Move IPU firmware under ipu

----------------------------------------------------------------
Sakari Ailus (2):
      Intel IPU6: Move firmware binaries under ipu/
      Intel IPU3 ImgU: Move firmware file under intel/ipu

 WHENCE                                                   |  15 ++++++++-------
 intel/{ => ipu}/ipu6_fw.bin                              | Bin
 intel/{ => ipu}/ipu6ep_fw.bin                            | Bin
 intel/{ => ipu}/ipu6epadln_fw.bin                        | Bin
 intel/{ => ipu}/ipu6epmtl_fw.bin                         | Bin
 intel/{ => ipu}/ipu6se_fw.bin                            | Bin
 .../irci_irci_ecr-master_20161208_0213_20170112_1500.bin | Bin
 7 files changed, 8 insertions(+), 7 deletions(-)
 rename intel/{ => ipu}/ipu6_fw.bin (100%)
 rename intel/{ => ipu}/ipu6ep_fw.bin (100%)
 rename intel/{ => ipu}/ipu6epadln_fw.bin (100%)
 rename intel/{ => ipu}/ipu6epmtl_fw.bin (100%)
 rename intel/{ => ipu}/ipu6se_fw.bin (100%)
 rename intel/{ => ipu}/irci_irci_ecr-master_20161208_0213_20170112_1500.bin (100%)

-- 
Sakari Ailus
