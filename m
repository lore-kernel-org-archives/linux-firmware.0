Return-Path: <SRS0=Xs0q=JX=intel.com=anthony.l.nguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0897FC48BC1
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Feb 2024 18:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE801C43390; Wed, 14 Feb 2024 18:23:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55937C433C7
	for <linux-firmware@kernel.org>; Wed, 14 Feb 2024 18:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55937C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707935033; x=1739471033;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+EU3GeJrMBbPrPxB7v9WvyMaHn659QP6UNnSwyXMClg=;
  b=BLzXcEGERpfYB7Vf/6etrKCUMhDfaUaYr/xv7Is9wC5Yhq5DzIq0x1VZ
   /o8RPX4S9NecWzx7EFnOZAhrCNQXglU32D85WSVH6lwMAoepsBknrw1Hm
   2aSVgRxnDf73AIHYrTyUcqTbX/O/IzP7UHvHA3Oil+EBjiMyscLiMz0WM
   zpHCsa5+lFIPyQr/wDmHC/zaafbzdJAwk90vyzYlEOsoeKyd7t5eNcKhR
   wS6erpvijbOejSJmUpq+NIXZ9RGW9QDf3T6j1aAHyXCeu59MPluMT0adV
   quMiBV6aCjFk4EE43hxBDXP5tUZ6g8LN9dUwUV/BsyvEYI4jvN4axWdqv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="19508145"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="19508145"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 10:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3255346"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by fmviesa009.fm.intel.com with ESMTP; 14 Feb 2024 10:23:52 -0800
From: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	przemyslaw.kitszel@intel.com
Subject: [linux-firmware v1 0/1][pull request] Intel Wired LAN Firmware Updates 2024-02-14
Date: Wed, 14 Feb 2024 10:23:37 -0800
Message-ID: <20240214182340.3220667-1-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ice DDP to support additional devices.

The following changes since commit 98db5411b132623478549d3abdb06e184724128b:

  Merge branch 'robot/pr-0-1707900738' into 'main' (2024-02-14 12:28:41 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware.git dev-queue

for you to fetch changes up to 4bbb468986a7df041c90659115d9331b57ac2708:

  ice: update ice DDP package to 1.3.36.0 (2024-02-14 10:08:22 -0800)

----------------------------------------------------------------
Przemek Kitszel (1):
      ice: update ice DDP package to 1.3.36.0

 WHENCE                                             |   4 ++--
 .../ice/ddp/{ice-1.3.35.0.pkg => ice-1.3.36.0.pkg} | Bin 692776 -> 692776 bytes
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename intel/ice/ddp/{ice-1.3.35.0.pkg => ice-1.3.36.0.pkg} (98%)
