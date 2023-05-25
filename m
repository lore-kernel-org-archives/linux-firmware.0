Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1F8C77B7E
	for <linux-firmware@archiver.kernel.org>; Thu, 25 May 2023 12:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4FF2DC433A1; Thu, 25 May 2023 12:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FE2C433A0
	for <linux-firmware@kernel.org>; Thu, 25 May 2023 12:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685017625;
	bh=vUtL/zXdTmrhRn/PDOiVtHOsCdhQzqoKramwgKyiGso=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lhE08vUCHrTcg5YL3l0lDcF/7tFmzd2hHv76K0vEw/iF8qW17jI0FIeypg5Mns1SF
	 QMEXPamioa2/zU/9N3ZSpeXpvqMAgYgG3iqZekZh/atmjrNX8j9lhKjBXrs4C8pSKf
	 8BeOX9HdyK+Mp0Pnm6mkGrK4YhO1lDlkhrGNwFm371mSlIL+T6nP4y4B9sjcwfAx0g
	 DNNcOa13gd7G1xn9xv4CoRSyFfmUcCCfwr3CQ7peTcC51Yi5SaRa4CNXqFJnuCIB29
	 6sFtDg5IBCoz/gVhBnSsDzr5gsBhLhQi9u9Zpypyfk3wDqDlsDFXWZ+pBA5Nz+XSRd
	 Msh8Z8zVAqZCA==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-563b1e5f701so4204677b3.3
        for <linux-firmware@kernel.org>; Thu, 25 May 2023 05:27:05 -0700 (PDT)
X-Gm-Message-State: AC+VfDzN1H0Pc4nw158VVoaakz/2oXvbYAyMTgmaTdOB0jOyKKw8ghy+
	VktwmpZi69yjt402QzqSUrGPlM0eXpsG53MIdjw=
X-Google-Smtp-Source: ACHHUZ6CS4jJGcC/riSlYAdpwb1NlKDcdfORuceMcKu9zJgZklZv6q1p9WFmnDSDZccYhd5NKY4FMFnb2U1OsprWmXQ=
X-Received: by 2002:a81:84c8:0:b0:561:e565:3678 with SMTP id
 u191-20020a8184c8000000b00561e5653678mr16835417ywf.11.1685017624154; Thu, 25
 May 2023 05:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230523151541.179373-1-didi.debian@cknow.org>
In-Reply-To: <20230523151541.179373-1-didi.debian@cknow.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 25 May 2023 08:26:53 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6BjjOg6YShkaiv+DeXrSApOFv81fqDOOth2cYjLd4_pw@mail.gmail.com>
Message-ID: <CA+5PVA6BjjOg6YShkaiv+DeXrSApOFv81fqDOOth2cYjLd4_pw@mail.gmail.com>
Subject: Re: [PATCH] brcm: Add symlinks from Pine64 devices to AW-CM256SM.txt
To: Diederik de Haas <didi.debian@cknow.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Maximilian Weigand <mweigand@mweigand.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Tue, May 23, 2023 at 11:16=E2=80=AFAM Diederik de Haas <didi.debian@ckno=
w.org> wrote:
>
> There are a number of Pine64 devices which all use the same wireless
> chipset, so add symlinks for those modules/(base)boards:
> - Pine64 RockPro64 v2.0 and v2.1 (via adapter board)
> - Pine64 RK3566 Quartz64-A Board (via adapter board)
> - Pine64 PineNote v1.1 and v1.2
> - PINE64 RK3566 SOQuartz on Model A carrier board
> - Pine64 RK3566 SoQuartz with CM4-IO Carrier Board
> - PINE64 RK3566 SOQuartz on Blade carrier board
>
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> Tested-by: Maximilian Weigand <mweigand@mweigand.net>
> ---
>  WHENCE | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index 6762c0bc..07897f04 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2718,8 +2718,16 @@ Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> =
brcmfmac4356-sdio.AP6356S.txt
>  File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
>  Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac=
43455-sdio.AW-CM256SM.txt
>  Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-s=
dio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt -> brcmfmac43455-=
sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt -> brcmfmac43455-=
sdio.AW-CM256SM.txt
>  Link: brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt -> brcmfmac43455-=
sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,quartz64-a.txt -> brcmfmac43455-sdi=
o.AW-CM256SM.txt
>  Link: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt -> brcmfmac43455-sdi=
o.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.0.txt -> brcmfmac43455=
-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.1.txt -> brcmfmac43455=
-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,soquartz-model-a.txt -> brcmfmac434=
55-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,soquartz-cm4io.txt -> brcmfmac43455=
-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,soquartz-blade.txt -> brcmfmac43455=
-sdio.AW-CM256SM.txt
>
>  Licence: GPLv2. See GPL-2 for details.
>
> --
> 2.39.2
>
