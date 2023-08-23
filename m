Return-Path: <SRS0=TxI6=EI=intel.com=daniele.ceraolospurio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE53C7113B
	for <linux-firmware@archiver.kernel.org>; Wed, 23 Aug 2023 18:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 466EAC433CB; Wed, 23 Aug 2023 18:42:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D79BC433C7;
	Wed, 23 Aug 2023 18:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D79BC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692816176; x=1724352176;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4iLwxg5lTQXmK4R+O1ip9pOJ++zE/rBhMDAMdRe8oTI=;
  b=G3xPH+8x3+HLkCVTU3/rDUy2CJJgWX9fcKXz21TOFi4T10xA6tTSzxTs
   oYDPzJSG7nI1fXDnV1xkOW47IrX2HReSLJS3cgsLFZdGTLALL1TCD7gIV
   PPkSby87FM+NARBgsaB7Q+CFZj8lu2rWYH78aQx5GB7ty4A7im9tizi+a
   Cv9dBqPu3DXp6tpdA8XrwubvgDsue2Z/Uvzj74xyP+GP8x2v+Qf18ydjN
   o/7x4peyArlhU0zkmP3tX0Xl3tqlIUJVkw8dVi3xx2d6Pje4kedoRRe9S
   8ngYNuKXWcVaJeVahDoF1Pob+w0dofIdoiGO1X1NRFdt4ZD2obHDeJGcs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405246594"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="405246594"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 11:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="736766534"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="736766534"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 11:42:54 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: PR for GSC FW release 102.0.0.1655 for MTL
Date: Wed, 23 Aug 2023 11:42:47 -0700
Message-ID: <20230823184247.1767725-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0e048b061bde79ad735c7b7b5161ee1bd3400150:

  Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-firmware (2023-08-14 13:03:41 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware mtl_gsc_1655

for you to fetch changes up to 81caac98eda16944446fa057191ee969c377154a:

  i915: add GSC 102.0.0.1655 for MTL (2023-08-21 14:13:11 -0700)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      i915: add GSC 102.0.0.1655 for MTL

 WHENCE             |   3 +++
 i915/mtl_gsc_1.bin | Bin 0 -> 1142784 bytes
 2 files changed, 3 insertions(+)
 create mode 100755 i915/mtl_gsc_1.bin
