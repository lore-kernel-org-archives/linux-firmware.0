Return-Path: <SRS0=25d7=J7=intel.com=gustavo.sousa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7598C54791
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Feb 2024 19:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84AF7C433F1; Thu, 22 Feb 2024 19:56:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD359C433C7
	for <linux-firmware@kernel.org>; Thu, 22 Feb 2024 19:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD359C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708631813; x=1740167813;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S36oj1zNqOvtqoh+zeZsUov4SwAYKn6+VNs9pFFIT+I=;
  b=dDE7VA68nxAqGbi6lxbAaYYrv/SQOpD22OAVqVzwvHRNNunPVXNjYkMK
   D0xBlm0HX/Fq6uFYP3k/qGHcQ6Iolrj87RzB6ris5QzAb9UCzZNyhCeX0
   PkpBuAH8CdQSfhf+sFC08117U9Jrs3TGrmJPlqO9Fe4xQml4vNNm3Y8XR
   f8mWF5oX00t6zA6G0hdEbnSaEAs3+W2iDPxxliEqScwzMD5od3grbWaaq
   sHv56zgOzOxoYPA5mgPw6bj13qMJjz8OCC95N+J2i5ZkU4XNSpd81nmr/
   eX80s4JWTx6/3BllTOXwcJg4Doxk4iu9PiuLWv8MFjvd59svVAGeT9ziQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3015207"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3015207"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 11:56:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5969349"
Received: from kdtweet-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com) ([10.125.144.156])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 11:56:53 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: PR for Xe2LPD DMC v2.18
Date: Thu, 22 Feb 2024 16:56:34 -0300
Message-ID: <20240222195634.291662-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 78b99e9ebad8e4e24dded99842f94a8a7db3a5e8:

  Merge branch 'robot/pr-0-1708610465' into 'main' (2024-02-22 14:24:47 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware xe2lpd_dmc_2.18

for you to fetch changes up to 94d9a511a605cc0794bbe2d13328143e86df26e9:

  i915: Add Xe2LPD DMC v2.18 (2024-02-22 16:54:31 -0300)

----------------------------------------------------------------
Gustavo Sousa (1):
      i915: Add Xe2LPD DMC v2.18

 WHENCE              |   3 +++
 i915/xe2lpd_dmc.bin | Bin 0 -> 61208 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 i915/xe2lpd_dmc.bin
