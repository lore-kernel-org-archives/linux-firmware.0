Return-Path: <SRS0=J5UN=HD=intel.com=anthony.l.nguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CAEC61D9B
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Nov 2023 17:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78474C433C8; Wed, 22 Nov 2023 17:30:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C10AC433C7
	for <linux-firmware@kernel.org>; Wed, 22 Nov 2023 17:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C10AC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700674257; x=1732210257;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z8brI9tNy0NrCmpE93Mz4hoKxVhUfqeQxjFpq3MNoCg=;
  b=LhiSKsA1FeBz7r7YJ5k/1zPojzMkqlIcxwXwHUDVQnsmAck0tximaMfS
   ZZkyvUplV2i+/LuWuKSdspXWqpmI1q29kGzFjCsXVkvHZmJX/wQoKB3VA
   mu9qE7EA6xINDUymiyixwN4dT2ArxoyYQfHLaa/W4OmOKuVjupzTH3BQS
   xpADIRB0NSiW6q/VIXw3rUaZHA9YJQHnPJqtJlCJLkfahp9VbfM1jX5Fk
   gARI6ha9CHTQWN8El0oKqvANRKZIy9C6aK9IbNI1KwElgwtLEj5DkIwh6
   sqiFIZNJL2oCRvno/1Xu3ADegPM0wj2T1kgJ0G+O8MOcq5B82L1hw2qL4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478305991"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="478305991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 09:30:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="15346038"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2023 09:30:56 -0800
From: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	netdev@vger.kernel.org,
	przemyslaw.kitszel@intel.com
Subject: [linux-firmware v1 0/3][pull request] Intel Wired LAN Firmware Updates 2023-11-22
Date: Wed, 22 Nov 2023 09:30:36 -0800
Message-ID: <20231122173041.3835620-1-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the various ice DDP packages to the latest versions.

Thanks,
Tony

The following changes since commit 9552083a783e5e48b90de674d4e3bf23bb855ab0:

  Merge branch 'robot/pr-0-1700470117' into 'main' (2023-11-20 13:09:23 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware.git dev-queue

for you to fetch changes up to c71fdbc575b79eff31db4ea243f98d5f648f7f0f:

  ice: update ice DDP wireless_edge package to 1.3.13.0 (2023-11-22 09:14:39 -0800)

----------------------------------------------------------------
Przemek Kitszel (3):
      ice: update ice DDP package to 1.3.35.0
      ice: update ice DDP comms package to 1.3.45.0
      ice: update ice DDP wireless_edge package to 1.3.13.0

 WHENCE                                             |   8 ++++----
 ...e_comms-1.3.40.0.pkg => ice_comms-1.3.45.0.pkg} | Bin 725428 -> 733736 bytes
 ...1.3.10.0.pkg => ice_wireless_edge-1.3.13.0.pkg} | Bin 725428 -> 737832 bytes
 .../ice/ddp/{ice-1.3.30.0.pkg => ice-1.3.35.0.pkg} | Bin 692660 -> 692776 bytes
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename intel/ice/ddp-comms/{ice_comms-1.3.40.0.pkg => ice_comms-1.3.45.0.pkg} (89%)
 rename intel/ice/ddp-wireless_edge/{ice_wireless_edge-1.3.10.0.pkg => ice_wireless_edge-1.3.13.0.pkg} (88%)
 rename intel/ice/ddp/{ice-1.3.30.0.pkg => ice-1.3.35.0.pkg} (88%)
