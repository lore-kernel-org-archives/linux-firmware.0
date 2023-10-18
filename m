Return-Path: <SRS0=mrQu=GA=intel.com=John.C.Harrison@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A98CDB483
	for <linux-firmware@archiver.kernel.org>; Wed, 18 Oct 2023 19:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1FC5C433C9; Wed, 18 Oct 2023 19:07:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B2F2C433C8;
	Wed, 18 Oct 2023 19:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B2F2C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697656029; x=1729192029;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l4H395Dg6duY9LjNNgMUe8M6E+QyjCmebBYyT/dCyTw=;
  b=KzSnpJTgkCEj1cce8sQKdZJnhrleObNn8ycAjCqn1W/3PS5k8AViGvZ6
   NXnCgQFIGDD0SueypSU0Xb8fvCOCKxwuRC5wnApwPHmb+fx+egoALFus8
   WnyiP5Ih/6aD0k2krIMtN9nrt7NiEo7hes2ES1fclQRFdlcFUy1qk1w6S
   CYV1gDela7VePcSwWnRFF0c4NZwe3gEVmhpOjxTqTpI5lgWSOEawxZyPe
   kpxwxhOiDPOXdElove9r1xSOlILug/z1vwKIqUg61l3vlyjGXrAkH2NXS
   mbVuo2QMcdG6JGSLBRTyEXaFNQnWgO3NKce6jJTyERBR6r45UqSpcMXW7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452561529"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="452561529"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 12:07:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="873147296"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="873147296"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
  by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2023 12:07:07 -0700
From: John.C.Harrison@Intel.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: [CI] PR for new GuC v70.13.1
Date: Wed, 18 Oct 2023 12:07:01 -0700
Message-ID: <20231018190701.2388817-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 7727f7e3b3358713c7c91c64a835e80c331a6b8b:

  Merge branch 'patch-1696561325' into 'main' (2023-10-06 03:04:57 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware guc_70.13.1

for you to fetch changes up to 44a9510c94ac0334931b6c89dd240ffe5bf1e5fa:

  i915: Add GuC v70.13.1 for DG2, TGL, ADL-P and MTL (2023-10-13 11:34:26 -0700)

----------------------------------------------------------------
John Harrison (1):
      i915: Add GuC v70.13.1 for DG2, TGL, ADL-P and MTL

 WHENCE               |   8 ++++----
 i915/adlp_guc_70.bin | Bin 297984 -> 342848 bytes
 i915/dg2_guc_70.bin  | Bin 385856 -> 443200 bytes
 i915/mtl_guc_70.bin  | Bin 308032 -> 365376 bytes
 i915/tgl_guc_70.bin  | Bin 285888 -> 330304 bytes
 5 files changed, 4 insertions(+), 4 deletions(-)
