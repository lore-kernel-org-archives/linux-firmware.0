Return-Path: <SRS0=pjNs=G6=intel.com=gustavo.sousa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E82FC072A2
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Nov 2023 15:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C0EFC433C7; Fri, 17 Nov 2023 15:07:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECBC2C433C8;
	Fri, 17 Nov 2023 15:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ECBC2C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700233667; x=1731769667;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=68Xm7vADGJ5OF+cjUOQG0x5GVggy3s3O7u6sovNibrw=;
  b=I3Dfi8erTc3LxNUxD33rpAKSMOBp9jA4AB8+wPc7VnIFAm3rjzdFjyaB
   WzJuXrJqoVG2//RRY1Mc93L40aPbIhxp+GCm01FcpJZZ7cFDfxcEEwR02
   hw16AO7qQoT6C5XhxMbL7BDKGmxcZjF3HsC6wUSWndmkZQcmLSFjRnJO6
   eEcAK80Gli9iDed53W+39h+8erCvP8rWgDaf2hfF1WS5xhpg9AkxEc0ET
   +FDkGRmLwyCgcVN9DdKxWghUjMf9wiX3QaDIPyJPsJ0VyXmmjx7LSY6nK
   /1WGBtadDxTA6LbUwhPHJ9DY0pUqwnDPUgsWhZaI/O4/ZBsbr3X77MQY7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="391095935"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="391095935"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 07:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="13953856"
Received: from bappiagy-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com) ([10.255.36.146])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 07:07:44 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: PR for MTL DMC v2.19
Date: Fri, 17 Nov 2023 12:07:11 -0300
Message-ID: <20231117150711.24379-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6723a8d9092325d00a125a1b3ca058644f74d314:

  Merge branch 'robot/pr-5-1700153542' into 'main' (2023-11-16 16:54:38 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware mtl_dmc_2.19

for you to fetch changes up to 451090149cecfae5e674d24944579a564afefe8a:

  i915: Update MTL DMC to v2.19 (2023-11-17 11:03:16 -0300)

----------------------------------------------------------------
Gustavo Sousa (1):
      i915: Update MTL DMC to v2.19

 WHENCE           |   2 +-
 i915/mtl_dmc.bin | Bin 52508 -> 52476 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
