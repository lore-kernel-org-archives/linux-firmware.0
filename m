Return-Path: <SRS0=tXJ+=2T=intel.com=daniele.ceraolospurio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2471AC4332F
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Oct 2022 15:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E05F3C433D6; Tue, 18 Oct 2022 15:22:50 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C166C433C1;
	Tue, 18 Oct 2022 15:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C166C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666106569; x=1697642569;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mfj6y1zJxsesul+cRLpD8qGCSovxPAibwGwx8EhLNW0=;
  b=f10u++SCj2wW61iNxrnUqNCC+6Bm2ZSD/z8azJpy7Hwqo21UfLC2BA5m
   FBmWYOH7HEpe6FJpMdD4ItKDC2ZjDbyHh7Ihl0GHGELTYVlwleIjNiyXK
   9L/nWh0F6fBSoBZexJRIPVJ2BV3niEXb+M46yuQl2EX0Dj3uHlJwivsVO
   XolOKeJQ6m9/Al3FJHwL1HGBncOE6SjdCVVjDuUKKI0p1oxYFwncu8DpR
   eNF0ZcQaFHHf3zP/tfT142vL48tZDcwj5g+PIIp8wZ9ByvZQRAKlZAEXN
   PNOkBm7BZKG9CunFdDAAeVSc8UBT89/VM6QJRIOx4hde4QxZv81Pfhk4U
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="306123282"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="306123282"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 08:22:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="659843953"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="659843953"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 08:22:37 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	intel-gfx@lists.freedesktop.org,
	kyle@kernel.org,
	ben@decadent.org.uk
Subject: PR for HuC 7.10.3
Date: Tue, 18 Oct 2022 08:24:46 -0700
Message-Id: <20221018152446.1927225-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:

  cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware dg2_huc_7.10.3_pr

for you to fetch changes up to 8f86b5ab3e051170ea240fc409d457e16e24bc21:

  i915: Add HuC 7.10.3 for DG2 (2022-10-18 08:18:19 -0700)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      i915: Add HuC 7.10.3 for DG2

 WHENCE               |   3 +++
 i915/dg2_huc_gsc.bin | Bin 0 -> 622592 bytes
 2 files changed, 3 insertions(+)
 create mode 100755 i915/dg2_huc_gsc.bin
