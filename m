Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78344C433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Sep 2021 13:30:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5AA28611CC; Tue, 28 Sep 2021 13:30:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44D52611CA
	for <linux-firmware@kernel.org>; Tue, 28 Sep 2021 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632835814;
	bh=Vieucxlsqi6xWL5mcibHOy1ZD/HDuWumVG41BqtnTmk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=es8+MbH52Se1wPsv4oyqghuu73oiLj8AnXagxkgcq3qWUArXHMqDPxyPeLqhBev+g
	 LwJkR2xZGhnzb27/eJR5RUBkLqC8r9fvpMRfuT6zrrfCseqKlpguTEGND8dOhJRarO
	 cKGZ0qt52SrGbNQE4Pg9I2Bhj/YmhBrFJXcLKqnlpNpsvmpippPPyseTJsJlrG82ck
	 1WwCY80DlSIkH7sElXHLfyj0HADvqqVU89cobKGNox5IJkNCXuO4ArjIG/GJLSTWmn
	 bVOWKLq65c5n1Tq1B9LDXI+ulb35AnGztYDKtTsp5Gv1rCs6+925NgXH+IDhAF4+9w
	 Ab+FiXvmHMfAQ==
Received: by mail-il1-f177.google.com with SMTP id q6so9357581ilm.3
        for <linux-firmware@kernel.org>; Tue, 28 Sep 2021 06:30:14 -0700 (PDT)
X-Gm-Message-State: AOAM532liT1V1bC9yt1Xy1PanrCJUiYpvvfpCW08odWDq9bg4EhllkC8
	C2A+XDjo8Uil2HWWA5h2PDHKeYe6Gw2VvtlXhXc=
X-Google-Smtp-Source: ABdhPJx/LRhUnmaBV0TdZ6OIHa9vm7EUQmVMuRXQfNYC/kMIVBwl37aONjN9hOsssP/GpajhOE0vBmF0Ah9Q0QwR6kM=
X-Received: by 2002:a05:6e02:1b03:: with SMTP id i3mr4305549ilv.251.1632835813695;
 Tue, 28 Sep 2021 06:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210926105030.6198-1-hdegoede@redhat.com>
In-Reply-To: <20210926105030.6198-1-hdegoede@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 28 Sep 2021 09:30:02 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5PAex8kaS=npXtHTSKBFbZLEHuYji9uPTW+AM-rpBP0g@mail.gmail.com>
Message-ID: <CA+5PVA5PAex8kaS=npXtHTSKBFbZLEHuYji9uPTW+AM-rpBP0g@mail.gmail.com>
Subject: Re: [PATCH] brcm: Add 43455 based AP6255 NVRAM for the ACEPC T8 Mini PC
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 26, 2021 at 6:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add a NVRAM file for the Ampak AP6255 Wifi/BT module as used
> on the ACEPC T8 Mini PC This file is based on the existing
> "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt" NVRAM file with
> the values adjusted for the Minix Neo Z83-4 Mini PC
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  WHENCE                               |  1 +
>  brcm/brcmfmac43455-sdio.acepc-t8.txt | 73 ++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 brcm/brcmfmac43455-sdio.acepc-t8.txt

Applied and pushed out.

josh

>
> diff --git a/WHENCE b/WHENCE
> index 3321033..16eaaa4 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2847,6 +2847,7 @@ File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
>  File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>  Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
> +File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> diff --git a/brcm/brcmfmac43455-sdio.acepc-t8.txt b/brcm/brcmfmac43455-sdio.acepc-t8.txt
> new file mode 100644
> index 0000000..8698316
> --- /dev/null
> +++ b/brcm/brcmfmac43455-sdio.acepc-t8.txt
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +# (C) Copyright 2018 Linaro Ltd
> +# NVRAM config file for the Ampak AP6255 43455 WiFi/BT module found on the
> +# ACEPC T8 (aka W8 pro) and the T11, as well as for the Cyberbook T116 tablet
> +AvVmid_c0=0,157,1,126,1,126,1,126,1,126
> +aa2g=1
> +aa5g=1
> +boardflags2=0x40000000
> +boardflags3=0x48200100
> +boardflags=0x00080201
> +boardrev=0x1304
> +boardtype=0x6e4
> +ccode=X2
> +deadman_to=481500000
> +devid=0x43ab
> +dot11agofdmhrbw202gpo=0x1553
> +ed_thresh2g=-54
> +ed_thresh5g=-54
> +extpagain2g=2
> +extpagain5g=2
> +femctrl=0
> +itrsw=1
> +ltecxfnsel=0x22
> +ltecxgcigpio=0x32
> +ltecxmux=0
> +ltecxpadnum=0x0504
> +macaddr=00:90:4c:c5:12:38
> +manfid=0x2d0
> +maxp2ga0=64
> +maxp5ga0=80,82,76,77
> +mcsbw202gpo=0x99355533
> +mcsbw205ghpo=0x99855000
> +mcsbw205glpo=0x99755000
> +mcsbw205gmpo=0x9df55000
> +mcsbw405ghpo=0xd9755000
> +mcsbw405glpo=0xb8555000
> +mcsbw405gmpo=0xed955000
> +mcsbw805ghpo=0xd9555000
> +mcsbw805glpo=0xc8555000
> +mcsbw805gmpo=0xe9555000
> +nocrc=1
> +ofdmlrbw202gpo=0x0033
> +pa2ga0=-112,6296,-662
> +pa2ga1=-165,3699,-515
> +pa5ga0=-143,6016,-683,-141,6013,-678,-137,5988,-670,-136,5982,-670
> +pa5ga1=-161,3544,-499,-166,3543,-497,-169,3569,-497,-171,3598,-498
> +pdoffset2g40ma0=10
> +pdoffset40ma0=0xaaaa
> +pdoffset80ma0=0xaaaa
> +prodid=0x06e4
> +regrev=1
> +rxchain=1
> +rxgains2gelnagaina0=0
> +rxgains2gtrelnabypa0=0
> +rxgains2gtrisoa0=0
> +rxgains5gelnagaina0=0
> +rxgains5gtrelnabypa0=0
> +rxgains5gtrisoa0=0
> +sd_gpout=0
> +sd_gpval=0
> +sromrev=11
> +swctrlmap_2g=0x00040004,0x00020002,0x00040004,0x010a02,0x1ff
> +swctrlmap_5g=0x00100010,0x00200020,0x00100010,0x010a02,0x2f4
> +swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x000
> +swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x000
> +tssipos2g=1
> +tssipos5g=1
> +tworangetssi2g=1
> +tworangetssi5g=1
> +txchain=1
> +vcodivmode=1
> +vendid=0x14e4
> +xtalfreq=37400
> --
> 2.31.1
>
