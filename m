Return-Path: <SRS0=Ipm0=5I=gmail.com=larry.finger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9D9C3F2CD
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Mar 2020 14:57:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BC69F20771; Mon, 23 Mar 2020 14:57:58 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72D4C20753
	for <linux-firmware@kernel.org>; Mon, 23 Mar 2020 14:57:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zy/lHqRX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72D4C20753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=larry.finger@gmail.com
Received: by mail-oi1-f193.google.com with SMTP id y71so14966573oia.7
        for <linux-firmware@kernel.org>; Mon, 23 Mar 2020 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UjrzqgZSv3mXZto7SmWc3JpstiOe/8niV5P3gk8UjGw=;
        b=Zy/lHqRXxFojtIxVEBrS9xSbgIQpZO9OwBH241+cIr3F5bZkBHFUzLaJMfu9QcXXfX
         k16xmf1P2FD8bLSZfgUk5Yj5f79Df7FNRfksN/56A3PzpK2CzceTAXbj5TrcM7LLZ+eB
         6x4AKhfthB5+Ldjb5+8WnSINyfsz/jrRDvP1IwUYLKMBnXm0SG/apZnhR8ojnKoqCs23
         NDIF2hxokFdKtZ+KIOq9Fl7RXglTYhOysgRpTebM9Zeebnq68KudAtGOvzgdgkLiOl7y
         3aTDzkvANelsIUUTYkXPkxVKm2P+hxRidGDYBcFJII5Nx1hp1gI8pYmNW4k6mxA+ggkc
         dZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UjrzqgZSv3mXZto7SmWc3JpstiOe/8niV5P3gk8UjGw=;
        b=CkaVras/jMVNrT22dkFiLompkhJr82M/BBCG7AVF/EERi1RCsDEWB1h4+R55Fg5H/v
         j6oDUGTEJwSjZUxTszee5AHaWjBFK4nFYx4tsnDUB9q6w/7s5N6KvLa/TVZJnI6kpKl7
         otSE4/k6HEujuMk/HulBV2kshlUUR7qMd58i6Zt5VKN8t5hqIhpNCjI3mWBMyTjwPtBP
         8UdZq6QbA5ICMxIUSvxUosG5zYA8l5PGY7/OEi0uz8khtu3wFtrIHC6QBaZg0nvIdTBC
         E/MXcCCAVo88ScWtUYjQ08LT79ABynv8QvsxMTo+VJazqmRdqhew4jlhBjK48anX45JS
         bBng==
X-Gm-Message-State: ANhLgQ2kgLTZCTAwjkYemfymUQt8XjEvsHF036LhTGZALONzleOUOjhA
	Pu8wmHB0nXp2UEDog3rp5cPufSe/
X-Google-Smtp-Source: ADFU+vuqDbJ+iZWSuRM81NzJ4V/DGq3rwml8RPFT7WREYpQqgCX2+rfFxp0bcNR5uo28CGWETp88uw==
X-Received: by 2002:aca:3c56:: with SMTP id j83mr17804363oia.52.1584975477679;
        Mon, 23 Mar 2020 07:57:57 -0700 (PDT)
Received: from [192.168.1.120] (cpe-24-31-245-230.kc.res.rr.com. [24.31.245.230])
        by smtp.gmail.com with ESMTPSA id 186sm36978ooi.30.2020.03.23.07.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2020 07:57:56 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH] rtlwifi: v88 firmware files for rtl8192cu
List-Id: <linux-firmware.lore.kernel.org>
To: Reto Schneider <code@reto-schneider.ch>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org
References: <20200323024500.4090-1-code@reto-schneider.ch>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <83f99512-ac72-642e-e336-c2cdce62634c@lwfinger.net>
Date: Mon, 23 Mar 2020 09:57:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200323024500.4090-1-code@reto-schneider.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/22/20 9:45 PM, Reto Schneider wrote:
> The vendor driver v4.0.1_6911.20130308 includes new firmware files.
> These were extracted from data statements in that driver to form these
> files.
> 
> Signed-off-by: Reto Schneider <code@reto-schneider.ch>
> ---
>   WHENCE                       |  20 ++++++++++++++++++--
>   rtlwifi/rtl8192cufw_A.bin    | Bin 16116 -> 16126 bytes
>   rtlwifi/rtl8192cufw_B.bin    | Bin 16096 -> 16096 bytes
>   rtlwifi/rtl8192cufw_TMSC.bin | Bin 16116 -> 16126 bytes
>   4 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/WHENCE b/WHENCE
> index 6265e03..d5bde95 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2738,14 +2738,30 @@ Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
>   
>   --------------------------------------------------------------------------
>   
> -Driver: rtl8192cu - Realtek 802.11n WLAN driver for RTL8192CU
> +Driver: rtl8192cu - Realtek 802.11n WLAN driver for RTL8192CU (fallback)
>   
>   File: rtlwifi/rtl8192cufw.bin
> +
> +Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
> +
> +--------------------------------------------------------------------------
> +
> +Driver: rtl8192cu - Realtek 802.11n WLAN driver for RTL8192CU
> +
>   File: rtlwifi/rtl8192cufw_A.bin
>   File: rtlwifi/rtl8192cufw_B.bin
>   File: rtlwifi/rtl8192cufw_TMSC.bin
> +Info: From Vendor's rtl8188C_8192C_usb_linux_v4.0.1_6911.20130308 driver
> +      All files extracted from driver/hal/rtl8192c/usb/Hal8192CUHWImg.c
> +      Relevant variables (CONFIG_BT_COEXISTENCE not set):
> +        - rtlwifi/rtl8192cufw_A.bin: Rtl8192CUFwUMCACutImgArray
> +        - rtlwifi/rtl8192cufw_B.bin: Rtl8192CUFwUMCBCutImgArray
> +        - rtlwifi/rtl8192cufw_TMSC.bin: Rtl8192CUFwTSMCImgArray
>   
> -Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
> +Licence: Allegedly GPLv2, but no source visible.

No, do not change this line. The firmware is NOT GPLv2; however, it can be 
redistributed as LICENCE.rtlwiifi says.

NACK.

Larry
