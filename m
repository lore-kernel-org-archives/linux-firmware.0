Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A016C3DA60
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Jul 2024 13:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F22F8C4AF10; Thu, 18 Jul 2024 13:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA80C4AF0A
	for <linux-firmware@kernel.org>; Thu, 18 Jul 2024 13:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721308364;
	bh=vYl8MNkELU4Ts7nwqTZXYDv94oAOQlp6vOMvp3c6lbk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mNZOdzPU3IGxduoRU3eUL8+SX4K40LDy43/8SFyyUGj22aTZUbJcavTaKvCCXaQb0
	 x86PJXfz31XIQdtuOnQls/V7gf4vxWQOmRxxPoLFcaZfeWkktO1CeYnKPvSkhKdiUO
	 rgu2Nrv1Vcpj2Gj/4iqrKWjjg4JVLIQAD2FwprcXGD7ncx8+28RVs+O964iS3yC2IL
	 n55bS1Nd1OiOAvbbRz6MfhGbL1qZgwhAi7+ZeLGBIU7l7TRU0e7lPhUCeuBvQwqHb/
	 8FLmFwLMLfq4BKUwqME4qEwFlf7wgu7xuwwm+6kezNO0tKMk6RwT9qWgZOAEmk/9t3
	 WVB7hotnzJHjQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6678a45eaa3so6050137b3.2
        for <linux-firmware@kernel.org>; Thu, 18 Jul 2024 06:12:44 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz/efb0faDcAN/llS7wkAk/mjSTb4fw+2n8BPZCGkAEO9jKEfEF
	MMQTIXFu8nqsjFeebEsbyQ2HRXTqTVMukqs9WIoFTsVNMKQcwWJw0j/cnYC43s/v1lc1+PYsRIY
	LKX6qQ7LUg7J6SKW8piYqxoyv20U=
X-Google-Smtp-Source: AGHT+IGHGsKu3aGgiDsmP3QMUlXnyDu/titXfL14zN189O3HKZ68TtQ10LQvGGJTe2Rdb33EsSSV39sXbLdHNJmfdlQ=
X-Received: by 2002:a0d:e443:0:b0:63b:ce21:da7f with SMTP id
 00721157ae682-664fe74049dmr51662367b3.21.1721308364100; Thu, 18 Jul 2024
 06:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240718070022.591-1-shenghao-ding@ti.com>
In-Reply-To: <20240718070022.591-1-shenghao-ding@ti.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 18 Jul 2024 09:12:32 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4cRtsC6a3AvW65==seufG3zoiUtL0N9PPLpYNEvNYwwQ@mail.gmail.com>
Message-ID: <CA+5PVA4cRtsC6a3AvW65==seufG3zoiUtL0N9PPLpYNEvNYwwQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: tas2781: fix the license issue for tas781 firmware
To: Shenghao Ding <shenghao-ding@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, zigo@debian.org, baojun.xu@ti.com, 
	13564923607@139.com, v-po@ti.com, linux-sound@vger.kernel.org, 
	robinchen@ti.com, linux-kernel@vger.kernel.org, mimperial@lenovo.com, 
	cchen50@lenovo.com, soyer@irl.hu, stuart.a.hayhurst@gmail.com, navada@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 3:01=E2=80=AFAM Shenghao Ding <shenghao-ding@ti.com=
> wrote:
>
> Fix the license issue for tas781 firmware, which are shipped as .bin
> opaque. Remove the GPL-2+, which imposes having the source code
> available.
>
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/257

josh

>
> ---
> v2:
>  - Drop "Found in hex form in kernel source."
>  - Drop Allegedly, Add Redistributable.
> v1:
>  - Remove the GPL-2+ and fix the license issue.
>  - Update the year of copyright.
> ---
>  WHENCE | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index b2fc018..3d95a97 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -7384,10 +7384,8 @@ Link: TAS2XXX38E0.bin -> ti/tas2781/TAS2XXX38E0.bi=
n
>  Link: TIAS2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
>  Link: TIAS2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
>
> -Licence: Allegedly GPLv2+, but no source visible. Marked:
> -        Copyright (C) 2023 Texas Instruments
> -
> -Found in hex form in kernel source.
> +Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
> +        Copyright (C) 2023 - 2024 Texas Instruments
>
>  ------------------------------------------------------------------------=
--
>
> @@ -7397,10 +7395,8 @@ File: ti/tas2563/INT8866RCA2.bin
>  Link: TAS2XXX3870.bin -> ti/tas2563/TAS2XXX3870.bin
>  Link: INT8866RCA2.bin -> ti/tas2563/INT8866RCA2.bin
>
> -Licence: Allegedly GPLv2+, but no source visible. Marked:
> -        Copyright (C) 2023 Texas Instruments
> -
> -Found in hex form in kernel source.
> +Licence: Redistributable. LICENCE.ti-tspa for details. Marked:
> +        Copyright (C) 2023 - 2024 Texas Instruments
>
>  ------------------------------------------------------------------------=
--
>
> --
> 2.34.1
>
