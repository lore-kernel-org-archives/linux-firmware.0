Return-Path: <SRS0=Eztx=6M=offog.org=ats@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2EBC636D4
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Feb 2023 00:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2F55C4339B; Thu, 16 Feb 2023 00:56:38 +0000 (UTC)
Received: from alt2.a-painless.mh.aa.net.uk (a-painless.mh.aa.net.uk [81.187.30.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D49CC433EF
	for <linux-firmware@kernel.org>; Thu, 16 Feb 2023 00:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D49CC433EF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=offog.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=offog.org
Received: from cartman.offog.org ([2001:8b0:83b:b53f::a])
	by painless-a.thn.aa.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ats@offog.org>)
	id 1pSSZd-000hzv-Mu; Thu, 16 Feb 2023 00:56:34 +0000
Received: from ats by cartman.offog.org with local (Exim 4.96)
	(envelope-from <ats@offog.org>)
	id 1pSSZS-0004xa-0A;
	Thu, 16 Feb 2023 00:56:22 +0000
From: Adam Sampson <ats@offog.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Adam Sampson <ats@offog.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/2] intel: Fix broken links
Date: Thu, 16 Feb 2023 00:56:02 +0000
Message-Id: <20230216005602.18838-2-ats@offog.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230216005602.18838-1-ats@offog.org>
References: <20230216005602.18838-1-ats@offog.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The target is relative to the link name.

Fixes: 23afbfe8 ("intel: avs: Add AudioDSP base firmware for CNL-based platforms")
Fixes: 284e55d9 ("intel: avs: Add AudioDSP base firmware for APL-based platforms")
Fixes: 289e3a97 ("intel: avs: Add AudioDSP base firmware for SKL-based platforms")
Fixes: 4296b7af ("intel: catpt: Add AudioDSP base firmware for BDW platforms")
Signed-off-by: Adam Sampson <ats@offog.org>
---
 WHENCE | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/WHENCE b/WHENCE
index b6199d6..e37fa73 100644
--- a/WHENCE
+++ b/WHENCE
@@ -4070,7 +4070,7 @@ Driver: snd_soc_catpt -- Intel AudioDSP driver for HSW/BDW platforms
 
 File: intel/catpt/bdw/dsp_basefw.bin
 Version: 44b81c4d5397a63108356f58f036953d9b288c4e
-Link: intel/IntcSST2.bin -> intel/catpt/bdw/dsp_basefw.bin
+Link: intel/IntcSST2.bin -> catpt/bdw/dsp_basefw.bin
 
 License: Redistributable. See LICENCE.IntcSST2 for details
 
@@ -4081,15 +4081,15 @@ Driver: snd_soc_avs -- Intel AudioDSP driver for cAVS platforms
 File: intel/avs/skl/dsp_basefw.bin
 File: intel/avs/skl/dsp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin
 Version: 9.21.00.4899
-Link: intel/dsp_fw_release.bin -> intel/avs/skl/dsp_basefw.bin
-Link: intel/dsp_fw_kbl.bin -> intel/avs/skl/dsp_basefw.bin
+Link: intel/dsp_fw_release.bin -> avs/skl/dsp_basefw.bin
+Link: intel/dsp_fw_kbl.bin -> avs/skl/dsp_basefw.bin
 File: intel/avs/apl/dsp_basefw.bin
 Version: 9.22.01.4908
-Link: intel/dsp_fw_bxtn.bin -> intel/avs/apl/dsp_basefw.bin
-Link: intel/dsp_fw_glk.bin -> intel/avs/apl/dsp_basefw.bin
+Link: intel/dsp_fw_bxtn.bin -> avs/apl/dsp_basefw.bin
+Link: intel/dsp_fw_glk.bin -> avs/apl/dsp_basefw.bin
 File: intel/avs/cnl/dsp_basefw.bin
 Version: 10.23.00.8551
-Link: intel/dsp_fw_cnl.bin -> intel/avs/cnl/dsp_basefw.bin
+Link: intel/dsp_fw_cnl.bin -> avs/cnl/dsp_basefw.bin
 
 License: Redistributable. See LICENCE.adsp_sst for details
 
-- 
2.30.2

