Return-Path: <SRS0=H/O1=E6=intel.com=daniele.ceraolospurio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A89EEAA52
	for <linux-firmware@archiver.kernel.org>; Thu, 14 Sep 2023 15:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58539C433CA; Thu, 14 Sep 2023 15:49:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1E6FC433C8;
	Thu, 14 Sep 2023 15:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1E6FC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694706543; x=1726242543;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p1/ujPKzutcHZHhAj38lOaC14m8NrDLzxb3DzET2/A0=;
  b=Wjlt5kKmQB+s/4GGvnWsZxs57nQiAbvpbBWTu9PDK/2oNl/MH9+GlqBe
   vhwfChGSefIITLiaMxVezjC7sR7GgLYooUEwVJjxpSBniyXqivLuhzTfy
   lhJ2DHGVPCJUEP+6GPAVyYl1BgZaNafMdZZ44q7ghos0QTL1qMlBOXbl8
   XPTc5AKaOSRKzfpVSAmMajbpAdqBd5NaazzGktQfptlBAniI5TU9EkFBM
   qfUWWotxeYnL59PdGQ1Vy+bMW2EcOqV3iHsoqDldQ/ZsImlLwtY0wbILv
   AG6VsYLod8IdfmRplbW37jKyb2GKo7DtV/AvP6aaBtKTWcsAvmvb2M5/3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381704109"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="381704109"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 08:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="737943936"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="737943936"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 08:42:37 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: PR for HuC v8.5.4 for MTL
Date: Thu, 14 Sep 2023 08:42:25 -0700
Message-ID: <20230914154225.2821571-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit dfa11466cf000120d1551146fd5bf78c44941eda:

  Merge branch 'main' into 'main' (2023-09-07 11:36:57 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware mtl_huc_8.5.4

for you to fetch changes up to a5dbe400f776b0dc2d0a402ba76b4c16c231b38e:

  i915: update MTL HuC to version 8.5.4 (2023-09-14 08:34:08 -0700)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      i915: update MTL HuC to version 8.5.4

 WHENCE               |   2 +-
 i915/mtl_huc_gsc.bin | Bin 569344 -> 561152 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
