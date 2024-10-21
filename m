Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4E7D17122
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Oct 2024 18:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6B3FC4AF09; Mon, 21 Oct 2024 18:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A27EC4CEC3;
	Mon, 21 Oct 2024 18:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729534923;
	bh=9pZU9zAoGZt6NGrlu4fYgkLxteWoyzNrqWQutED9lPs=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=T64i2lxTqV5l+RWPHnJvW43X4ADrpOdvNHCitFLZDyBkVWrM3hgNOfdg5Dkl9FK8X
	 ARs+1wzp2I1+5KfJf7WBaTInoUeiMXrzu2FRko/lPRd0dVwMkjUmiOnJIYzs1SlnyA
	 Wc8GjPrsZMTEOoaKM/nAfB8vhbqiA2bS1DG6yUjxYKxkwyKX6Sdp06T/Zvl7uxrVP1
	 6pWJLMtiZzMOEcktEY5ywWgt7XB0WzVra1PxkPhkpRrVES66ek674o8vpr5MiqX6xc
	 MxHUKrPjaIQuYhf7lyb7Kpx74B4AnyrpLCuTVVEmd1tSSr735lvXRADkS3SRxBwLZU
	 QEVWjZIKUMeOQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,  Jeff Johnson
 <jjohnson@kernel.org>,  Bjorn Andersson <andersson@kernel.org>,  Konrad
 Dybcio <konradybcio@kernel.org>,  <linux-firmware@kernel.org>,
  <ath11k@lists.infradead.org>,  <linux-arm-msm@vger.kernel.org>
Subject: Re: [RFC PULL] ath11k: move WCN6750 firmware to the device-specific
 subdir
References: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
	<379780f5-bf30-4452-aa9e-f1b6915b6389@quicinc.com>
Date: Mon, 21 Oct 2024 21:22:00 +0300
In-Reply-To: <379780f5-bf30-4452-aa9e-f1b6915b6389@quicinc.com> (Jeff
	Johnson's message of "Fri, 18 Oct 2024 15:16:02 -0700")
Message-ID: <87plntnwon.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 10/10/2024 11:16 PM, Dmitry Baryshkov wrote:
>
>> The firmware under ath11k/WCN6750 can not be utilized on other devices using
>> WCN6750 to provide WiFi (e.g. on the Qualcomm RB3 gen2 board).  This is an
>> attempt to propose a solution by moving the file into device-specifig subdir.
>> Other platforms can place firmware files in other subdirs, depending on the
>> SoC.
>> 
>> Note, while performing the move I also propose squashing the firmware
>> file.

I assume you mean squashing the files to wpss.mbn?

>> This is the practice recommended by the msm platform maintainers for the DSP
>> firmware (not to mention that it also saves us from the extra symlinks). If
>> Kalle, ath11k maintainer, objects, I will keep the firmware in the split form.
>> 
>> For now this is an RFC in order to gather opinion form respective platform and
>> driver maintainers.
>> 
>> ----------------------------------------------------------------
>> 
>> The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:
>> 
>>   Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)
>> 
>> are available in the Git repository at:
>> 
>>   https://gitlab.com/lumag/linux-firmware wcn6750-device-specific
>> 
>> for you to fetch changes up to abe8c109a2b4c422b627335d124473734c8790d8:
>> 
>>   ath11k: move WCN6750 firmware to the device-specific subdir (2024-10-10 22:26:20 +0300)
>> 
>> ----------------------------------------------------------------
>> Dmitry Baryshkov (1):
>>       ath11k: move WCN6750 firmware to the device-specific subdir
>> 
>>  WHENCE                                             |  12 ++----------
>>  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
>>  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
>>  11 files changed, 2 insertions(+), 10 deletions(-)
>>  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)

So this follow basically the same directory hierarchy as you Dmitry
implemented for ath10k in commit 5abf259772df ("wifi: ath10k: support
board-specific firmware overrides"), right? Just making sure we are on
the same page. I think ath10k/ath11k/ath12k drivers should follow the
same design as much as possible.

>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt
>
> I'm waiting for Kalle to respond, but at a minimum I suspect our internal
> firmware tooling would be impacted by this change.

Yeah, most likely we need to update our tools. But we would have to do
it anyway so I'm not concerned about that.

> Kalle, do you have concerns or suggestions on how to handle this issue?

Looks good to me.

Dmitry, if you have the time please take a look at this:

https://patchwork.kernel.org/project/linux-wireless/cover/20241001033053.2084360-1-quic_miaoqing@quicinc.com/

Based on a quick look it seems to do things differently and not really a
fan of that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
