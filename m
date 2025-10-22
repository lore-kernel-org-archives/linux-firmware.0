Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E9FCCD1AB
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Oct 2025 14:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DAC3EC4CEF7; Wed, 22 Oct 2025 14:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47C8C116B1
	for <linux-firmware@kernel.org>; Wed, 22 Oct 2025 14:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761143942;
	bh=P6EAYEDNHglbRcE+ypwHwhFAshNddbtmYfhrnepmFCY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=D1Y1osM4+4iO9xXkHnXS76nVsxolseWzAGP1k3WQz4VYp4WWxehT6FUD4A1Hkl1Gu
	 R2sK74TCYJ7d3RcH4Suzv9Bqz5yZGnF1v49xsFdus5TwaGgfsTqrbKhsKoQXgR8UFE
	 4hRRkJjq0k81ovDpKwOf4XASkhhzvAmw0RwJnTZZy5ykz+HTU6nBzmUdZ9BV3OB52K
	 THpALqKVmOrhM+QE/7nvtLs68SXVDwzUg0Qj6/rx51Ms9MJg1U2myYAkLiQfRIA9Zh
	 W+OgTniSBhB9FBbbv0DfST7RTRn6j6v6UZf7cDoB7LCnRlAtje7UNtF7zAB0v+PWW1
	 6orxNhHl5viUQ==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-63e19642764so5556955d50.1
        for <linux-firmware@kernel.org>; Wed, 22 Oct 2025 07:39:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YxhhJvg8XdXKaLkHIRsQPSANJ6VKnYg0MI4ZtYA0uy8sUt+FWri
	Rlk/W+iEPTecA7O23Dky9oahMgIGBi3wi0Pkk3q83MWXpni4m4GqUYcn8RozyR6wmXvRQH6EcKx
	cznTs6GwuU/76zaheHLhaS5hUtoApaCk=
X-Google-Smtp-Source: AGHT+IFmHVoOgD3+n29/bMoaB9ZOaoPt52PunvsPO3hR7HEWPpKLzyr71O+REWZwahPqHFfGfyXcMm0yOy4I6lkkxl4=
X-Received: by 2002:a53:dd4f:0:b0:63c:f5a7:3d8 with SMTP id
 956f58d0204a3-63e161f67a9mr11977263d50.68.1761143941922; Wed, 22 Oct 2025
 07:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <2bf2a966-7fe9-4e48-bb1e-c2a6b65d2b19@opensource.cirrus.com>
In-Reply-To: <2bf2a966-7fe9-4e48-bb1e-c2a6b65d2b19@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 22 Oct 2025 10:38:50 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6rx7BCP-nQrC=R8xiOj93BmMRpyEu4E_dyapupD2+neQ@mail.gmail.com>
X-Gm-Features: AS18NWA5jQZN5pOgTB7jGVE6HnTgFP3S5HXtbpXPfOG69ADQuU184DzKOZfRscQ
Message-ID: <CA+5PVA6rx7BCP-nQrC=R8xiOj93BmMRpyEu4E_dyapupD2+neQ@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Rename various Asus Laptop firmware
 files to not have Speaker ID
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com, 
	lockalsash@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 8:41=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to fix firmware filenames for Cirrus Logic Smart Amp CS35L4=
1
> for several ASUS Laptops.
>
> Thanks,
> Stefan Binding
>
> The following changes since commit 6a0152a5d1a9d7699e13ca7ed81df2caa1262a=
77:
>
>   Merge branch 'revert-WIFI_MT7922' into 'main' (2025-10-20 14:11:17 +000=
0)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20251022

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/754

josh

>
> for you to fetch changes up to 34d17f09fc425472f2784f95cee47b53e17a4f26:
>
>   cirrus: cs35l41: Rename various Asus Laptop firmware files to not have =
Speaker ID (2025-10-22 13:07:14 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>       cirrus: cs35l41: Rename various Asus Laptop firmware files to not h=
ave Speaker ID
>
>  WHENCE                                                                  =
                       |  30 ++++++++++--------------------
>  cirrus/{cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin =3D> cs35l41-dsp1-s=
pk-prot-10431fb3-l0.bin} | Bin
>  cirrus/{cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin =3D> cs35l41-dsp1-s=
pk-prot-10431fb3-r0.bin} | Bin
>  cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin                     =
                       | Bin 4432 -> 0 bytes
>  cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin                     =
                       | Bin 4432 -> 0 bytes
>  cirrus/{cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin =3D> cs35l41-dsp1-s=
pk-prot-10433d78-l0.bin} | Bin
>  cirrus/{cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin =3D> cs35l41-dsp1-s=
pk-prot-10433d78-r0.bin} | Bin
>  cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin                     =
                       | Bin 2096 -> 0 bytes
>  cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin                     =
                       | Bin 2100 -> 0 bytes
>  9 files changed, 10 insertions(+), 20 deletions(-)
>  rename cirrus/{cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin =3D> cs35l41=
-dsp1-spk-prot-10431fb3-l0.bin} (100%)
>  rename cirrus/{cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin =3D> cs35l41=
-dsp1-spk-prot-10431fb3-r0.bin} (100%)
>  delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin
>  delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin
>  rename cirrus/{cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin =3D> cs35l41=
-dsp1-spk-prot-10433d78-l0.bin} (100%)
>  rename cirrus/{cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin =3D> cs35l41=
-dsp1-spk-prot-10433d78-r0.bin} (100%)
>  delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin
>  delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin
>
