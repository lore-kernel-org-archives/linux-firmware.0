Return-Path: <SRS0=xtak=B2=intel.com=daniele.ceraolospurio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAB5C77B73
	for <linux-firmware@archiver.kernel.org>; Tue,  6 Jun 2023 16:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE6EFC433D2; Tue,  6 Jun 2023 16:33:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 233D5C433EF;
	Tue,  6 Jun 2023 16:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 233D5C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686069234; x=1717605234;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P1q6rVmOF/6IGNt1dQ0OrhY1sUDstftmwkOwbaFR67I=;
  b=akbOEPPghwFLFnI5IbmROa0rtdG1eO7gXxGCVB5FKP53ijUAteC0N6J4
   1TtmiqzGG5P4akzSpE+4FJlG047aYlC1vHMxZDJVPPY7KFv9JS+Vth1nr
   WE9BVqjvBfuXkSxkaIPEC6wqp17c87rxXYZ/AryA2ob/Kvx2R8SfkZg4C
   zXIrgy67k+gQV853vjDi6Cxlc8DWav6sc1y+fB7s9rzdxRw6+ojXwTAmJ
   3aPJSMDB0V78wLdfcyIrJl/yrrzWEuYd9kyFoTguvICrsyp+F8RGfSh+A
   RMvlAQWkzDq5gma+sF5iI6aQ6rRntos9blcOBEcEN2Pmth5OvLT0tMD8H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="336356328"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="336356328"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 09:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="774187029"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="774187029"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 09:33:53 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: PR for HuC v8.5.0 for MTL
Date: Tue,  6 Jun 2023 09:33:45 -0700
Message-Id: <20230606163345.2058790-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fc90c59beebd551dde5fe5eb3e76d36651ba08fb:

  Merge branch 'db410c' of https://github.com/lumag/linux-firmware (2023-05-31 07:35:15 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware mtl_huc_v8.5.0

for you to fetch changes up to 5de33fb45cee8d83abfe17e9e85bd74d51a2653f:

  i915: Add HuC v8.5.0 for MTL (2023-06-06 09:24:40 -0700)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      i915: Add HuC v8.5.0 for MTL

 WHENCE               |   3 +++
 i915/mtl_huc_gsc.bin | Bin 0 -> 565248 bytes
 2 files changed, 3 insertions(+)
 create mode 100755 i915/mtl_huc_gsc.bin
