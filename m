Return-Path: <SRS0=MBwk=E7=intel.com=John.C.Harrison@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24260C56202
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Nov 2020 01:42:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D7D14208DB; Wed, 25 Nov 2020 01:42:16 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CDE4206E5;
	Wed, 25 Nov 2020 01:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CDE4206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=John.C.Harrison@intel.com
IronPort-SDR: 0LjkylqtbqTuLr4sdTUIS4ifrkwqKjfGNKErXk/Pa5auFklbsXGOhpcQnSsHeMc8ffOva22Axx
 fO6kVy/pb8YQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="190182031"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; 
   d="scan'208";a="190182031"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 17:42:15 -0800
IronPort-SDR: h5ouB8FFVJjUSpj4KiUEhLwhtX5zF0FNZ0KsorprLQCxT3/zm7yGtdSKOW/nbtMMDdXWs1oc6x
 4V/SBH+bNyGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; 
   d="scan'208";a="327794297"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
  by orsmga003.jf.intel.com with ESMTP; 24 Nov 2020 17:42:14 -0800
From: John.C.Harrison@Intel.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: linux firmware PR for i915 GuC v49.0.1
Date: Tue, 24 Nov 2020 17:42:14 -0800
Message-Id: <20201125014214.3772152-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Josh, Kyle, Ben,

Kindly add the below i915 changes to linux-firmware.git:


The following changes since commit b362fd4cb8963ad75517dbcf424974f65a29a60e:

  Mellanox: Add new mlxsw_spectrum firmware xx.2008.2018 (2020-11-24 09:55:03 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware FDO/guc_v49

for you to fetch changes up to c487f7dadcd21116613441ed355b764003b3f57b:

  i915: Add GuC firmware v49.0.1 for all platforms (2020-11-24 17:04:17 -0800)

----------------------------------------------------------------
John Harrison (2):
      i915: Remove duplicate KBL DMC entry
      i915: Add GuC firmware v49.0.1 for all platforms

 WHENCE                  |  25 ++++++++++++++++++++++++-
 i915/bxt_guc_49.0.1.bin | Bin 0 -> 196224 bytes
 i915/cml_guc_49.0.1.bin | Bin 0 -> 197184 bytes
 i915/ehl_guc_49.0.1.bin | Bin 0 -> 324160 bytes
 i915/glk_guc_49.0.1.bin | Bin 0 -> 196672 bytes
 i915/icl_guc_49.0.1.bin | Bin 0 -> 324160 bytes
 i915/kbl_guc_49.0.1.bin | Bin 0 -> 197184 bytes
 i915/skl_guc_49.0.1.bin | Bin 0 -> 196288 bytes
 i915/tgl_guc_49.0.1.bin | Bin 0 -> 321792 bytes
 9 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 i915/bxt_guc_49.0.1.bin
 create mode 100644 i915/cml_guc_49.0.1.bin
 create mode 100644 i915/ehl_guc_49.0.1.bin
 create mode 100644 i915/glk_guc_49.0.1.bin
 create mode 100644 i915/icl_guc_49.0.1.bin
 create mode 100644 i915/kbl_guc_49.0.1.bin
 create mode 100644 i915/skl_guc_49.0.1.bin
 create mode 100644 i915/tgl_guc_49.0.1.bin
