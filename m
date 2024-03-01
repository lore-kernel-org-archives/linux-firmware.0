Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC6CC5475B
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Mar 2024 19:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36E57C43394; Fri,  1 Mar 2024 19:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A7CC433F1
	for <linux-firmware@kernel.org>; Fri,  1 Mar 2024 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709320699;
	bh=3IQL3xWuAM2S57bOJSBTVHx+AT1g1hY0PKjQnlJ/oDA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nL7KF5KgmmcY/zge9OPncIqHlGRVIsbimAs1/2n4gTXg6xXPYOJbLp1qLpJvPCt49
	 mBdxFM5+YS16z79ZnMBE/xSc5f6GxGGCbCk46ZqCsJVF7Gf/MDyxpOT+U3Ym4Lgb28
	 gP0akWWqMlFvQWFsK5V5c8qtEbOZctjlStpGjlCQQcVx04AbuBdbKllQ6CkAMTSgSI
	 sUWUBb2J4aD7DFS7egbKI86F7wC2D36N6SYlW/+rqKXHgAy++3fAX6WDiZoQzwngLv
	 ezpWl/jcsnKZheviqdynX8aAj+/NKCijpBBo2oZBHIgklUHt1DdLTQl82Yfr+hu20M
	 ALsVvYyC4qpOQ==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcc73148611so2672906276.3
        for <linux-firmware@kernel.org>; Fri, 01 Mar 2024 11:18:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtou6TQ22yj6u2HCk2tGThybiGk3O7nhgmxKrIA8Rlx4EZhuTDWY76D3JymZFTMlvyRmm+9ef9pMBj8vKgglW4zrkG6QCnYx1f
X-Gm-Message-State: AOJu0Yz8EOiBk6tqkNUeEr534Zl3CHNdM1rU6p/VZ/iayfawVXVBxLOd
	5dINte+ZMr0zMeObvUDh9tcJc0ao7DSmytNtDwWVofY2e6XDHxm+yZGjMQmSPElP5qtPN6hG2pT
	OdDEYk9DA8Kux8XR7HxFbwFUndOg=
X-Google-Smtp-Source: AGHT+IHbAmJR5FrfzeEVsLG86Bfgf97fHoQUK7NSi0ISdaxsbRt4RCWk6GczL6oKqRvX9olM6Py7DyNBavhXcfksL8c=
X-Received: by 2002:a5b:50b:0:b0:dcf:9018:67 with SMTP id o11-20020a5b050b000000b00dcf90180067mr2602957ybp.42.1709320698229;
 Fri, 01 Mar 2024 11:18:18 -0800 (PST)
MIME-Version: 1.0
References: <20240228223049.40959-1-hdegoede@redhat.com>
In-Reply-To: <20240228223049.40959-1-hdegoede@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 1 Mar 2024 14:18:07 -0500
X-Gmail-Original-Message-ID: <CA+5PVA73OE3zCUhaO0e6znT+r77LZeGJb4drmPua0fHXW_obgQ@mail.gmail.com>
Message-ID: <CA+5PVA73OE3zCUhaO0e6znT+r77LZeGJb4drmPua0fHXW_obgQ@mail.gmail.com>
Subject: Re: [PATCH linux-firmware] brcm: Add nvram for the Acer Iconia One 7
 B1-750 tablet
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Mario Limonciello <superm1@gmail.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/161

josh

On Wed, Feb 28, 2024 at 5:30=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Add a NVRAM file for the brcmfmac43340 wifi/bt chip found on the Acer
> Iconia One 7 B1-750 tablet. This is based on copy of the existing
> 'brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt' file with
> some of the values adjusted for the Acer Iconia One 7 B1-750 tablet.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  WHENCE                                    |  1 +
>  brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt | 96 +++++++++++++++++++++++
>  2 files changed, 97 insertions(+)
>  create mode 100644 brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt
>
> diff --git a/WHENCE b/WHENCE
> index 576f8d73..ffa5b6b2 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2833,6 +2833,7 @@ Licence: Redistributable. See LICENCE.cypress for d=
etails.
>  File: "brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt"
>  File: "brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt"
>  File: "brcm/brcmfmac4330-sdio.Prowise-PT301.txt"
> +File: "brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt"
>  File: "brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
>  File: "brcm/brcmfmac43340-sdio.meegopad-t08.txt"
>  File: "brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt"
> diff --git a/brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt b/brcm/brcmfmac433=
40-sdio.Insyde-VESPA2.txt
> new file mode 100644
> index 00000000..cb930518
> --- /dev/null
> +++ b/brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +# (C) Copyright 2018 Linaro Ltd
> +# NVRAM config file for the 43430 WiFi/BT chip as found on the Acer Icon=
ia
> +# One 7 B1-750 tablet's mainboard
> +aa2g=3D1
> +aci_detect_en_2g=3D1
> +ag0=3D255
> +boardflags=3D0x0090201
> +boardnum=3D22
> +boardrev=3D0x1203
> +boardtype=3D0x0653
> +btc_params95=3D0x9
> +cck2gpo=3D0x0000
> +cckPwrOffset=3D3
> +cckpapden=3D0
> +ccode=3DXZ
> +dacrate2xen=3D1
> +devid=3D0x4386
> +dlocalidx5g=3D70
> +dlorange_lowlimit=3D5
> +gain=3D32
> +gain_settle_dly_2g=3D4
> +gain_settle_dly_5g=3D4
> +interference=3D3
> +iqcalidx5g=3D50
> +iqlocalidx5g=3D40
> +loflag=3D0
> +lpbckmode5g=3D1
> +macaddr=3D00:90:4c:c5:12:38
> +manfid=3D0x2d0
> +maxp2ga0=3D0x38
> +maxp5ga0=3D0x38
> +maxp5gha0=3D0x38
> +maxp5gla0=3D0x38
> +mcs2gpo0=3D0x6666
> +mcs2gpo1=3D0x6666
> +mcs5ghpo0=3D0x2000
> +mcs5ghpo1=3D0x6622
> +mcs5glpo0=3D0x2000
> +mcs5glpo1=3D0x6622
> +mcs5gpo0=3D0x2000
> +mcs5gpo1=3D0x6622
> +nocrc=3D1
> +noise_cal_high_gain_2g=3D73
> +noise_cal_high_gain_5g=3D73
> +noise_cal_nf_substract_val_2g=3D346
> +noise_cal_nf_substract_val_5g=3D346
> +noise_cal_po_2g=3D-1
> +noise_cal_po_40_2g=3D-1
> +noise_cal_po_40_5g=3D-1
> +noise_cal_po_5g=3D-1
> +ofdm2gpo=3D0x00000000
> +ofdm5ghpo=3D0x66222000
> +ofdm5glpo=3D0x66222000
> +ofdm5gpo=3D0x66222000
> +pa0b0=3D0x1bba
> +pa0b1=3D0xfcae
> +pa0b2=3D0xff4a
> +pa0itssit=3D0x20
> +pa1b0=3D0xac8
> +pa1b1=3D0xfe4e
> +pa1b2=3D0xff59
> +pa1hib0=3D0xaf6
> +pa1hib1=3D0xfe48
> +pa1hib2=3D0xff7b
> +pa1lob0=3D0xbb9
> +pa1lob1=3D0xfe3d
> +pa1lob2=3D0xFF44
> +papden2g=3D1
> +papden5g=3D1
> +prodid=3D0x0653
> +regrev=3D1
> +rssisav2g=3D0x1
> +rssisav5g=3D0x3
> +rssismc2g=3D0x8
> +rssismc5g=3D0x7
> +rssismf2g=3D0xf
> +rssismf5g=3D0xf
> +rxpo5g=3D0
> +sd_gpout=3D4
> +sd_oobonly=3D1
> +sromrev=3D3
> +swctrlmap_2g=3D0x00080008,0x00100010,0x00080008,0x011010,0x11f
> +swctrlmap_5g=3D0x00020002,0x00040004,0x00020002,0x011010,0x2fe
> +triso2g=3D8
> +triso5g=3D8
> +tssifloor2g=3D63
> +tssifloor5gh=3D27
> +tssifloor5gl=3D28
> +tssifloor5gm=3D28
> +txalpfbyp=3D1
> +txalpfpu=3D1
> +txiqlopapu2g=3D0
> +txiqlopapu5g=3D0
> +vendid=3D0x14e4
> +xtalfreq=3D37400
> --
> 2.43.2
>
