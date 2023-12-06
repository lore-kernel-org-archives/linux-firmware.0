Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA9BC4167B
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Dec 2023 21:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2FBBC433CC; Wed,  6 Dec 2023 21:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA76EC433C8
	for <linux-firmware@kernel.org>; Wed,  6 Dec 2023 21:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701897247;
	bh=BevcefBugGCEY911ysVBRxIBkJzgu/kIj3n9pfhcZPA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Uhi03r7P8Zt3AX++nU0PGfaELYKIntCpX1Kgpyv+TUDYjH8bNYUS4C+V7pTqXKWFh
	 gpXAPxg0V5brAnNIjQACuRKQgTY0GQjfyhew6dZfdNq9tVXZxYhP3p4PrXH8dQJbn1
	 q8/HY39gjv3baO2xeVZbcsXMeeTKFmrkuFgOHtWbNvHliHKURDwuA0RQXllfkEqRDm
	 6Klp/LPCYvPSz/F9nC/wBiu8PNl7tBR7v+2LNe+XZF5TiRh1HK8E6ct3/WM6mkEo+h
	 iRy9anWg00TQjqZU5i/VUF69qSK7Lm/O/eplkoCeK4PxsXL9jwE5SwX0ixM5ZNFvpy
	 +BjhdvVih8Fiw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5d05ff42db0so1975577b3.2
        for <linux-firmware@kernel.org>; Wed, 06 Dec 2023 13:14:07 -0800 (PST)
X-Gm-Message-State: AOJu0YxejBw9TqyZSowjQ2w6jW4IxmLNQ1CEBuk1Pe9c2/pYSk7x4dn9
	3L9k/aD1lQ6TwVvmv7wtjaiUHDPegpKQmhbAW80=
X-Google-Smtp-Source: AGHT+IHAETtMLoWPr70mwk+NRtb/ulbyqFwx8NXiNr5JLkX4SzbfNBeWoeJSekJai5GNZAW2KdHVuUFsptM0f2UMkcQ=
X-Received: by 2002:a81:f00c:0:b0:5d3:a721:853d with SMTP id
 p12-20020a81f00c000000b005d3a721853dmr1310530ywm.13.1701897246795; Wed, 06
 Dec 2023 13:14:06 -0800 (PST)
MIME-Version: 1.0
References: <20231205201011.2511131-1-john.allen@amd.com>
In-Reply-To: <20231205201011.2511131-1-john.allen@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 6 Dec 2023 16:13:55 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5B=Wu56osD_6=hcRA+YMTpUjWgyEosccDTcFFsQckJow@mail.gmail.com>
Message-ID: <CA+5PVA5B=Wu56osD_6=hcRA+YMTpUjWgyEosccDTcFFsQckJow@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: Update AMD cpu microcode
To: John Allen <john.allen@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org, 
	suravee.suthikulpanit@amd.com, bp@alien8.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 3:11=E2=80=AFPM John Allen <john.allen@amd.com> wrot=
e:
>
> * Update AMD cpu microcode for processor family 17h
>
> Key Name        =3D AMD Microcode Signing Key (for signing microcode cont=
ainer files only)
> Key ID          =3D F328AE73
> Key Fingerprint =3D FC7C 6C50 5DAF CC14 7183 57CA E4BE 5339 F328 AE73
>
> Signed-off-by: John Allen <john.allen@amd.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/93

josh

> ---
>  WHENCE                                 |   2 +-
>  amd-ucode/README                       |   2 +-
>  amd-ucode/microcode_amd_fam17h.bin     | Bin 12924 -> 12924 bytes
>  amd-ucode/microcode_amd_fam17h.bin.asc |  16 ++++++++--------
>  4 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 832c66ed..dc847c5f 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4037,7 +4037,7 @@ Version: 2018-05-24
>  RawFile: amd-ucode/microcode_amd_fam16h.bin
>  Version: 2014-10-28
>  RawFile: amd-ucode/microcode_amd_fam17h.bin
> -Version: 2023-07-19
> +Version: 2023-12-05
>  RawFile: amd-ucode/microcode_amd_fam19h.bin
>  Version: 2023-10-19
>  File: amd-ucode/README
> diff --git a/amd-ucode/README b/amd-ucode/README
> index 86d69822..a982ea1f 100644
> --- a/amd-ucode/README
> +++ b/amd-ucode/README
> @@ -32,7 +32,7 @@ Microcode patches in microcode_amd_fam16h.bin:
>
>  Microcode patches in microcode_amd_fam17h.bin:
>    Family=3D0x17 Model=3D0x08 Stepping=3D0x02: Patch=3D0x0800820d Length=
=3D3200 bytes
> -  Family=3D0x17 Model=3D0x31 Stepping=3D0x00: Patch=3D0x0830107a Length=
=3D3200 bytes
> +  Family=3D0x17 Model=3D0x31 Stepping=3D0x00: Patch=3D0x0830107b Length=
=3D3200 bytes
>    Family=3D0x17 Model=3D0xa0 Stepping=3D0x00: Patch=3D0x08a00008 Length=
=3D3200 bytes
>    Family=3D0x17 Model=3D0x01 Stepping=3D0x02: Patch=3D0x0800126e Length=
=3D3200 bytes
>
> diff --git a/amd-ucode/microcode_amd_fam17h.bin b/amd-ucode/microcode_amd=
_fam17h.bin
> index f9841b65b8d6ea156a402f45bba17f0e31eaf4ea..4afcc9833d26adc165647ef1c=
5fa9ada2a7d9124 100644
> GIT binary patch
> delta 2716
> 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
> W0Duet03#q31_%J42n4fz8UGkt8ZYPo
>
> delta 2716
> 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
> W0Duet03#q31_%J42n4fz8UGmAKS?tH
>
> diff --git a/amd-ucode/microcode_amd_fam17h.bin.asc b/amd-ucode/microcode=
_amd_fam17h.bin.asc
> index 34a40245..49a9f32b 100644
> --- a/amd-ucode/microcode_amd_fam17h.bin.asc
> +++ b/amd-ucode/microcode_amd_fam17h.bin.asc
> @@ -1,11 +1,11 @@
>  -----BEGIN PGP SIGNATURE-----
>
> -iQEzBAABCgAdFiEE/HxsUF2vzBRxg1fK5L5TOfMornMFAmS4Mm4ACgkQ5L5TOfMo
> -rnN35wgAkllCunxE6J5hQyLMx5o4WTHZkbNvXmu6nV1Y3vjiL1oeaK+pmx8BlkPt
> -fGZJCe/068kqmp3N4EtOZLxXn55t3jNBYectPr0RmFqpjMsEJEcfXfuXROA4N9Ti
> -Zd/o6X21eHEsm0kK0q4YfppfgTd5Ze7k1jTkUuuU6/yh6uRk1MiFreEzkPO3Aayh
> -iEWlYx33vq3HccTPgdY3D64Zr8gmgKG+8mdEvqb1jK4SVZ1/9vy4OKIIpUZB/eqx
> -46h9Ejwn9pktnYkHi/A/zCREEcIQ10HXFF5bjxJTFQkM5S46/QEO7uuvnpMb+6Yy
> -4V1/QIWMG6ixqCRx9GqbBK7GHdYODw=3D=3D
> -=3D+IsI
> +iQEzBAABCgAdFiEE/HxsUF2vzBRxg1fK5L5TOfMornMFAmVCWc4ACgkQ5L5TOfMo
> +rnPh/wf+LAIyLbenqgpit5OPRZBhw/zWk3Wtl08328h1LJilI+ebJxtjYLlL8sQc
> +NAkfN2f1RqRAoqhktxEMiWc9G4C7gqji1CTKTFLdALk+NaHPFA9z1E8nc+aUp58Y
> +EXfmr0wWjKdMfyGzkDt+gX2QVGom5yN2uAe+rg/OeepuzvVMQtijOHsu4jKlDk4o
> +lcuD8m+oRxCA4umPGQVNoeAhqTK+0MIAYQ8Igv6v/yk6bmYvd9CTCs16OrL1cFPm
> +153kvq2agnmqLlB9Tl9yVApqkE0iinzWBBDuYuno+1I/tfs1k5AOmsxGa1CVVz45
> +ZrYL1jovjWpW7VTiyKxIUlR2SHv22A=3D=3D
> +=3DB89Z
>  -----END PGP SIGNATURE-----
> --
> 2.25.1
>
