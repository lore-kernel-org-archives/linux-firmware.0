Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EECCCA479
	for <linux-firmware@archiver.kernel.org>; Mon, 18 Jul 2022 11:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27F07C341CE; Mon, 18 Jul 2022 11:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1249BC341CF
	for <linux-firmware@kernel.org>; Mon, 18 Jul 2022 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658142868;
	bh=uC9Kul7WDB4dlgqZ8b9DQk4hJt3NKsATpceUDBGJOxo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=aKlNHzHryGHwvscxCBBNZYjMFQzo4ux4EVIWBC/7C0+I+9NzowOaePrvJqVZgSIEO
	 smZ98S0p9hxtRmfpWaGTCVKVJ1CFzDs+cCIG9zEuvEewoTJoPwbNy80EXAtNzNSkLn
	 6pX/hXDTo/5i9W5s498rcDhiCvozhIZyHlF/lzcU6dhDUmB4Wd2OvhGM3XkpUw+A1v
	 2RiLletJIPRGCoOe94I0tvVr7lph/cVOJ+F5iLGo87frwjoV0BSD46p1tnsm5Ib1j4
	 ZKxm8tCLtkF93uZomeXPBNAG9gXpgntA+VxhIeWxkiXh6X44dYsaYirO1kdc8O04WA
	 xRa9GSsRL0U1g==
Received: by mail-io1-f42.google.com with SMTP id q14so8895113iod.3
        for <linux-firmware@kernel.org>; Mon, 18 Jul 2022 04:14:27 -0700 (PDT)
X-Gm-Message-State: AJIora/WU1Ka9Yhw7dKoeeEKeEOwEA2QpaJVNVUkNnkwf/Cg22QAXFiT
	8N4alvpiLmINI2fMvKx7RLKsZtwXKmtw3h1W3xk=
X-Google-Smtp-Source: AGRyM1vLg0+iIIeQ1X3CBuC6LEulGeCds+unxFBTWYQSD50JiUfaO7UVosrP1Eu3l5Vmp25mu6m42p3BQMYaX41PEPM=
X-Received: by 2002:a05:6638:d93:b0:341:5cab:4d9 with SMTP id
 l19-20020a0566380d9300b003415cab04d9mr5056207jaj.146.1658142867216; Mon, 18
 Jul 2022 04:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220717160656.2151872-1-pbrobinson@gmail.com>
In-Reply-To: <20220717160656.2151872-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 18 Jul 2022 07:14:16 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4GaO3OGR3tOsh8XaOaFSbYtWS2imEa4qeJ6=40UAaVVA@mail.gmail.com>
Message-ID: <CA+5PVA4GaO3OGR3tOsh8XaOaFSbYtWS2imEa4qeJ6=40UAaVVA@mail.gmail.com>
Subject: Re: [PATCH] WHENCE: Fix the dangling symlinks fix
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 17, 2022 at 12:07 PM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The directories were incorrect when creating the links. Fix
> them so they end up in the right location.
>
> Fixes: dfa2931 ("WHENCE: Correct dangling symlinks")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>

Sigh.  Clearly we need CI on this project.  Thanks.  Applied and pushed out.

josh

> ---
>  WHENCE | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 14d0a87..545fcd7 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2820,10 +2820,10 @@ Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6
>  Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
>  Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
>  File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> -Link: brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> -Link: brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> -Link: brcmfmac43455-sdio.pine64,pinephone-pro.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> -Link: brcmfmac43455-sdio.pine64,quartz64-b.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
>
>  Licence: GPLv2. See GPL-2 for details.
>
> --
> 2.37.1
>
