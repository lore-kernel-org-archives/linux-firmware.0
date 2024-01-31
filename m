Return-Path: <SRS0=884g=JJ=linux.intel.com=sakari.ailus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8FFC47DDF
	for <linux-firmware@archiver.kernel.org>; Wed, 31 Jan 2024 21:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C992C433F1; Wed, 31 Jan 2024 21:59:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 769D4C43390
	for <linux-firmware@kernel.org>; Wed, 31 Jan 2024 21:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 769D4C43390
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706738385; x=1738274385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UpQ5xNCujqIbUBuGnqq8byv0bhjmIt4Z4Xw6op/kn58=;
  b=ZboisNdH5rfXbcn3JJdI96Bl3CK0vxnnorSvccB8RTDOWu/v1l6R/9jI
   iHhPYMOxFtafkX+Pfr6I3shGko6W8BKzhIApMgxTu3Gj48U50IwRDK0vU
   u0QOPjL3pl8V3bG8GkwenEEDRLbJ+dIp0QNAR0yYKEn9YlVapirusotM6
   eRrVDq9GbLPSk3O3zj5F78XvBLFnprrQZxEN5nFSqbVmqz7ntFhb/2eqz
   BTVG7yITaq03U2e0koLCx4viBYT++l7G+p+uk5dSm0dBM0ERVB0Mi2sCC
   12gE4+EOdxnQJWz2AnmRY43oqPXKpTLSMnw4L8cxbajJz1SQDLRajmb82
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10391533"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="10391533"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 13:59:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="30661437"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 13:59:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A26B411F9DB;
	Wed, 31 Jan 2024 23:59:31 +0200 (EET)
Date: Wed, 31 Jan 2024 21:59:31 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Intel Image Processing Unit 6 firmware
Message-ID: <ZbrCw1AVnW6APq56@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi folks,

This PR adds firmware binaries for Intel Image Processing Unit 6 (IPU6).
The driver isn't merged yet but work to get it there is nearing completion.

Please pull.


The following changes since commit 001ba06d9ded2a8e9a91f1824954bcb41f372d6f:

  Merge branch 'robot/pr-0-1706638273' into 'main' (2024-01-30 18:39:07 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu6-2024-01-31

for you to fetch changes up to 1b24d7d3379b5dde99fcb17e796cdd5fe0a668bd:

  linux-firmware: intel: Add IPU6 firmware binaries (2024-01-31 23:52:37 +0200)

----------------------------------------------------------------
Intel IPU6 firmware

----------------------------------------------------------------
Bingbu Cao (1):
      linux-firmware: intel: Add IPU6 firmware binaries

 WHENCE                  |  15 +++++++++++++++
 intel/ipu6_fw.bin       | Bin 0 -> 471040 bytes
 intel/ipu6ep_fw.bin     | Bin 0 -> 466944 bytes
 intel/ipu6epadln_fw.bin | Bin 0 -> 466944 bytes
 intel/ipu6epmtl_fw.bin  | Bin 0 -> 466944 bytes
 intel/ipu6se_fw.bin     | Bin 0 -> 380928 bytes
 6 files changed, 15 insertions(+)
 create mode 100644 intel/ipu6_fw.bin
 create mode 100644 intel/ipu6ep_fw.bin
 create mode 100644 intel/ipu6epadln_fw.bin
 create mode 100644 intel/ipu6epmtl_fw.bin
 create mode 100644 intel/ipu6se_fw.bin

-- 
Sakari Ailus
