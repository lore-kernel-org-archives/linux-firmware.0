Return-Path: <SRS0=3dGv=YN=intel.com=anthony.l.nguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80B5C5AD49
	for <linux-firmware@archiver.kernel.org>; Thu, 29 May 2025 17:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2D1FC4CEEA; Thu, 29 May 2025 17:38:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BECBBC4CEE7
	for <linux-firmware@kernel.org>; Thu, 29 May 2025 17:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BECBBC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748540293; x=1780076293;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YoOxUQbJL+i3n0RojUX1F4dqRljOeFFxnsQ9O+FPlEA=;
  b=DkdRpaiKxxcARNAnQoZlhgceD9ksiynG8itu+m9oZnwOToRRP8GhTJyv
   4yN8IkbQsUeGreSyvYjNuxm/LPUNH9Fwi9x/2o7VYHN6d7rfzIJ3Z6yKY
   /fZVFUlfxq2nLB3yYNMrDzF/chBlXfSEfvK2JutxRj/jPcBAyZ3XAeLE0
   wWGKth/PI4P0B3XADoqDGTfYxb++gxotJiRzqSvceoj5asvv0ZIEqkLZL
   C93F4XLWpKxZkjeDPHyWcsfpuseD9/UQlhevnLNsCvIwtq3T8TCMDe/zO
   YT9B9X8vgpuIKrIGHdHNM6+AUj3MxQao1oAulvSnobEPijNWPMMWR/iQZ
   A==;
X-CSE-ConnectionGUID: UZ2Sv1jCSEKlmHO5TKSAvQ==
X-CSE-MsgGUID: Anp6Zn15RJufhX3uIuM/FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="38242342"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="38242342"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 10:38:13 -0700
X-CSE-ConnectionGUID: 2PCP0Y4LStybKMohyOYvTQ==
X-CSE-MsgGUID: Ywv8uvxpTPOiKL7b191Jsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="144613522"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2025 10:38:13 -0700
From: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	jacob.e.keller@intel.com
Subject: [linux-firmware][pull request] Intel Wired LAN Firmware Updates 2025-05-29
Date: Thu, 29 May 2025 10:38:06 -0700
Message-ID: <20250529173808.1007279-1-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ice DDP packages (default, comms, and wireless_edge) to support
E825-C devices.

The following changes since commit 167118c968355b779bb2fb16078bb53bad677d49:

  Merge branch '23.140.Rev5' into 'main' (2025-05-29 11:01:00 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware.git dev-queue

for you to fetch changes up to 4439f5b5c5afc0c206c1e92fec39856caf092f75:

  ice: update wireless_edge package to 1.3.23.0 (2025-05-29 08:06:40 -0700)

----------------------------------------------------------------
Tony Nguyen (3):
      ice: update package to 1.3.43.0
      ice: update comms package to 1.3.55.0
      ice: update wireless_edge package to 1.3.23.0

 WHENCE                                             |   8 ++++----
 ...e_comms-1.3.52.0.pkg => ice_comms-1.3.55.0.pkg} | Bin 1434500 -> 1434500 bytes
 ...1.3.20.0.pkg => ice_wireless_edge-1.3.23.0.pkg} | Bin 1442692 -> 1442692 bytes
 .../ice/ddp/{ice-1.3.41.0.pkg => ice-1.3.43.0.pkg} | Bin 1352580 -> 1352580 bytes
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename intel/ice/ddp-comms/{ice_comms-1.3.52.0.pkg => ice_comms-1.3.55.0.pkg} (99%)
 rename intel/ice/ddp-wireless_edge/{ice_wireless_edge-1.3.20.0.pkg => ice_wireless_edge-1.3.23.0.pkg} (99%)
 rename intel/ice/ddp/{ice-1.3.41.0.pkg => ice-1.3.43.0.pkg} (99%)

-- 
2.47.1

