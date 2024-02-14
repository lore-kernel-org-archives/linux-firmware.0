Return-Path: <SRS0=xp8S=JX=linux.intel.com=sakari.ailus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C194BC48BC4
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Feb 2024 07:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74307C43390; Wed, 14 Feb 2024 07:59:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 562FEC433F1
	for <linux-firmware@kernel.org>; Wed, 14 Feb 2024 07:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 562FEC433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707897539; x=1739433539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e94wWW1fuEpgNPMZ2D34RkTB+CRzTDEjN7tPl0kpjh8=;
  b=SClKUO+9W1lOQZuZ7s0vurF4tlUJqNH14FZ+Bo79MdizWKkw5tnkbFRd
   CS+PVSa2EwGx+Pb75JG2R6sScytMvHkadyt7/mjV4ppZyPc+D8iamMHRA
   Rljhgqwnp4f+FtbDl0UA3v+QUjOEuRuJVrcXrtceIo7l+Y4rHaXI+NYIv
   bRTn4tjuprkIYIPzK0xHEoQXUuRQjK5j7lH1z4h+hOocX/slBmZbJ900w
   FnE64778APg+Q2WBFyu8gp6824KPpGP8OOMIRrZnV1STQZJ5qZlYbXDIN
   8O3ZJexMkyYApRrpbNTs8UGu6jZzeGWvEWx2yxWqg0IBDYfwd6+Mpd0nw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1800967"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1800967"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 23:58:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="40597050"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 23:58:57 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D24FF11F86A;
	Wed, 14 Feb 2024 09:49:42 +0200 (EET)
Date: Wed, 14 Feb 2024 07:49:42 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Intel Image Processing Unit 6 firmware
Message-ID: <ZcxwlqJMztS_lUtb@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi folks,

This PR moves Intel IPU firmware files under ipu subdirectory for easier
packaging. WHENCE is updated for IPU3 ImgU firmware links.

Please pull.


The following changes since commit fbef4d381e3d0143427e1a8c924be8e738c0fc2d:

  Merge branch 'main' into 'main' (2024-02-08 12:24:01 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu6-2024-02-14

for you to fetch changes up to 9b25ed59b5de4b70f0ac57e760055f880a677b75:

  Intel IPU3 ImgU: Move firmware file under intel/ipu (2024-02-09 15:28:35 +0200)

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
