Return-Path: <SRS0=x1ZM=IS=gmail.com=aspriel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300ECC3DA6E
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Jan 2024 19:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF5A7C433C9; Mon,  8 Jan 2024 19:03:14 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF4A2C433C8
	for <linux-firmware@kernel.org>; Mon,  8 Jan 2024 19:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF4A2C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-42989a64713so14871871cf.2
        for <linux-firmware@kernel.org>; Mon, 08 Jan 2024 11:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704740592; x=1705345392; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ry9h7brTOa51YyCS8UKjYNUpAm+TJLu9cb0BqQG60ro=;
        b=QjvzX3NyY7/6isWsUZmj/2omKfCc/p/yzK2D/VqCwmNqsvWGwDmmam3UFbkIj8zBPv
         7V6G/kBV4PCSRgUrgutvqz6pinKIkaGB3o8NIWK3SDV2PFCtkb4xK/FEMds4zaP6heRo
         U8HGB4jQQg4+zF30rAobFeajTWMoGh0JO5BmG6tSty/PWdiYC2OWbWetu1POKhUMkpI5
         AVD+QlgTxNyg4+X9qo68/shdwAjg0CeDNmjkVF/x8Yo/4K8uqLzXbWLjhCzhfoGXlsb9
         QcAzGqrbUnq9DEXETM7TE2dQsjpapSHrkDs8pJpjPnNdvg7MmIvYpQIrt5v5eooGgSjL
         9V2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704740592; x=1705345392;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ry9h7brTOa51YyCS8UKjYNUpAm+TJLu9cb0BqQG60ro=;
        b=YsTi02el7L6gDJ6oBdvY0cEtOtrReCqD8gudiesCUDIFM0oFN4zOzu/wFnzi6NImVI
         RPecI4Bfe1/C9XmjIbWljTUcnm/OhDeaeK9Iy7AXSllsjRNcE8eoR+S7xgNx2zPO6ghc
         mUx/zIUf5zEqhgg5Kn0TylSmmLon1+8re0r9ljARwVaRuTfF4JklW6KkCgtI7oSeGv6M
         jEVoNaU4Q+z84GesTM0z1pVgibjGUWw5+eZtPm8W/qvtE2aFxWsgSkE54fZQxU60LIOh
         DiSbRsSuiOcbu8SuE+tx4yO6eR/G9DPqAExKxuDuNuau/p7yAeYgvfPs8NldTPlKd23U
         buAg==
X-Gm-Message-State: AOJu0Yw55ABJHYVkaKuFbUVjydKLi99rtNc4ZNsrXu+MVp1HAIaXnjyA
	LUMx71ZYvigo9ZujLH2LV60=
X-Google-Smtp-Source: AGHT+IFX5o/FrvAH3B7DkvKM6+1KeLPOho1GN85rZKUAV4agtmZuaFWBspuFnpg0zxXPPd2ANhsezg==
X-Received: by 2002:ac8:5781:0:b0:429:9770:8936 with SMTP id v1-20020ac85781000000b0042997708936mr1848813qta.18.1704740592582;
        Mon, 08 Jan 2024 11:03:12 -0800 (PST)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id bw11-20020a05622a098b00b00429940c13a8sm137181qtb.34.2024.01.08.11.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 11:03:11 -0800 (PST)
Message-ID: <a1a3683b-9d47-41e8-a527-17bdca1607ba@gmail.com>
Date: Mon, 8 Jan 2024 20:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: License of old broadcom BT firmwares and WiFi calibration files
Content-Language: en-US
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Arend Van Spriel <arend.vanspriel@broadcom.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-firmware@kernel.org,
 linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>
References: <CAPVz0n2Ky350xhOv6WvE0YhFJ9QBe59LnWvKiafs2tjFnptP+g@mail.gmail.com>
 <22115037-3a81-4a52-8e64-bc85c2be4212@broadcom.com>
 <CAPVz0n2Dah1b45c0yUjMZNph5AVJjneLsc2LOQ-dkXNRTv6y+Q@mail.gmail.com>
 <18cce9a7818.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <18ccea1d6d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <BFE6B9E5-CAF5-4E30-A4A2-A2489423C961@gmail.com>
 <18cd08e83d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAPVz0n347PVv28H2wswmO3N63dpfPZ0d3VrdxmQHXMoo9LS69g@mail.gmail.com>
 <18ce9be5470.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAPVz0n3BxJjaudDnC=QLHa-0NsE9JSs1ezFpwK2yb=9ySyr2cw@mail.gmail.com>
 <18cea3af2c8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAPVz0n3-nirqD9XW+-R_Uh8Ehkm2WKcxa3ZTp8TiOUf7gz+wKA@mail.gmail.com>
From: Arend Van Spriel <aspriel@gmail.com>
In-Reply-To: <CAPVz0n3-nirqD9XW+-R_Uh8Ehkm2WKcxa3ZTp8TiOUf7gz+wKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+ linux-bluetooth
+ Marcel

On 1/8/2024 7:21 PM, Svyatoslav Ryhel wrote:
> пн, 8 січ. 2024 р. о 19:59 Arend Van Spriel <arend.vanspriel@broadcom.com> пише:
>>
>> On January 8, 2024 5:48:37 PM Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>>
>>> пн, 8 січ. 2024 р. о 17:43 Arend Van Spriel <arend.vanspriel@broadcom.com>
>>> пише:
>>>>
>>>> On January 4, 2024 10:08:04 AM Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>>>>
>>>>> ср, 3 січ. 2024 р. о 20:20 Arend Van Spriel <arend.vanspriel@broadcom.com>
>>>>> пише:
>>>>>>
>>>>>> On January 3, 2024 6:28:33 PM Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>>>>>>
>>>>>>> 3 січня 2024 р. 11:22:42 GMT+02:00, Arend Van Spriel
>>>>>>> <arend.vanspriel@broadcom.com> написав(-ла):
>>>>>>>> On January 3, 2024 10:14:42 AM Arend Van Spriel
>>>>>>>> <arend.vanspriel@broadcom.com> wrote:
>>>>>>>>
>>>>>>>>> + linux-wireless
>>>>>>>>> + Hans de Goede
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On December 16, 2023 9:14:48 PM Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>>> сб, 16 груд. 2023 р. о 21:57 Arend van Spriel
>>>>>>>>>> <arend.vanspriel@broadcom.com> пише:
>>>>>>>>>>>
>>>>>>>>>>> On 12/16/2023 6:45 PM, Svyatoslav Ryhel wrote:
>>>>>>>>>>>> Greetings!
>>>>>>>>>>>>
>>>>>>>>>>>> I am trying to submit bluetooth firmwares (BCM4329B1.*,*.hcd and
>>>>>>>>>>>> BCM4330B1.*,*.hcd) and wifi calibration files
>>>>>>>>>>>> (brcmfmac4329-sdio.*,*.txt and brcmfmac4329-sdio.*,*.txt) from a few
>>>>>>>>>>>> Tegra 2 and Tegra 3 based devices into linux-fimware.
>>>>>>>>>>>>
>>>>>>>>>>>> I have faced ambiguous license issue since those files were part of
>>>>>>>>>>>> Android Images of different vendors. Those vendors did not provide a
>>>>>>>>>>>> license nor for android images, not for these files.
>>>>>>>>
>>>>>>>> Does this mean you extracted them from the android image? That probably
>>>>>>>> never get accepted without any license information.
>>>>>>>
>>>>>>> Can Broadcom re-grant license to these files?
>>>>>>>
>>>>>>> This license is for bcm4329 in crespo
>>>>>>> <https://android.googlesource.com/device/samsung/crespo/+/refs/heads/main/self-extractors/broadcom/LICENSE>
>>>>>>
>>>>>> Actually checked this link:
>>>>>>
>>>>>> https://android.googlesource.com/device/samsung/crespo/+/refs/heads/main/proprietary-blobs.txt
>>>>>>
>>>>>> It lists the bcm4329.hcd file as falling under Apache-2.0 license. Same for
>>>>>> asus/grouper.
>>>>>>
>>>>>> Regards,
>>>>>> Arend
>>>>>
>>>>> So this actually resolves ambiguity. Thanks
>>>>
>>>> Yes, but ... you should add them to linux-firmware under the same license.
>>>> That means you need to mark them as such in the WHENCE file. Feel free to
>>>> cc: me for the patch so I can have a look at it.
>>>>
>>>> Regards,
>>>> Arend
>>>
>>> Thank you for your assistance, it is really appreciated and valued but
>>> it was rejected
>>>
>>> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/114
>>>
>>> I have referred to our conversation.
>>
>> I see and it seems they were correct. My bad. Clearly should not try a
>> career as lawyer.
>>
>> I can try to publish them to linux-firmware, but I have to ask internally.
>>
>> Regards,
>> Arend
>>
> 
> Thank you, looking forward to your answer. But keep in mind that
> generic firmware for bluetooth might not be an option. I have tried to
> shuffle them and bluetooth failed.

Okay. I guess there is a naming scheme that btbcm.ko uses. Will look in 
the source file how it loads firmware/patch. Actually your merge request 
would also tell me. That involves a whole lot more firmware files than 
what we discussed earlier.

Regards,
Arend
