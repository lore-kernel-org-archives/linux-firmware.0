Return-Path: <SRS0=Pkw9=GL=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D53C433DB
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Jan 2021 23:35:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EC51723AA7; Fri,  8 Jan 2021 23:35:28 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F3D923A9B;
	Fri,  8 Jan 2021 23:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F3D923A9B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-ej1-f41.google.com with SMTP id g20so16811026ejb.1;
        Fri, 08 Jan 2021 15:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5NPGtpLfOsxC7zG8DMWlaeHD3KJMnJLiajuzRCHX4GI=;
        b=YBuee/UB9eni9vUScyHoakm64jotyyHS4ze+fO0Vi42IjCvPIUcYd/k/OgzLxm7p5v
         00Dhno0QgMI1QlHobqr9EFdsVoQX2GHevjc2svFYavPms7vGBpmYR7YhQvERTHuiapX8
         pY0phG9nMh8D9IzY7rOWY79OuZW6H4Wbx6Mm6/QQaAYdRgirvUllUVS8yYs/Y275m4jc
         9S9pJc1vcFOa2edPqOHc1o4OkOahxpGen9R6JwC+pG2Yv//KinnjMne9jkhGNxLjLEFo
         EQOUfUFyynHdVAQqEYc4EjLikmdg+PJ5nKAAr3XUadqhhlvAgwPbiGWgHRPbVYnaG4W6
         GGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5NPGtpLfOsxC7zG8DMWlaeHD3KJMnJLiajuzRCHX4GI=;
        b=dsqoo8u4QpJVJmcUULdiJNPzA7qi03YFVAHi3AKl07U1C4f+kL+UHJQOetHEryjO67
         tg8+bTFmDnK0EPRMCm9uS/tYI/bUah9/HNzGfbU5tNt2OFf+rpmMsRsb3mkh7FBaT/CE
         7BVXA5pLm/OF/KqHB18ns1uUQvRSTLsi62/rQSEbSa97hCFHrh4ZRhRCTh1FDAwt3tKC
         nrLTkMqK8Gm8koNsfFNTWwJWr3rdz8vzQtRL6CuI4r+VG5Nv/dS86MyK+tSRgdK33dMG
         N7ediJacNc9Q363NMwtmRXPtHMpZj1nvie8N1Wn6GwZEKpp1XU+jHNN2tXPmcXCGVio/
         AIlQ==
X-Gm-Message-State: AOAM532dFAelpdyRpObrgFjSaDlCTP0NMoInTviLBaCPncVggwF67G8B
	sYjzyaVOfRqG+FxJU/IFiAF+u5T2+XatXRUabUvvw5LpH1c=
X-Google-Smtp-Source: ABdhPJyqRj6+CYRy61M9Q3I+PWaE5q8VtrFEjOhIss8Pa09Se35HCf2TIjZ8rjQzh9qwbE4a9BBJiBytM2GrODjomMI=
X-Received: by 2002:a17:907:da7:: with SMTP id go39mr4320945ejc.58.1610148927075;
 Fri, 08 Jan 2021 15:35:27 -0800 (PST)
MIME-Version: 1.0
References: <20210108204916.1724298-1-jeremy.linton@arm.com>
In-Reply-To: <20210108204916.1724298-1-jeremy.linton@arm.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 8 Jan 2021 23:35:15 +0000
Message-ID: <CALeDE9M4YZc9Wga5DvUebr4bgM8z3E-Aa7V-WoKxy01GfkaCSw@mail.gmail.com>
Subject: Re: [PATCH] brcm: Link rpi4's wifi with newer DMI string
To: Jeremy Linton <jeremy.linton@arm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Hans de Goede <hdegoede@redhat.com>, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 8:49 PM Jeremy Linton <jeremy.linton@arm.com> wrote:
>
> The rpi4 when booted with a full featured
> firmware reports a machine id from SMBIOS/DMI.
> Since that is used to select the firmware we
> need to add a new symlink.

Overall the patch is fine but the commit message is very opinionated
for a wifi firmware support patch. For one it's not a newer DMI string
for Raspberry Pi as all current strings are for device tree and in the
context of supporting WiFi the difference between what ever the
firmware you're referring to when you say "full featured firmware" is
irrelevant and marketing, does that "full featured firmware" support
more features of the wifi chipset than the other variants of firmware?

Except for the commit message:
Reviewed-by: Peter Robinson <pbrobinson@gmail.com>

> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index cbde48d..1f69078 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2711,6 +2711,7 @@ File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> +Link: brcm/brcmfmac43455-sdio.Raspberryi\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
>  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
>
> --
> 2.26.2
>
