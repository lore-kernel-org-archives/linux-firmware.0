Return-Path: <SRS0=2fXX=JK=gmail.com=hkallweit1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C83C4828D
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Feb 2024 14:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A220C433F1; Thu,  1 Feb 2024 14:25:43 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0561C433C7
	for <linux-firmware@kernel.org>; Thu,  1 Feb 2024 14:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0561C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a358ec50b7cso179522566b.0
        for <linux-firmware@kernel.org>; Thu, 01 Feb 2024 06:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706797541; x=1707402341; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c+YzURVZX6G/xxMNdYXKmweKkAr57zDR/z4vvmZvIws=;
        b=e9TFiS0hYOjgxOly3v3BXpsHODauliIT0GCBc+4NXllDqyKW7HJ8/OWsHaWvdpyKL5
         WGXBYGYotvlarQ/kvtLT5YgSQPtaEHh+WjjwlUAkvAcc7CCQO1aJUDhW4Izc7fEzIO8g
         MzIBeJUqAfCeuodpWVJ+mz94lK2c1V/h6n+KMpTLQzKU9Eb+3GLd5V2gy6Js4FeOvBrW
         rZygEULv35MVhhwqTA+Vhh1uZDW0piNkinGBbmnG6ZbixaJgHwUigcbZO2+32JeRqz/3
         1ZIbj4EcWmpMMuzBBIkXL5m+I0Xv2o0tdf+9WXE5MrIpXF577BKl36w9gJVqGoNDPp2w
         r2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706797541; x=1707402341;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+YzURVZX6G/xxMNdYXKmweKkAr57zDR/z4vvmZvIws=;
        b=cyT+4dzabPmbl52vzwzlHNQWrDENEcwhQiz8hgszlI7uAqkncH2fkw95ycaXERpV82
         CJ6PCEeHSyDxeQ6/7GbtQ6dKF3D2uTl6Ipyr4bxlHr6BVzGF6oRqM29dTe0ZrdJtbMoO
         6LjWaWHfg4iTRe19tJFGdfmI5kwdwPoUdqQ4yEBgcEkb1CIXaBKIvAcDG1jSG7/xhuk7
         jH2HG7KYOtE1FL6TNhRVvW5XXmsKt8pjHzNBJp7qVhGharAWGKuQhyvQ/HS7iW0DgTi6
         ntrP3t3nQMkVR5RhNEWqKMwaY8b4CVM34P8cate+jHG6+K4m1+JesgEUKQJRNB3AeQaZ
         pFCQ==
X-Gm-Message-State: AOJu0YzpJ/RShIkJhPns9LM5Lp4UTXn/OBe8JOUcDoyTYuDq6/tRE9dq
	8fummQUtssWZuuE5/5yl6wOHun8LotYyXXIjzZYpzZrvKCa8fDDvu6rZnpUp
X-Google-Smtp-Source: AGHT+IEqiLf2p8Tb6W6FxiwFUWlO1fhq2WyCL5YOBWfUUXvAlAFJL8h06Mw0Abov2PKoF+r22tlu1w==
X-Received: by 2002:a17:907:8906:b0:a35:d1c6:9981 with SMTP id rs6-20020a170907890600b00a35d1c69981mr6523126ejc.8.1706797540538;
        Thu, 01 Feb 2024 06:25:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWTKZLrLUDzm2e/z+bY/DCzbsf6gtemlwddnCTn+6fFfAQXI7CmN8tjaCSQlipnEKUeUi8B+HHLHLdTw72Apyez9ObuyQ==
Received: from ?IPV6:2a01:c23:bcb7:3100:3940:b422:9f20:414f? (dynamic-2a01-0c23-bcb7-3100-3940-b422-9f20-414f.c23.pool.telefonica.de. [2a01:c23:bcb7:3100:3940:b422:9f20:414f])
        by smtp.googlemail.com with ESMTPSA id x5-20020a1709064bc500b00a35f1000146sm3610832ejv.49.2024.02.01.06.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 06:25:40 -0800 (PST)
Message-ID: <91d0c882-0ad5-4f25-a95b-bdbcf3f699ed@gmail.com>
Date: Thu, 1 Feb 2024 15:25:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtl_nic: add firmware for RTL8126A
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Chun-Hao Lin <hau@realtek.com>
References: <62adc40d-fd8e-4a5e-9671-8a42260fc81c@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <62adc40d-fd8e-4a5e-9671-8a42260fc81c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.02.2024 15:24, Heiner Kallweit wrote:
> Realtek provided a firmware file for new chip version RTL8126A.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  WHENCE                |   3 +++
>  rtl_nic/rtl8126a-2.fw | Bin 0 -> 29248 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 rtl_nic/rtl8126a-2.fw
> 
> diff --git a/WHENCE b/WHENCE
> index 99632bb..211202c 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3356,6 +3356,9 @@ Version: 0.0.2
>  File: rtl_nic/rtl8125b-2.fw
>  Version: 0.0.2
>  
> +File: rtl_nic/rtl8126a-2.fw
> +Version: 0.0.2
> +

Hi Hau,

could you please respond with your Reviewed-by?

Thanks, Heiner

