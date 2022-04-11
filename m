Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21B2C433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Apr 2022 11:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB53AC385A3; Mon, 11 Apr 2022 11:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEEDBC385A5
	for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 11:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649675459;
	bh=ZJ9wvmlGM9bYBS3LD7RRDUj5xyTY7Senc6UzL2g4w4c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VYe0LdzjCGqWPANQKlbuur52EUsOFLRj2vKm7KG3DhyWwkbOBvweV1h5HtBeGG/wE
	 rayyYQDWY50LomSwO0c7VJxpjyhyjQJHy1kAimUGJy+cxi237vaiFWKrzZcoR3pCbm
	 D7MV+/+DqWzHrL4RQvDtPga/W75ut9qfJ4kglbBChcbYO+ElJJP+c0MQsznOanVJKc
	 M5JA6zrsu6Sf94oe4dQK0/WuCUTk0wNyya2hzNDj8jUb8H23g6vh3+CuaDOB+R9LIi
	 ARHfzxPRdaV/mfzjSvse1r7jXbB+XReenchANFE0E6gmU6t76jcf3GOSuJCw/bQv/F
	 gzNhOfKSH07YQ==
Received: by mail-io1-f46.google.com with SMTP id p21so18243802ioj.4
        for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 04:10:59 -0700 (PDT)
X-Gm-Message-State: AOAM532QC5yuuxqYhcMXe5Zl+6mY9GQzUR9tFK1VnvuXZ9jVYaxfguPw
	Ufn71eZCKiIDa7swUycypJBY7TBOIh+DG0j1zMA=
X-Google-Smtp-Source: ABdhPJwIChMEsBOPrGBrgG03pcpriLh+3mT44SGQWx2OjlboD+/cbaKWbvIFybkYKjSriaAEa+HIOfdXi5aix4muXMc=
X-Received: by 2002:a05:6638:2642:b0:323:756f:42a7 with SMTP id
 n2-20020a056638264200b00323756f42a7mr15487545jat.145.1649675458826; Mon, 11
 Apr 2022 04:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220403161934.979471-1-pbrobinson@gmail.com>
In-Reply-To: <20220403161934.979471-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 11 Apr 2022 07:10:48 -0400
X-Gmail-Original-Message-ID: <CA+5PVA44zexFxeyM6b4+O-PaYHoc6u-R9qM_NxWjKtrdVzr-4w@mail.gmail.com>
Message-ID: <CA+5PVA44zexFxeyM6b4+O-PaYHoc6u-R9qM_NxWjKtrdVzr-4w@mail.gmail.com>
Subject: Re: [PATCH] brcm: rename Rock960 NVRAM to AP6356S and link devices to it
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 3, 2022 at 12:19 PM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The Rock960, VIM2 and Firefly3399 all have a AP6356S WiFi module
> and their NVRAM all appear to be the same so call the NVRAM after
> the AP module and link the 3 devices to that to make it clear.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Applied and pushed out.

josh

> ---
>  WHENCE                                                      | 6 ++++--
>  ...sdio.vamrs,rock960.txt => brcmfmac4356-sdio.AP6356S.txt} | 0
>  2 files changed, 4 insertions(+), 2 deletions(-)
>  rename brcm/{brcmfmac4356-sdio.vamrs,rock960.txt => brcmfmac4356-sdio.AP6356S.txt} (100%)
>
> diff --git a/WHENCE b/WHENCE
> index 8f37cc3..b0d423a 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3012,8 +3012,10 @@ Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\
>  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
>  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
> -File: brcm/brcmfmac4356-sdio.vamrs,rock960.txt
> -Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.vamrs,rock960.txt
> +File: brcm/brcmfmac4356-sdio.AP6356S.txt
> +Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6356S.txt
> +Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
> +Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
>
>  Licence: GPLv2. See GPL-2 for details.
>
> diff --git a/brcm/brcmfmac4356-sdio.vamrs,rock960.txt b/brcm/brcmfmac4356-sdio.AP6356S.txt
> similarity index 100%
> rename from brcm/brcmfmac4356-sdio.vamrs,rock960.txt
> rename to brcm/brcmfmac4356-sdio.AP6356S.txt
> --
> 2.35.1
>
