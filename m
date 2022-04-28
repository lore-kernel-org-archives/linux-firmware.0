Return-Path: <SRS0=uzVw=VG=intel.com=John.C.Harrison@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA734C433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 28 Apr 2022 19:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B849C385A9; Thu, 28 Apr 2022 19:07:28 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7D03C385A0;
	Thu, 28 Apr 2022 19:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7D03C385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651172846; x=1682708846;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZZspD1TKFfsbOOpsJ0BcXFfzGc2zMpvBW+AdlFdThCk=;
  b=by5hIJjycRZrgo0YaeXgQuE8SvhWZswAjaCDetBh08h2tybDNOsP2eS8
   G8jRWNFpLQrS3sOnKfPADsmTeLgvsJTkETFqG0Jvhz6VTLa41BX+ufyEH
   t1j6L8iGwljt/nq4ld2qI9I1XXgcqQKzuXB5feIqVq7K1LQdG1lV87j3g
   YX2mN4VxQyaXzLpsMPd9YVNrNoOilgjbB/kgu5LaBsQ5UxczicVdyoTCG
   x6Wd0Yah7/ky6vvKDufUPy7z2xlY8pb3bM42oXL8X/fSKrDjyZQeEk0AT
   mQUlfw4FV7D0rn/ZG5MLBq23ZzFJ3bIxeG/jEBiATBfIRrhS8FCMHplvS
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="266208336"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="266208336"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 12:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="581565132"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
  by orsmga008.jf.intel.com with ESMTP; 28 Apr 2022 12:07:25 -0700
From: John.C.Harrison@Intel.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: PR for new GuC v70.1.2 for DG2
Date: Thu, 28 Apr 2022 12:07:25 -0700
Message-Id: <20220428190725.3704842-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ac21ab5d1de0de34201c90d32eee436f873d1e5b:

  Mellanox: Add lc_ini_bundle for xx.2010.1006 (2022-04-25 07:36:16 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware guc_v70.1.2_dg2

for you to fetch changes up to 89ae5eb20f65752db6a3e38b9a69144f19540567:

  i915: Add GuC v70.1.2 for DG2 (2022-04-26 13:27:47 -0700)

----------------------------------------------------------------
John Harrison (1):
      i915: Add GuC v70.1.2 for DG2

 WHENCE                  |   3 +++
 i915/dg2_guc_70.1.2.bin | Bin 0 -> 365568 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 i915/dg2_guc_70.1.2.bin
