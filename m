Return-Path: <SRS0=8klg=X4=linux.intel.com=amadeuszx.slawinski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E33C3ABCD
	for <linux-firmware@archiver.kernel.org>; Mon, 12 May 2025 13:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56AABC4CEEF; Mon, 12 May 2025 13:13:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C7D0C4CEED
	for <linux-firmware@kernel.org>; Mon, 12 May 2025 13:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C7D0C4CEED
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747055590; x=1778591590;
  h=message-id:date:mime-version:to:cc:from:subject:
   content-transfer-encoding;
  bh=MesQFtYn2OgOG3Hm3rp4JJkbWFz5FSqcx4/9gztpFK4=;
  b=BJHBshwW3TA+gHHdqXpSi9P//Br0BMrA7iGUqPHj/KGF4RmBeKdM5zTn
   gK+0uuP+MTIduOBLmYfQVFOSo/Lkk/ivvVXxZ/30MKaeNzAE8N00AI/Mm
   /nACTIJj0DrJ1qQWI/3g6isXLFRlu3eHbAWRXYleDgHGBp2RylggWeDje
   le7gNiKX0HeA5PIPtG6P0LVT0AJXs4N9cbIVmfxqZBamSkOxNQuDDoMtr
   46CNvHNOVZGofEdkJCED6VRAtf9NwAluBYiY8+nILsRFIw16xg0Q8CMy2
   GO81auzbuUTrMKaGBhF4USwxWpZmDOoMnFgtwl4wv6EsHLXETi1mbFCQP
   Q==;
X-CSE-ConnectionGUID: e8xiODuRQIiyRLSoDCz8Iw==
X-CSE-MsgGUID: otuHGvpQT+mfDGL2vQXv5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60253842"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="60253842"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 06:13:10 -0700
X-CSE-ConnectionGUID: kYuxIj0hQVq3MI43gUXONA==
X-CSE-MsgGUID: PzuKG2+PRoKs7TAwHuFdrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="137874193"
Received: from pcalusx-mobl1.ger.corp.intel.com (HELO [10.94.0.51]) ([10.94.0.51])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 06:13:08 -0700
Message-ID: <f8876a08-c0e4-4ced-bc63-7939df61f6a3@linux.intel.com>
Date: Mon, 12 May 2025 15:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: intel: avs: Update DMIC topology file
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The following changes since commit a1d732703915a35a4c726a82e18fe436e26b74a7:

   Merge branch 'amd-staging' into 'main' (2025-05-09 14:49:08 +0000)

are available in the Git repository at:

   https://github.com/amadeuszslawinski-intel/linux-firmware.git 
2025.05.12_topology_update

for you to fetch changes up to a32d5cc1a182b83f26a63adfae78853db2e0d151:

   intel: avs: Update topology file for Digital Microphone Array 
(2025-05-12 15:12:13 +0200)

----------------------------------------------------------------
Amadeusz Sławiński (1):
       intel: avs: Update topology file for Digital Microphone Array

  intel/avs/dmic-tplg.bin | Bin 9064 -> 9064 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)
