Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4B1C0219D
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Feb 2025 12:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2683BC4CEFA; Mon, 10 Feb 2025 12:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01301C4CEF5
	for <linux-firmware@kernel.org>; Mon, 10 Feb 2025 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739191927;
	bh=yF6X3BvbYvFerhWqLU8ro2JxuVXJzFH9uRlewAW+S3I=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=I5A1lP7GepcmF6VAOgf8W4gjh1VOUf09LL4mh84owtGIt0Tjv4dS9yP7xPP82bkJ3
	 Avcv3r783rO1xTdq7/tQSCzzRFSfaVjRMW/kLzMijtuHjy/cTkdgVpoWzzE0bWptQQ
	 EqUfBqrwgbTezEEXgL77iMMWR+7T5sQJe8vcurRv/LkVG3nMJtWb0BNKP/NjNYJ3Ni
	 be2DWVwBI/Lt/WrKXYYJIq28gaWKKju8jBmejt1ewRNKzBimEod6jVHdq9yt4EYpKm
	 61ogAp5gJENzcHJT0MypDejLr/UDL6qWhyCCIp8bv5Ir56023Foe+0hR4ErNbYA5B8
	 9HX6EDXotx5oQ==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e5b16621c28so3237254276.2
        for <linux-firmware@kernel.org>; Mon, 10 Feb 2025 04:52:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLT+x/WO4gvMmpVI57XJ8kgvua2ZUJH0O+w4o9WbrDtz9GFu2HrAm2MuBEjW8rSOrvugyUR0Vx1BgdL9BCFQ==@kernel.org
X-Gm-Message-State: AOJu0YzrB/9Wz0OQ8xX7k6bU9D/+UvXIjo6Kea5At37C97xboMYOpKNL
	7c9LwFVUc6nf+5prqjh6EeVCkkcNeodiuUakwcO0rZsJv7lPUIWqZqWCz5V2fusSSSv3iC03nXn
	7MCYSQCcv/MYcTIBLAFD1OFSOtgY=
X-Google-Smtp-Source: AGHT+IFZAQSA8nZT0mgJdymX7s99wUId9uifB6JS5cSx+Gh3vhm5wSmvS3iJeqzgnSSpFpXhCppIgaiGdlPZw77FVnI=
X-Received: by 2002:a05:6902:1206:b0:e57:633b:6789 with SMTP id
 3f1490d57ef6-e5b4629d1e3mr11060115276.46.1739191926123; Mon, 10 Feb 2025
 04:52:06 -0800 (PST)
MIME-Version: 1.0
References: <20250210075211.5343-1-baojun.xu@ti.com>
In-Reply-To: <20250210075211.5343-1-baojun.xu@ti.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 10 Feb 2025 07:51:55 -0500
X-Gmail-Original-Message-ID: <CA+5PVA647txB7OME6eHeH4hCd=JfQ=0CazXi6Jpctf=N7oSx0g@mail.gmail.com>
X-Gm-Features: AWEUYZmVXgXU5kwTLTOMKeaY4Fz6TtILcpr0AyeIs0Jx3LsYhNL3TOnTPbkBU7s
Message-ID: <CA+5PVA647txB7OME6eHeH4hCd=JfQ=0CazXi6Jpctf=N7oSx0g@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Add regbin firmware by index for single device
To: Baojun Xu <baojun.xu@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: shenghao-ding@ti.com, linux-firmware@kernel.org, 13916275206@139.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alexander@burningdaylight.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 2:52=E2=80=AFAM Baojun Xu <baojun.xu@ti.com> wrote:
>
> Add regbin firmware by index for single device.
> Add more symbolic link for Gemtree project.
>
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/447

josh

> ---
>  WHENCE                      |  14 ++++++++++++++
>  ti/tas2781/TXNW2781RCA0.bin | Bin 0 -> 868 bytes
>  ti/tas2781/TXNW2781RCA1.bin | Bin 0 -> 868 bytes
>  3 files changed, 14 insertions(+)
>  create mode 100644 ti/tas2781/TXNW2781RCA0.bin
>  create mode 100644 ti/tas2781/TXNW2781RCA1.bin
>
> diff --git a/WHENCE b/WHENCE
> index d2ccfbb2..39b6de58 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -8010,12 +8010,18 @@ File: ti/tas2781/TAS2XXX3F300.bin
>  File: ti/tas2781/TAS2XXX3F301.bin
>  File: ti/tas2781/TAS2XXX8DE8.bin
>  File: ti/tas2781/TAS2XXX8DE9.bin
> +File: ti/tas2781/TXNW2781RCA0.bin
> +File: ti/tas2781/TXNW2781RCA1.bin
>  File: ti/tas2781/TIAS2781RCA2.bin
>  File: ti/tas2781/TIAS2781RCA4.bin
>  Link: TAS2XXX0C94.bin -> ti/tas2781/TAS2XXX0C94.bin
>  Link: TAS2XXX0C95.bin -> ti/tas2781/TAS2XXX0C95.bin
>  Link: TAS2XXX0C96.bin -> ti/tas2781/TAS2XXX0C96.bin
>  Link: TAS2XXX0C97.bin -> ti/tas2781/TAS2XXX0C97.bin
> +Link: TAS2XXX103C8DE80.bin -> ti/tas2781/TAS2XXX8DE8.bin
> +Link: TAS2XXX103C8DE81.bin -> ti/tas2781/TAS2XXX8DE8.bin
> +Link: TAS2XXX103C8DE90.bin -> ti/tas2781/TAS2XXX8DE9.bin
> +Link: TAS2XXX103C8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
>  Link: TAS2XXX10A40.bin -> ti/tas2781/TAS2XXX10A40.bin
>  Link: TAS2XXX10A41.bin -> ti/tas2781/TAS2XXX10A41.bin
>  Link: TAS2XXX11540.bin -> ti/tas2781/TAS2XXX11540.bin
> @@ -8074,8 +8080,16 @@ Link: TAS2XXX3F300.bin -> ti/tas2781/TAS2XXX3F300.=
bin
>  Link: TAS2XXX3F301.bin -> ti/tas2781/TAS2XXX3F301.bin
>  Link: TAS2XXX8DE8.bin -> ti/tas2781/TAS2XXX8DE8.bin
>  Link: TAS2XXX8DE9.bin -> ti/tas2781/TAS2XXX8DE9.bin
> +Link: TAS2XXX8DE80.bin -> ti/tas2781/TAS2XXX8DE8.bin
> +Link: TAS2XXX8DE81.bin -> ti/tas2781/TAS2XXX8DE8.bin
> +Link: TAS2XXX8DE90.bin -> ti/tas2781/TAS2XXX8DE9.bin
> +Link: TAS2XXX8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
>  Link: TIAS2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
>  Link: TIAS2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
> +Link: TXNW2781RCA0.bin -> ti/tas2781/TXNW2781RCA0.bin
> +Link: TXNW2781RCA1.bin -> ti/tas2781/TXNW2781RCA1.bin
> +Link: TXNW2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
> +Link: TXNW2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
>
>  Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
>          Copyright (C) 2023 - 2024 Texas Instruments
> diff --git a/ti/tas2781/TXNW2781RCA0.bin b/ti/tas2781/TXNW2781RCA0.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..9718640b529e324bc5975d7d6=
6bcfbdef8d4ad6e
> GIT binary patch
> literal 868
> zcmZQzU`{#U%krFofsqx68Pj~{%w_~J7~p^z$m#*&J3xE`E;@o3Da8f4hGt2bCA!5q
> z`6UMA_?(H6g>eB;qXrN&GcW=3DnL(EJD76y9;1}-Te4;c2mKrt}~1_nN$5`G|NVqj!u
> z1aUZk7^DLz&&1?u6byAsYH~(?QEFOhQEFatDk&}lxn&8^%nBgp0-6epU%n$iI~~y6
> z!~$`X0FVZ{i&6Xp&`B%|EMWgLg4rArKqG(v<Tef&kds*$I5Zd>Kw=3D;^mj{RiWk*27
> zA^yPXx1`E~#NuLz7BWeot&EjGy(K`*33eAKDKmrp2@FTLKW{QHBnSY#uLlozeEuWB
> JUkq5{3;=3Du;DgFQe
>
> literal 0
> HcmV?d00001
>
> diff --git a/ti/tas2781/TXNW2781RCA1.bin b/ti/tas2781/TXNW2781RCA1.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..f92631f8477b78cd8714e9941=
fa57d8346323df8
> GIT binary patch
> literal 868
> zcmZQzU`}~`QE(3f10yRCGp6~@`OgSqFu(ybkaY)$dw}=3D`Tyz96JdJ{N4b74=3DOLS9{
> zGxCd4(^894^O93_i*xcz42TN{CI%M9B|xPWK+MI!$N&sez9S3_{0<BZF*6xh80>+<
> zT0n6Y1_oYW&<g-*F$V@l@e>R{oeV5sTNuG?4he{jj6l^KG7Jzg4F;e=3D5H^<wL>{D%
> zD*_@8QVUebz|6=3D8l;i+nkO)YODW$jo>NgU61F-=3D{g8T+@pau{#L(B#H2`C2k6EIzY
> z`~>t51IT)QAja;Nq{@QC;$omQ`2ge=3DPym$xF(<?=3Dz@*F!4s)Qtk;0rIK>+AJE4bV6
> Mg*7NFImi!V0F@^x`v3p{
>
> literal 0
> HcmV?d00001
>
> --
> 2.34.1
>
