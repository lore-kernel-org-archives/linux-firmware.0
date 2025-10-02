Return-Path: <superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D40ECAC5B0
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Oct 2025 13:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 236EFC4CEFB; Thu,  2 Oct 2025 13:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81C7C4CEFA;
	Thu,  2 Oct 2025 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759411789;
	bh=TaBYUu4wtCtQsCWZyIJ52TYcCgbTX1BJqmSZWRP/v50=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=DURAOKgg9huaud4BbdoG4GTmEY4emyl6AFHIHPAmY8XnlZLcoXYVn5rRn8NtoIdgx
	 8dY44Wg10F3kHr/wWoiQwgUHbww6fdCJPX8adxU4+Kf+7LCOuje8CZo9SuMFYAY5Vj
	 tkWm7ak2TK2P1MUjy32TlGAy0MvdDev0xqqVsg93VpzdU0ujXSLTv023bFyPcR5fWq
	 7BhK7RJiHmvVy6F5uj+tZ588mYRyaTxEotE232kW+GoA/VX7Tcb9ubNQAVOO4eTeLQ
	 YQzahwptCBr2nI9nSmaWDkESV4WhOy6cFuA/wijYUvfrkKqEktT7NXueDVplrN3qTQ
	 nDR+5Y58xlIFw==
Message-ID: <e7f5f6ea-ebbd-4454-9adb-2df9e3e7630d@kernel.org>
Date: Thu, 2 Oct 2025 08:29:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: add video firmware for Kaanapali
To: Josh Boyer <jwboyer@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 linux-firmware@kernel.org, Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <bbd5acf0-e985-1f55-052d-8d3ecf0aa910@oss.qualcomm.com>
 <e2wyi33p42lsq5f6ihuw54k5q6czbt2en5ocijswypjgw52dbg@wz6x2fojxvoa>
 <CA+5PVA6gN4M7gchGXPoswHmv7h0NiZ_n063r1GOGGVAujdDbKQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CA+5PVA6gN4M7gchGXPoswHmv7h0NiZ_n063r1GOGGVAujdDbKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/2/25 7:19 AM, Josh Boyer wrote:
> On Wed, Oct 1, 2025 at 8:48 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Wed, Oct 01, 2025 at 06:36:11PM +0530, Dikshita Agarwal wrote:
>>> Hi,
>>>
>>> The following changes since commit ed924f6db3c973f941fd6c6317c0d52664e83e5a:
>>>
>>>    Merge branch 'robot/pr-0-1759253351' into 'main' (2025-09-30 17:36:46 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>> video-fw-kaanapali
>>>
>>> for you to fetch changes up to 7c2d4d41e96fdddfa360c0740e8a8ee9b5efb572:
>>>
>>>    qcom: vpu: add video firmware for Kaanapali (2025-10-01 18:32:02 +0530)
>>
>> +Link: qcom/vpu/vpu40_p2.mbn -> vpu40_p2_s7.mbn
>>
>> Can we please drop that link? FWIW the driver for that platform is not
>> yet merged.
> 
> This got merged yesterday.
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/717
> 
> josh

Please send up a pull request to drop the link if it's not correct.
