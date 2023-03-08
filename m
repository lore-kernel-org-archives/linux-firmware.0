Return-Path: <SRS0=6VVP=7A=intel.com=fiona.trahe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063D1C64EC4
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Mar 2023 19:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF566C433D2; Wed,  8 Mar 2023 19:18:07 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E52AC433EF
	for <linux-firmware@kernel.org>; Wed,  8 Mar 2023 19:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E52AC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678303086; x=1709839086;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0o0l8/73RhfX+BEEpYitGfL1egYHmeewhOqMb+ar+HM=;
  b=AcJFyfzJzlb2wK1BO1NlyWKPSMccRt1HKzyBHczladNVVCwQ3HEf28Vo
   2nnCsG90uIblTTHuq4UImKt+qRvRg7q/tquL47zcOK91r+ZV9Gg6mX5sE
   SvNHH6hoY4kMEEGyO17VdaQE0FjcumcbY5sOHRJYrOrEaN5wkSEOch/on
   aFLKmSS6/HhTRegLPv/VUm8LR3piTgZ8MA7NDwgPI/g6anwL75V0Jzu6u
   d5JempLrEzALkG0DWxjOuUU1/EL+7eJWBBB4WYvRv0td4/dcobrFPd03V
   oSqscPUBapycY/jSlMz7bNJ3bXcNvSRwGKSLyBgyYm9yp8dL268OrjrNy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324569741"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="324569741"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 11:18:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="670450840"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="670450840"
Received: from r022s003_zp31l10c01.gv.intel.com (HELO localhost.gv.intel.com) ([10.219.170.201])
  by orsmga007.jf.intel.com with ESMTP; 08 Mar 2023 11:18:05 -0800
From: Fiona Trahe <fiona.trahe@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: fiona.trahe@intel.com,
	giovanni.cabiddu@intel.com,
	adam.guerin@intel.com
Subject: [PATCH] qat: update licence text
Date: Wed,  8 Mar 2023 14:18:00 -0500
Message-Id: <20230308191800.98791-1-fiona.trahe@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Research and Development Ireland Ltd - Co. Reg. #308263 - Collinstown Industrial Park, Leixlip, County Kildare - Ireland
Content-Transfer-Encoding: 8bit

The same firmware is distributed with the qat out-of-tree package.
Remove one unnecessary phrase in this licence to align with the licence
used in the out-of-tree package.

Signed-off-by: Fiona Trahe <fiona.trahe@intel.com>
Signed-off-by: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
---
 LICENCE.qat_firmware | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/LICENCE.qat_firmware b/LICENCE.qat_firmware
index 9d94846..75a4ff1 100644
--- a/LICENCE.qat_firmware
+++ b/LICENCE.qat_firmware
@@ -18,12 +18,9 @@ Limited patent license.  Intel Corporation grants a world-wide,
 royalty-free, non-exclusive license under patents it now or hereafter
 owns or controls to make, have made, use, import, offer to sell and
 sell ("Utilize") this software, but solely to the extent that any
-such patent is necessary to Utilize the software alone, or in
-combination with an operating system licensed under an approved Open
-Source license as listed by the Open Source Initiative at
-http://opensource.org/licenses.  The patent license shall not apply to
-any other combinations which include this software.  No hardware per
-se is licensed hereunder.
+such patent is necessary to Utilize the software alone. The patent
+license shall not apply to any other combinations which include this
+software. No hardware per se is licensed hereunder.
 
 DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
 CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
-- 
2.39.2

