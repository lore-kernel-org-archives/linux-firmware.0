Return-Path: <SRS0=LYiI=PO=intel.com=gustavo.sousa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B292C52D7F
	for <linux-firmware@archiver.kernel.org>; Thu, 15 Aug 2024 21:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D569C4AF0C; Thu, 15 Aug 2024 21:22:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 483E6C32786
	for <linux-firmware@kernel.org>; Thu, 15 Aug 2024 21:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 483E6C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723756949; x=1755292949;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tcD5FumD9HjF98d6IQV/A2SMU6uG+UDDBty5jatbBjY=;
  b=OhmDGKPT42EHQ8GJmf+lF3weXb5v2BE6mvaUIaY6gHp7b2V2ctkJVaEU
   8b8kqDucsBKg5Xr5v3isAEbMkuSGO13LbPkTGo0iHGyt6Ic5RYq67n7bc
   ujTa3R3gO5Y756BcqT69V3AtUKksD2RVOVKY21wykACBrSteqUFqvg57k
   1iQ1iQ9FeXN0xdS66seSxWSkcPPS15UdrKeOfPo9GzVSINIYFBkoASfci
   Mh/HdO9eVwrPFqbLgx0cSvPYO22Ws+QeXUDx6UqSLJDTj1pLVJK17WX9I
   9CDvyGjWLCsLlsp9TfORK0LKonlRczeC0ST7w2mov7YaXYU3r2yJJV4of
   g==;
X-CSE-ConnectionGUID: FIrlFtlhSFavUIgoN8xI5w==
X-CSE-MsgGUID: qexpF74gTHCZiizvePog5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="47445182"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="47445182"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 14:22:28 -0700
X-CSE-ConnectionGUID: VmeCHToSR3CdXmckbL1cog==
X-CSE-MsgGUID: WGifvSZkS5egcZqSjMwq8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="59149827"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com) ([10.125.110.233])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 14:22:27 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: PR to revert MTL DMC to v2.21
Date: Thu, 15 Aug 2024 18:21:59 -0300
Message-ID: <20240815212216.66557-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b1de0237a78a84baf7e1e2a1e9585405b88d82f8:

  Merge branch 'ath-20240813' into 'main' (2024-08-15 13:43:05 +0000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/firmware.git intel/mtl-dmc-revert-to-v2.21

for you to fetch changes up to ad8d5f76c429e5485764a9ecb7a2ce3fbc1386ae:

  Revert "i915: Update MTL DMC v2.22" (2024-08-15 18:10:27 -0300)

----------------------------------------------------------------
Gustavo Sousa (1):
      Revert "i915: Update MTL DMC v2.22"

 WHENCE           |   2 +-
 i915/mtl_dmc.bin | Bin 52700 -> 52476 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
