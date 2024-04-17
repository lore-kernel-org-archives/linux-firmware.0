Return-Path: <SRS0=tm4Z=LW=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCAEC04FFE
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Apr 2024 12:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 670DFC2BD10; Wed, 17 Apr 2024 12:42:33 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DB57C072AA
	for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 12:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9DB57C072AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6eb86aeeb2cso1640315a34.3
        for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 05:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713357751; x=1713962551; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3oveVIqvfXpANC6X0yZp4EOyb3G4ovV7gjUYkogoPps=;
        b=mmrz7/rY94m5a4/SvqixHkS5r20YYZTY99TV0jlNa8o27z4m4U6bxdCqnTa/XJCT0R
         5ONdjwoyn8QmpfrSB/g3l6p5oRIzf4wIyKAs5Tt2iPyhfyxLpnIrtc2Oohe6Fv/Si9rd
         zjTQ8czUZZCIDXgROc+3A3dZuqQdird3eENWguwGbZVRLaKkO79MAH6dVxhPa7B8fOhS
         nBgptEwTw2oFyuLKve7r9QgMrdC5//mQSXvPBzQ6Oj/mWfv5jXaulZP1nIEMfPtsUnNq
         IgkBuH6aiJeGGrN9h9AQ+4k//pg4/0HtX6ThYQ95ADu6GgEABT2E4lyxrBj3puFFuE9e
         kkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713357751; x=1713962551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3oveVIqvfXpANC6X0yZp4EOyb3G4ovV7gjUYkogoPps=;
        b=VFbP1I0dIeiLX5LVTRqJr1hnrMsi1TthiFlHt4ab5cTP9oFo4TvMuaeZbWdASF+KbV
         lQLWYmS8MESPVYNcNV/1/fZAjDMoLrSpSja3TRGLQNzOcApF0ek5fJPDQgrKXwJpQ1qO
         mM3BT0vn7I9E9dVvjuJOxhpCUBbFsL1t5iWpe2e9Mvuq22eyr84F2J8spJJw3A9Li4qs
         KH20ABegMZyue25UCtChnuHyq74rF7qSY7can5NP6IAzs0XMSPxYf6EFyg91wh2mVxE0
         Zq7nSVjV4CKS/B0xWSltgYsZ/84jx9hlLhmDdRl38EzJwMFJMBhGrZtU26NKKA8qHwv0
         6n0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWoSFT6PB1HkLbTVT1CHDJsGurzvIlu5ca4rOLVSIptXJ5He5or4ATJVvGLO9axcdZmLF0DIBcfE8L1QBUlby9jMsJXygbSMJQA
X-Gm-Message-State: AOJu0YyS6yMWU3ceXrZuatfxtB3UJCCSoN5dL06ggBqgkXy0pSiLiIKK
	2jYXUn4Nt/aqsO928oJ6fpo2mP3ju9snu+f+16GrBpgNQ64NXJ+2
X-Google-Smtp-Source: AGHT+IGD/GDkNXQwvUnzsEGr8VZocCQZuoc5HYGQxn2wyiQ9xk5kv1R81udHtCoUvw7iheI/MHgI8Q==
X-Received: by 2002:a05:6870:718f:b0:229:fa5a:2fec with SMTP id d15-20020a056870718f00b00229fa5a2fecmr19418889oah.54.1713357751602;
        Wed, 17 Apr 2024 05:42:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:70:f702:9c77:c230:a0ba:a1a1? ([2600:1700:70:f702:9c77:c230:a0ba:a1a1])
        by smtp.gmail.com with ESMTPSA id lg22-20020a0568700b9600b00238abc3bb0bsm198465oab.40.2024.04.17.05.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 05:42:31 -0700 (PDT)
Message-ID: <b0e70576-a53f-4d03-a503-ddf1f98bbe9d@gmail.com>
Date: Wed, 17 Apr 2024 07:42:30 -0500
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
From: Mario Limonciello <superm1@gmail.com>
In-Reply-To: <f65765b29ea7503fbbaa5e047c95a82de6fc2083.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/17/24 07:39, Johannes Berg wrote:
> On Wed, 2024-04-17 at 07:31 -0500, Mario Limonciello wrote:
>>
>> On 4/17/24 06:18, Johannes Berg wrote:
>>> Hi,
>>>
>>> Since I was just looking at some firmware related thing (files for the
>>> hardware that might be shared between Intel BT and WiFi), I noticed that
>>> just over 30% of the files/dirs in the top-level firmware tree are
>>> iwlwifi-* files.
>>>
>>> While we can't move the files that older drivers might consume, we could
>>> e.g. change the driver to look up future versions/future hardware under
>>> intel/ instead? Would that be worth doing?
>>>
>>> johannes
>>>
>>
>> How about moving them all now and then creating compat symlinks for
>> older kernels at linux-firmware 'make install' time?
>>
> 
> Didn't realize there even was a 'make install' time :-)
> 
> But then I guess it'd be simpler in the driver since we could just
> unconditionally add the intel/ prefix to the request_firmware call.
> 
> johannes

Do both.  All the stuff already there add the compat symlinks in linux 
firmware so that current and older kernels work with older hardware.

Any "new firmware" only put in the new path, and add commits to the 
kernel to look for "all" firmware in the new path.

Should hopefully cover everything without too much pain then.
