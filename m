Return-Path: <SRS0=2SVH=FE=intel.com=john.c.harrison@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB40C63777
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Nov 2020 18:49:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0D6C92074A; Mon, 30 Nov 2020 18:49:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0DE42073C;
	Mon, 30 Nov 2020 18:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0DE42073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=john.c.harrison@intel.com
IronPort-SDR: WBRXm+xgIlmmQJxNbTx1q1uVOLq+P0DCrmiX2enkTLPfugChM4+Zmsxtx0ndU+WX+yXIIJLEiY
 w/mjACRg7/Lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="152523124"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="152523124"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 10:49:57 -0800
IronPort-SDR: FR9J5XZ5jmoNvg/DfiW0e4g1W3GQPtW5kcS6xh4hoC5+mjJtPVCoqi8Z4IswT2qpn6hlAjJ2CB
 mwWSOVEdydrA==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="549218094"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.212.134.54]) ([10.212.134.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 10:49:57 -0800
Subject: Re: linux firmware PR for i915 GuC v49.0.1
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>,
 Kyle McMartin <kyle@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20201125014214.3772152-1-John.C.Harrison@Intel.com>
 <CA+5PVA5n3C3fzTrLWLAmjqdjnVzxN2ae+fZDRS5Qbqj3UG+iKw@mail.gmail.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <c0aa4cb2-1374-b90f-e7cc-88bfb17ce04b@intel.com>
Date: Mon, 30 Nov 2020 10:49:56 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CA+5PVA5n3C3fzTrLWLAmjqdjnVzxN2ae+fZDRS5Qbqj3UG+iKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

On 11/30/2020 06:26, Josh Boyer wrote:
> On Tue, Nov 24, 2020 at 8:42 PM <John.C.Harrison@intel.com> wrote:
>> Hi Josh, Kyle, Ben,
>>
>> Kindly add the below i915 changes to linux-firmware.git:
>>
>>
>> The following changes since commit b362fd4cb8963ad75517dbcf424974f65a29a60e:
>>
>>    Mellanox: Add new mlxsw_spectrum firmware xx.2008.2018 (2020-11-24 09:55:03 -0500)
>>
>> are available in the Git repository at:
>>
>>    git://anongit.freedesktop.org/drm/drm-firmware FDO/guc_v49
> This doesn't exist.  Git complains with:
>
> fatal: couldn't find remote ref FDO/guc_v49
>
> Did you just mean guc_v49?
>
> josh
I guess. The FDO part is the name of the remote repo in my local .git. 
When I tried to create the pull request without that part it gave me an 
error.

Do you need me to resend the email with the 'FDO/' part dropped?

Thanks,
John.



>
>> for you to fetch changes up to c487f7dadcd21116613441ed355b764003b3f57b:
>>
>>    i915: Add GuC firmware v49.0.1 for all platforms (2020-11-24 17:04:17 -0800)
>>
>> ----------------------------------------------------------------
>> John Harrison (2):
>>        i915: Remove duplicate KBL DMC entry
>>        i915: Add GuC firmware v49.0.1 for all platforms
>>
>>   WHENCE                  |  25 ++++++++++++++++++++++++-
>>   i915/bxt_guc_49.0.1.bin | Bin 0 -> 196224 bytes
>>   i915/cml_guc_49.0.1.bin | Bin 0 -> 197184 bytes
>>   i915/ehl_guc_49.0.1.bin | Bin 0 -> 324160 bytes
>>   i915/glk_guc_49.0.1.bin | Bin 0 -> 196672 bytes
>>   i915/icl_guc_49.0.1.bin | Bin 0 -> 324160 bytes
>>   i915/kbl_guc_49.0.1.bin | Bin 0 -> 197184 bytes
>>   i915/skl_guc_49.0.1.bin | Bin 0 -> 196288 bytes
>>   i915/tgl_guc_49.0.1.bin | Bin 0 -> 321792 bytes
>>   9 files changed, 24 insertions(+), 1 deletion(-)
>>   create mode 100644 i915/bxt_guc_49.0.1.bin
>>   create mode 100644 i915/cml_guc_49.0.1.bin
>>   create mode 100644 i915/ehl_guc_49.0.1.bin
>>   create mode 100644 i915/glk_guc_49.0.1.bin
>>   create mode 100644 i915/icl_guc_49.0.1.bin
>>   create mode 100644 i915/kbl_guc_49.0.1.bin
>>   create mode 100644 i915/skl_guc_49.0.1.bin
>>   create mode 100644 i915/tgl_guc_49.0.1.bin

