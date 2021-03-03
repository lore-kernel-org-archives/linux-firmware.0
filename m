Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D2EC433E0
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Mar 2021 18:25:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A09B364EF1; Wed,  3 Mar 2021 18:25:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75A1164EF6
	for <linux-firmware@kernel.org>; Wed,  3 Mar 2021 18:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614795958;
	bh=Jl0wdyiVjpN6eQvIiFoWWaYxX3h9r0fGnKKMNp3XqDU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Giyx/vLhnZT3CFYApgs48nYqiogzFN6xTm4BxLLu41C0n0Wg3J+B7fzaoFq4jj+r5
	 DwqrA+hCLCj/hURwvXExOscWPnXPTTr//TAeHBMWrFOrTQm2Kxn0eAytOvyP17Bopi
	 3wCt8MXyNcyDW6aXkVz1y1WeeA/ZZ+LeCgZMbkheZ0iJdFed4XnoJf45vm3H/Hrt8A
	 +Soc5yj82isrMbmOyJ8fqemaVwmUTRdOc2vyRPsME/8t+EsxQ0VhWIBGBOJt29fl7d
	 Z9YvqIRdETm8thNQJJYjh50GhAX4MZOaYTDNxKlMXEAILHsDB++MQcIzfrUbtBbF4m
	 mBq0zlYHSeJOQ==
Received: by mail-io1-f51.google.com with SMTP id 81so23135505iou.11
        for <linux-firmware@kernel.org>; Wed, 03 Mar 2021 10:25:58 -0800 (PST)
X-Gm-Message-State: AOAM531hbxTJkaIktVQr2Q/pS758wDzlqgG6g4YttjuQAfwnzaRQbfpe
	odTEQIVYhy67GtzbnoOrvvSGGBdnnb0tU+DGels=
X-Google-Smtp-Source: ABdhPJxHtP5QBtejBfRUy4LJYF/eGCGlEuee5I9xYsHCn175ddnCDdrCOx0lVfuF1PpH4ebFCaPsn6kv0/NWmSFfhLs=
X-Received: by 2002:a5d:9501:: with SMTP id d1mr354693iom.159.1614795957821;
 Wed, 03 Mar 2021 10:25:57 -0800 (PST)
MIME-Version: 1.0
References: <cbcb1fabd3a005142216213ca67c1a1664b7958a.camel@gmail.com>
 <YCtw7RaNEyod8mxb@photino.stro.at> <6fe1da22eb783f020de8bfa3b9f2b1457e593a4b.camel@gmail.com>
 <YCwShdDfEI8Fzidn@photino.stro.at> <YDQg9nkcyzzdljno@photino.stro.at>
In-Reply-To: <YDQg9nkcyzzdljno@photino.stro.at>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 3 Mar 2021 13:25:46 -0500
X-Gmail-Original-Message-ID: <CA+5PVA59VxknE=+2zVC-qOmQ_jQ8k7iWbSwCJyPAB7u8tYJeaA@mail.gmail.com>
Message-ID: <CA+5PVA59VxknE=+2zVC-qOmQ_jQ8k7iWbSwCJyPAB7u8tYJeaA@mail.gmail.com>
Subject: Re: Bug#982579: Solution for loading firmware
To: maximilian attems <maks@stro.at>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 982579@bugs.debian.org, 
	Bernhard <bewoern1@gmail.com>, vagrant@debian.org
Content-Type: text/plain; charset="UTF-8"

Both patches applied and pushed out.

In the future, could you please send the patches either as direct
emails or as attachments or as pull requests?  When you embed them in
the body of the email I have to manually adjust them to get the commit
log properly included.

josh

On Mon, Feb 22, 2021 at 4:24 PM maximilian attems <maks@stro.at> wrote:
>
> please also add BananaPi M3 support.
>
>
> From 216a0bda280e7b361c335f545156e86a059d9551 Mon Sep 17 00:00:00 2001
> From: maximilian attems <maks@stro.at>
> Date: Mon, 22 Feb 2021 22:18:36 +0100
> Subject: [PATCH 2/2] WHENCE: add missing symlink for BananaPi M3
>
> Fixes (Debian bug #982579):
> > [   11.957171] brcmfmac mmc2:0001:1: firmware: failed to load
> brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt (-2)
> > [   11.967106] firmware_class: See https://wiki.debian.org/Firmware for
> information about missing firmware
> > [   11.977035] brcmfmac mmc2:0001:1: firmware: failed to load
> brcm/brcmfmac43430-sdio.txt (-2)
> > [   12.994756] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl
> 0x50
>
> Reported-by: Bernhard <bewoern1@gmail.com>
> Signed-off-by: maximilian attems <maks@stro.at>
> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index 11c0970..b569990 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2717,6 +2717,7 @@ File: "brcm/brcmfmac43430-sdio.AP6212.txt"
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-plus.txt -> brcmfmac43430-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
> +Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.txt
>  File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
>  File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
> --
> 2.30.0
>
