Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A480BC54F30
	for <linux-firmware@archiver.kernel.org>; Tue, 27 May 2025 13:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77B9DC4CEF1; Tue, 27 May 2025 13:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6188EC4CEEF
	for <linux-firmware@kernel.org>; Tue, 27 May 2025 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748352862;
	bh=slUeHAaHejORucO73I8fuosvdKitZLRDYrHi5DvQI4Q=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KgPLlDJJXrw0zNIm4vqBW+SZKIr9IzZl64LkVPKFogGbrtgWx0jWzIgUdmPj8FzBL
	 1X6rhKh+TYX3Gw/7a1oiFgbi1HXeJAreklfLS3PqrFoqNI2ocCxcC5J+0c/GE2+3Us
	 JLYELcE6cQUv4d+LomamlpVz2jNEPYzrivffJf0SyZxrAmpP6YD+MFDPqpEfRwiVVm
	 dHOT5Xw5JF+FxVQcts7px/aBOng3mQm7TUt9b7GJOAyNgi1aHPNjCIqWQ1ABUhuOBn
	 R1aFbTYUoJkYhqEQ07v/6ujZv/UcOBtXidcNvhvs2BymhCAZu3k3Cx+V/rUnkwept3
	 +d/V0rVOpL/yQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e3e0415a7so21858617b3.0
        for <linux-firmware@kernel.org>; Tue, 27 May 2025 06:34:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YwYQ1Yjfc9AxQeHNFHwISOlwjbEp0HKjxQbVWguUHe77CFdQw0s
	0glTe9yL1MeXo3wV3GTBxLoafNSbR4um5Tyqe3tJp5FEM02r2ucnX/IekoYRGFMhBwC82HLe5tB
	YtXNdUKQe4fcta55YgJC/AD2gF3STovk=
X-Google-Smtp-Source: AGHT+IEdlVYBvyXloh4pXUj4c18L98mDIBr7Dgc5vW4wgV0zWpl3hGM88VdXlDfK/q+WgM2oxPIdT0+xP7NjL7scsww=
X-Received: by 2002:a05:690c:630e:b0:70e:2173:6f98 with SMTP id
 00721157ae682-70e8331f747mr9184127b3.6.1748352861566; Tue, 27 May 2025
 06:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250525131522.965580-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250525131522.965580-1-martin.blumenstingl@googlemail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 27 May 2025 09:34:10 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6v-fqDBK31yaPkB1FqMTjVHNy2c=g0aQESeO+9_Jr+OQ@mail.gmail.com>
X-Gm-Features: AX0GCFssQGNkTPet2D-LQrPauahwbn4LzNCHFP4jnBruAt5wXJwSwEdSAPLiBYk
Message-ID: <CA+5PVA6v-fqDBK31yaPkB1FqMTjVHNy2c=g0aQESeO+9_Jr+OQ@mail.gmail.com>
Subject: Re: [PATCH] brcm: Add symlinks for Khadas VIM SDIO wifi config to AW-CM256SM.txt
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 9:16=E2=80=AFAM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Khadas VIM (1 - the original one) uses an Ampak AP6212 SDIO wifi /
> UART Bluetooth combo module. The SDIO wifi config matches
> brcmfmac43455-sdio.AW-CM256SM.txt apart from the comments. Add a symlink
> so the wifi part is supported out-of-the-box, without users having to
> add symlinks on their own.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/562

josh

> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index 93f849c..2649c97 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3087,6 +3087,7 @@ Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brc=
mfmac4356-sdio.AP6356S.txt
>  Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP63=
56S.txt
>  File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
>  Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac=
43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.brcmfmac43455-sdio.khadas,vim.txt -> brcmf=
mac43455-sdio.AW-CM256SM.txt
>  Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-s=
dio.AW-CM256SM.txt
>  Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt -> brcmfmac43455-=
sdio.AW-CM256SM.txt
>  Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt -> brcmfmac43455-=
sdio.AW-CM256SM.txt
> --
> 2.49.0
>
