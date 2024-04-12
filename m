Return-Path: <SRS0=iwHl=LR=linux.intel.com=bingbu.cao@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266BBC4345F
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Apr 2024 06:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3ED6C2BD10; Fri, 12 Apr 2024 06:07:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A82DBC2BBFC
	for <linux-firmware@kernel.org>; Fri, 12 Apr 2024 06:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A82DBC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712902037; x=1744438037;
  h=subject:to:references:from:cc:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=fsdflMi3M4UdvsCMwrnHoYi/q34oAR3BPBxW5VS6jeM=;
  b=Jh1T2ROO85nd51o8aYPyNsFxQqHzwIG43RmzpGMMt2OohBthEWCemiji
   1Ac8wQUSkinp7XpcWDzOIrxfIGnZb+cKA/1Y2TE0STeiV4JF6tebjtsSS
   hmWsMWn2FJawSGAniN3dLFp5oh86Mm442HEnJkrqcZj0zwL36lRbhGONH
   hudwVWV9m88PaDLnl4bq9UOkKMGI3E4sBxNO97R47BxQL1XffZHljcscM
   UHRsI7FxvvZMwx3UKVP83XPA2Ugiv5B+XKvWMz/cob3IzE5DVJPXA4Tlv
   iT1rWYcTOfoflO4n+6sdjnnG8eI55MdafzUoWnshDSKrPEs3XqXlykLQo
   Q==;
X-CSE-ConnectionGUID: PxhGVKpjQl2Ohm7I06yFfg==
X-CSE-MsgGUID: twtm8F8QR4mc+odhq5kUIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8204090"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8204090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 23:07:16 -0700
X-CSE-ConnectionGUID: JBioon0tQAmrwB3ctPmxnQ==
X-CSE-MsgGUID: 6TrdJYaLRcGpsXjHL/hs7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="21721565"
Received: from unknown (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa008.jf.intel.com with ESMTP; 11 Apr 2024 23:07:15 -0700
Subject: Re: [GIT PULL v2] Intel Image Processing Unit 6 firmware
List-Id: <linux-firmware.lore.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, linux-firmware@kernel.org,
 juerg.haefliger@canonical.com
References: <Zcx8i978Bx7QRSNJ@kekkonen.localdomain>
 <484e0f05-3332-4b97-89b7-74406677ed0f@redhat.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <279f3b2b-701c-333c-e699-74225b4858df@linux.intel.com>
Date: Fri, 12 Apr 2024 14:08:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <484e0f05-3332-4b97-89b7-74406677ed0f@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hans And Juerg,

On 2/14/24 4:51 PM, Hans de Goede wrote:
> Hi,
> 
> On 2/14/24 09:40, Sakari Ailus wrote:
>> Hi folks,
>>
>> This PR moves Intel IPU firmware files under ipu subdirectory for easier
>> packaging. WHENCE is updated for IPU3 ImgU firmware links.
>>
>> since v1:
>>
>> - Rebase on the Gitlab repository main branch. The one in git.kernel.org
>>   was not up to date. :-(
>>
>> Please pull.
> 
> Just a quick note for the linux-firmware maintainers, no compat
> symlinks are added for the ipu6 firmwares since the ipu6 driver
> is not upstream yet. So we can just make the driver use the new
> firmware paths before merging it upstream.

We are planning to submit a change to add the compat symlinks for
IPU6 firmwares to support the downstream driver.

Is it fine for you?

> 
> Regards,
> 
> Hans
> 
> 
> 
>>
>>
>> The following changes since commit 8acf0a98dbe1606cf696b0ee61bcce7eed5db80f:
>>
>>   Merge branch 'robot/patch-10-1707787255' into 'main' (2024-02-13 01:31:56 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu6-2024-02-14-2
>>
>> for you to fetch changes up to 08ab13d5d079c90dc21145710a2cc42326562aee:
>>
>>   Intel IPU3 ImgU: Move firmware file under intel/ipu (2024-02-14 10:37:57 +0200)
>>
>> ----------------------------------------------------------------
>> Move IPU firmware under ipu
>>
>> ----------------------------------------------------------------
>> Sakari Ailus (2):
>>       Intel IPU6: Move firmware binaries under ipu/
>>       Intel IPU3 ImgU: Move firmware file under intel/ipu
>>
>>  WHENCE                                                   |  15 ++++++++-------
>>  intel/{ => ipu}/ipu6_fw.bin                              | Bin
>>  intel/{ => ipu}/ipu6ep_fw.bin                            | Bin
>>  intel/{ => ipu}/ipu6epadln_fw.bin                        | Bin
>>  intel/{ => ipu}/ipu6epmtl_fw.bin                         | Bin
>>  intel/{ => ipu}/ipu6se_fw.bin                            | Bin
>>  .../irci_irci_ecr-master_20161208_0213_20170112_1500.bin | Bin
>>  7 files changed, 8 insertions(+), 7 deletions(-)
>>  rename intel/{ => ipu}/ipu6_fw.bin (100%)
>>  rename intel/{ => ipu}/ipu6ep_fw.bin (100%)
>>  rename intel/{ => ipu}/ipu6epadln_fw.bin (100%)
>>  rename intel/{ => ipu}/ipu6epmtl_fw.bin (100%)
>>  rename intel/{ => ipu}/ipu6se_fw.bin (100%)
>>  rename intel/{ => ipu}/irci_irci_ecr-master_20161208_0213_20170112_1500.bin (100%)
>>
> 

-- 
Best regards,
Bingbu Cao
