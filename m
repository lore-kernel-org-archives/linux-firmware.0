Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE22C433EF
	for <linux-firmware@archiver.kernel.org>; Tue,  5 Jul 2022 16:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E0DFC341CA; Tue,  5 Jul 2022 16:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63287C341C7
	for <linux-firmware@kernel.org>; Tue,  5 Jul 2022 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657038963;
	bh=zDoNy6lR86Krkud6XFe0JAnh4/JwyiewIF1cvywU9OU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=h1aUw4OtnLxeW3jqKhG4j6DL+6upiFvb5rgPyLVvgWaEnRSci74WermtzfmF2rmop
	 22ZkyJd8zkxsWmktRFfgELyPpWMNbYii35MGLGCQe7k5E7n9SAwZzwulsvmTwrqce7
	 NorNmdwPblf6u8MhCd2zWrP72Kpb/nXmOS77ysKaROt7CeEXL9cBplL9y7DqdcWcQl
	 25LJEGmbWBiR98suF1+nvbRvF8+zWBxz18qjtxrgDT0rKW4tduuXYNguc2cN/dMsQd
	 eour1Njk8OVBBAJMToRDh3RrxLieuGXD+/LcQafmYzGBgXNZCc+XSjJu2YZEJ/XD/1
	 kNSsDILe9t0TQ==
Received: by mail-io1-f54.google.com with SMTP id z191so11619866iof.6
        for <linux-firmware@kernel.org>; Tue, 05 Jul 2022 09:36:03 -0700 (PDT)
X-Gm-Message-State: AJIora++PFJgGESXU9jWPlwE5Cnqw6MT/cCfbpK+WG8OgYIy76DhZzKd
	VnZLDqwCpszV3v6DRkuY0BVNlxGUnpxvInRsZOg=
X-Google-Smtp-Source: AGRyM1ughpEL1fuu/78JzlcZwyHBI3X+ESPwlEZGXIbVkcVoY70ExsqOr60ZAMX5RMOhZ20QxY37Mxqt1E1T8ou6Tq8=
X-Received: by 2002:a05:6602:26d1:b0:669:734a:4c8a with SMTP id
 g17-20020a05660226d100b00669734a4c8amr19248178ioo.209.1657038962273; Tue, 05
 Jul 2022 09:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220703220018.668000-1-pbrobinson@gmail.com>
In-Reply-To: <20220703220018.668000-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 5 Jul 2022 12:35:51 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5vvgLr2UwiFrsTctx12DdkLz-CDf=0rnZ1kQALVsb-Dg@mail.gmail.com>
Message-ID: <CA+5PVA5vvgLr2UwiFrsTctx12DdkLz-CDf=0rnZ1kQALVsb-Dg@mail.gmail.com>
Subject: Re: [PATCH] drop Token Ring network firmwares
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Sun, Jul 3, 2022 at 6:00 PM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The last vestigates of the token ring network stack were dropped
> in linux commit ee446fd5e6da over 10 years ago so drop the now
> obsolete associated firmware.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  3com/3C359.bin | Bin 24880 -> 0 bytes
>  WHENCE         |  40 ----------------------------------------
>  tr_smctr.bin   | Bin 7614 -> 0 bytes
>  3 files changed, 40 deletions(-)
>  delete mode 100644 3com/3C359.bin
>  delete mode 100644 tr_smctr.bin
>
> diff --git a/3com/3C359.bin b/3com/3C359.bin
> deleted file mode 100644
> index b132989cb8ac58eefd101293afb1415f11a14e48..0000000000000000000000000000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>
> literal 24880
> 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
> E04uJhOaK4?
>
> diff --git a/WHENCE b/WHENCE
> index 8ac1450..57cc043 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -95,20 +95,6 @@ Licence: Redistributable. See LICENCE.qla1280 for details
>
>  --------------------------------------------------------------------------
>
> -Driver: smctr -- SMC ISA/MCA Token Ring adapter
> -
> -File: tr_smctr.bin
> -Version: 6.3C1
> -Info: MCT.BIN v6.3C1 03/01/95
> -
> -Original licence info:
> -
> - * This firmware is licensed to you strictly for use in conjunction
> - * with the use of SMC TokenRing adapters. There is no waranty
> - * expressed or implied about its fitness for any purpose.
> -
> ---------------------------------------------------------------------------
> -
>  Driver: kaweth -- USB KLSI KL5USB101-based Ethernet device
>
>  File: kaweth/new_code.bin
> @@ -1383,32 +1369,6 @@ Found in hex form in kernel source.
>
>  --------------------------------------------------------------------------
>
> -Driver: 3c359 - 3Com 3C359 Token Link Velocity XL adapter
> -
> -File: 3com/3C359.bin
> -
> -Licence:
> -/*
> - * The firmware this driver downloads into the tokenring card is a
> - * separate program and is not GPL'd source code, even though the Linux
> - * side driver and the routine that loads this data into the card are.
> - *
> - * This firmware is licensed to you strictly for use in conjunction
> - * with the use of 3Com 3C359 TokenRing adapters. There is no
> - * waranty expressed or implied about its fitness for any purpose.
> - */
> -/* 3c359_microcode.mac: 3Com 3C359 Tokenring microcode.
> - *
> - * Notes:
> - *  - Loaded from xl_init upon adapter initialization.
> - *
> - * Available from 3Com as part of their standard 3C359 driver.
> - */
> -
> -Found in hex form in kernel source.
> -
> ---------------------------------------------------------------------------
> -
>  Driver: pcnet_cs - NE2000 compatible PCMCIA adapter
>
>  File: cis/LA-PCM.cis
> diff --git a/tr_smctr.bin b/tr_smctr.bin
> deleted file mode 100644
> index 23d843c05934dfd2ecac8eaf63c5c11b5c93e18c..0000000000000000000000000000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>
> literal 7614
> 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
>
> --
> 2.36.1
>
