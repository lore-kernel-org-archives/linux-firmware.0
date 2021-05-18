Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE67BC433B4
	for <linux-firmware@archiver.kernel.org>; Tue, 18 May 2021 15:05:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A60CC61261; Tue, 18 May 2021 15:05:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DFB86108B
	for <linux-firmware@kernel.org>; Tue, 18 May 2021 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621350302;
	bh=YFEE4065dLLi1xAzDWHNRNG9ADZXIStvC0lAuW3y578=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZDQFV8I5OyiFrZ4zw25sSJhaQTaBnYFBz3PnDK5JJXg39IXPrdNpK5uzaDA/TklmY
	 PAlenwwE7OC+hu6fEzySoZSXQFQ+Dr/i4cJHJF8sv2j0xpMmrVwKCUGT5V/qP9zqTa
	 JbhC1gffqwkco0G1VnPtac3kx/sCRmCsupC43+zih98DQBcYPc3q796Kc/QhE4fSa3
	 Rkzghdw9NRK8RpQ1kc1Eeg52BklQ6ChJ+vsDkAc8KSJC8OZOvEmRL077DPwAN9Yysm
	 Qtv+6Z0taIM0ei04fFemugDWsGBnifDpoa5O2LN6LTS0iT5V/NX/lGI+CbvxRJ+u/X
	 m1ESBfDkT1elA==
Received: by mail-io1-f51.google.com with SMTP id r4so9000560iol.6
        for <linux-firmware@kernel.org>; Tue, 18 May 2021 08:05:02 -0700 (PDT)
X-Gm-Message-State: AOAM533y0d0QV3wpIdt1328o8D56EwoB25AAoiKZn3jDAz85SfXOtK2D
	4z/7v8jIXSY1iTxV++I05HrggZEwtNtDEGCosY0=
X-Google-Smtp-Source: ABdhPJzb0OAN1dgBkiLc2LedAbCVzZvtD2PvYS/GhOAsz/zeLFVXdvFF3ELoB9WM82/bmFSIRp2H14amqEHejbfrhsI=
X-Received: by 2002:a05:6602:3146:: with SMTP id m6mr4616685ioy.158.1621350302039;
 Tue, 18 May 2021 08:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210518063631.5072-1-bskeggs@redhat.com>
In-Reply-To: <20210518063631.5072-1-bskeggs@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 May 2021 11:04:50 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6cjL_G6NKH3vJu71h-cG-oW15P=ac6tefwqhWKNnNVLA@mail.gmail.com>
Message-ID: <CA+5PVA6cjL_G6NKH3vJu71h-cG-oW15P=ac6tefwqhWKNnNVLA@mail.gmail.com>
Subject: Re: [PATCH] nvidia: fix symlinks for tu104/tu106 acr unload firmware
To: Ben Skeggs <bskeggs@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Tue, May 18, 2021 at 2:36 AM Ben Skeggs <bskeggs@redhat.com> wrote:
>
> Bootloader and firmware proper got swapped, resulting in module unload,
> suspend, and runtime suspend issues on affected chipsets.
>
> Fixes: 1487a8abdbac ("linux-firmware: nvidia: move firmware symlinks to WHENCE")
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  WHENCE | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 24106a4..b6e573a 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4722,8 +4722,8 @@ File: nvidia/tu102/sec2/sig.bin
>  Link: nvidia/tu104/acr/bl.bin -> ../../tu102/acr/bl.bin
>  Link: nvidia/tu104/acr/ucode_ahesasc.bin -> ../../tu102/acr/ucode_ahesasc.bin
>  Link: nvidia/tu104/acr/ucode_asb.bin -> ../../tu102/acr/ucode_asb.bin
> -Link: nvidia/tu104/acr/unload_bl.bin -> ../../tu102/acr/ucode_unload.bin
> -Link: nvidia/tu104/acr/ucode_unload.bin -> ../../tu102/acr/unload_bl.bin
> +Link: nvidia/tu104/acr/unload_bl.bin -> ../../tu102/acr/unload_bl.bin
> +Link: nvidia/tu104/acr/ucode_unload.bin -> ../../tu102/acr/ucode_unload.bin
>  Link: nvidia/tu104/gr/fecs_bl.bin -> ../../tu102/gr/fecs_bl.bin
>  File: nvidia/tu104/gr/fecs_data.bin
>  File: nvidia/tu104/gr/fecs_inst.bin
> @@ -4744,8 +4744,8 @@ Link: nvidia/tu104/sec2/sig.bin -> ../../tu102/sec2/sig.bin
>  Link: nvidia/tu106/acr/bl.bin -> ../../tu102/acr/bl.bin
>  Link: nvidia/tu106/acr/ucode_ahesasc.bin -> ../../tu102/acr/ucode_ahesasc.bin
>  Link: nvidia/tu106/acr/ucode_asb.bin -> ../../tu102/acr/ucode_asb.bin
> -Link: nvidia/tu106/acr/unload_bl.bin -> ../../tu102/acr/ucode_unload.bin
> -Link: nvidia/tu106/acr/ucode_unload.bin -> ../../tu102/acr/unload_bl.bin
> +Link: nvidia/tu106/acr/unload_bl.bin -> ../../tu102/acr/unload_bl.bin
> +Link: nvidia/tu106/acr/ucode_unload.bin -> ../../tu102/acr/ucode_unload.bin
>  Link: nvidia/tu106/gr/fecs_bl.bin -> ../../tu102/gr/fecs_bl.bin
>  File: nvidia/tu106/gr/fecs_data.bin
>  File: nvidia/tu106/gr/fecs_inst.bin
> --
> 2.31.1
>
