Return-Path: <SRS0=zeHL=QH=intel.com=dnyaneshwar.bhadane@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74665ECE579
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Sep 2024 09:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45185C4CEC6; Mon,  9 Sep 2024 09:54:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 461FBC4CEC5
	for <linux-firmware@kernel.org>; Mon,  9 Sep 2024 09:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 461FBC4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725875657; x=1757411657;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mHRQTRTeejWTYdG4uAvkLUpZApejqWCWh+v3gAss/ZA=;
  b=SYDNRbxWEs7l5EckTrh/Y6MHwK8/3KPOmjEcdWKiJ8KDJmJZHvASdpmk
   Ajt9zYldI6aabpOgGdFzC45IO9B8r1rhCDSqSJSfQlm2zeQlKQ6oLYVRe
   zm6KTO8g8IaJ3UvGfgOQc+MjvRgmkkYfqyZRDJvwQtUjjy1SyUWw0Qy53
   G+ikxYEGLgPUln8VnvbS4xFP2IUBno2Sq5V9i3pO6V1T/7RqRsUu9JduJ
   rnrPThZaaIxaQPTVyPoJhxbcqsKDTbrTJh6Q6tUguplGY0gWtF0qUpyuQ
   2r6srThI1WTLPCA3zqTFBjixhPOaXCsOt01sC4MZ7kOIP0PhDHC5K9LgB
   Q==;
X-CSE-ConnectionGUID: hBRwgFVmSP+OAkObmiDE3w==
X-CSE-MsgGUID: G56OSv+6TYmaoSVZVIOSxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="49973740"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="49973740"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 02:54:17 -0700
X-CSE-ConnectionGUID: mPKTSJ0GTSib6aLQOyITRw==
X-CSE-MsgGUID: q9JaSw2QRaSEZlsQFhB4Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66333817"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
  by fmviesa007.fm.intel.com with ESMTP; 09 Sep 2024 02:54:16 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: PR for MTL DMC v2.23
Date: Mon,  9 Sep 2024 15:25:49 +0530
Message-Id: <20240909095549.1712018-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 87cae274d38e69f6e9461f966fe42d223e20d7be:

  Merge branch 'cirrus-20240904' into 'main' (2024-09-04 17:12:54 +0000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/firmware.git drm-https/intel/mtl-dmc-v2.23

for you to fetch changes up to 6528c3446191b0071691b71590d13f7344db5560:

  i915: Update MTL DMC v2.23 (2024-09-05 13:09:16 -0300)

----------------------------------------------------------------
Dnyaneshwar Bhadane (1):
      i915: Update MTL DMC v2.23

 WHENCE           |   2 +-
 i915/mtl_dmc.bin | Bin 52476 -> 52712 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
