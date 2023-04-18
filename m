Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B64C6FD18
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Apr 2023 12:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6219C433A0; Tue, 18 Apr 2023 12:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CFEC4339E
	for <linux-firmware@kernel.org>; Tue, 18 Apr 2023 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681819505;
	bh=h3Pz2rIvlawSrHPd+J+RG/QrkSHr1xySzW5nFztwwe8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=EvI1itZ8UK8o61PHhBBRBJgJR8a4zd7uWS7eQX1q+lXMZzVXT49Nr/RklcIwRo6/6
	 3eDWO1nHAvKJ1JP9QvXcstuRXXN7l+1L0goJUALkjtGI/tuZt3PCESz3lCCyT+66dt
	 NMxveUgGFOB/6c9KJ/zc9qjTlfCT22wjqlBlDa3/nke46IQoTgG4RiyWxKu6x44q0l
	 QH0Nh3x9EoPT+WrxUO54vHACowdMO19cU4OsGGBFjmbFsMQ5NfJ86IhHTc1Sq4l83C
	 0X2ThLQGjJKewmYeOffE7jFuw3QLklqDNG2y9nVaKXhZrfGqZvTs5ijxm7eaUb6HMn
	 h7LWO6l5GSwEA==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-555bc7f6746so9888727b3.6
        for <linux-firmware@kernel.org>; Tue, 18 Apr 2023 05:05:05 -0700 (PDT)
X-Gm-Message-State: AAQBX9fRcD166iSHEWD34gYPg6/b+sMUzTFAxOp2SZmLsTKTt3qPiJZ8
	RwK7orCeYi0DdqBpx9dlsAOfEfYmlyVudYcZ1vA=
X-Google-Smtp-Source: AKy350ahR4npAF3/tCvF2OgwpPHBwBmSZUpfyAszczEu9/7pZTz5ebtqblOm0UuP1Zw2ZiuU0ILZTx7UNqmVWXx/LnY=
X-Received: by 2002:a81:6dce:0:b0:54f:e182:6f4f with SMTP id
 i197-20020a816dce000000b0054fe1826f4fmr14623176ywc.20.1681819504639; Tue, 18
 Apr 2023 05:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230414161358.180759-1-john.allen@amd.com>
In-Reply-To: <20230414161358.180759-1-john.allen@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Apr 2023 08:04:53 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4i6oqLvG7tiBGdST8nSkAfN_tG1qekUJMObqm9iQJMNQ@mail.gmail.com>
Message-ID: <CA+5PVA4i6oqLvG7tiBGdST8nSkAfN_tG1qekUJMObqm9iQJMNQ@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: Update AMD cpu microcode
To: John Allen <john.allen@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org, 
	suravee.suthikulpanit@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 12:14=E2=80=AFPM John Allen <john.allen@amd.com> wr=
ote:
>
> * Update AMD cpu microcode for processor family 17h
>
> Key Name        =3D AMD Microcode Signing Key (for signing microcode cont=
ainer files only)
> Key ID          =3D F328AE73
> Key Fingerprint =3D FC7C 6C50 5DAF CC14 7183 57CA E4BE 5339 F328 AE73
>
> Signed-off-by: John Allen <john.allen@amd.com>

Applied and pushed out.

josh

> ---
>  WHENCE                                 |   2 +-
>  amd-ucode/README                       |   2 +-
>  amd-ucode/microcode_amd_fam17h.bin     | Bin 9700 -> 9700 bytes
>  amd-ucode/microcode_amd_fam17h.bin.asc |  16 ++++++++--------
>  4 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 7cc9afd4..c2295e13 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3917,7 +3917,7 @@ Version: 2018-05-24
>  File: amd-ucode/microcode_amd_fam16h.bin
>  Version: 2014-10-28
>  File: amd-ucode/microcode_amd_fam17h.bin
> -Version: 2022-04-08
> +Version: 2023-04-13
>  File: amd-ucode/microcode_amd_fam19h.bin
>  Version: 2023-01-31
>  File: amd-ucode/README
> diff --git a/amd-ucode/README b/amd-ucode/README
> index 0adfde27..0d97f910 100644
> --- a/amd-ucode/README
> +++ b/amd-ucode/README
> @@ -33,7 +33,7 @@ Microcode patches in microcode_amd_fam16h.bin:
>  Microcode patches in microcode_amd_fam17h.bin:
>    Family=3D0x17 Model=3D0x08 Stepping=3D0x02: Patch=3D0x0800820d Length=
=3D3200 bytes
>    Family=3D0x17 Model=3D0x01 Stepping=3D0x02: Patch=3D0x0800126e Length=
=3D3200 bytes
> -  Family=3D0x17 Model=3D0x31 Stepping=3D0x00: Patch=3D0x08301055 Length=
=3D3200 bytes
> +  Family=3D0x17 Model=3D0x31 Stepping=3D0x00: Patch=3D0x08301072 Length=
=3D3200 bytes
>
>  Microcode patches in microcode_amd_fam19h.bin:
>    Family=3D0x19 Model=3D0x01 Stepping=3D0x00: Patch=3D0x0a001078 Length=
=3D5568 bytes
> diff --git a/amd-ucode/microcode_amd_fam17h.bin b/amd-ucode/microcode_amd=
_fam17h.bin
> index dec3871929a36792a261578aa834e807b5bea77d..37d899cd534789e461a5cf3ad=
666fcd587b8ab93 100644
> GIT binary patch
> delta 2695
> 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
> BMdttj
>
> delta 2505
> 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
>
> diff --git a/amd-ucode/microcode_amd_fam17h.bin.asc b/amd-ucode/microcode=
_amd_fam17h.bin.asc
> index f5b1e4d7..27da52c8 100644
> --- a/amd-ucode/microcode_amd_fam17h.bin.asc
> +++ b/amd-ucode/microcode_amd_fam17h.bin.asc
> @@ -1,11 +1,11 @@
>  -----BEGIN PGP SIGNATURE-----
>
> -iQEzBAABCgAdFiEE/HxsUF2vzBRxg1fK5L5TOfMornMFAmJQi+QACgkQ5L5TOfMo
> -rnOMKAf/T14Ixwan/IPPOEZHhsB5reCrEWLM89hey7z3vn/h8RWLAfJnAQwTuv1A
> -B18gOWwUQMNARsoeDQZnnDvIQBB4w/DpzAaoWBoPnUR8Ko9jdl8ou7aUwdJzYC4T
> -h6+LeSmHGhQ/h7AIJWABplXJg+weYfQiDr9u/ulFsZdCvfBx+8USNp75HddVTXWr
> -+SunY5MrUZKmQvj147fCojByYVGzNCkWHJe3V6obd19kubTT357QwUX8A7/ZwgYO
> -8DlxoVbYg9X224/7Cck6dECE9jKbmaVJkmdMg6ACVirjDH5U/HAACYNwwcO2olPn
> -BOxF9sZMYY9cl14WCj2R7WS+gEjYWA=3D=3D
> -=3DpSDv
> +iQEzBAABCgAdFiEE/HxsUF2vzBRxg1fK5L5TOfMornMFAmQeEvgACgkQ5L5TOfMo
> +rnPOpAf/dYhPqq/ktg1muI/khV4EhDiguX6OXib3fmfSZdvPIAI0cRI77M3Lvf0b
> +nlV8D67e5HOQ5foJbix5tunz0sZjqr2QU8U9dNk/ut0KC7UiCRc8VH40aSi/OQBG
> +Y8c7tb6IJ+N+jyJ6Ii6koUuRO2Lk2MckcrWLRuLRV4bB+osyJrGjc/X54Z6UJ/Ma
> +VDg13Yxy5WvC7sMmlmnY42JLeLBKDVUvg0zDvJ4aOLLxRE2l3eiAKE+TV122LmxN
> +ca5WA/ESYQ9BjxHYIrpTd9nQaWa/TIZ+rOmJGLMtnQ1gGlW97zQuJR7zh+8vdLzC
> +iwVlS1cu7kcV7KYDytTkWJ+2gwb3uQ=3D=3D
> +=3DlP2S
>  -----END PGP SIGNATURE-----
> --
> 2.25.1
>
