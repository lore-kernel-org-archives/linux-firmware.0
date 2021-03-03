Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B636C433DB
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Mar 2021 18:24:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4F64864EF8; Wed,  3 Mar 2021 18:24:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D34D64EF6;
	Wed,  3 Mar 2021 18:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614795878;
	bh=kNYPkNz/o4YKQ9RMOJvSgvlHg8WT5GMa03WfRCvWzxM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Utk2KjqOnERjKYTU+rkPd1nz+Ayz0XwYOObdIhJsNqAFWA4krmOXYLHzXWc+0sofe
	 VCuVSbg7usaLy40vNqS73WdpheWZv48NPH1QJr9yr3y6O0ELamhVfiu+9aG0NFbeYh
	 n2Y2AEqwxl1Nt36dZGbkjMgk1cq4hT6s32f/Hgsxa2c1mhlsfMt+2IK38kK3+Di5Wv
	 T5c2/4Bx3SSUYTrbW4OmdcwidiQv+9/4XCEuSWyuaXpDFgd+ywui8rbqGQzVWcHCid
	 74WNdfeiRCrv5/tyEweuVRLT/fPRlsnf63s3vrrsVfIP7Mrxv5I5YfitEEj9+MDnmF
	 zCje5dypdwFnw==
Received: by mail-il1-f174.google.com with SMTP id v14so11104957ilj.11;
        Wed, 03 Mar 2021 10:24:38 -0800 (PST)
X-Gm-Message-State: AOAM531eArm3lce4pm5X3v6OiRkDgsMaadmUegA7Fg9W/0SByJw7rYof
	PifWTiEtf3M8I9bO9RxCI6eCbX0aDSShGk/BdqY=
X-Google-Smtp-Source: ABdhPJzq4HXKG7eV/FeZ/r6zkATVDQ1xJfmRIIDml7QLcfJHAdp3vqf9I1RnW/nPtgi3UeRob6OxFWWogW0WwEnE9uE=
X-Received: by 2002:a92:d8d1:: with SMTP id l17mr534964ilo.85.1614795877441;
 Wed, 03 Mar 2021 10:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20210216193523.32321-1-matthias.bgg@kernel.org>
In-Reply-To: <20210216193523.32321-1-matthias.bgg@kernel.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 3 Mar 2021 13:24:25 -0500
X-Gmail-Original-Message-ID: <CA+5PVA59eD=R0W1UZFBSo5AVPCE9X35BGCjY0nDNYNs63A336A@mail.gmail.com>
Message-ID: <CA+5PVA59eD=R0W1UZFBSo5AVPCE9X35BGCjY0nDNYNs63A336A@mail.gmail.com>
Subject: Re: [PATCH] brcm: Fix Raspberry Pi 4B NVRAM file
To: matthias.bgg@kernel.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, ruud@veniogames.com, 
	Peter Robinson <pbrobinson@gmail.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, 
	Matthias Brugger <mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Tue, Feb 16, 2021 at 2:35 PM <matthias.bgg@kernel.org> wrote:
>
> From: Matthias Brugger <mbrugger@suse.com>
>
> NVRAM file set's boarflags3 to 0x48200100 which indicates the firmware
> that an external LPO is present. But on the RPi4 no external LPO exists.
>
> Fixes: 870b805 ("brcm: Update Raspberry Pi 3B+/4B NVRAM for downstream changes")
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt b/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> index d5bd530..8dda168 100644
> --- a/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> +++ b/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> @@ -7,7 +7,7 @@ aa5g=1
>  AvVmid_c0=1,165,2,100,2,100,2,100,2,100
>  boardflags=0x00480201
>  boardflags2=0x40800000
> -boardflags3=0x48200100
> +boardflags3=0x44200100
>  boardrev=0x1304
>  boardtype=0x6e4
>  btc_mode=1
> --
> 2.30.0
>
