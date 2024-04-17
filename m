Return-Path: <SRS0=tm4Z=LW=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4B9C001CC
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Apr 2024 13:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B79DC3277B; Wed, 17 Apr 2024 13:58:22 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6ED96C116B1
	for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 13:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6ED96C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c70964374bso1941089b6e.1
        for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713362300; x=1713967100; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pg5WNLYsB3WinifJAqg0RF5waYmPebStvdmGjyYhRTo=;
        b=HTb4ZkYX24qzsErhHsBCrZ8PUEQjZHMEcUXJmQmY65G2sQwdnsz8YJGuB0Yj4+ZNTc
         1+sCSG7jqCwXtvYAk1HDrePRE9GzxjzP+vXwMVyo4nqUSDsIwOpF94ZLV/NLKcmowKoP
         wi1jjiSuSebD+dGI076ghXaYMGNfegWPH2ws6GqYmEjvhA25CiWSP+yUhngDFyulCIbV
         5OSAyLFRvoEYciGQKKabVrJMYL1j7r4L3NAXrg63o6ZYQUcgm5iPtQyOQ+PxrFMnkVvP
         ATR9OMNAsF1bP0rdcu+qnXpX4fsDr+qI29PorNqheJ3ysDrvoSiuu+BrL3mbfLe0L6cn
         hXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713362300; x=1713967100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pg5WNLYsB3WinifJAqg0RF5waYmPebStvdmGjyYhRTo=;
        b=YK1n2BSMWzKZKASjxiUxefdD//9Mia4TtlnyagZJRkQhiFQtsw3+Vbr54zEgCFIihr
         jl73TbGvSTp+uIlyDuW9fvjjKvo5m5bwnUye1ckod4V0f4I4kWbKS5cF1/Q6lMK0/fsD
         w5pkVmFtlZ5WFBCbDVlzi6mVklhttjYLxkqkEYwFXN0BTTOQ3e3QJVgWX2f8+WGrA7kU
         rqng7QqtXPqvu/tNkuXMu5waufEUDvkfNvf3yjZx2Lr14ohUJlZIUPqEPG1Zz/AfqLSK
         Ser3uA0gB+YPIZafxKgSympVtvF+jA83EYhfGvXWtrDm8Ykokbul/qjKSfc5U3PpQ+D5
         8HcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUi3IOnYyGmPrQk84e5C6gP8PE2sJTBj3UJCYRMTjBRBbdoKMTwQTGzHzIZk92XF1+BoTsCxnHE6a6SPC2zV/7GFOQownGoy8A
X-Gm-Message-State: AOJu0YwQiJw2X7PoS1yWlmRCJY1iYjCEW0/+USvZcDcieI89f4toQZCT
	RUoyS8EE8Dzm1gcpCPMBDsjA643Vtn+7XIgv+KQJ6gttmrBk71Mg
X-Google-Smtp-Source: AGHT+IFBHseeoNdtd8Hh0AsNxb8X5LNp1lJN2YR/81gCsLeyiTY2i8vgV8EFmsvP31gica8t5MpQlg==
X-Received: by 2002:a05:6808:2228:b0:3c6:1566:af58 with SMTP id bd40-20020a056808222800b003c61566af58mr20204814oib.20.1713362300387;
        Wed, 17 Apr 2024 06:58:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:70:f702:9c77:c230:a0ba:a1a1? ([2600:1700:70:f702:9c77:c230:a0ba:a1a1])
        by smtp.gmail.com with ESMTPSA id b1-20020a056808010100b003c5f54d014dsm2379929oie.51.2024.04.17.06.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 06:58:20 -0700 (PDT)
Message-ID: <b7876373-08d9-4948-a49a-e79f42f3abcb@gmail.com>
Date: Wed, 17 Apr 2024 08:58:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: putting future iwlwifi firmware into intel/ ?
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, miriam.rachel.korenblit@intel.com
References: <fec30176f437d565d4c1dfc4944373f117d75a64.camel@sipsolutions.net>
 <9aa64d50-cb4d-4118-bc27-86c23410ff8b@gmail.com>
 <f65765b29ea7503fbbaa5e047c95a82de6fc2083.camel@sipsolutions.net>
 <b0e70576-a53f-4d03-a503-ddf1f98bbe9d@gmail.com>
 <b712f48a3e35221b7ff7f4c8cb495b5159bdd367.camel@sipsolutions.net>
From: Mario Limonciello <superm1@gmail.com>
In-Reply-To: <b712f48a3e35221b7ff7f4c8cb495b5159bdd367.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/17/24 07:45, Johannes Berg wrote:
> On Wed, 2024-04-17 at 07:42 -0500, Mario Limonciello wrote:
>>
>> On 4/17/24 07:39, Johannes Berg wrote:
>>> On Wed, 2024-04-17 at 07:31 -0500, Mario Limonciello wrote:
>>>>
>>>> On 4/17/24 06:18, Johannes Berg wrote:
>>>>> Hi,
>>>>>
>>>>> Since I was just looking at some firmware related thing (files for the
>>>>> hardware that might be shared between Intel BT and WiFi), I noticed that
>>>>> just over 30% of the files/dirs in the top-level firmware tree are
>>>>> iwlwifi-* files.
>>>>>
>>>>> While we can't move the files that older drivers might consume, we could
>>>>> e.g. change the driver to look up future versions/future hardware under
>>>>> intel/ instead? Would that be worth doing?
>>>>>
>>>>> johannes
>>>>>
>>>>
>>>> How about moving them all now and then creating compat symlinks for
>>>> older kernels at linux-firmware 'make install' time?
>>>>
>>>
>>> Didn't realize there even was a 'make install' time :-)
>>>
>>> But then I guess it'd be simpler in the driver since we could just
>>> unconditionally add the intel/ prefix to the request_firmware call.
>>>
>>> johannes
>>
>> Do both.  All the stuff already there add the compat symlinks in linux
>> firmware so that current and older kernels work with older hardware.
>>
>> Any "new firmware" only put in the new path, and add commits to the
>> kernel to look for "all" firmware in the new path.
>>
>> Should hopefully cover everything without too much pain then.
> 
> Yeah, I guess. Though not actually sure, do we need to support new
> kernel + old firmware install?
> 
> johannes

I'd say you should.  Here's a few examples of why:

1) Kernel documentation says so.  See 
https://github.com/torvalds/linux/blob/master/Documentation/driver-api/firmware/firmware-usage-guidelines.rst


2) Let's say you change this in latest linux-firmware and kernel 6.10 
but don't do a symlink.  A user upgrades to 6.10 and latest 
linux-firmware but finds a regression.  They're asked to come bisect it, 
but their kernel 6.9 can no longer work with wifi due to "missing" 
firmware.  The bisect gets WAY more painful.

3) Some distros do "HWE" kernels (for example Ubuntu).  This means they 
could do a HWE-6.10 or HWE-6.11 but expect that the exact same 
linux-firmware package works on all of them.  They could uprev their 
linux-firmware to the one matching this change but then their "LTS" 
kernel stops working.

So yes; do the symlinks when you move directories.  It's one line in 
WHENCE per file that you want a symlink.
