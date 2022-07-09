Return-Path: <SRS0=6woB=XO=heitbaum.com=rudi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64CDC433EF
	for <linux-firmware@archiver.kernel.org>; Sat,  9 Jul 2022 04:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7FE67C341C6; Sat,  9 Jul 2022 04:39:18 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FB4FC3411C
	for <linux-firmware@kernel.org>; Sat,  9 Jul 2022 04:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4FB4FC3411C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=heitbaum.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Received: by mail-pg1-f173.google.com with SMTP id 72so594755pge.0
        for <linux-firmware@kernel.org>; Fri, 08 Jul 2022 21:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=heitbaum.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6ZCngqvFSQhcLqa9lqiTvMkoYJAYo5f2acyuWH/780Y=;
        b=jg7Ux8WcKn7B4N9P8Dys4L8NBW6EBaGK6dSZwqyqAUMT2CK1LRUu3kimKDn3AUb23Z
         cYbBfWYggk/01ZjnIjM4Ht4A68t/6md4pLh7Mt0S4PQ1NJJF0Z2Vp8IWtlE+f9adUtWZ
         LPgwY4Q/98VzXVGIm7SUNt8bq6gA9bxsUJ++w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6ZCngqvFSQhcLqa9lqiTvMkoYJAYo5f2acyuWH/780Y=;
        b=pdroooPyS7QARMblLHu0rRFjZcXU/so45RCu/TdYNtKjX39P927CIz48aTSEogwvlh
         PvXF4UZa3C/0/lfzbObc6+ZNk4UoLtlOurY8OZTn1lM5b1R5pP1J2mEaAFj8HLYJV0pM
         avstcipm3Uab2XiIT7KYB8c9nm1Ilcww6CtSlsLsrVyRq5CH6EhGCag0dUX4VShd0dcI
         Sma1M9nofiP13UIAaXQq2EXP3K1m95/N7TVMXEAPC0pasUcK1uadeUTwuRYU0pC4VKfH
         gvmwaUfboODhv84wO69m70AzoNasIAD6w5qSV7an7CU7HU4v2hD+nD5otvx6WXThh6et
         aVCQ==
X-Gm-Message-State: AJIora9Xtuqgth7EJt8UF54hfuX29uY5SeQeR/vIIO6ay38IF2tO1ssd
	tZlJ7M+kBI8Hqoybdd2TQLIXJjB5RkIF03IA
X-Google-Smtp-Source: AGRyM1slsrnWpvCBLAjjxCeypxAovsUZcCLy2letdG4PYkK1E3vX/+/WkrSg0WedkSexMkNak39nJg==
X-Received: by 2002:a63:4558:0:b0:411:442a:b740 with SMTP id u24-20020a634558000000b00411442ab740mr6033565pgk.540.1657341555646;
        Fri, 08 Jul 2022 21:39:15 -0700 (PDT)
Received: from a6d8130baa37 ([203.220.223.63])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902c40400b0016c1a1c1405sm346406plk.222.2022.07.08.21.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 21:39:15 -0700 (PDT)
Date: Sat, 9 Jul 2022 04:39:10 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: [PATCH v2 2/2] Link some devices that ship with the AW-CM256SM
Message-ID: <20220709043910.GA9927@a6d8130baa37>
References: <20220614141249.3975556-1-pbrobinson@gmail.com>
 <20220614141249.3975556-2-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614141249.3975556-2-pbrobinson@gmail.com>

Hi Peter/Josh,

I have posted a fix as the entries are reversed.

https://lore.kernel.org/all/20220709043338.GA316680@0c7a33013940/

On Tue, Jun 14, 2022 at 03:12:49PM +0100, Peter Robinson wrote:
> We know the BeagleBoneAI, Pine64 Pinebook Pro, Pinephone Pro and
> Pine64 Quartz64 Model B all ship with a AW-CM256SM so link their
> known names so the WiFi NVRAM is available to those devices.
> This is the refresh of the Pinebook Pro, the first rev has a
> Synaptics brcmfmac part which the vendor doesn't provide firmware.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
> 
> In v1 I mentioned the Pinephone Pro, but linked the Pinebook Pro, where
> I meant to add both. Mention the rev of the Pinebook
> 
>  WHENCE | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/WHENCE b/WHENCE
> index 084af41..ae13c5d 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2964,6 +2964,10 @@ Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6
>  Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
>  Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
>  File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt
> +Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinebook-pro.txt
> +Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinephone-pro.txt
> +Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,quartz64-b.txt
>  
>  Licence: GPLv2. See GPL-2 for details.
>  
> -- 
> 2.36.1
> 
