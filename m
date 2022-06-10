Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7ADC43334
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Jun 2022 11:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F234C341C5; Fri, 10 Jun 2022 11:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096E1C341C0
	for <linux-firmware@kernel.org>; Fri, 10 Jun 2022 11:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654859379;
	bh=rbLZy+tveWWWWo/ALyyhAHHfgvIF4l/ePLWbyz5gjDA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Aq0Unjtn5eTWMe2oXujIPk1HSLHaiE+t5psl/8PYjH40b8YgkF0Zv7y0sPAxgL+qG
	 WLDUo+mY179l3l333uIg3THRZkR+LbsLBCDwktX1iLvBm3H+qbmxTcpmqBYZNispxa
	 x3+IS8Gzc2Yr7gsA3wwp8cT2FZeJux4R5Y0lxs5zhAhikmcJf9plkNZhGOWBlKpEK5
	 Rx9jq/+uUdAbDPWuy5UU/adFSQ7a7RF4QpwJzjOTdHBfqdeqOBulffx4JBlXZUfh5W
	 L9WsUsfb3tE4RJzhTYLntcZLZ9n+h2jF2oQejDK1wk7iH3mBsqid7Nh42PFQnZHh9Y
	 J1qW9ocSLsPtw==
Received: by mail-il1-f175.google.com with SMTP id h7so13071659ila.10
        for <linux-firmware@kernel.org>; Fri, 10 Jun 2022 04:09:38 -0700 (PDT)
X-Gm-Message-State: AOAM5318istigI1Gp1FV12pJVxJmB6wFwCpQkzkiztNtpVztTyuaNy5G
	AbsCFqRf/0NGLErWjRlTMx0gnB/n0HgksA3S91s=
X-Google-Smtp-Source: ABdhPJwCZkMMsdcArMap7vacuM3kAcwtlU8B8zCa8Og1JgLu7d4nK7vjIHzvv1iOfgjTUdh+lqpZHy28uYVGYDKEoqg=
X-Received: by 2002:a05:6e02:1c45:b0:2d3:bb0c:9559 with SMTP id
 d5-20020a056e021c4500b002d3bb0c9559mr25718531ilg.251.1654859378169; Fri, 10
 Jun 2022 04:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220607142716.1934891-1-strit@manjaro.org>
In-Reply-To: <20220607142716.1934891-1-strit@manjaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Jun 2022 07:09:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6uMtqO7UyH1sDrqyeM57VXCS7tzMs5PiWVwBuHOAMqJA@mail.gmail.com>
Message-ID: <CA+5PVA6uMtqO7UyH1sDrqyeM57VXCS7tzMs5PiWVwBuHOAMqJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] brcm: Add NVRAM file 43455 based Wifi/BT module as
 used on the Quartz64 Model B from Pine64. This file is based on the existing
 "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt" NVRAM file.
To: Dan Johansen <strit@manjaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 10:28 AM Dan Johansen <strit@manjaro.org> wrote:
>
> Signed-off-by: Dan Johansen <strit@manjaro.org>
> ---
>  brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt not listed in WHENCE

Please add this entry to the WHENCE file.

josh

>
> diff --git a/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt b/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
> new file mode 100644
> index 0000000..abaf544
> --- /dev/null
> +++ b/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +# (C) Copyright 2018 Raspberry Pi (Trading) Ltd.
> +# NVRAM config file for the BCM43455 WiFi/BT chip as found on the
> +# Pine64 Quartz64 Model B
> +aa2g=1
> +aa5g=1
> +AvVmid_c0=1,165,2,100,2,100,2,100,2,100
> +boardflags=0x00480201
> +boardflags2=0x40800000
> +boardflags3=0x44200100
> +boardrev=0x1304
> +boardtype=0x6e4
> +btc_mode=1
> +btc_params1=0x7530
> +btc_params8=0x4e20
> +btc_params50=0x972c
> +cbfilttype=1
> +cckPwrIdxCorr=3
> +cckTssiDelay=150
> +deadman_to=481500000
> +devid=0x43ab
> +dot11agofdmhrbw202gpo=0x4442
> +dot11b_opts=0x3aa85
> +ed_thresh2g=-54
> +ed_thresh5g=-54
> +eu_edthresh2g=-54
> +eu_edthresh5g=-54
> +extpagain2g=2
> +extpagain5g=2
> +fdsslevel_ch11=6
> +femctrl=0
> +itrsw=1
> +ldo1=4
> +ltecxfnsel=0x22
> +ltecxgcigpio=0x32
> +ltecxmux=0
> +ltecxpadnum=0x0504
> +macaddr=b8:27:eb:74:f2:6c
> +manfid=0x2d0
> +maxp2ga0=80
> +maxp5ga0=82,82,82,82
> +mcsbw202gpo=0x98444422
> +mcsbw205ghpo=0xb9555000
> +mcsbw205glpo=0xb9555000
> +mcsbw205gmpo=0xb9555000
> +mcsbw402gpo=0x98444422
> +mcsbw405ghpo=0xb9555000
> +mcsbw405glpo=0xb9555000
> +mcsbw405gmpo=0xb9555000
> +mcsbw805ghpo=0xb9555000
> +mcsbw805glpo=0xb9555000
> +mcsbw805gmpo=0xb9555000
> +nocrc=1
> +ofdmlrbw202gpo=0x0022
> +ofdmTssiDelay=150
> +pa2ga0=-129,6525,-718
> +pa2ga1=-149,4408,-601
> +pa5ga0=-185,6836,-815,-186,6838,-815,-184,6859,-815,-184,6882,-818
> +pa5ga1=-202,4285,-574,-201,4312,-578,-196,4391,-586,-201,4294,-575
> +pdoffset2g40ma0=16
> +pdoffset2gperchan=0,-2,1,0,1,0,1,1,1,0,0,-1,-1,0
> +pdoffset40ma0=0x8888
> +pdoffset80ma0=0x8888
> +pdoffsetcckma0=2
> +phycal_tempdelta=15
> +prodid=0x06e4
> +rawtempsense=0x1ff
> +rxchain=1
> +sromrev=11
> +swctrlmap_2g=0x00000000,0x00000000,0x00000000,0x010000,0x3ff
> +swctrlmap_5g=0x00100010,0x00200020,0x00200020,0x010000,0x3fe
> +swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x3
> +swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x3
> +tssipos2g=1
> +tssipos5g=1
> +tworangetssi2g=1
> +tworangetssi5g=1
> +txchain=1
> +txpwr2gAdcScale=1
> +txpwr5gAdcScale=1
> +vcodivmode=1
> +vendid=0x14e4
> +xtalfreq=37400
> --
> 2.36.1
>
