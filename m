Return-Path: <SRS0=X/cd=5M=intel.com=amit.k.bag@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6DFC2D0E8
	for <linux-firmware@archiver.kernel.org>; Fri, 27 Mar 2020 09:33:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F0B8E20716; Fri, 27 Mar 2020 09:33:03 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3BE720714
	for <linux-firmware@kernel.org>; Fri, 27 Mar 2020 09:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3BE720714
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=amit.k.bag@intel.com
IronPort-SDR: hPgk4mJ5fjY3PpJFi1pAs6j9pjvbcgBZKOrRb2g79J36ZPVFY8JAw9NNPLgYOaj6Q4W9jlEUMV
 ic3NMNqs6h1g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 02:33:03 -0700
IronPort-SDR: tnL0tKsGAM/imjLqaUjrpqPPtZZ7rRTbTDoMbJhYWO0Ig7GUpwiH9K21yXQo02RkNRYKS+0GGa
 8IyQd4u0Asyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; 
   d="scan'208";a="447351376"
Received: from unknown (HELO intel-Lenovo-Legion-Y540-15IRH-PG0.iind.intel.com) ([10.224.186.95])
  by fmsmga005.fm.intel.com with ESMTP; 27 Mar 2020 02:33:01 -0700
From: Amit K Bag <amit.k.bag@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	Amit K Bag <amit.k.bag@intel.com>
Subject: [PATCH 1/2] linux-firmware: Update firmware file for Intel Bluetooth AX201
Date: Fri, 27 Mar 2020 15:03:34 +0530
Message-Id: <20200327093335.20150-1-amit.k.bag@intel.com>
X-Mailer: git-send-email 2.17.1

This patch updates new firmware file for Intel Bluetooth AX201
Also it is known as Intel HarrisonPeak (HrP).

FW Build: REL0384

Release Version: 21.70.3.2

Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
---
 intel/ibt-19-0-0.ddc   | Bin 27 -> 14 bytes
 intel/ibt-19-0-1.ddc   | Bin 27 -> 14 bytes
 intel/ibt-19-0-4.ddc   | Bin 27 -> 14 bytes
 intel/ibt-19-16-4.ddc  | Bin 27 -> 14 bytes
 intel/ibt-19-240-1.ddc | Bin 27 -> 14 bytes
 intel/ibt-19-240-4.ddc | Bin 27 -> 14 bytes
 intel/ibt-19-32-0.ddc  | Bin 27 -> 14 bytes
 intel/ibt-19-32-1.ddc  | Bin 27 -> 14 bytes
 intel/ibt-19-32-4.ddc  | Bin 27 -> 14 bytes
 9 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/intel/ibt-19-0-0.ddc b/intel/ibt-19-0-0.ddc
index 3cd54fe2c149616ff68aee097a466c534832f805..f24bb176758e6fce478820f1c2b7f7930bf88ce3 100644
GIT binary patch
literal 14
VcmZS9V3c5SVsvd_(PU(1000Ym0fGPk

literal 27
icmZSV{=>(t!6?Dv#OT_<qRGh2z{JPK*!_orfdK$Wjs&&<

diff --git a/intel/ibt-19-0-1.ddc b/intel/ibt-19-0-1.ddc
index 3cd54fe2c149616ff68aee097a466c534832f805..f24bb176758e6fce478820f1c2b7f7930bf88ce3 100644
GIT binary patch
literal 14
VcmZS9V3c5SVsvd_(PU(1000Ym0fGPk

literal 27
icmZSV{=>(t!6?Dv#OT_<qRGh2z{JPK*!_orfdK$Wjs&&<

diff --git a/intel/ibt-19-0-4.ddc b/intel/ibt-19-0-4.ddc
index 3cd54fe2c149616ff68aee097a466c534832f805..f24bb176758e6fce478820f1c2b7f7930bf88ce3 100644
GIT binary patch
literal 14
VcmZS9V3c5SVsvd_(PU(1000Ym0fGPk

literal 27
icmZSV{=>(t!6?Dv#OT_<qRGh2z{JPK*!_orfdK$Wjs&&<

diff --git a/intel/ibt-19-16-4.ddc b/intel/ibt-19-16-4.ddc
index 3cd54fe2c149616ff68aee097a466c534832f805..f24bb176758e6fce478820f1c2b7f7930bf88ce3 100644
GIT binary patch
literal 14
VcmZS9V3c5SVsvd_(PU(1000Ym0fGPk

literal 27
icmZSV{=>(t!6?Dv#OT_<qRGh2z{JPK*!_orfdK$Wjs&&<

diff --git a/intel/ibt-19-240-1.ddc b/intel/ibt-19-240-1.ddc
index 3cd54fe2c149616ff68aee097a466c534832f805..f24bb176758e6fce478820f1c2b7f7930bf88ce3 100644
GIT binary patch
literal 14
VcmZS9V3c5SVsvd_(PU(1000Ym0fGPk

literal 27
icmZSV{=>(t!6?Dv#OT_<qRGh2z{JPK*!_orfdK$Wjs&&<

diff --git a/intel/ibt-19-240-4.ddc b/intel/ibt-19-240-4.ddc
index 3cd54fe2c149616ff68aee097a466c534832f805..f24bb176758e6fce478820f1c2b7f7930bf88ce3 100644
GIT binary patch
literal 14
VcmZS9V3c5SVsvd_(PU(1000Ym0fGPk

literal 27
icmZSV{=>(t!6?Dv#OT_<qRGh2z{JPK*!_orfdK$Wjs&&<

diff --git a/intel/ibt-19-32-0.ddc b/intel/ibt-19-32-0.ddc
index 3cd54fe2c149616ff68aee097a466c534832f805..f24bb176758e6fce478820f1c2b7f7930bf88ce3 100644
GIT binary patch
literal 14
VcmZS9V3c5SVsvd_(PU(1000Ym0fGPk

literal 27
icmZSV{=>(t!6?Dv#OT_<qRGh2z{JPK*!_orfdK$Wjs&&<

diff --git a/intel/ibt-19-32-1.ddc b/intel/ibt-19-32-1.ddc
index 3cd54fe2c149616ff68aee097a466c534832f805..f24bb176758e6fce478820f1c2b7f7930bf88ce3 100644
GIT binary patch
literal 14
VcmZS9V3c5SVsvd_(PU(1000Ym0fGPk

literal 27
icmZSV{=>(t!6?Dv#OT_<qRGh2z{JPK*!_orfdK$Wjs&&<

diff --git a/intel/ibt-19-32-4.ddc b/intel/ibt-19-32-4.ddc
index 3cd54fe2c149616ff68aee097a466c534832f805..f24bb176758e6fce478820f1c2b7f7930bf88ce3 100644
GIT binary patch
literal 14
VcmZS9V3c5SVsvd_(PU(1000Ym0fGPk

literal 27
icmZSV{=>(t!6?Dv#OT_<qRGh2z{JPK*!_orfdK$Wjs&&<

-- 
2.17.1

