Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94627EB8FD7
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Sep 2023 11:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C387C4936D; Thu,  7 Sep 2023 11:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AB4C32780
	for <linux-firmware@kernel.org>; Thu,  7 Sep 2023 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694087052;
	bh=NhkNqCdl0MMoid1nErMtIK5yOEFB6u0sBeRLWKFgg+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jLIWtjhaapxVVPuw/Mjz3mBcn3bzSAVlHLNeuKOVug/Af/RpGdjSSJvj6guXD4obq
	 cuZggXEumWwRf7NiyKmw/TyWDm+cHtYFnN7Zs56xb4wDcq+JZPuP7IFSdiImbCjez0
	 63MlT+c/aQ5MTqXvAlEaC6KFPANlQDo2AWJeFxYBkOF5VWcrJT6kcwd0hnMXoFyx4s
	 GLOlHGq1TKcCTh/GYlSRnZGjucb4ViHqcUi1lYirU38e9CbCHySf1muru3TJV+JyLq
	 CoDokUm2vp7O6iFs6G3MPVsJtAz31cVUBfK40fvfc8oEVoOWEvl60TQG9zGAkUHCjE
	 T2QFKVmYJlO7w==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d7cbcfdf137so710402276.2
        for <linux-firmware@kernel.org>; Thu, 07 Sep 2023 04:44:12 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx0gyIvOBHv5ifrxajXrGB07NZaeVumRZ5KsIB+cm2LKihiEPec
	KwHlYsmw07T6LlbAYfcMJMOnof8yQdgOReH0C8w=
X-Google-Smtp-Source: AGHT+IF2H6JmxzNWpa8qeTim8c6AchM8+si4CMDkzHk4E05lYEfQ/yVlgtIKlWUFb/xWXkLVtMAT9bMxa2hLKuEGhEg=
X-Received: by 2002:a25:907:0:b0:cae:d40f:5934 with SMTP id
 7-20020a250907000000b00caed40f5934mr18566200ybj.27.1694087051247; Thu, 07 Sep
 2023 04:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAOYdKdhsMWGtubm-sRs3f8Y0K4Raz1ATbV_NhGw+04MtALiLQw@mail.gmail.com>
In-Reply-To: <CAOYdKdhsMWGtubm-sRs3f8Y0K4Raz1ATbV_NhGw+04MtALiLQw@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 7 Sep 2023 07:44:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA79oa-9vrgMmgf9VoR0mswVr+H4DuMtrPCYVg0odZf2Pg@mail.gmail.com>
Message-ID: <CA+5PVA79oa-9vrgMmgf9VoR0mswVr+H4DuMtrPCYVg0odZf2Pg@mail.gmail.com>
Subject: Re: [PATCH] brcm: Add 4334 NVRAM for the Wink Hub v1
To: Rogan Dawes <rogan@dawes.za.net>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2023 at 11:28=E2=80=AFAM Rogan Dawes <rogan@dawes.za.net> wr=
ote:
>
> Add a NVRAM file for the Broadcom 4334 Wifi/BT module as used on the
> Wink Hub v1 home automation gateway. This file has been lifted directly
> from the vendor firmware image, and has been tested using a custom
> OpenWrt build.
>
> Signed-off-by: Rogan Dawes <rogan@dawes.za.net>
> ---
>  ...cmfmac4334-sdio.wink,imx28-wink-hub-v1.txt | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt
>
> diff --git a/brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt b/brcm/brc=
mfmac4334-sdio.wink,imx28-wink-hub-v1.txt
> new file mode 100644
> index 00000000..e63019b0
> --- /dev/null
> +++ b/brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt

This fails to apply for some reason, and you didn't add an entry into
WHENCE.  Can you fix it up and resend?

josh

> @@ -0,0 +1,101 @@
> +# SWB-B53_B1_R04_eLNA 10/21/2011
> +
> +manfid=3D0x2d0
> +prodid=3D0x05c1
> +vendid=3D0x14e4
> +devid=3D0x4380
> +boardtype=3D0x05de
> +boardrev=3D0x1105
> +boardnum=3D22
> +macaddr=3D00:90:4c:c5:12:38
> +sromrev=3D0
> +
> +boardflags=3D0x10081a00
> +xtalfreq=3D37400
> +nocrc=3D1
> +ag0=3D255
> +aa2g=3D1
> +ccode=3DALL
> +pa0itssit=3D0x20
> +
> +#PA parameters for 2.4GHz (0x15A7,0xFD54,0xFF4A)
> +pa0b0=3D0x19B7
> +pa0b1=3D0xFD2A
> +pa0b2=3D0xFF7B
> +extpagain2g=3D2
> +extpagain5g=3D2
> +
> +# rssi params for 2.4GHz
> +rssismf2g=3D0x2
> +rssismc2g=3D0x7
> +rssisav2g=3D0x1
> +cckPwrOffset=3D0
> +
> +# rssi params for 5GHz
> +rssismf5g=3D0x8
> +rssismc5g=3D0x8
> +rssisav5g=3D0x1
> +
> +
> +#PA parameters for lower a-band
> +pa1lob0=3D5516
> +pa1lob1=3D-680
> +pa1lob2=3D-182
> +#PA parameters for midband
> +pa1b0=3D5560
> +pa1b1=3D-683
> +pa1b2=3D-178
> +#PA paramasdeters for high band
> +pa1hib0=3D5438
> +pa1hib1=3D-681
> +pa1hib2=3D-193
> +rxpo5g=3D0
> +
> +
> +maxp2ga0=3D66
> +ofdm2gpo=3D0x22222222
> +mcs2gpo0=3D0x4444
> +mcs2gpo1=3D0x4444
> +
> +maxp5ga0=3D0x4a
> +maxp5gla0=3D0x4a
> +maxp5gha0=3D0x4a
> +ofdm5gpo=3D0x66666666
> +ofdm5glpo=3D0x66666666
> +ofdm5ghpo=3D0x66666666
> +mcs5gpo0=3D0x8888
> +mcs5gpo1=3D0x8888
> +mcs5glpo0=3D0x8888
> +mcs5glpo1=3D0x8888
> +mcs5ghpo0=3D0x8888
> +mcs5ghpo1=3D0x8888
> +
> +#il0macaddr=3D00:90:4c:c5:12:38
> +wl0id=3D0x431b
> +pagc2g=3D0x10
> +#dacgc2g=3D4
> +txalpfbyp=3D1
> +
> +#For SEMCO B53-R04-eLNA Module
> +swctrlmap_2g=3D0x0c0c0c0c,0x12121212,0x02020202,0x11202,0x1ff
> +swctrlmap_5g=3D0x40404040,0x20202020,0x20202020,0x12202,0x2f8
> +
> +gain=3D32
> +triso2g=3D12
> +triso5g=3D8
> +
> +hostwake=3D0x40
> +hostrdy=3D0x41
> +usbrdy=3D0x03
> +usbrdydelay=3D100
> +deadman_to=3D0xffffffff
> +muxenab=3D0x1
> +
> +tssioffsetmax=3D27
> +
> +PwrOffset40mhz2g=3D0
> +PwrOffset40mhz5g=3D-8
> +
> +tssioffsetmax5gl=3D21
> +tssioffsetmax5gm=3D23
> +tssioffsetmax5gh=3D20
> --
> 2.34.1
>
