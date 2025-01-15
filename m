Return-Path: <SRS0=NAH+=UH=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE6EC02180
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Jan 2025 19:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65FB5C4CEE1; Wed, 15 Jan 2025 19:30:36 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08535C4CED1
	for <linux-firmware@kernel.org>; Wed, 15 Jan 2025 19:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08535C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3c47434eso178063e87.3
        for <linux-firmware@kernel.org>; Wed, 15 Jan 2025 11:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736969432; x=1737574232; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=74XkFS9DzZ2OkyiCSpmU2WovRKw4oJ8QjJazyagugLE=;
        b=ZLVyXeXrqU6pApG+Ncgb2Zgr74MXNlxrASWbkp6/x75GpP1f3N49g/8kj3eDxd+/Ih
         8o26P4ztBwVHKwjnzkvaDvBjVC+IA0s7aUXj6EuCmmXIwlQt054H6yWYax8FH3yLpI2R
         HQH5UdkVTGkIEgUqXm3tchKZ86vYjDjaURN0c098I6M8Gf7m7pgeT9o9tnojNrTJoEys
         aj4bWCHHRhPEOpqHZhyDjiB3JI4uKaXaO7Dn19ReotyvJqrg5NPtFCfEfAwDTF+B0oq6
         nKBqMzu+foPo+tkBUXg7hvHqdguNM4M5BY8v6R4UGb6bJYrGG71gKjCVqCY6HvuNtlNx
         D8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736969432; x=1737574232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74XkFS9DzZ2OkyiCSpmU2WovRKw4oJ8QjJazyagugLE=;
        b=vur+PrLnep5emhK64/ZUEtJoG2R0TujGr1BnitJ8i7E+szU56gL/ZZQ6XaWunywvdD
         R1nq4Kuji0NEMoB5eYO/vXZwVsA/G08IWIaHZyRLXxDPgG3EuMjo8bqOEwkoy4RxGQX2
         JsndbXWGTbf8u/9CWVckkLThSkmJTSwYycELVcOXEHwggeu+PkyKv5ysOmvwa1L6r4zt
         TH7N4JUl6JUae8p8Z/Fhx2M9pg8i8OhxHCNoeEi+QJxDrtTqVOtEQiBghsfZkGnK0vV5
         t5MtP4rh+oB8/mgiKi1XF4yQMB1Ot1BeX0B/N1jvvF2f0ojNhcsoY5pWuUYnuyq+e3t8
         iXhQ==
X-Gm-Message-State: AOJu0YzC+oJLDTepoVtJ+jm7ZqTrhykom0LhP5jX9Rc7aNXlCT79pjaI
	ysiCXRJCvu0Th2p0kigr9kaMqRykB+yzBzOua2oHXP8DPTO0Xqc90eRKiJbNOUg=
X-Gm-Gg: ASbGncvnWjKMJCGp8JpkeeELzyTTEIO3iI6VmvKaxlQrxTchTTH0CyQiOW/fWZn/wDW
	MR6dRhf3BPDq2AF7rDroafcuQzLeUpEqEMP4JVBhrIIG/RK71pBband7ytoyqo3mKEl1HcDDo1D
	lAtf/ixv4KmFxn89QoWpqOzA+S1lGVMkLs4rgVrncE03x70lwlWx/FJbV8uWw9HZ4yFmWl9E7ui
	NxgtPEV6hxRXKvoedICskNiqiNzzfVp/iKHU716Q6vwHsVMcy9g1GAv3/XIvPlzRQjHCQtO4XFR
	IlUvw7P+ZNcu078REMwSuLeUimUNQkwS8tMo
X-Google-Smtp-Source: AGHT+IGS0gsniHAb1265t2ZInspYgL6rWfoxkSpJFSOe+oC2DXSzdeDmFJAzWdYH+4C429519LL8Aw==
X-Received: by 2002:a05:6512:1188:b0:540:1a0c:9bac with SMTP id 2adb3069b0e04-542845d61d7mr10774580e87.34.1736969432101;
        Wed, 15 Jan 2025 11:30:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be54154sm2133263e87.68.2025.01.15.11.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 11:30:30 -0800 (PST)
Date: Wed, 15 Jan 2025 21:30:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ajay.Kathat@microchip.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	kvalo@kernel.org, alexis.lothore@bootlin.com, marex@denx.de, 
	Sripad.Balwadgi@microchip.com
Subject: Re: [PATCH] linux-firmware: wilc3000: add firmware for WILC3000 WiFi
 device
Message-ID: <ismsffcidddb3dqr54mdhzsxrwpqfvsauq77fmuzsekhnxyeb6@3imjhwdg34fx>
References: <20250115171751.7308-1-ajay.kathat@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115171751.7308-1-ajay.kathat@microchip.com>

On Wed, Jan 15, 2025 at 05:18:49PM +0000, Ajay.Kathat@microchip.com wrote:
> This commit adds WLAN firmware for wilc3000 which is supported in mainline
> Linux with commit [1].
> 
> FW version: 16.1.2
> 
> 1. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/microchip/wilc1000?id=e1408c115ef9b
> 
> Signed-off-by: Ajay Singh <ajay.kathat@microchip.com>
> ---
>  WHENCE                             |   5 +++--
>  atmel/wilc3000_wifi_firmware-1.bin | Bin 0 -> 140712 bytes
>  2 files changed, 3 insertions(+), 2 deletions(-)
>  create mode 100644 atmel/wilc3000_wifi_firmware-1.bin
> 
> diff --git a/WHENCE b/WHENCE
> index 920d6093..3842bed7 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5712,14 +5712,15 @@ Licence: Redistributable. See LICENCE.nvidia for details
>  
>  --------------------------------------------------------------------------
>  
> -Driver: wilc1000 - Atmel 802.11n WLAN driver for WILC1000
> +Driver: wilc1000 - Atmel 802.11n WLAN driver for WILC1000 & WILC3000
>  
>  File: atmel/wilc1000_fw.bin
>  File: atmel/wilc1000_ap_fw.bin
>  File: atmel/wilc1000_p2p_fw.bin
>  File: atmel/wilc1000_wifi_firmware.bin
>  File: atmel/wilc1000_wifi_firmware-1.bin
> -Version: 16.0

Why? You haven't updated old firmware, so it should still be 16.0

> +File: atmel/wilc3000_wifi_firmware-1.bin
> +Version: 16.1.2
>  
>  License: Redistributable. See LICENSE.atmel for details
>  

-- 
With best wishes
Dmitry
