Return-Path: <SRS0=+YBo=OR=gmail.com=usbwifi2024@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C69C3DA49
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Jul 2024 01:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C520C4AF09; Wed, 17 Jul 2024 01:06:49 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0D75C116B1;
	Wed, 17 Jul 2024 01:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0D75C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5cebd3bd468so253830eaf.1;
        Tue, 16 Jul 2024 18:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721178407; x=1721783207; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l+Vk8DiSZi0c+U2JmkeHKr+qpLRIUE7I4B3zXPia7R4=;
        b=KMtNIez1i8ZoQzYsY2uQRqTNmcgQ9A8hhczdxZW+P5vwDq7A2JONJ00+JSWnwWEJGk
         oxQ3R64wEKPBM8Pss7U7Gqb9bFhsiPS2cj0UKUHVeAQ/mtXBDX+EYTYJlq2VFUUs1InA
         FnJ6R6zCQoaGWbkQyNCD15M65o2/QQFRVDZ7891/2FMYiKzAnUdtjBcKuEdIzJUUHJIz
         JaBNPTQYOey/mXiDoh77INEtSbabJkEeR1tgVVAUL1993ZUHqNs9W4zdVOSp8JveqDhN
         bMa3iqhse6pxwxJtZ6+iqJ+vc9JhK2blw0lvYGkyXuEufVzUGSr5zQxHYJ24DtQIFZb6
         QfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721178407; x=1721783207;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+Vk8DiSZi0c+U2JmkeHKr+qpLRIUE7I4B3zXPia7R4=;
        b=dxaNRoqflT5d2nWjnoH4iCrMsSPaD2LyFDvAoN0QbB1vjyvJvFbSpQTUI4gYRw4eNC
         LTNltnY0cnGe6T5oOk942OB+PjDslkz+I2qAigxwyUFh/A+y2vtKww0dn9h0cqQKbf/T
         Ybr5G9N81kqjvW1JPXSVflBuO4Y9YXT2h5fF2A1TVw4eVBLQUM/bLZb/UdAObE9ubKYr
         Cp9Sa6OPRW4qUno+KmbqlquZJ5eaOEQLMpLWi9pYF6P4IkBNSHIDrFLkQmKZqwRDFPAt
         59NEZGa11oIV6wKAdUqDhcUhSqhBUkTpSLoVvx/k7QgaqArIrV3CanpVP9CCxLfcS6br
         nSJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWShw1DkoUZxkvzmYMC4LfbJtoG8zgKZSVCELqqwXOjHX0AjH8kheqJ4kAZFOgY0DN8KTStbSU3wvDNtczTlycKzI=
X-Gm-Message-State: AOJu0YxY+NCS18o/3o/65arn6LXQFWN0LZkT4kbucqlHPP8NxPHAiG+o
	773x6xu8XiAdr8HcQUa20b1pUgX+xodsv2He1ZnFzkPoWFxHWxkeFs8ldSrE
X-Google-Smtp-Source: AGHT+IF7PkiKRj+Tisbeoy52d/aCl0XYWy4ljy48leh/tiN6QFC3mP3t0minbkzcYkSZeA1Ld56Kvw==
X-Received: by 2002:a05:6870:1708:b0:259:8cf3:9ec3 with SMTP id 586e51a60fabf-260d94cce2cmr87679fac.54.1721178407703;
        Tue, 16 Jul 2024 18:06:47 -0700 (PDT)
Received: from ?IPV6:2600:8804:8c40:b4::94c? ([2600:8804:8c40:b4::94c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2607513552bsm1537707fac.15.2024.07.16.18.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 18:06:47 -0700 (PDT)
From: Nick Morrow <usbwifi2024@gmail.com>
X-Google-Original-From: Nick Morrow <USBWiFi2024@gmail.com>
Message-ID: <0e5a3ee7-a5d5-4705-8e39-829e089c1a4e@gmail.com>
Date: Tue, 16 Jul 2024 20:06:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-firmware: Add firmware for RTL8812AU device
To: Ping-Ke Shih <pkshih@realtek.com>, Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
References: <09899e7a-6a34-4c21-bf18-6533e22b2d22@gmail.com>
 <CA+5PVA7oS2hBGTudjCzbwrpXfbdYpL7_UbqL-inhm4tKaSRGCQ@mail.gmail.com>
 <91575ad3af41462a9ba2688e0920dc94@realtek.com>
Content-Language: en-US
In-Reply-To: <91575ad3af41462a9ba2688e0920dc94@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/16/24 19:35, Ping-Ke Shih wrote:
> Josh Boyer <jwboyer@kernel.org> wrote:
>>
>> On Tue, Jul 16, 2024 at 10:50 AM Nick Morrow <usbwifi2024@gmail.com> wrote:
>>>
>>>
>>> This firmware was extracted from the  20210708 - v5.13.6-23 release of
>>> the vendor driver for this device and is believed to be the latest
>>> release by Realtek.
>>
>> We'd need someone from Realtek to submit this, or include their Signed-off-by.
>>
> 
> I can help this. Please send patch to or Cc me next time, Nick.
> 
>>>    rtw88/rtw8812a_fw.bin | Bin 0 -> 27030 bytes
> 
> Since rtw88 has not supported this chip yet, please submit firmware after
> adding driver.

Will do Ping-Ke. It should happen soon.

Question: At some point in the next few months we are going to try to push a driver for the rtl8814au chip as well but I have no idea what the most recent version would be. Do you have a suggestion as to who I should contact?

Thanks,

Nick Morrow
