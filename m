Return-Path: <SRS0=3bMR=BZ=intel.com=jose.souza@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63127C433E1
	for <linux-firmware@archiver.kernel.org>; Sat, 15 Aug 2020 00:45:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3DCC922EBE; Sat, 15 Aug 2020 00:45:50 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D288820781;
	Sat, 15 Aug 2020 00:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D288820781
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jose.souza@intel.com
IronPort-SDR: 8MkwdD3f8uwMOQtjkseY7CcnMVIMYLYE6zIJccGDG6PtB9dp/IMmHnudPAta0y5Vn9n6Fl/YiD
 Y0nZRqpLXAXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9713"; a="154480848"
X-IronPort-AV: E=Sophos;i="5.76,314,1592895600"; 
   d="scan'208";a="154480848"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2020 17:45:49 -0700
IronPort-SDR: 9y7vSj8D5ETZYUbZgYtLj8prx7kx7v3nmHHvh4xxCFrs/B8POtfBvwME+uyfCi10JfPj0178gA
 n/l9Zq+zxH+A==
X-IronPort-AV: E=Sophos;i="5.76,314,1592895600"; 
   d="scan'208";a="291886021"
Received: from rabecker-mobl1.amr.corp.intel.com (HELO josouza-MOBL2.amr.corp.intel.com) ([10.254.23.113])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2020 17:45:48 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	intel-gfx@lists.freedesktop.org,
	kyle@kernel.org,
	ben@decadent.org.uk
Subject: PR for new i915 firmware files
Date: Fri, 14 Aug 2020 17:48:02 -0700
Message-Id: <20200815004802.25787-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit c331aa9c49ce507d4e5a9a4f2f19115db8e15536:

  amdgpu: update vega20 firmware for 20.30 (2020-08-07 08:16:21 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware i915-firmware-updates-08-2020

for you to fetch changes up to 1b81373b52a86dadcfe70d4385e62bc6afc3963a:

  i915: Add DMC firmware 2.02 for RKL (2020-08-13 11:04:08 -0700)

----------------------------------------------------------------
José Roberto de Souza (3):
      i915: Add HuC firwmare v7.5.0 for TGL
      i915: Add DMC firmware 2.08 for TGL
      i915: Add DMC firmware 2.02 for RKL

 WHENCE                   |   9 +++++++++
 i915/rkl_dmc_ver2_02.bin | Bin 0 -> 18204 bytes
 i915/tgl_dmc_ver2_08.bin | Bin 0 -> 18932 bytes
 i915/tgl_huc_7.5.0.bin   | Bin 0 -> 580736 bytes
 4 files changed, 9 insertions(+)
 create mode 100644 i915/rkl_dmc_ver2_02.bin
 create mode 100644 i915/tgl_dmc_ver2_08.bin
 create mode 100644 i915/tgl_huc_7.5.0.bin

diff --git a/WHENCE b/WHENCE
index be8c390..54c3714 100644
--- a/WHENCE
+++ b/WHENCE
@@ -4124,6 +4124,9 @@ Version: DMC API/APB ver 2 release 4 for Tigerlake
 File: i915/tgl_dmc_ver2_06.bin
 Version: DMC API/APB ver 2 release 6 for Tigerlake
 
+File: i915/tgl_dmc_ver2_08.bin
+Version: DMC API/APB ver 2 release 8 for Tigerlake
+
 File: i915/icl_huc_9.0.0.bin
 Version: Huc API/APB ver 9 release 0 for Icelake
 
@@ -4142,6 +4145,12 @@ Version: Huc API/APB ver 7 release 0 for Tigerlake
 File: i915/tgl_huc_7.0.12.bin
 Version: Huc API/APB ver 7 release 0 for Tigerlake
 
+File: i915/tgl_huc_7.5.0.bin
+Version: Huc API/APB ver 7 release 5 for Tigerlake
+
+File: i915/rkl_dmc_ver2_02.bin
+Version: DMC API/APB ver 2 release 2 for Rocketlake
+
 License: Redistributable. See LICENSE.i915 for details
 
 --------------------------------------------------------------------------
diff --git a/i915/rkl_dmc_ver2_02.bin b/i915/rkl_dmc_ver2_02.bin
new file mode 100644
index 0000000..e553fbc
Binary files /dev/null and b/i915/rkl_dmc_ver2_02.bin differ
diff --git a/i915/tgl_dmc_ver2_08.bin b/i915/tgl_dmc_ver2_08.bin
new file mode 100644
index 0000000..9db379c
Binary files /dev/null and b/i915/tgl_dmc_ver2_08.bin differ
diff --git a/i915/tgl_huc_7.5.0.bin b/i915/tgl_huc_7.5.0.bin
new file mode 100644
index 0000000..bed10f3
Binary files /dev/null and b/i915/tgl_huc_7.5.0.bin differ
