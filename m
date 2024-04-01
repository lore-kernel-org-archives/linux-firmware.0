Return-Path: <SRS0=EXSQ=LG=intel.com=daniele.ceraolospurio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4F0CD1288
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Apr 2024 18:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27DE4C433F1; Mon,  1 Apr 2024 18:50:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CBCBC433C7;
	Mon,  1 Apr 2024 18:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8CBCBC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711997429; x=1743533429;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AtAS4zGkKNsb1Tmr6Zk8hPfwLZcy4u8ShP+CvWhg+8w=;
  b=JLT8zM8i86weK+dvmB8TRoYMS2D+RscMyj39/E3OeHX8MGiS+y5rgHbM
   IT6amz7Gf+Whd12s7PtzJSfgr6Y+qptYv+ljbAYg+AwD0E8RqsUDqHYOX
   puSEaOXPqIjM8jkbYhuY+Qb0638DaxXbo/qiaiVWFyS4zfcY5y+VRFWuu
   tEje/pzYhoJgT0jSslrIH9qTzFR1jWRdxzsXh2jbOudp+ZxyP7C7oNHNm
   TADSx7wpvniAuHMH6MnEPywNAUMsrNIDrRHFD1kwbawf4b3TQcOl1oO6T
   KjL/FhAEjhOlQv5fy8vqCGgGrBhmR5T9BQGZDk0cDCIWuAlY9Smj3itOi
   w==;
X-CSE-ConnectionGUID: ykoAF3xxSPixLpjQ4bl0Dg==
X-CSE-MsgGUID: NLqFWqsDTEOAP4jOIS00rw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10098874"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="10098874"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 11:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="22539494"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 11:50:29 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	intel-gfx@lists.freedesktop.org
Subject: [PR] i915: Add DG2 HuC to 7.10.15
Date: Mon,  1 Apr 2024 11:50:15 -0700
Message-ID: <20240401185015.624402-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 93f329774542b9b7d57abb18ea8b6542f2d8feac:

  Merge branch 'robot/pr-0-1709214990' into 'main' (2024-02-29 14:10:53 +0000)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/intel-2024-04-01

for you to fetch changes up to ab144168469a77f54ad539ac98dede7ce4c6a75d:

  i915: Add DG2 HuC 7.10.15 (2024-03-28 13:45:41 -0700)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      i915: Add DG2 HuC 7.10.15

 WHENCE               |   2 +-
 i915/dg2_huc_gsc.bin | Bin 622592 -> 630784 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
 mode change 100755 => 100644 i915/dg2_huc_gsc.bin
