Return-Path: <SRS0=25d7=J7=intel.com=gustavo.sousa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A244C54788
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Feb 2024 13:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B1F7C433C7; Thu, 22 Feb 2024 13:58:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EAE76C43394
	for <linux-firmware@kernel.org>; Thu, 22 Feb 2024 13:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EAE76C43394
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708610332; x=1740146332;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hb6mwgaj7qxUKh5pDLUzl5dsbQpa7yv4lOKhJ02zXsU=;
  b=aOkucWsV6b1AKBQt8QINydarT5ILOhaT/iHfYtZawhXL9EO91O7pEdkn
   vbmVPosqeGy6V3v7WGdfj6NplFMEetPfkX7wFtblpjVgySDl6brZmFTkn
   UCUWsfqlc34c58+mimSZirM2KEWjhwQOEx+VwIgIRSy/CD9XnjoA+xNyN
   nhfTRwJeeVn/Wf4EEfORmO8a4N++Nqv1HUTqtzy1BxIFrQSKE41P6bG46
   /axkzlPeGRrdM1h54JpvilYPF1d0KN1zMK2DzpQIZIS8diryDQs0egwlz
   xBoGqVT0BjRl8e12+exTyuijVEdeFXGEeTiFnkyZJyWv0QnUAipdVYbAa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="28275102"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="28275102"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 05:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="36503954"
Received: from tgv15d-lfw01b-20.inn.intel.com (HELO gjsousa-mobl2.intel.com) ([10.125.20.2])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 05:58:50 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: intel-gfx@lists.freedesktop.org
Subject: PR for MTL DMC v2.21
Date: Thu, 22 Feb 2024 10:58:34 -0300
Message-ID: <20240222135834.75378-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 97b693d243f0bb464819fa3f8326edd4091032e4:

  Merge branch 'mediatek' into 'main' (2024-02-20 15:13:01 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware mtl_dmc_2.21

for you to fetch changes up to 98502ba83a6db0e4dc99aa1fa292e48b1dc8d0ce:

  i915: Update MTL DMC v2.21 (2024-02-22 10:51:16 -0300)

----------------------------------------------------------------
Gustavo Sousa (1):
      i915: Update MTL DMC v2.21

 WHENCE           |   2 +-
 i915/mtl_dmc.bin | Bin 52476 -> 52476 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
