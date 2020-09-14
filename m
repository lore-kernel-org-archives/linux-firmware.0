Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9878C433E2
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Sep 2020 12:47:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C722621741; Mon, 14 Sep 2020 12:47:52 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A40B4208DB
	for <linux-firmware@kernel.org>; Mon, 14 Sep 2020 12:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600087672;
	bh=hzW6NtEV7q/qUzLoNFCjSSwTTdTD8Sxgq+hQNsiq52k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=wRrSOe8BPVZEixQAN1proPsA96RTfSGEcLxufVjrb5zIQVa8Mel+cAAImF58XuFyt
	 JJ5SZRrk9ykbsFENO4NmgKJCkGWWZVfsLfqzyKyYDbtXIHbEcB3IUT/DNSLe6hw6KH
	 VrBjjdBD7DFEZS1LMxLtRUkSrQvE3mS4/iXvQYc8=
Received: by mail-il1-f179.google.com with SMTP id f82so11874115ilh.8
        for <linux-firmware@kernel.org>; Mon, 14 Sep 2020 05:47:52 -0700 (PDT)
X-Gm-Message-State: AOAM532NerBXZEX2YiVUsHoaRgTn0hfH8jFuQ2aStuhPrcyUwI2/dC9A
	V1H1tDp64RyFn7vDCS018vuTmmaSRIhm450ZAtM=
X-Google-Smtp-Source: ABdhPJysKx5xzyJR02kVt+ht5GqXkFx3Th1QAy0iI1Pd/lThkZmN4PpxBb6pU8Odss+Y3OGBOhjjIC6dkXlIS0OWn5A=
X-Received: by 2002:a92:1597:: with SMTP id 23mr11918187ilv.206.1600087672117;
 Mon, 14 Sep 2020 05:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200908101656.27835-1-tiwai@suse.de>
In-Reply-To: <20200908101656.27835-1-tiwai@suse.de>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 14 Sep 2020 08:47:41 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5JPBHO3k47bDO3RQ==Yrw-jJqVAVewhmOWYnfO2o7gDQ@mail.gmail.com>
Message-ID: <CA+5PVA5JPBHO3k47bDO3RQ==Yrw-jJqVAVewhmOWYnfO2o7gDQ@mail.gmail.com>
Subject: Re: [PATCH linux-firmware] brcm: Fix a stale symlink for RPi3 model b+
To: Takashi Iwai <tiwai@suse.de>, hpj@urpla.net
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh
On Tue, Sep 8, 2020 at 6:17 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> The symlink for brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
> was wrongly listed with the same subdirectory brcm, and this resulted
> in a stale symlink.  Fix it.
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  WHENCE | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/WHENCE b/WHENCE
> index 4adac39e28eb..f4af5d01e2c8 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2639,7 +2639,7 @@ File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
>  File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
> -Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
> +Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
>  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
>  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
> --
> 2.16.4
>
