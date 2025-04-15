Return-Path: <SRS0=3DBT=XB=linux.intel.com=amadeuszx.slawinski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2684AC369B4
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Apr 2025 12:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6EE6C4CEEB; Tue, 15 Apr 2025 12:39:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9D9FC4CEDD
	for <linux-firmware@kernel.org>; Tue, 15 Apr 2025 12:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9D9FC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744720788; x=1776256788;
  h=message-id:date:mime-version:from:subject:cc:to:
   content-transfer-encoding;
  bh=1k8lnBtRAl9rNIXF+Dwe7ONDlTFfL0QycNKNurftNfk=;
  b=A+bmn3Mh22ADWg0r5sdOiBjs0EvoynhQGPd5Xk3YRPfj/ot6rjiCcFVR
   KdJ5iA745jsXPVJtyNYRCeJJtTuzshkZGkpW+9XpP61CHgY3K6pKKtYDY
   iwJmITzset3aKKM5C2g78vKDB80hJg6GDSwhVA/7H3NAPYrP7QhvuTbcQ
   r8L5gnYV3SfnOHj9ujeG9iPw0TCFbeD4UNd+OcalmxZ7GmC3DfzeIl/7+
   F0Wc7QD5OmUnUAXrhhES3GlaYZMrB+WMKjDgf4TvqdnO+my/OJ06ebaZ/
   EWhJaiwgUCz2R2PCO4bklF1h6PUYPXkcNqN6w/LoOaaJakdAPwofDaEj6
   g==;
X-CSE-ConnectionGUID: QBuY3yR6Q1mFvug7EnKtZw==
X-CSE-MsgGUID: IXGT+uMCT023NsXxQmGX9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="68718206"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="68718206"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:39:47 -0700
X-CSE-ConnectionGUID: ZyfVEz8eSzyQHZhJP9DFmw==
X-CSE-MsgGUID: UKqfSHolQUyaFIxOMNxfVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="153302506"
Received: from sbockowx-mobl2.ger.corp.intel.com (HELO [10.94.8.84]) ([10.94.8.84])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:39:45 -0700
Message-ID: <3a95047a-36f3-4819-8d8e-4278f70d33bf@linux.intel.com>
Date: Tue, 15 Apr 2025 14:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: intel: avs: Update topology files
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jaroslav Kysela <perex@perex.cz>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

This patchset updates topology files for avs driver to align with latest 
changes in topology repository [1].

Overall there were minor cleanups with incorrect ordering of XML nodes 
and added new field to assign FE DAI IDs. The FE DAI ID assignment being 
more important change, as while for current users there should be no 
noticeable difference, future kernel versions require FE DAI IDs to be 
set correctly - see [2] for full patchset and [3] for commit. Do note 
that almost all topologies available in linux-firmware tree expose only 
one FE, and already had its ID set to 0 automatically. The only one that 
really needs to be updated is HDMI topology which exposes 3 FEs and 
needs them numbered correctly, otherwise future kernel versions will 
fail to load it.

[1]: https://github.com/thesofproject/avs-topology-xml
[2]: 
https://lore.kernel.org/linux-sound/20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com/
[3]: 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/sound/soc/intel/avs?id=e3dc0351d7a0fdcde18ed1719c9149b1a656e7ec

---

The following changes since commit 6a006cef10cebfaa282100a81cb45ad3a9212721:

   Merge branch 'intel/guc_70441' into 'main' (2025-04-10 20:59:06 +0000)

are available in the Git repository at:

   https://github.com/amadeuszslawinski-intel/linux-firmware.git 
2025.04.15_topology_update

for you to fetch changes up to 75a26a64e907139c2979852003fe88cdb62c103c:

   intel: avs: Update topology file for I2S Analog Devices 4567 
(2025-04-15 13:22:03 +0200)

----------------------------------------------------------------
Amadeusz Sławiński (15):
       intel: avs: Update topology file for I2S Dialog 7219
       intel: avs: Update topology file for Digital Microphone Array
       intel: avs: Update topology file for HDMI codecs
       intel: avs: Update topology file for HDAudio codecs
       intel: avs: Update topology file for I2S Maxim 98357a
       intel: avs: Update topology file for I2S Maxim 98373
       intel: avs: Update topology file for I2S Maxim 98927
       intel: avs: Update topology file for I2S Nuvoton 8825
       intel: avs: Update topology file for I2S Realtek 274
       intel: avs: Update topology file for I2S Realtek 286
       intel: avs: Update topology file for I2S Realtek 298
       intel: avs: Update topology file for I2S Realtek 5514
       intel: avs: Update topology file for I2S Realtek 5640
       intel: avs: Update topology file for I2S Realtek 5663
       intel: avs: Update topology file for I2S Analog Devices 4567

  intel/avs/da7219-tplg.bin           | Bin 4576 -> 4576 bytes
  intel/avs/dmic-tplg.bin             | Bin 9064 -> 9064 bytes
  intel/avs/hda-808628xx-3ep-tplg.bin | Bin 7264 -> 7264 bytes
  intel/avs/hda-generic-1ep-tplg.bin  | Bin 7372 -> 7372 bytes
  intel/avs/max98357a-tplg.bin        | Bin 3228 -> 3228 bytes
  intel/avs/max98373-tplg.bin         | Bin 3748 -> 3748 bytes
  intel/avs/max98927-tplg.bin         | Bin 3748 -> 3748 bytes
  intel/avs/nau8825-tplg.bin          | Bin 4576 -> 4576 bytes
  intel/avs/rt274-tplg.bin            | Bin 4976 -> 4976 bytes
  intel/avs/rt286-tplg.bin            | Bin 4976 -> 4976 bytes
  intel/avs/rt298-tplg.bin            | Bin 4976 -> 4976 bytes
  intel/avs/rt5514-tplg.bin           | Bin 3144 -> 3144 bytes
  intel/avs/rt5640-tplg.bin           | Bin 5652 -> 5652 bytes
  intel/avs/rt5663-tplg.bin           | Bin 4576 -> 4576 bytes
  intel/avs/ssm4567-tplg.bin          | Bin 3740 -> 3740 bytes
  15 files changed, 0 insertions(+), 0 deletions(-)
