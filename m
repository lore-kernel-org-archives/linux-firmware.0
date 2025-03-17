Return-Path: <superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF2EC28B28
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Mar 2025 21:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5F56C4CEEE; Mon, 17 Mar 2025 21:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A9DC4CEE3;
	Mon, 17 Mar 2025 21:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742246186;
	bh=2LcXFgbTsp3I2FI6wcg7aVfXy4nmgMwwtK9Xla+IKSo=;
	h=Date:Subject:List-Id:To:References:From:In-Reply-To:From;
	b=KAf9+uSE1KF1NXmlL/w+tMXrH594x9IXqxdudTART6kt07FWsxh3/MoTLjZJOyOFw
	 DCAVzeZ2YMXdM0D9B35hVyssJDS0EIwWwtEy3JtZUpS2a9gS5O5TMIs7Bkuk+77p3/
	 9cKLdtrxFODFLNfzqsJcmdH180qPNTnKVRFq/dbk5dECR/zTOVaG0d5egvezMa20em
	 rt+GSdM/wWOWbRPeIQ1vLg/h9gUkNAmZyVjFc6OqeQUG9IqhJxFT+bPCI12SRPHPTS
	 OqTmDB6KqP/zglawf0jFDeLYyIVxleeRKarkFJ5JyZgvT37ynclni8M47AQGQ/7en2
	 S+d/qf5/1Vgrw==
Message-ID: <494d9c74-140a-4816-b52c-88a7308267a7@kernel.org>
Date: Mon, 17 Mar 2025 16:16:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] copy-firmware: make script smarter about parameters
List-Id: <linux-firmware.lore.kernel.org>
To: Timur Tabi <ttabi@nvidia.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
 "maxim.cournoyer@gmail.com" <maxim.cournoyer@gmail.com>,
 "jwboyer@kernel.org" <jwboyer@kernel.org>
References: <20250317191606.64181-1-ttabi@nvidia.com>
 <3c09c8a1-21c3-49f6-9e41-e409fd38883a@kernel.org>
 <379244a968c4bb9dd735f9da34c8f22d569edeb2.camel@nvidia.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <379244a968c4bb9dd735f9da34c8f22d569edeb2.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/17/2025 16:14, Timur Tabi wrote:
> On Mon, 2025-03-17 at 15:27 -0500, Mario Limonciello wrote:
>> On 3/17/2025 14:16, Timur Tabi wrote:
>>> Several improvements to copy-firmware.sh that make it more friendly
>>> when passed unknown or not exactly correct command-line parameters.
>>>
>>> 1) Add a usage() function to show the command-line options.
>>> 2) Print that usage on all errors.
>>> 3) Don't fail with a weird error if there's a space between -j and
>>>      the number.
>>> 4) Add support for the -h or --help options.
>>> 5) Ignore any command-line unsupported parameters that start with
>>>      a dash.  This is necessary because otherwise the script will
>>>      assume the option is actually a destination directory, and then
>>>      the "test" command will get confused.  Drawback is that we don't
>>>      support any more destination directories that start with a dash,
>>>      but no one does that.
>>>
>>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>>> ---
>>>    copy-firmware.sh | 18 ++++++++++++++++++
>>>    1 file changed, 18 insertions(+)
>>
>> /Conceptually/ I'm aligned on everything in this patch.
>>
>> A few things.
>>
>> 1) One patch per change please.
> 
> Do you want me to split patch [1/2] into five different patches?  That seems
> excessive.  To me, this patch is already about "one change": improving
> the command line parser.

Maybe 2 or 3 patches?  It seems like it's at least one patch for 
usage/--help and one patch for ignoring parameters with a dash.

> 
>> 2) It appears that the second patch in this this series fails CI.  You
>> should install pre-commit or run `make check` to check before submitting
>> in the future.
>>
>> Here are the details of the failure.
>>
>> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/486
>>
>> BTW - In general it would be better to submit a MR so that you could
>> just force push a fix.
> 
> Ok, I will fix the pipeline failure and submit an MR.
> 

OK.
