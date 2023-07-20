Return-Path: <SRS0=LHs3=DG=intel.com=daniele.ceraolospurio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CDEC00528
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Jul 2023 17:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0CE0C433C8; Thu, 20 Jul 2023 17:35:54 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98574C433CC;
	Thu, 20 Jul 2023 17:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98574C433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689874552; x=1721410552;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fBKREk4PBD1GuDN0lxGr74qHKoIx0ldo1vIT+GjokKk=;
  b=js7Gcg9TherR78n3JyaxIDWa3XDQ+BrDko+tKyQqSAJ/bZnnQyYMc6fu
   FnGh5sMQFgUjqQaakpyxeiPmpKZYP4uIw4KGmQQhMFYarkvYw3Rdx0s3B
   gJsDh3l91L2qnS0Jf42PmuX+5iQHhfnHcap/XdGhKEentpjdQsfaMtnBN
   /MPZGQr+nVGloYenwgPtBxLfv2uBrLJASylu8woWpqHutbTxWrugtUKMX
   Flom2sMHohawvuv3mN1/T2orCU5rpl2BCwwwGzzkKZgaq0csncF0jEec+
   khVj6ysHjBYqli5lk17Vrq3KccY2NpyLByx8nEkM5LyQEZ7rSuyOJ0nn4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="430609879"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="430609879"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 10:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="848521685"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="848521685"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 10:35:51 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: [PR] GuC 70.8 for MTL and DG2 + HuC 8.5.1 for MTL
Date: Thu, 20 Jul 2023 10:35:22 -0700
Message-ID: <20230720173522.194818-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit d3f66064cf43bd7338a79174bd0ff60c4ecbdf6d:

  Partially revert "amdgpu: DMCUB updates for DCN 3.1.4 and 3.1.5" (2023-07-07 15:24:32 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware dg2_mtl_guc_70.8

for you to fetch changes up to 6f3a37f47d68d5e2108b98a900e4be910e8c7106:

  i915: update DG2 GuC to v70.8.0 (2023-07-20 10:14:57 -0700)

----------------------------------------------------------------
Daniele Ceraolo Spurio (2):
      i915: update to GuC 70.8.0 and HuC 8.5.1 for MTL
      i915: update DG2 GuC to v70.8.0

 WHENCE               |   6 +++---
 i915/dg2_guc_70.bin  | Bin 369600 -> 385856 bytes
 i915/mtl_guc_70.bin  | Bin 303936 -> 308032 bytes
 i915/mtl_huc_gsc.bin | Bin 565248 -> 569344 bytes
 4 files changed, 3 insertions(+), 3 deletions(-)
