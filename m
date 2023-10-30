Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B207C4332F
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Oct 2023 12:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62198C433CC; Mon, 30 Oct 2023 12:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450BDC433C9
	for <linux-firmware@kernel.org>; Mon, 30 Oct 2023 12:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698668559;
	bh=2YOQTiqWllbEPH8x7C8Zf7dxC3vMOTBuI6Q4dKDUCWo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=GI5bLAuZUNIwqtxTnWIa3EVzf4qQaCzuz7m2qu45r/DrHIb9cW451UCJaAiEc1jUC
	 ecG8JyAN+QxqtuX3/o7s1uZJYtHlfxVyJTDU5mJBmTgxLMFe0f9zm2BLcXneDu7GPQ
	 maeqlJoS0UtqpOgGt1P8DzFC/zZN33Cc9yIa5yjfzw4GWKHR9UU0i9pjs3HTiy/AGq
	 JEUgGpJHOUgNmRXrrIpFjuvGLjSp3q/Pu2gtq+TFB0t+D1zt4fFJx1azdXSqwN4uTD
	 HAbk9/bYYX4VMJl+lkTgb3Qcu0VeMY0M1dBvhy38r+2lJEiI3MUZv8WbfnV+pwIzEg
	 dKh0UOFHad9cw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5afbdbf3a19so28095557b3.2
        for <linux-firmware@kernel.org>; Mon, 30 Oct 2023 05:22:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw6/RrFw/y1t1HU8F19MfYhIa+RYqjXX5Jy8w5nAw5PROudKnmA
	w7tu8ipHgFfcujGhh8J7zgpHcsVdZ9Jxxi4nnQo=
X-Google-Smtp-Source: AGHT+IEWTVX6OZJce1I3+hVGQB59R5PEUuVmN/J1cWHEboBhEVtSPAQsp5v24k9uYUIHqMy1avI/AwUZj0U3voF500g=
X-Received: by 2002:a81:9b8c:0:b0:5a8:1d75:65c3 with SMTP id
 s134-20020a819b8c000000b005a81d7565c3mr9809248ywg.13.1698668558100; Mon, 30
 Oct 2023 05:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231019170320.1154960-1-john.allen@amd.com>
In-Reply-To: <20231019170320.1154960-1-john.allen@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 30 Oct 2023 08:22:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4X_7w-0Lpu_dD7Pod=0Ux4-+yxy_dS7bRseYY0+_HkSA@mail.gmail.com>
Message-ID: <CA+5PVA4X_7w-0Lpu_dD7Pod=0Ux4-+yxy_dS7bRseYY0+_HkSA@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: Update AMD cpu microcode
To: John Allen <john.allen@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org, 
	suravee.suthikulpanit@amd.com, bp@alien8.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 1:03=E2=80=AFPM John Allen <john.allen@amd.com> wro=
te:
>
> * Update AMD cpu microcode for processor family 19h
>
> Key Name        =3D AMD Microcode Signing Key (for signing microcode cont=
ainer files only)
> Key ID          =3D F328AE73
> Key Fingerprint =3D FC7C 6C50 5DAF CC14 7183 57CA E4BE 5339 F328 AE73
>
> Signed-off-by: John Allen <john.allen@amd.com>
> ---
>  WHENCE                                 |   2 +-
>  amd-ucode/README                       |   6 +++---
>  amd-ucode/microcode_amd_fam19h.bin     | Bin 39172 -> 39172 bytes
>  amd-ucode/microcode_amd_fam19h.bin.asc |  16 ++++++++--------
>  4 files changed, 12 insertions(+), 12 deletions(-)

This was applied and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/35

josh

>
> diff --git a/WHENCE b/WHENCE
> index 0758a86a..c06f5d80 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3970,7 +3970,7 @@ Version: 2014-10-28
>  RawFile: amd-ucode/microcode_amd_fam17h.bin
>  Version: 2023-07-19
>  RawFile: amd-ucode/microcode_amd_fam19h.bin
> -Version: 2023-08-08
> +Version: 2023-10-19
>  File: amd-ucode/README
>
>  License: Redistributable. See LICENSE.amd-ucode for details
> diff --git a/amd-ucode/README b/amd-ucode/README
> index f47743c1..86d69822 100644
> --- a/amd-ucode/README
> +++ b/amd-ucode/README
> @@ -37,13 +37,13 @@ Microcode patches in microcode_amd_fam17h.bin:
>    Family=3D0x17 Model=3D0x01 Stepping=3D0x02: Patch=3D0x0800126e Length=
=3D3200 bytes
>
>  Microcode patches in microcode_amd_fam19h.bin:
> -  Family=3D0x19 Model=3D0x11 Stepping=3D0x01: Patch=3D0x0a10113e Length=
=3D5568 bytes
> -  Family=3D0x19 Model=3D0x11 Stepping=3D0x02: Patch=3D0x0a10123e Length=
=3D5568 bytes
> -  Family=3D0x19 Model=3D0xa0 Stepping=3D0x02: Patch=3D0x0aa00212 Length=
=3D5568 bytes
> +  Family=3D0x19 Model=3D0x11 Stepping=3D0x02: Patch=3D0x0a101244 Length=
=3D5568 bytes
>    Family=3D0x19 Model=3D0x01 Stepping=3D0x01: Patch=3D0x0a0011d1 Length=
=3D5568 bytes
>    Family=3D0x19 Model=3D0x01 Stepping=3D0x00: Patch=3D0x0a001079 Length=
=3D5568 bytes
> +  Family=3D0x19 Model=3D0xa0 Stepping=3D0x02: Patch=3D0x0aa00213 Length=
=3D5568 bytes
>    Family=3D0x19 Model=3D0x01 Stepping=3D0x02: Patch=3D0x0a001234 Length=
=3D5568 bytes
>    Family=3D0x19 Model=3D0xa0 Stepping=3D0x01: Patch=3D0x0aa00116 Length=
=3D5568 bytes
> +  Family=3D0x19 Model=3D0x11 Stepping=3D0x01: Patch=3D0x0a101144 Length=
=3D5568 bytes
>
>  NOTE: For Genoa (Family=3D0x19 Model=3D0x11) and Bergamo (Family=3D0x19 =
Model=3D0xa0),
>  either AGESA version >=3D 1.0.0.8 OR a kernel with the following commit =
is
> diff --git a/amd-ucode/microcode_amd_fam19h.bin b/amd-ucode/microcode_amd=
_fam19h.bin
> index 02a5d051d58b8028275ee6a0b091f11f8d1b6e27..412e5fc83dafd35177aeb39bd=
75c463658694587 100644
> GIT binary patch
> delta 15313
> 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
w
> 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
r
> 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
p
> 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
>
> delta 15323
> zcmYkDV{D)e5Up$5#ui)KTibTKHMh3=3DR$JS)ZQHi(c555=3DyUM*MnPg7p&-|P`Clgc;
> z7E}+$BPu5Z@;~MGU!fxB{m=3DG)3H84g?f>&=3D|9LRv^8Y&q0V|Kg`w=3DHg66cKvP6EZB
> zAQgxY<f3`=3DurC+r4u>=3DB=3D$L0!w^f?Po;NU?S#9f=3D87D!wHq-JeLC0~^GVw(#mgaI=
l
> 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
}
> z2jaya@EGxxh3l^Fkxo@{d>Y`h(by@hXL%Ph0oo_Qg;RVg;=3DlMZ#R3t@jUEhUM3M|8
> zjN0tyg8YB9)C5;Ti@y_`vwrmtAyz_@wYM`o7!8Y<RYdaPb9bt>GW#?5k6JW<d*(v7
> z4dhadxg@7eSuhLA53=3D?Vc<RU7F*-l#D+bi$Phc-cwafaF$*RIBb$Yb<K!(y`H5_w^
> z1Lxb!jHt%0?_Hd0(YRKw<?=3DYaC#vpttzM>g0W1<=3DTkBw$>@$0PZA`0hVSN^qp-b4G
> zb;gFoOP8eY;Q~>MC0tJlt&)eu{laHK$tH~xua}Zxf4p)dPiXw-+lC;+<E*5*6x}HF
> zQdf+Op08KIT}R0nQ*mtzm8PpzZKGYZfb!bVLhlmx3kZ}Ohd9P)Jw|@F^{Yvyma=3D@e
> zV4WQk%ve>QKPTJG1Y`XhF!lYRGW`Tl#>;KanNT476H!*j%D>jm&6N<iC6^J_c7HYb
> z!$*26k8e;lmu{7NZCY5~-IdS*0x51w*dTorY<sQhT{w<EI;67JIKGkKGXuynflx-N
> zW<M())$wS@HVEHZ<DE=3DhhUa&b&tb%F#!`$}umF3AV9YjpE~)gYRK<g8J+!c&dv0@K
> zWD>tkC6+}isaSGcjReHuP5xmgLn}$SNqP(nrwf*OIPN88M5s_l*zy`_(G=3D3GoXE2n
> zqj;gDlxk0QmvBt%c`|nwNp=3DMP0_Fl%Cx&{H`TWo#qI}lxMAq>kiA$3WJ)1=3DZ|JI{G
> z9%d7xO{9nQ$`wF~F!$mo1_n!)&f*Er>OwttV)m0TZO5Sy+EN|<-1B{Q>FGUOnKWHa
> zaONfo#Lhl+<*F3A#~|?#^t^<?-LRN_RGTt5S`K_ycCE|&FkDD-Bx5A41u&d*Zy$AB
> zNuf@t$kR|M<LbYDVzE#hR0MAe-t2*!XB(_cUw#swj#BNM(D=3D0{FHwi8n^urEUE|I*
> zsk$R{Itz@RG|^^71y_<_-<Ie&E;1Gqqa}V~6R~P<;@47YS;jo?qBf@e;#SAqZ~n1(
> z?nwq$OtF;(b>yeH9qCrt2q>#Kd8smGi2Msf-xP4kj>*}gNvMXYo~Us0eeN{P?s|Sq
> z#<Af1Ald8-A8OeNAS3wVQA!*Y%eXy0@ZK-PJ?cK&5YW%%O4UQ<(uTKIus!s!D>~`!
> zMIAh8<TBLb6+<-py=3DQ9`wUE7!0Hu9{K#SV=3D=3DsP&N_=3D4uQe0dis2H=3D!geStjr4!=
5x4
> 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
|rp
> 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
}
> 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
>
> diff --git a/amd-ucode/microcode_amd_fam19h.bin.asc b/amd-ucode/microcode=
_amd_fam19h.bin.asc
> index 8cff9013..3955e529 100644
> --- a/amd-ucode/microcode_amd_fam19h.bin.asc
> +++ b/amd-ucode/microcode_amd_fam19h.bin.asc
> @@ -1,11 +1,11 @@
>  -----BEGIN PGP SIGNATURE-----
>
> -iQEzBAABCgAdFiEE/HxsUF2vzBRxg1fK5L5TOfMornMFAmTEYrcACgkQ5L5TOfMo
> -rnN4IQf/QKbOezXZ4OYzaPANvsZQEAzLNfuylC/aQMwrPaO7daz5/zmCN4HU5XkH
> -dDT8DYfPg+fQHIgxAw0/L24xPOm5Op/QuLVDyDqVr4qvL8+65eeI+JqxD/wXMXYN
> -V34kkLM2p8iuyY1Nc8IDLXu4X75KGNPbKZlMRKMU3Pr7ai5O4ihmiAM+N6qv1KEJ
> -YToNN6vrg0qt1cv0SLM8sa4e7L1+oblUrg/o0FViYE8pxsU3ZRRVSJMUg+lKjvl/
> -1ZPGKOdD80fcNJ+ItYGHNNs3eCc3WgW7Kc/E668eH75Yu9Zt7ewWZX8Sg/mygleY
> -OzMwhbPJg4bF4zm7C/Pku7i1T2Omcg=3D=3D
> -=3Dkm2X
> +iQEzBAABCgAdFiEE/HxsUF2vzBRxg1fK5L5TOfMornMFAmUoW6AACgkQ5L5TOfMo
> +rnMHAAf/SxaKEu5l7FGXR+QJYc2oSJDpf9ZsHTkVnxqF1I3ReItEGAR3iqSWrsRw
> +KA4niP9Ihr8EqwhOaOtqkRKKF9D5yg+DksnRWbh2VTUECO4KQxjHNrPp3JWEzBwb
> +Xn+vRVP02ZRi3u4MCYbnDC4AfUSnKnldY3TTlNi/6HUaGS2pcw8Vjli/C06zwfgh
> +WwUAoFMQl4SDJhbGfC9cb93MKjBl/0Hv4uhK5W8fJ1iUkMvY8Ijna/oDTZCNPqP0
> +0AgOwdAdzoyOYWjbUXcwofz2Umpz12xmJW8yXNwdv1pmaCvv9aCJz1L49lGwFH9E
> +lhhoFQ1SQL3hhPjTXO6DbeeT9+fjOg=3D=3D
> +=3D9Xav
>  -----END PGP SIGNATURE-----
> --
> 2.25.1
>
