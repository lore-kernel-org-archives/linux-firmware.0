Return-Path: <SRS0=7+Sx=PX=gmail.com=usbwifi2024@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9004AC52D6F
	for <linux-firmware@archiver.kernel.org>; Sat, 24 Aug 2024 19:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53506C4AF0E; Sat, 24 Aug 2024 19:18:36 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 668CDC32781
	for <linux-firmware@kernel.org>; Sat, 24 Aug 2024 19:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 668CDC32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-70943b07c2cso2826637a34.1
        for <linux-firmware@kernel.org>; Sat, 24 Aug 2024 12:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724527114; x=1725131914; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZn3T3TMp54nUloXbXnxjQ0Ru/RTXJEf7kHaHIFc6Ng=;
        b=gEMdcJbXxswMlofwf5xOpwC3bgZs/LDZ3Ru0NHirCCTTzE2GY0IpD98qCcX8PnRsuu
         Tiqt1AwCwUYmPoAH38HsBLUx1dOSJtcPp1lc2DxpbTG4v4isBxOhj0NBTY9Wz2xxIyXc
         R4von2Bqiebuf1FUnJXIUhlJpFX7JxbO/XQNH3D24gsjEeeOvu3NKWCsh0TnUTg9fy/e
         fPqivHXKuQbqCb3ibegyAlquJWCXPOIFXLWNkGYtaFOQYKE5vsuGInkda2W68wBU6PHH
         A8Kt152Xqn5Iq0wmBw4XlEawxo+wJQV89qLVfWWKDAzRfmcM5tznoVGnCSRvRUT9MAQb
         WG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724527114; x=1725131914;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZn3T3TMp54nUloXbXnxjQ0Ru/RTXJEf7kHaHIFc6Ng=;
        b=AE09zDk4IQV3RBKsSrrCxFrTxvzBYF2N0YHnvdiL6zYeAWxhaNTQwsH3RytDnE30oM
         RVxundbvKhndEURelIJhOsxnmN27BYhykMgqUWpPFfW0EER4Jtm7vHWAxBlflCEJoiZi
         cVIUingt7R0kSBWsMPQ6aq0sQIbWYccg6XJIFH6YceLq5fh3X3F0Z/9UaNKWw/vrbjR/
         ow23HcMkRyR8m3GWKK4cBwJgQkUipmkLxhJh5rh0mL8BQ6Ikj6thVVZOVwAvMvGGmuMX
         ydsOl4RsLroJPRPw6R5yqaAZAodo5UT/RcXBxQODDA52TE8sa2d3xs/JK16vj8eEA4xJ
         7zjg==
X-Forwarded-Encrypted: i=1; AJvYcCVtpH7GCVpYqSfu3TkTOcq0OqrVzF4pl3XsZTggi4ykMyBJHulsRjp06oGxGNO6ZbARI+oml67xTcjaFnouPw==@kernel.org
X-Gm-Message-State: AOJu0Yxq6/5aM7aTXZRToNVRVgzaSHGoyz1AlUCvULdJRJJiPJNEQjG/
	J240J+F8qKoP65D+MlJ9DhdYO0RHGE3MfFd79todFuNwe6YgXGvFvP112A==
X-Google-Smtp-Source: AGHT+IG2rgsVwJntp+zHu54ZMj5RMzdgO7wHYHSDgd/hzAmdHT+qIc7TaNasisFgM65lve2ZH4Ha3g==
X-Received: by 2002:a05:6808:1815:b0:3da:d8b9:6e56 with SMTP id 5614622812f47-3de2a8867e3mr7717423b6e.15.1724527114115;
        Sat, 24 Aug 2024 12:18:34 -0700 (PDT)
Received: from ?IPV6:2600:8804:8c40:89::28e? ([2600:8804:8c40:89::28e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3de225c52a6sm1307462b6e.44.2024.08.24.12.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 12:18:33 -0700 (PDT)
From: Nick Morrow <usbwifi2024@gmail.com>
X-Google-Original-From: Nick Morrow <USBWiFi2024@gmail.com>
Message-ID: <db84ee3a-1aed-4721-ac27-8c6d116979bf@gmail.com>
Date: Sat, 24 Aug 2024 14:18:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] linux-firmware: Add firmware for RTL8812AU device
List-Id: <linux-firmware.lore.kernel.org>
To: Ping-Ke Shih <pkshih@realtek.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <f815d748-6578-441e-b61e-0a220d45e168@gmail.com>
 <774a7dd01718448da4048e966f5430f1@realtek.com>
Content-Language: en-US
In-Reply-To: <774a7dd01718448da4048e966f5430f1@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/24 19:58, Ping-Ke Shih wrote:
> +linux-wireless
> 
> Hi Nick,
> 
> Please always Cc linux-wireless for rtw88 firmware.
> 
> And subject prefix would be "rtw88: ..."

Hi Ping-Ke, I am trying to resolve what you are asking for vs. the instructions at linux-firmware. Should the subject for V3 be:

  [PATCH V3] linux-firmware: rtw88: Add firmware for RTL8812AU device

> 
> Nick Morrow <usbwifi2024@gmail.com> wrote:
>> This firmware was extracted from the  20210708 - v5.13.6-23 release of
>> the vendor driver for this device and is believed to be the latest
>> release by Realtek. Testing of the new driver has been accomplished
>> using this firmware. Numerous testers have been involved.
>>
>> Signed-off-by: Nick Morrow <USBWiFi2024@gmail.com>
>> ---
>> v2:
>>     - No change. Resubmitted now that the driver is in review.
>> ---
>>    WHENCE                |   1 +
>>    rtw88/README          |   3 +++
>>    rtw88/rtw8812a_fw.bin | Bin 0 -> 27030 bytes
>>    3 files changed, 4 insertions(+)
>>    create mode 100644 rtw88/rtw8812a_fw.bin
>>
>> diff --git a/WHENCE b/WHENCE
>> index 8aebe56b..d6bd4814 100644
>> --- a/WHENCE
>> +++ b/WHENCE
>> @@ -3270,6 +3270,7 @@ Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
>>    Driver: rtw88 - Realtek 802.11ac WLAN driver for RTL8822BE and RTL8822CE
>>
>>    Info: Sent to Larry Finger by Realtek engineer Yan-Hsuan Chuang <yhchuang@realtek.com>
>> +File: rtw88/rtw8812a_fw.bin
>>    File: rtw88/rtw8821a_fw.bin
> 
> I failed to apply this patch, even this textual part.
> 
> Two leading spaces before "File: rtw88/rtw8821a_fw.bin", but actually this
> should be only one. Not sure what is wrong.

I am carefully going over this patch again... while preparing a new version of the patch. I do not recall editing the line that has two leading spaces.

