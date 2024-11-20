Return-Path: <SRS0=ibSw=SP=intel.com=anthony.l.nguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7124D711CB
	for <linux-firmware@archiver.kernel.org>; Wed, 20 Nov 2024 17:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76D5AC4CED0; Wed, 20 Nov 2024 17:16:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63CF8C4CECD
	for <linux-firmware@kernel.org>; Wed, 20 Nov 2024 17:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63CF8C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732123012; x=1763659012;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hEs54f+MbXa+UPqBHoxRdOh+cegQGw3leRdfHDbt7cQ=;
  b=nL9rV7vzCyA4g9wUJ+S4sAIsdew4JAtURrHR3I3Q8nJLLACF5fiTgrBR
   Iy0h/RlP+d7seOW9vgEkva2wVsaAwsCpJoIa5NR07GPejQT3kPNapqa5E
   nNSF0AXj6Vm7+qCuWcHlEjmTPTURicofjJs1rSHVPXFPpmJWbYrhoUGj/
   oSjwpVwmG/nERkU8dutgSdgKRKU+Lc7BVBBtWn1kjMSwYrJEYyBjQZ2v/
   5a5Wqlr+qeVlNAftP/Cv5r4rnpcNkCPzQhedyOuZ9DbRAu37fcwkLLlk6
   QbMvRXaciKsUQPVHJ0hh3aAY+3s709LeET4gjdj1BpYJ3/03KPzVEo3Vs
   A==;
X-CSE-ConnectionGUID: cmpKYY04RTWrFNjiiAIvcQ==
X-CSE-MsgGUID: 0QIlZh9QT/a4CpvYnG81cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32255992"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="32255992"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 09:16:52 -0800
X-CSE-ConnectionGUID: gl9dPXkoTgyNHh59Jm9czg==
X-CSE-MsgGUID: 3C3/eez0S5SE0WEYpp8etg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="90390739"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by fmviesa009.fm.intel.com with ESMTP; 20 Nov 2024 09:16:51 -0800
From: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	paul.greenwalt@intel.com
Subject: [linux-firmware][pull request] Intel Wired LAN Firmware Updates 2024-11-20
Date: Wed, 20 Nov 2024 09:16:27 -0800
Message-ID: <20241120171629.2999114-1-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the ice DDP packages to the latest versions.
This includes the ice, ice comms, and ice wireless edge packages.

This update adds support for E830 devices and 192B max header length.
The E830 support is provided using a dual segment package with one
segment for E810 and one for E830, which increases the package size.

The following changes since commit 3b477528a4e62b6a166816bf605573719b3a87a4:

  Merge branch 'intel/guc/v70360rel' into 'main' (2024-11-20 12:35:10 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware.git dev-queue

for you to fetch changes up to 4d8d58ebd1fc1d161200fc06343ce0444e1892b7:

  ice: update ice DDP wireless_edge package to 1.3.20.0 (2024-11-20 08:44:51 -0800)

----------------------------------------------------------------

Paul Greenwalt (3):
  ice: update ice DDP package to ice-1.3.41.0
  ice: update ice DDP comms package to 1.3.52.0
  ice: update ice DDP wireless_edge package to 1.3.20.0

 WHENCE                                        |   8 ++++----
 ...ms-1.3.45.0.pkg => ice_comms-1.3.52.0.pkg} | Bin 733736 -> 1434500 bytes
 ...3.0.pkg => ice_wireless_edge-1.3.20.0.pkg} | Bin 737832 -> 1442692 bytes
 .../{ice-1.3.36.0.pkg => ice-1.3.41.0.pkg}    | Bin 692776 -> 1352580 bytes
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename intel/ice/ddp-comms/{ice_comms-1.3.45.0.pkg => ice_comms-1.3.52.0.pkg} (50%)
 rename intel/ice/ddp-wireless_edge/{ice_wireless_edge-1.3.13.0.pkg => ice_wireless_edge-1.3.20.0.pkg} (50%)
 rename intel/ice/ddp/{ice-1.3.36.0.pkg => ice-1.3.41.0.pkg} (50%)

-- 
2.42.0

