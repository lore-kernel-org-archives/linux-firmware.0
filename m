Return-Path: <SRS0=Gy+H=KG=linux.intel.com=sakari.ailus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B668C48BF6
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Feb 2024 13:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC66FC43390; Thu, 29 Feb 2024 13:26:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B13DAC433C7
	for <linux-firmware@kernel.org>; Thu, 29 Feb 2024 13:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B13DAC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709213206; x=1740749206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uVLMYSZATuXCH09+gmFihm7O7pb45I1udoK+XDlL644=;
  b=AhwN6u27C5khalJoIbEHaNsPAZhz8UAMhtYgys2+DroFe9+QNInu2TnZ
   QcitFX+I/iallu07ltdbcB2iP32dfYx6a18uWP8Y2eRw8U3/AMKQOzfsh
   dg49kOtCVwtnIBCqLx8zWD70t5MXg6EV3+sF8eZzQv0cMLeAFhNdwm65L
   M3i0y3BE2LANf51KMnNiB36Po4LqrmlE6YEFi/mKszjc+aKrCumqnqlQn
   VSNUDKdITMD9mof1FjgDcWUFPp4HsxPScUhv0HL4mv9GoVYSgpg87lgKt
   2eqKnp0zk1P4sS8JpWeyXyhnGy/0EXSPeRIZ40K3X/iqB1Zg7LWdu2zMi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14388229"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14388229"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 05:26:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7698996"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 05:26:43 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9478211FC11;
	Thu, 29 Feb 2024 15:26:40 +0200 (EET)
Date: Thu, 29 Feb 2024 13:26:40 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] Intel Image Processing Unit 2 firmware
Message-ID: <ZeCGEN8PgbkY3k_g@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi folks,

This PR adds firmware files for Intel IPU2. The atomisp driver that needs
the firmware is currently in staging.


The following changes since commit fe0274513384acb3be3756ae17da97f551a1e0e7:

  Merge branch 'robot/patch-0-1709160821' into 'main' (2024-02-28 23:13:23 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu2-2024-02-29-2

for you to fetch changes up to 28fbeb4f8b8cf5fa214eeaa93c83d4ee779d7a5b:

  Intel IPU2: Add firmware files (2024-02-29 15:24:23 +0200)

----------------------------------------------------------------
IPU2 firmware binaries

----------------------------------------------------------------
Sakari Ailus (1):
      Intel IPU2: Add firmware files

 WHENCE                         |  12 ++++++++++++
 intel/ipu/shisp_2400b0_v21.bin | Bin 0 -> 10972768 bytes
 intel/ipu/shisp_2401a0_v21.bin | Bin 0 -> 12093280 bytes
 3 files changed, 12 insertions(+)
 create mode 100644 intel/ipu/shisp_2400b0_v21.bin
 create mode 100644 intel/ipu/shisp_2401a0_v21.bin

-- 
Sakari Ailus
