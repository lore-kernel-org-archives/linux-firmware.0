Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD5BC433E0
	for <linux-firmware@archiver.kernel.org>; Sat,  9 Jan 2021 12:33:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F107A23A3C; Sat,  9 Jan 2021 12:32:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAE63235DD
	for <linux-firmware@kernel.org>; Sat,  9 Jan 2021 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610195579;
	bh=Xe5tyDyMXSZ+LkdVk/ka+tGq7PCmqEhmBWo/7r9+CQU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LZUmQQAFLVtBlY9CCayt/nPw5Z4v1UlI76qXB1couKTFtzAuA0kEXK+RfqjFjY8I1
	 i02cod8D1wUEGERAOM/IpcbW7e+hjX6vHhAohXBgQ/MR/WdQ5ZPjEuhETg1I0ZRgVm
	 1ilXwak/4DqsLWGDb3fUtcgO+0dY8hv+ZywHZv8LXNvd+hJgJy/iVq25M7ohyCE+3X
	 hDVG3qyAghjHm2UZC11J6dMdMFmVAVwWz34d/T54fvtxOeQdM/1+JhqMp3eXTmudUX
	 7ArICOUli2h2NvXYm3VhcRUJsocfUyFcdPT5ijbu4lzQbixbVm4KFKOZlHm4g+1A3/
	 emlra3QBhaIIQ==
Received: by mail-io1-f48.google.com with SMTP id m23so12712386ioy.2
        for <linux-firmware@kernel.org>; Sat, 09 Jan 2021 04:32:59 -0800 (PST)
X-Gm-Message-State: AOAM530TQCxAVcoc2pw/p3O3IEQR2krh89pfz66GRhWV4M0I5j9rg0b/
	iHM5YbNkSfYfC7OFXfqqGUmdDRy+lS4p5PnxRz8=
X-Google-Smtp-Source: ABdhPJwUPSxrL6b5e6zVwb0qiUh5Y3yjmGZWt8z/uf9bQF+dS6Twyg64hx6n6yFBuxQ1fPC1ulkuYhdsp/B7QCfXb64=
X-Received: by 2002:a02:b607:: with SMTP id h7mr7623155jam.120.1610195579374;
 Sat, 09 Jan 2021 04:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20210108100029.715329-1-pbrobinson@gmail.com>
In-Reply-To: <20210108100029.715329-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sat, 9 Jan 2021 07:32:48 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7osJRckrLHM9szEpG-Fwr9LsPr7wibaBRb6d-sZB_FRQ@mail.gmail.com>
Message-ID: <CA+5PVA7osJRckrLHM9szEpG-Fwr9LsPr7wibaBRb6d-sZB_FRQ@mail.gmail.com>
Subject: Re: [PATCH] brcm: Update Raspberry Pi 3B+/4B NVRAM for downstream changes
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Matthias Brugger <mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 5:00 AM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The Raspberry Pi Foundation NVRAM files have been updated for a new
> BT/WiFi coexistence parameter for firmwares newer than 177, now
> we have new firmwares (7.45.221) from Cypress for the BCM43455
> update the NVRAM for these parameters.
>
> Update the RPi4B NVRAM boardflags3 parameter to match too, which
> also happens to be what we already have for the RPi3B+.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Matthias Brugger <mbrugger@suse.com>

Applied and pushed out.

josh

> ---
>  brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt | 1 +
>  brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt      | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt b/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
> index ba94f54..e8d6b19 100644
> --- a/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
> +++ b/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
> @@ -13,6 +13,7 @@ boardtype=0x6e4
>  btc_mode=1
>  btc_params1=0x7530
>  btc_params8=0x4e20
> +btc_params50=0x972c
>  cbfilttype=1
>  cckPwrIdxCorr=3
>  cckTssiDelay=150
> diff --git a/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt b/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> index 425d293..d5bd530 100644
> --- a/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> +++ b/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> @@ -7,12 +7,13 @@ aa5g=1
>  AvVmid_c0=1,165,2,100,2,100,2,100,2,100
>  boardflags=0x00480201
>  boardflags2=0x40800000
> -boardflags3=0x44200100
> +boardflags3=0x48200100
>  boardrev=0x1304
>  boardtype=0x6e4
>  btc_mode=1
>  btc_params1=0x7530
>  btc_params8=0x4e20
> +btc_params50=0x972c
>  cbfilttype=1
>  cckPwrIdxCorr=3
>  cckTssiDelay=150
> --
> 2.29.2
>
