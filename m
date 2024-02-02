Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08427C47DB3
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 12:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1C71C43399; Fri,  2 Feb 2024 12:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA524C43394
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706876760;
	bh=ASt7A+MCrqjLpRiJUhXElVDLBlov1Zz4vaFF8R2yuDY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=t6pPI7yxDeirm/enBHnRpOQM1eTo5vP3G6rIKwP6moIDvSg8Q1iUzOcNyW/OET4NX
	 u8SRQW77sIIN67SNlS1fwHU2JZSEpK5zOpDg8/59Mr+EXxtsfALNOeO6/WCpU0inHR
	 NiaWPql27vcwiNXoYZ6VhK1k4LM9QkzXb9VJO67umt71OJxdRxDCpaOpGz9R+/mNGu
	 z8dr8OyRXnFZ+YBEROD0COdVfiBNC4E9hHiGm1xzk6+gVlSH0KzpKR8jIIAL8zN3iV
	 YJu0ZpyJt49FLYeIhG5JmWl0mX2MK8xyGfh+mfL1YwKMK1rDMwvXuGDVF+H019j28j
	 P3VWeWvHImxIg==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6e0fe3195so1367228276.0
        for <linux-firmware@kernel.org>; Fri, 02 Feb 2024 04:26:00 -0800 (PST)
X-Gm-Message-State: AOJu0YwRM9K+BdPTbqo/FT79rBXahMQR0wbuc0Rdv3/6TIkdi2aWnNjn
	AH93cWmaFBEQOvQii3/luIEqAWVZaQ3NJwIFQdGHW34puAQQBBSMX0qeOgYShyMzT1/MWBvEjSe
	mNrEFx2l/1e/TIv9yAqZ+NOXn+UE=
X-Google-Smtp-Source: AGHT+IHvQ8/+Yrqt2yKqdSR4gnygeZFpWMdICWpFa1z73ymsNzgulHGzyybJc6u0kUmNEMoqwmp9z++PPznE5bG5tfg=
X-Received: by 2002:a25:6412:0:b0:dbd:b892:ef1d with SMTP id
 y18-20020a256412000000b00dbdb892ef1dmr7041959ybb.24.1706876759909; Fri, 02
 Feb 2024 04:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20240129170422.48797-1-hdegoede@redhat.com>
In-Reply-To: <20240129170422.48797-1-hdegoede@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Feb 2024 07:25:49 -0500
X-Gmail-Original-Message-ID: <CA+5PVA56fqJOCWAvmfft4pPaUezHastsB4b-xEQ0HNEzN=3d1w@mail.gmail.com>
Message-ID: <CA+5PVA56fqJOCWAvmfft4pPaUezHastsB4b-xEQ0HNEzN=3d1w@mail.gmail.com>
Subject: Re: [PATCH linux-firmware] brcm: Add brcmfmac43430-sdio.xxx.txt nvram
 for the Chuwi Hi8 (CWI509) tablet
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Mario Limonciello <superm1@gmail.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 12:04=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Add a NVRAM file for the brcmfmac43430[a1] wifi/bt chip found on some
> versions of the Chuw Hi8 (CWI509) tablet. This is based on copy of
> the existing brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt NVRAM file with som=
e
> the calibration values adjusted for the Chuwi Hi8 tablet.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/135

josh

> ---
>  WHENCE                                 |  1 +
>  brcm/brcmfmac43430-sdio.ilife-S806.txt | 50 ++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 brcm/brcmfmac43430-sdio.ilife-S806.txt
>
> diff --git a/WHENCE b/WHENCE
> index c3a59846..3fc8a53c 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2842,6 +2842,7 @@ Link: brcm/brcmfmac43430-sdio.starfive,visionfive-v=
1.txt -> brcmfmac43430-sdio.A
>  Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt -> =
brcmfmac43430-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-r0.txt -> =
brcmfmac43430-sdio.AP6212.txt
>  File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
> +File: "brcm/brcmfmac43430-sdio.ilife-S806.txt"
>  File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>  Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43=
430-sdio.raspberrypi,3-model-b.txt
> diff --git a/brcm/brcmfmac43430-sdio.ilife-S806.txt b/brcm/brcmfmac43430-=
sdio.ilife-S806.txt
> new file mode 100644
> index 00000000..162b1e70
> --- /dev/null
> +++ b/brcm/brcmfmac43430-sdio.ilife-S806.txt
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +# (C) Copyright 2018 Linaro Ltd
> +# NVRAM config file for the 43430A1 WiFi/BT chip as found on the Chuwi H=
i8
> +# tablet's mainboard
> +aa2g=3D1
> +ag0=3D255
> +AvVmid_c0=3D0x0,0xc8
> +boardflags=3D0x00404201
> +# boardflags3 is not set
> +boardnum=3D22
> +boardrev=3D0x1101
> +boardtype=3D0x0726
> +# btc_params is not set
> +cckbw202gpo=3D0x5555
> +cckpwroffset0=3D5
> +ccode=3DX2
> +# cldo_pwm is not set
> +deadman_to=3D0xffffffff
> +devid=3D0x43e2
> +extpagain2g=3D0
> +hostrdy=3D0x41
> +hostwake=3D0x40
> +il0macaddr=3D00:90:4c:c5:12:38
> +legofdmbw202gpo=3D0x77777777
> +macaddr=3D00:90:4c:c5:12:38
> +manfid=3D0x2d0
> +maxp2ga0=3D90
> +mcsbw202gpo=3D0xaaaaaaaa
> +nocrc=3D1
> +ofdmdigfilttype=3D7
> +pa0itssit=3D0x20
> +pa2ga0=3D-168,7161,-820
> +# pacalidx2g is not set
> +# papdendidx is not set
> +# papdepsoffset is not set
> +papdmode=3D2
> +# papdvalidtest is not set
> +prodid=3D0x0726
> +# propbw202gpois not set
> +sd_gpdc=3D0
> +sd_gpout=3D0
> +sd_gpval=3D1
> +# spurconfig is not set
> +sromrev=3D11
> +txpwrbckof=3D6
> +usbrdy=3D0x03
> +usbrdydelay=3D100
> +vendid=3D0x14e4
> +wl0id=3D0x431b
> +xtalfreq=3D26000
> --
> 2.43.0
>
