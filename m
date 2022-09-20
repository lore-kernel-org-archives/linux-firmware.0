Return-Path: <SRS0=YgI2=ZX=intel.com=John.C.Harrison@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38B6C6FA82
	for <linux-firmware@archiver.kernel.org>; Tue, 20 Sep 2022 20:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DF05C433D7; Tue, 20 Sep 2022 20:40:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB1A9C433D6;
	Tue, 20 Sep 2022 20:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB1A9C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663706441; x=1695242441;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nMq0DGS7HnZDGzO1z6SarqIinLpzBCeaVeHBmc/7dks=;
  b=ivXAq2+XT8doScl1I+QvgKZYRIIojvU7Tkl4cKpjIYAJZ07TWxigqPYQ
   gnt0AQZud1TGGtTMLHs1U9QydL3eYRj9s/goL+jo0YwyBc3tOTxXizL1T
   /ul+oxatjUA3pIS+5LT5sAYhY4cApQPnDIAd+1u64nK3W4ZD+bN3dq5Fl
   FCowj3kMv9zs4/Jlta3KHVwwAECHQLwPHO9wjbZmJuqtT4zG1CtDUeELY
   GPdhqD4mySAsv2M9GBuf39jbdmsfCssqNeP2dLS4/fLqFRnMrXKPZ4SxU
   9Z82Mols3h/sWfSCNKMHtzhTNJExXyFoN0iT3kyg5IxU2z3IFM2SMWyRy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="286882116"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; 
   d="scan'208";a="286882116"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 13:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; 
   d="scan'208";a="687570925"
Received: from relo-linux-5.jf.intel.com ([10.165.21.188])
  by fmsmga004.fm.intel.com with ESMTP; 20 Sep 2022 13:40:39 -0700
From: John.C.Harrison@Intel.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: PR for new GuC v70.5.1 and GuC/HuC with new names
Date: Tue, 20 Sep 2022 13:41:19 -0700
Message-Id: <20220920204119.3514792-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:

  amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware guc_70.5.1_huc_nover

for you to fetch changes up to 51fff4e69b4554dd3fee21e3c55a0f94937293e3:

  i915: Add versionless HuC files for current platforms (2022-09-16 08:52:30 -0700)

----------------------------------------------------------------
John Harrison (2):
      i915: Add GuC v70.5.1 for DG1, DG2, TGL and ADL-P
      i915: Add versionless HuC files for current platforms

 WHENCE               |  18 ++++++++++++++++++
 i915/adlp_guc_70.bin | Bin 0 -> 297984 bytes
 i915/dg1_guc_70.bin  | Bin 0 -> 272512 bytes
 i915/dg1_huc.bin     | Bin 0 -> 589888 bytes
 i915/dg2_guc_70.bin  | Bin 0 -> 369600 bytes
 i915/tgl_guc_70.bin  | Bin 0 -> 285888 bytes
 i915/tgl_huc.bin     | Bin 0 -> 589888 bytes
 7 files changed, 18 insertions(+)
 create mode 100644 i915/adlp_guc_70.bin
 create mode 100644 i915/dg1_guc_70.bin
 create mode 100644 i915/dg1_huc.bin
 create mode 100644 i915/dg2_guc_70.bin
 create mode 100644 i915/tgl_guc_70.bin
 create mode 100644 i915/tgl_huc.bin
