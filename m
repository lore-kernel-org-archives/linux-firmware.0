Return-Path: <SRS0=KwFo=YF=intel.com=John.C.Harrison@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F74C00144
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Aug 2022 18:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 999A7C433D6; Mon,  1 Aug 2022 18:02:32 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D47BEC433D7;
	Mon,  1 Aug 2022 18:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D47BEC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659376950; x=1690912950;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rMJTjhWhjcwMpGiWJTcqI2BLuTxW2Bf3ao0fLxFtcD0=;
  b=ChoU9Of5hfnXOhTVVYxA/cYNDBC8HSftIPdVVn+KRR0AHCtxmgjPPPjc
   8kNXadpnOr0IKKaWjV11xngNKE0wgNoETDWwFtDqj4dE+Wxu3DM29p+XY
   Z+YXi7Lfx+v3IyIh+9oC8SOOOuaT6bmgv/WvmJOU+mzyU8WijdqqrG2tV
   zqVpHpM5lvGst7q5EDPl6XrmwGe8EVv+1oIiTNtCEmLaGNWazPMLMVK6K
   iDzPzrG8/rx+L4c2I5gjbVdmM6gfW/H+jR2Obn+jgprQUBxB6MsahmThi
   hZNbkwlFwR9bDvAKu/rZszFU1NfkzAlSVxuT4vc4FWReXr8q3kh70qjLo
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="289223660"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="289223660"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 11:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="634984824"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
  by orsmga001.jf.intel.com with ESMTP; 01 Aug 2022 11:02:29 -0700
From: John.C.Harrison@Intel.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	kyle@kernel.org,
	ben@decadent.org.uk,
	intel-gfx@lists.freedesktop.org
Subject: PR for new GuC v70.4.1 for DG2
Date: Mon,  1 Aug 2022 11:02:29 -0700
Message-Id: <20220801180229.3824606-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:

  amdgpu partially revert "amdgpu: update beige goby to release 22.20" (2022-07-25 14:16:04 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware dg2_guc_v70.4.1

for you to fetch changes up to a4235e0aa4d4753119fd81f582eef84addf3f4a1:

  i915: Add GuC v70.4.1 for DG2 (2022-07-27 18:03:49 -0700)

----------------------------------------------------------------
John Harrison (1):
      i915: Add GuC v70.4.1 for DG2

 WHENCE                  |   3 +++
 i915/dg2_guc_70.4.1.bin | Bin 0 -> 369600 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 i915/dg2_guc_70.4.1.bin
