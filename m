Return-Path: <SRS0=8hGz=4V=intel.com=daniele.ceraolospurio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D426AC3F2CE
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Mar 2020 21:36:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C190420838; Wed,  4 Mar 2020 21:36:04 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9793E20828;
	Wed,  4 Mar 2020 21:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9793E20828
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniele.ceraolospurio@intel.com
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Mar 2020 13:36:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,515,1574150400"; 
   d="scan'208";a="229465370"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
  by orsmga007.jf.intel.com with ESMTP; 04 Mar 2020 13:36:03 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: intel-gfx@lists.freedesktop.org,
	jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	jose.souza@intel.com
Subject: PR - i915 firmware updates (TGL HuC 7.0.12 and DMC 2.06)
Date: Wed,  4 Mar 2020 13:35:13 -0800
Message-Id: <20200304213513.2239-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Kindly add the below i915 changes to linux-firmware.git

The following changes since commit 0148cfefcbf98898ca65bb26d9d7d638b30e211d:

  Merge https://github.com/rjliao-qca/qca-btfw (2020-03-02 08:08:15 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware tgl_huc_7.0.12_dmc_2.06

for you to fetch changes up to fb83402c757034fd9adef083047390b3b2f54cb4:

  i915: Add DMC firmware v2.06 for TGL (2020-03-04 13:19:07 -0800)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      i915: add HuC firmware v7.0.12 for TGL

José Roberto de Souza (1):
      i915: Add DMC firmware v2.06 for TGL

 WHENCE                   |   6 ++++++
 i915/tgl_dmc_ver2_06.bin | Bin 0 -> 18660 bytes
 i915/tgl_huc_7.0.12.bin  | Bin 0 -> 530368 bytes
 3 files changed, 6 insertions(+)
 create mode 100644 i915/tgl_dmc_ver2_06.bin
 create mode 100644 i915/tgl_huc_7.0.12.bin
