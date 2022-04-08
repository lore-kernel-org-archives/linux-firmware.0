Return-Path: <SRS0=V/5q=US=intel.com=anthony.l.nguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E277FC433FE
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Apr 2022 16:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B04CCC385AB; Fri,  8 Apr 2022 16:13:41 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82098C385A3
	for <linux-firmware@kernel.org>; Fri,  8 Apr 2022 16:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82098C385A3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649434418; x=1680970418;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KJjFKKVIN37SeFR2fMe4XxCFJuSmW19jRHZJdkwFC4Y=;
  b=Bgcd9ofF3LgQkVQiItbLdL9fIKuNCwAeZPqWI5vpfX87uLKE0RdUVDTZ
   pX52yglVXBegNIWrTPWdzgS/jn0GNpMuJHoqb/Z0Ibc5d/Jexk67egUEH
   O/8Mqz1+YSSHoacwx/+rwqWkyygQeD/AFNHdhfUp1ptciUCAlF33z3lEJ
   4YOkWXy4c6Fx9ZZA3r/RErWv8XMDoHZ+57roV0UWtC0lvM62/SzSE2E8l
   t5jhAtONxJPGlwzPEQjkhWqCTIeY5GdfDGvaR6fClx0pV8Fyg2dKn8Bjq
   h9e7peghs8g0+tCr5/awV6Z8CpUteuHvOXX0dBy2Svct+GWJ+gaijp5sY
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="241562860"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="241562860"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 09:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="589269690"
Received: from anguy11-desk2.jf.intel.com ([10.166.244.147])
  by orsmga001.jf.intel.com with ESMTP; 08 Apr 2022 09:12:40 -0700
From: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	netdev@vger.kernel.org
Subject: [linux-firmware v1 0/2][pull request] Intel Wired LAN Firmware Updates 2022-04-08
Date: Fri,  8 Apr 2022 09:13:22 -0700
Message-Id: <20220408161324.2224973-1-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the ice comms package to a newer version and add another
alternative package file, wireless edge, that can optionally be used.

The following are changes since commit 681281e49fb6778831370e5d94e6e1d97f0752d6:
  amdgpu: update PSP 13.0.8 firmware
and are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware dev-queue

Arjun Anantharam (1):
  ice: update ice DDP comms package to 1.3.31.0

Guruprasad Rao (1):
  ice: Add wireless edge file for Intel E800 series driver

 WHENCE                                        |   3 ++-
 ...ms-1.3.20.0.pkg => ice_comms-1.3.31.0.pkg} | Bin 688388 -> 717176 bytes
 .../ice_wireless_edge-1.3.7.0.pkg}            | Bin 688388 -> 717176 bytes
 3 files changed, 2 insertions(+), 1 deletion(-)
 copy intel/ice/ddp-comms/{ice_comms-1.3.20.0.pkg => ice_comms-1.3.31.0.pkg} (75%)
 rename intel/ice/{ddp-comms/ice_comms-1.3.20.0.pkg => ddp-wireless_edge/ice_wireless_edge-1.3.7.0.pkg} (74%)

-- 
2.31.1

