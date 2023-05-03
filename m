Return-Path: <SRS0=1C7p=AY=intel.com=John.C.Harrison@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A41C77B75
	for <linux-firmware@archiver.kernel.org>; Wed,  3 May 2023 16:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 681FDC4339B; Wed,  3 May 2023 16:58:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 163D5C433D2;
	Wed,  3 May 2023 16:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 163D5C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683133108; x=1714669108;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JmWq3PsHtXDgfJ+JouZpU37KyzNhDna8x1Sd4MGE/sA=;
  b=g535/65L2Km2x4IDcO5lHoB9+81T/cB0m9/rVvLb3IJHDeGbMgHO2wuw
   X7uTbH1AekK0WJoKNlkuZyaFebtqOJ1pUUIqL9/u7d7EguVN4P0HuiE6Q
   K7u6ub7eTkUDuKq9AHueYaKafOb3f9C9Bva/Ns0NLUpUGWPz9/OqZuj8o
   OPQHsyZTtGcpGYuaZNJgjtv7hx4Yimd/pG0O6VvznFmRu71sK9mMYdezP
   Kq/4/5PnhjEN+zh6E33cmgjjkp6yfrsxhZTViYH40XvndJK6ScaTxevdg
   gItpSTS9AKY0CPe8k3LARtcfokzEb/Xxfpy5Avgj4fOclMuL0PUgikt2u
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="337838491"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="337838491"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 09:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674157067"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="674157067"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
  by orsmga006.jf.intel.com with ESMTP; 03 May 2023 09:58:16 -0700
From: John.C.Harrison@Intel.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: PR for new GuC v70.6.6 for MTL
Date: Wed,  3 May 2023 09:58:28 -0700
Message-Id: <20230503165828.1002609-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 312c61f5a6c9c6a313383a8f0c2b02711ec15262:

  amdgpu: update DCN 3.1.6 DMCUB firmware (2023-05-03 09:11:02 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware mtl_guc_70.6.6

for you to fetch changes up to 192ee6d1a7806620eeb6f8478e6a3ec6ea44821c:

  i915: Add GuC v70.6.6 for MTL (2023-05-03 06:45:11 -0700)

----------------------------------------------------------------
John Harrison (1):
      i915: Add GuC v70.6.6 for MTL

 WHENCE              |   3 +++
 i915/mtl_guc_70.bin | Bin 0 -> 303936 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 i915/mtl_guc_70.bin
