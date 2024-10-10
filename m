Return-Path: <SRS0=dEQg=RG=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE75ECEDDA9
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Oct 2024 03:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88208C4CECE; Thu, 10 Oct 2024 03:06:29 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86B2EC4CEC3
	for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 03:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86B2EC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7157c329d93so240825a34.3
        for <linux-firmware@kernel.org>; Wed, 09 Oct 2024 20:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728529586; x=1729134386; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0S9i0QsKrTEFXoLHFccDF34hrvX9l0HAkJSbDJmtsuk=;
        b=h/2zXvcFVuD9viI3vF3yzc20fz9NfIBLq4EmMh1E2ftxXN+AvxvW4gT1Qbj7t6BrZ+
         gnV8zmhQ6yRtCLwDlyaAa0lFSUa5aPkjGXvnqDG2oKoFlHcL3QePZUbMIYNmoqHclNsn
         BKWKVZv4bGDxIgRcfl76r8uSFBNpdIL9lWAqw4xXtHHaG6WVNj5P0we1WVHS8MdGanY3
         dsWg5f2hYXE0mBCON1sS7as2wKwTslplKiEfumtpldeVQTZmRAt2P0xs0gk4EYwZxKxA
         8b0AWJ1YvfVhQQWW/unVyJhohA5P0Hw+bkY1X5ePuxn0w9I8iAGgIJ3Ip662cBD778Wd
         wFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728529586; x=1729134386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0S9i0QsKrTEFXoLHFccDF34hrvX9l0HAkJSbDJmtsuk=;
        b=Mt67S4XzPsnBUi5geBgDD4sf/IwO3CNFGLMQ+HfKoi7wgCb0WvQjnsjBh9R4xDYTpF
         19w2hxaeznZ+ikClkGmdI+I/pB2TXJN8KBHLV4HoQ56PI9cyw17Z1vGPeHk4EvIchXOz
         Fm8Kd5lKAbaq6hZGONceMwodUspi8YIKLsyzBrlF3wCnDq5hf0RBs4r3YDxl+6v2U5Ml
         4uirtdJnTdiCtOBy18vkKDhfhgq82UAf7raG7HiCr7TpSVsuBgrTssvfAf3q//k4RX4P
         EYljdI5zzBmX9HJzieRbEabQJeuWy6j0m+Y+6KEOGu4zAaz525SMgq/Gt1xHDuTH005h
         Ewlw==
X-Forwarded-Encrypted: i=1; AJvYcCUPb08BgRRFELXbNuX6/XpficZ8ucG7VuaJ1ZKZGWbaCPwcIJuEjWbSdGKihVlxzq18gM4Ye6VzgfT/VtObIw==@kernel.org
X-Gm-Message-State: AOJu0YxBYypgHd6l/cmXzXul/gwc0cZ0F17zBoY6XBNO+cBfiKcRIH3U
	T25+voL2B1eYYYiqp6fWWBqoikrrNhK0tRL8XNfclFFDO2zSKKqP
X-Google-Smtp-Source: AGHT+IENQKCoupa70Rsc818NrmBzIViwc1MsXFBDTbFtlqmHkomz1zji8Ovv17zTYRXXBs8loHJsUg==
X-Received: by 2002:a05:6830:349e:b0:715:5494:5d34 with SMTP id 46e09a7af769-716a421dd6fmr3309545a34.20.1728529586370;
        Wed, 09 Oct 2024 20:06:26 -0700 (PDT)
Received: from ?IPV6:2603:8080:1400:9f00:1ac8:ba3e:b226:eb6a? ([2603:8080:1400:9f00:1ac8:ba3e:b226:eb6a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-717d0035698sm47835a34.76.2024.10.09.20.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 20:06:25 -0700 (PDT)
Message-ID: <d1941b10-0549-4a0e-a3fe-a8d7c50c175b@gmail.com>
Date: Wed, 9 Oct 2024 22:06:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Upload dsp firmware for ASUS laptop 1EB30 & 1EB31 and
 Update WHENCE for both
List-Id: <linux-firmware.lore.kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, linux-firmware@kernel.org
Cc: baojun.xu@ti.com, derekjohn.clark@gmail.com, 13916275206@139.com,
 romangg@manjaro.org, linux-sound@vger.kernel.org, robinchen@ti.com,
 linux-kernel@vger.kernel.org, k-yi@ti.com, navada@ti.com, philm@manjaro.org,
 jlobue10@gmail.com, luke@ljones.dev, antheas.dk@gmail.com
References: <20241009101807.1473-1-shenghao-ding@ti.com>
Content-Language: en-US
From: Mario Limonciello <superm1@gmail.com>
In-Reply-To: <20241009101807.1473-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/9/24 05:18, Shenghao Ding wrote:
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> ---
>   WHENCE                     |   4 ++++
>   ti/tas2781/TAS2XXX2234.bin | Bin
>   2 files changed, 4 insertions(+)
>   mode change 100644 => 100755 ti/tas2781/TAS2XXX2234.bin
> 
> diff --git a/WHENCE b/WHENCE
> index a9c8bb5..00096eb 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -7487,6 +7487,8 @@ Originates from https://git.codelinaro.org/linaro/qcomlt/audioreach-topology.git
>   --------------------------------------------------------------------------
>   
>   Driver: ti-tas2781 - tas2781 firmware
> +File: ti/tas2781/TAS2XXX1EB30.bin
> +File: ti/tas2781/TAS2XXX1EB31.bin
>   File: ti/tas2781/TAS2XXX2234.bin
>   File: ti/tas2781/TAS2XXX387D.bin
>   File: ti/tas2781/TAS2XXX387E.bin
> @@ -7516,6 +7518,8 @@ File: ti/tas2781/TAS2XXX38DF.bin
>   File: ti/tas2781/TAS2XXX38E0.bin
>   File: ti/tas2781/TIAS2781RCA2.bin
>   File: ti/tas2781/TIAS2781RCA4.bin
> +Link: TAS2XXX1EB30.bin -> ti/tas2781/TAS2XXX1EB30.bin
> +Link: TAS2XXX1EB31.bin -> ti/tas2781/TAS2XXX1EB31.bin
>   Link: TAS2XXX2234.bin -> ti/tas2781/TAS2XXX2234.bin
>   Link: TAS2XXX387D.bin -> ti/tas2781/TAS2XXX387D.bin
>   Link: TAS2XXX387E.bin -> ti/tas2781/TAS2XXX387E.bin
> diff --git a/ti/tas2781/TAS2XXX2234.bin b/ti/tas2781/TAS2XXX2234.bin
> old mode 100644
> new mode 100755

Hello,

I tried to process this into a MR on Gitlab and it failed CI.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/311

Please run 'make check' before submitting.

Thanks,
