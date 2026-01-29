Return-Path: <SRS0=+27d=AC=intel.com=anthony.l.nguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887F8D61033
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Jan 2026 17:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70EC8C4CEF7; Thu, 29 Jan 2026 17:14:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84975C116D0
	for <linux-firmware@kernel.org>; Thu, 29 Jan 2026 17:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84975C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769706878; x=1801242878;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7f+GrKw0ly8lUt7zJ1XXOd71XhXRZTFWuTgUr0mMrAY=;
  b=LTsINiiKiDaSco7t5/BkY7oZJOL9U7pjzakYMh3b/FlAXZmOh6B/gYWy
   y6oLAsfojttKls3ONn4Xb/Fx7h6kWLSqKlVCGe0TEficjn57qWa2WGrgL
   lOR/zZgJEQYm0xIJmlAmtLEslMYWMifhsfGO+opSgnrIDIZrWqAVTN9WZ
   jThTBxLYQnJ7Cd4GUiaUe97WA8FD0r6CiQTNrv/SbQHd0S0iHDg2TZQgL
   HooRbdSDQH4zVVylPpo5QOF3GFeXW1jxKhMLKRSD7rkoVHu87TFbIpj/Z
   wqyhv/x0xRRRwyUnV0DH9zS1lE6YhWPhVuUj8LzGpWULSt9ovGMFi1zhb
   Q==;
X-CSE-ConnectionGUID: foa/JC9iSPqds+iPGIRRLw==
X-CSE-MsgGUID: LJSt8fU6Q/eOEZN2Z8+zjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81685370"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="81685370"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 09:14:37 -0800
X-CSE-ConnectionGUID: tOhxqzkUR7+hWh1CGZhhag==
X-CSE-MsgGUID: fTe3tViiRVGQeM2cD+9x9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="239357393"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa002.jf.intel.com with ESMTP; 29 Jan 2026 09:14:38 -0800
From: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	marcin.szycik@linux.intel.com
Subject: [linux-firmware][pull request] Intel Wired LAN Firmware Updates 2026-01-29
Date: Thu, 29 Jan 2026 09:14:29 -0800
Message-ID: <20260129171430.21343-1-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the ice DDP LAG package to include support for E830 devices.

This uses a dual-segment package with one segment for E810 and one for
E830, which increases package size.

The following changes since commit 2e5a8b0550ba3255bccc2bac57c520259968f5e9:

  Merge branch 'main' into 'main' (2026-01-28 02:12:22 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware.git dev-queue

for you to fetch changes up to 524647ff511fd1c5ed5086e8bbf16acb96df2ce9:

  ice: update DDP LAG package to 1.3.2.0 (2026-01-29 08:37:49 -0800)

----------------------------------------------------------------
Marcin Szycik (1):
  ice: update DDP LAG package to 1.3.2.0

 WHENCE                                |   2 +-
 intel/ice/ddp-lag/ice_lag-1.3.1.0.pkg | Bin 692776 -> 0 bytes
 intel/ice/ddp-lag/ice_lag-1.3.2.0.pkg | Bin 0 -> 1360772 bytes
 3 files changed, 1 insertion(+), 1 deletion(-)
 delete mode 100644 intel/ice/ddp-lag/ice_lag-1.3.1.0.pkg
 create mode 100644 intel/ice/ddp-lag/ice_lag-1.3.2.0.pkg

-- 
2.47.1

