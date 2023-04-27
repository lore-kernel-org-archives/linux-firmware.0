Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA51C77B61
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Apr 2023 13:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4F4BC433EF; Thu, 27 Apr 2023 13:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE6AC433D2
	for <linux-firmware@kernel.org>; Thu, 27 Apr 2023 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682601389;
	bh=k9DJbpJwbuhm8RYHw95Q1Aa0vzfbIxt7mzi2xOeS4F8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=f+HI6lmWyoTXI+oGasnL1i76qHKaP6j84aN2ylR5kNz8n0Rv8VLjRVDn6Y+RoUaw2
	 tQ8Sy1Rv5I3LM07GqCVjIhch9meTD/A1CgtixLSJQHRVfulfzrCtaux2ZtaI1sN0SH
	 oJHioVtlapvpqxLnlcpYCLnsdyVpA8uyGfKwSc6szwV/X6/4mkCvBW8kgzb282tt3Z
	 H4sqC03NDHIypidMml9/5BmkM1loF6FgD0YJFHPcHcqLdj4EFEWiRJvo+9X3fG/oKp
	 6s5qT2wwJURCkRYZuUpgXx4HBSpgfAj6l9tF3LcqtxaBHSl7EZMtRHO1UcGhoiSnLk
	 DrOTdW3052zYw==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-54fb89e1666so66675617b3.3
        for <linux-firmware@kernel.org>; Thu, 27 Apr 2023 06:16:29 -0700 (PDT)
X-Gm-Message-State: AC+VfDy76Pc6rXC4VygCuqEQ0wBvGEXy8rgcE/9AnOBFfMwO+d6OV1fR
	ZPtp6W3Fe2A3aU3PiqtOMDkMp1kZIqdnHqlW2vk=
X-Google-Smtp-Source: ACHHUZ4DR6ACnFaMK3a4pGrVPvLxdMCTHHfIutlqxAPbsDKHCzLDXLBVn26levj8r+ei1NRZdbNZaZ96Weu8RVrgKSw=
X-Received: by 2002:a81:7446:0:b0:555:e184:b6ed with SMTP id
 p67-20020a817446000000b00555e184b6edmr1017479ywc.52.1682601388691; Thu, 27
 Apr 2023 06:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230419102057.1242812-1-pbrobinson@gmail.com>
In-Reply-To: <20230419102057.1242812-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 27 Apr 2023 09:16:17 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4WP_wGzUPd0as-mNZg+QZXva-8zeVFWZdL+yC7a5oDyA@mail.gmail.com>
Message-ID: <CA+5PVA4WP_wGzUPd0as-mNZg+QZXva-8zeVFWZdL+yC7a5oDyA@mail.gmail.com>
Subject: Re: [PATCH] Group all Conexant V4L devices together
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 6:21=E2=80=AFAM Peter Robinson <pbrobinson@gmail.co=
m> wrote:
>
> All the Conexant V4L devices are from the same vendor
> and covered under the same license so they can be
> bundled together into a single group.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Applied and pushed out.

josh

> ---
>  WHENCE | 44 ++++----------------------------------------
>  1 file changed, 4 insertions(+), 40 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 033cbc9..fa75f75 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -1104,22 +1104,6 @@ Licence: Redistributable. See LICENSE.ipu3_firmwar=
e for details
>
>  ------------------------------------------------------------------------=
--
>
> -Driver: cx231xx - Conexant Cx23100/101/102 USB broadcast A/V decoder
> -
> -File: v4l-cx231xx-avcore-01.fw
> -
> -Licence: Redistributable.
> -
> -  Conexant grants permission to use and redistribute these firmware
> -  files for use with Conexant devices, but not as a part of the Linux
> -  kernel or in any other form which would require these files themselves
> -  to be covered by the terms of the GNU General Public License.
> -  These firmware files are distributed in the hope that they will be
> -  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
> -  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> -
> -------------------------------------------------------------------------=
--
> -
>  Driver: tehuti - Tehuti Networks 10G Ethernet
>
>  File: tehuti/bdx.bin
> @@ -1274,40 +1258,20 @@ Found in hex form in kernel source.
>
>  ------------------------------------------------------------------------=
--
>
> +Driver: cx231xx - Conexant Cx23100/101/102 USB broadcast A/V decoder
> +
> +File: v4l-cx231xx-avcore-01.fw
> +
>  Driver: cx23418 - Conexant PCI Broadcast A/V with MPEG encoder
>
>  File: v4l-cx23418-apu.fw
>  File: v4l-cx23418-cpu.fw
>  File: v4l-cx23418-dig.fw
>
> -Licence: Redistributable.
> -
> -  Conexant grants permission to use and redistribute these firmware
> -  files for use with Conexant devices, but not as a part of the Linux
> -  kernel or in any other form which would require these files themselves
> -  to be covered by the terms of the GNU General Public License.
> -  These firmware files are distributed in the hope that they will be
> -  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
> -  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> -
> -------------------------------------------------------------------------=
--
> -
>  Driver: cx23885 - Conexant PCI Express Broadcast A/V decoder
>
>  File: v4l-cx23885-avcore-01.fw
>
> -Licence: Redistributable.
> -
> -  Conexant grants permission to use and redistribute these firmware
> -  files for use with Conexant devices, but not as a part of the Linux
> -  kernel or in any other form which would require these files themselves
> -  to be covered by the terms of the GNU General Public License.
> -  These firmware files are distributed in the hope that they will be
> -  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
> -  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> -
> -------------------------------------------------------------------------=
--
> -
>  Driver: cx23840 - Conexant sideport Broadcast A/V decoder
>
>  File: v4l-cx25840.fw
> --
> 2.40.0
>
