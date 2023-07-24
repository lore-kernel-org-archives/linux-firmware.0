Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA9DC001B0
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Jul 2023 12:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D58DC433CA; Mon, 24 Jul 2023 12:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E7DC433C9
	for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 12:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690201782;
	bh=gXsfhLQ8qgnMLCTxJ8vduAzbiYd7R3FBHhN3fAnSRpc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=BKpIIebt6wy7IleCuxsZ2yz62XvVLeukpvunyW9ucT3rvLwkVyWr6JVl1rMSDluZa
	 1kgfri2IjI0M+aRtbkEUBnIOxRLXpwg4WnFmYngCaKOVfXo+1iUqwIIIM4wOjY+UHZ
	 v6RZFRR+ZqzoFqMJykifq0jypR/S9nrv/E0HqkPl5hR7Rhd7PkuwEiCMI62mqaSbZS
	 ylzzxgqfwJOP34MG2inf/ohAeeKeKyalTyiw3fwYneN+scfWwwr/QMGhFMvJdYZMDI
	 4ekcp5r4ahUXSMzJSa0SpwlS6/xs3thO4r3zuquew09nlYfyPqKPfmPSaPFaTwIuTa
	 Xsh8Xp/l2GPhQ==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d066d72eb12so3378669276.1
        for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 05:29:42 -0700 (PDT)
X-Gm-Message-State: ABy/qLZrLh5rGv/92B1xAkOWTdL/eSVBTVB7ymVDlVd+QMHa8zAHCVCA
	/v2pvokeAGy2Gt79pBGpK+9ikSxHftPXOj8LHig=
X-Google-Smtp-Source: APBJJlGbcsAABW1+FNsjIuohFRxVylndz37/xzgV38bKK2meiKWCc6ca9egrZNhRwM8aN/WTWxrwYmyWc56ATIhe7sM=
X-Received: by 2002:a25:e646:0:b0:d04:e57d:f5be with SMTP id
 d67-20020a25e646000000b00d04e57df5bemr7252612ybh.13.1690201780981; Mon, 24
 Jul 2023 05:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230718231959.3163407-1-john.allen@amd.com> <20230719191757.3210370-1-john.allen@amd.com>
In-Reply-To: <20230719191757.3210370-1-john.allen@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jul 2023 08:29:30 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5enKYaZLeWpysa-EBEhC7-zwwjjv_iE3p=nGpKLKKdqQ@mail.gmail.com>
Message-ID: <CA+5PVA5enKYaZLeWpysa-EBEhC7-zwwjjv_iE3p=nGpKLKKdqQ@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: Update AMD fam17h cpu microcode
To: John Allen <john.allen@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org, 
	suravee.suthikulpanit@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 3:18=E2=80=AFPM John Allen <john.allen@amd.com> wro=
te:
>
> * Update AMD cpu microcode for processor family 17h
>
> Key Name        =3D AMD Microcode Signing Key (for signing microcode cont=
ainer files only)
> Key ID          =3D F328AE73
> Key Fingerprint =3D FC7C 6C50 5DAF CC14 7183 57CA E4BE 5339 F328 AE73
>
> Signed-off-by: John Allen <john.allen@amd.com>
> ---
> Hi Josh,
>
> Apologies, I didn't think this one would be going out so soon after the f=
amily
> 19h patch from yesterday. This patch applies on top of the family 19h pat=
ch.
> Please let me know if you would prefer if I resent these as a single patc=
h.

Both applied and pushed out.

josh

>
> Thanks,
> John
> ---
>  WHENCE                                 |   2 +-
>  amd-ucode/README                       |   3 ++-
>  amd-ucode/microcode_amd_fam17h.bin     | Bin 9700 -> 12924 bytes
>  amd-ucode/microcode_amd_fam17h.bin.asc |  16 ++++++++--------
>  4 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index bab6cc9a..15a8645c 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3909,7 +3909,7 @@ Raw: amd-ucode/microcode_amd_fam16h.bin
>  Version: 2014-10-28
>  File: amd-ucode/microcode_amd_fam17h.bin
>  Raw: amd-ucode/microcode_amd_fam17h.bin
> -Version: 2023-04-13
> +Version: 2023-07-19
>  File: amd-ucode/microcode_amd_fam19h.bin
>  Raw: amd-ucode/microcode_amd_fam19h.bin
>  Version: 2023-07-18
> diff --git a/amd-ucode/README b/amd-ucode/README
> index 4308fe2d..1d39da3b 100644
> --- a/amd-ucode/README
> +++ b/amd-ucode/README
> @@ -32,8 +32,9 @@ Microcode patches in microcode_amd_fam16h.bin:
>
>  Microcode patches in microcode_amd_fam17h.bin:
>    Family=3D0x17 Model=3D0x08 Stepping=3D0x02: Patch=3D0x0800820d Length=
=3D3200 bytes
> +  Family=3D0x17 Model=3D0x31 Stepping=3D0x00: Patch=3D0x0830107a Length=
=3D3200 bytes
> +  Family=3D0x17 Model=3D0xa0 Stepping=3D0x00: Patch=3D0x08a00008 Length=
=3D3200 bytes
>    Family=3D0x17 Model=3D0x01 Stepping=3D0x02: Patch=3D0x0800126e Length=
=3D3200 bytes
> -  Family=3D0x17 Model=3D0x31 Stepping=3D0x00: Patch=3D0x08301072 Length=
=3D3200 bytes
>
>  Microcode patches in microcode_amd_fam19h.bin:
>    Family=3D0x19 Model=3D0x01 Stepping=3D0x01: Patch=3D0x0a0011d1 Length=
=3D5568 bytes
> diff --git a/amd-ucode/microcode_amd_fam17h.bin b/amd-ucode/microcode_amd=
_fam17h.bin
> index 37d899cd534789e461a5cf3ad666fcd587b8ab93..f9841b65b8d6ea156a402f45b=
ba17f0e31eaf4ea 100644
> GIT binary patch
> delta 5515
> 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
> F{{gHxepLVf
>
> delta 2769
> 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
> XI8~N^f?XgDZsTXPhi>+WOwD$}@;OgK
>
> diff --git a/amd-ucode/microcode_amd_fam17h.bin.asc b/amd-ucode/microcode=
_amd_fam17h.bin.asc
> index 27da52c8..34a40245 100644
> --- a/amd-ucode/microcode_amd_fam17h.bin.asc
> +++ b/amd-ucode/microcode_amd_fam17h.bin.asc
> @@ -1,11 +1,11 @@
>  -----BEGIN PGP SIGNATURE-----
>
> -iQEzBAABCgAdFiEE/HxsUF2vzBRxg1fK5L5TOfMornMFAmQeEvgACgkQ5L5TOfMo
> -rnPOpAf/dYhPqq/ktg1muI/khV4EhDiguX6OXib3fmfSZdvPIAI0cRI77M3Lvf0b
> -nlV8D67e5HOQ5foJbix5tunz0sZjqr2QU8U9dNk/ut0KC7UiCRc8VH40aSi/OQBG
> -Y8c7tb6IJ+N+jyJ6Ii6koUuRO2Lk2MckcrWLRuLRV4bB+osyJrGjc/X54Z6UJ/Ma
> -VDg13Yxy5WvC7sMmlmnY42JLeLBKDVUvg0zDvJ4aOLLxRE2l3eiAKE+TV122LmxN
> -ca5WA/ESYQ9BjxHYIrpTd9nQaWa/TIZ+rOmJGLMtnQ1gGlW97zQuJR7zh+8vdLzC
> -iwVlS1cu7kcV7KYDytTkWJ+2gwb3uQ=3D=3D
> -=3DlP2S
> +iQEzBAABCgAdFiEE/HxsUF2vzBRxg1fK5L5TOfMornMFAmS4Mm4ACgkQ5L5TOfMo
> +rnN35wgAkllCunxE6J5hQyLMx5o4WTHZkbNvXmu6nV1Y3vjiL1oeaK+pmx8BlkPt
> +fGZJCe/068kqmp3N4EtOZLxXn55t3jNBYectPr0RmFqpjMsEJEcfXfuXROA4N9Ti
> +Zd/o6X21eHEsm0kK0q4YfppfgTd5Ze7k1jTkUuuU6/yh6uRk1MiFreEzkPO3Aayh
> +iEWlYx33vq3HccTPgdY3D64Zr8gmgKG+8mdEvqb1jK4SVZ1/9vy4OKIIpUZB/eqx
> +46h9Ejwn9pktnYkHi/A/zCREEcIQ10HXFF5bjxJTFQkM5S46/QEO7uuvnpMb+6Yy
> +4V1/QIWMG6ixqCRx9GqbBK7GHdYODw=3D=3D
> +=3D+IsI
>  -----END PGP SIGNATURE-----
> --
> 2.25.1
>
