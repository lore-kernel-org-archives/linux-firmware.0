Return-Path: <SRS0=bXg3=P5=gmail.com=hkallweit1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA6BCA0EE8
	for <linux-firmware@archiver.kernel.org>; Fri, 30 Aug 2024 07:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 926B9C4CEC4; Fri, 30 Aug 2024 07:58:17 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97807C4CEC2
	for <linux-firmware@kernel.org>; Fri, 30 Aug 2024 07:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 97807C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f3f163e379so24270861fa.3
        for <linux-firmware@kernel.org>; Fri, 30 Aug 2024 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725004695; x=1725609495; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fCN+M7LpxkD224UyuQmFYzSTTh3Lo8O+PFzDTg2aGE8=;
        b=BMO1iy/08veOgHL/4EwLjMjF9HqbcdBfhCK7+xZxKAl3CkXT4rgXhxXlHlV7RGJpc+
         V322U6w63YEHmAqTYAhQo1vmRhOQC2gGh+VJXNREVzgPYjqlGLBnqmWEdOzc5RtAFX6Z
         mgfXtZyQZ1XDJREbjsEtamJ5eLJUzuQU3KN/5pr4Pys6xi2Tc5ckCOFNU4AYU/MK8RrO
         boFIh4qrWIzD9S00JNvKYdELAP0uROyYlKK1IzOt4iTeFbRT+wC69tnWmqcfkaZgKpcB
         X5M7I8hDdYdJG+HticFvCYwEHVlMdOwx93h00THAztxAfPTBxRoIudfqvQMj13N7/1BG
         KlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725004695; x=1725609495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCN+M7LpxkD224UyuQmFYzSTTh3Lo8O+PFzDTg2aGE8=;
        b=haPUOUlJPYpoItsk65Tx0NZfKoaMudJlbjIBlzU8Wg1YY2u4/oejlP06yPIc1fh7T2
         C7LYpR7/foZEwIbtuCBYipEErlYNIdYxlWo97C+cfbMScGrKHj0NfCxM4wD5dy97M8TX
         3U55bnr560hnXvalmX5xUI2CLYtFQ5agKBm8PEJaKV0aUR+OKGl90nZkod4bxgKr6Z19
         0otQslcuw5ejMDWf01u00PNl/I5w+K4JQcU9srwQZp0FpZfuNc0WLZDPuDJdVsciypd2
         p8L1yNK2JeOx67Ki+Rnhp1k5SeZ3aaol2+Y8VP+USKgLcd/qakJUTiG3OUutenCgXUS0
         TaZw==
X-Forwarded-Encrypted: i=1; AJvYcCWAhvScIVK0HV6U0Q/AL3idKAVDwKCzpja0aH9p82N48+GV0tvqeSe9fdN96wcYV2LqrcEB3wJXRO3tfFOnGQ==@kernel.org
X-Gm-Message-State: AOJu0YyxTMmxfGuq0VdVHuuL/3aFnEPp+YlNHOnZu0B1eF+rkXSPjWIO
	OOp+FTN1O2/SCURfWXRC+7qXIz3H15Axm1ndtSCDFkdf2c6wJ/Dz
X-Google-Smtp-Source: AGHT+IFoKPVimMVvautcEzSfeawj6h940ReLRhOS3ItGVb/ygTr9FV4509uXINBlyciIixhxGbr/ug==
X-Received: by 2002:a05:6512:3c9e:b0:52c:deb9:904b with SMTP id 2adb3069b0e04-53546bde550mr937531e87.38.1725004693480;
        Fri, 30 Aug 2024 00:58:13 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c577:dc00:9553:b74e:f171:6b52? (dynamic-2a01-0c23-c577-dc00-9553-b74e-f171-6b52.c23.pool.telefonica.de. [2a01:c23:c577:dc00:9553:b74e:f171:6b52])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a89890229b5sm183926966b.51.2024.08.30.00.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 00:58:12 -0700 (PDT)
Message-ID: <78f2b8fc-d6c0-447e-87f1-d8e4e3174bd8@gmail.com>
Date: Fri, 30 Aug 2024 09:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtl_nic: add firmware rtl8126a-3
List-Id: <linux-firmware.lore.kernel.org>
To: ChunHao Lin <hau@realtek.com>, linux-firmware@kernel.org,
 nic_swsd@realtek.com
References: <20240830064151.12520-1-hau@realtek.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240830064151.12520-1-hau@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 08:41, ChunHao Lin wrote:
> This adds firmware rtl8126a-3 for RTL8126A rev.b.
> 
> Signed-off-by: ChunHao Lin <hau@realtek.com>
> ---
>  rtl_nic/rtl8126a-3.fw | Bin 0 -> 13232 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 rtl_nic/rtl8126a-3.fw
> 
> diff --git a/rtl_nic/rtl8126a-3.fw b/rtl_nic/rtl8126a-3.fw
> new file mode 100644

Hi Hau,

the WHENCE file in the root directory needs to be updated as well.

