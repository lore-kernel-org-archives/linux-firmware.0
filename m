Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A128606A31A
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Oct 2026 11:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I/BdFSVP
Received: by smtp.kernel.org (Postfix)
	id 1515A1F01825; Wed, 28 Oct 2026 11:27:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793186878;
	b=E7tdgBMjbfprBeYcOCtVp/6s2hJKAYN6engcwvNJ5EDzypT1A0JAUmpAAVG/e4gqvFL+
	 veJCx1zt67Fb+5MrKp0h/WBu4ou6Zpu8MF5AQa+UF/hXyy7m0PRkUBraJMFOtXHRtjuEC
	 notExg32k7DaHLkoirEIog13I7RQc8VNrh6syYZGUFYUldNJgrERlblIBMYtpZE3gfhxD
	 8lWYcsfxGNPuH03T28e4kw4CFVP7OsEgzKBUaVOifZNjeCGwksS3Yy5j61ewCtz8zGQju
	 xKGMTeB1ujoIRrCCHx5xE1HkwvG/10syu9GCjefSgewgLYcYYgarY5k2hHCUL4HUBiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793186878;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:List-Id:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=Bjb4yPPFH5UnA5WjilkHiQ0Chuabq/EBQuVt/G37Qkw=;
	b=Lv7vIUXu2TW3wuKgUwGvWx+gSKWaZO2Wd391eUWgqW3G8jtb9//xaOzIy7yrm4p0KumF
	 N88kplAIs6eK9rCoMkIMZZPIBGNKj3hhNGi3WQr7q0s83nQt99gVCu/z9Swb+ar5YVjPS
	 DnsF1rMATzedNvUrm5qKOOOAVSu8nOIeKIIKknZYryEmrRsZjgd03WQwXUKTFWFXuMlrQ
	 nIm2j2UT+8x0rVmEeI/+6HbQPm5I1i57iwyaCwAPyP8y+yQgDH4ztKE2oA5sAPTWY+qq/
	 Gjz6chRDayHpW5i+6ulqwWG0/AFvfp9E7vmp5NYfx/xmTcPHDIIsOkPdpcJTnsHCIVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="I/BdFSVP";
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8981C1F031E8
	for <linux-firmware@kernel.org>; Wed, 28 Oct 2026 11:27:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I/BdFSVP
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8981C1F031E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793186876; x=1824722876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=99tJ65LEGNZKe+pXlYei5b4rjvDNOnhKiAo9xgoctbI=;
  b=I/BdFSVPKhJoc2s79syUatmbG2s4JapafYJ0AoVluW3ZsVU4Fg8XJIgY
   0sqUSih+iNdtPGKzTm8JtXIXh/2lcDvcRbswR2QwacQl8DyVL/sQSVGyO
   6WMvaVneyqlvRd0Sk/MFf+Ym1Mi0Va0ifM841p+ZxSrjBeSUVqQibkmIM
   OrhCRVDJjtJARDl32JJwiNtvIAcAwZTxGIyh1nUjnNNVI99Uzj84Taf9s
   3KWy4XyM+ZyGK/6x1vLL26wlI+sj64dHJFLcKV0Vl04Qejd689DBDJl8G
   HNQGY+iIGk9Pp6VfV+1PxVMw+Oe+Cw0pN+/dOrVkFNyow5jTj465y/UGb
   w==;
X-CSE-ConnectionGUID: F8Q9Yuz3TUa5YSHAU2QxNA==
X-CSE-MsgGUID: MuxRLwEdQ6mKW58hUNGuSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1930317"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1930317"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 04:27:55 -0700
X-CSE-ConnectionGUID: RewhktQCS76su04hxopl8w==
X-CSE-MsgGUID: NuKEcfMrRNeIeOC7H22vNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4853712"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.217])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 04:27:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A175B121BA9;
	Wed, 28 Oct 2026 13:27:58 +0200 (EET)
Date: Wed, 28 Oct 2026 13:27:58 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>
Subject: [GIT PULL] IPU8 firmware and IPU7 firmware cleanup
Message-ID: <auHcPkbXfyfPjynW@kekkonen.localdomain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This set adds Intel IPU8 firmware and sets the driver for the IPU7 and
IPU7.5 firmware to the IPU6, reflecting changes in the kernel, where the
IPU6 driver now supports all IPUs from 6 to 8.

Please pull.


The following changes since commit 9a80a04181713da7f8187ec928c15160137f3262:

  Merge branch 'robot/patch-0-1792477420' into 'main' (2026-10-20 12:07:53 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu6-ipu8-firmware-2

for you to fetch changes up to ef1129224ffbc1f1e5f65db1646d3f0308074a23:

  intel-ipu6: Add firmware binary for IPU8 (2026-10-22 12:41:02 +0300)

----------------------------------------------------------------
Intel IPU7 firmware cleanup and firmware for Intel IPU8

----------------------------------------------------------------
Divyamani Tripathi (1):
      intel-ipu6: Add firmware binary for IPU8

Sakari Ailus (1):
      intel-ipu6: Support IPU 7 and later as well

 WHENCE                |   9 ++++-----
 intel/ipu/ipu8_fw.bin | Bin 0 -> 258048 bytes
 2 files changed, 4 insertions(+), 5 deletions(-)
 create mode 100644 intel/ipu/ipu8_fw.bin

-- 
Sakari Ailus
