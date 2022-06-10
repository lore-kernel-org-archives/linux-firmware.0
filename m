Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ED8C43334
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Jun 2022 11:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 498D2C3411D; Fri, 10 Jun 2022 11:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332C7C34114
	for <linux-firmware@kernel.org>; Fri, 10 Jun 2022 11:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654859621;
	bh=kWAUY5z/OTF7Vg8k8Y7Sz9lw5/tKoo1TNf56kqsdOos=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=oq2qR2pML8Dwh9l9qWIKFpEE5St6J25f3dUjbeNnV+n5EYQYgGl2vkpTHgfuNaY8M
	 K3/gC/pTPpVuZtW/1rGRiP3Ml5M6y/v0N0CmrmL9gdXMmk4onrzHR3hSXmvdLPt9G1
	 sIIJ07xklADq41pxO3n+eYQBFXXXdC7h2RdkSbyB22YcK7vHIVn3j7G1jrGb0HZJ+Y
	 BA30j/058VrRNaRpDPU1L6JLxk1ZHnb0cO5QseY/BGhF2P+otGRl28nr3VUc9nBc2x
	 D+r5DsmvapLMKH4YP6HsU4bRChjWJ6ZBHNKasu3RyILrLzGnP7iVYkKVO2Nj3l04sl
	 NcQM3fYxCPcig==
Received: by mail-io1-f42.google.com with SMTP id y12so24947782ior.7
        for <linux-firmware@kernel.org>; Fri, 10 Jun 2022 04:13:41 -0700 (PDT)
X-Gm-Message-State: AOAM532mnxkMdaInK5UEjgx2aOnhYytOBzbg3ET/2+njK7NrgWTMmjx+
	nOSMdgM7d5EJIqh/V9d9X8vjQhgXX6dsLCGIS6w=
X-Google-Smtp-Source: ABdhPJyAktn1HzTe9b5yURYjWfkuX4O9TO94RAPYdiJ4mq40ainrDXcOcoa78FPhCgILYhgsug3ve937TqugZOFk+sc=
X-Received: by 2002:a6b:fa13:0:b0:64f:d480:30d3 with SMTP id
 p19-20020a6bfa13000000b0064fd48030d3mr21565411ioh.179.1654859620317; Fri, 10
 Jun 2022 04:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220607142716.1934891-1-strit@manjaro.org> <CA+5PVA6uMtqO7UyH1sDrqyeM57VXCS7tzMs5PiWVwBuHOAMqJA@mail.gmail.com>
In-Reply-To: <CA+5PVA6uMtqO7UyH1sDrqyeM57VXCS7tzMs5PiWVwBuHOAMqJA@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Jun 2022 07:13:29 -0400
X-Gmail-Original-Message-ID: <CA+5PVA53vCKMzd=ntC0PsKUBeP7PpNvQCZ_xuMj13o0r1WGFfA@mail.gmail.com>
Message-ID: <CA+5PVA53vCKMzd=ntC0PsKUBeP7PpNvQCZ_xuMj13o0r1WGFfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] brcm: Add NVRAM file 43455 based Wifi/BT module as
 used on the Quartz64 Model B from Pine64. This file is based on the existing
 "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt" NVRAM file.
To: Dan Johansen <strit@manjaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 10, 2022 at 7:09 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Tue, Jun 7, 2022 at 10:28 AM Dan Johansen <strit@manjaro.org> wrote:
> >
> > Signed-off-by: Dan Johansen <strit@manjaro.org>
> > ---
> >  brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt | 83 +++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644 brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
>
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt not listed in WHENCE
>
> Please add this entry to the WHENCE file.

OK, the combined commit with both of your patches is now pushed to the repo.

josh

> > diff --git a/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt b/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
> > new file mode 100644
> > index 0000000..abaf544
> > --- /dev/null
> > +++ b/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: GPL-2.0+
> > +# (C) Copyright 2018 Raspberry Pi (Trading) Ltd.
> > +# NVRAM config file for the BCM43455 WiFi/BT chip as found on the
> > +# Pine64 Quartz64 Model B
> > +aa2g=1
> > +aa5g=1
> > +AvVmid_c0=1,165,2,100,2,100,2,100,2,100
> > +boardflags=0x00480201
> > +boardflags2=0x40800000
> > +boardflags3=0x44200100
> > +boardrev=0x1304
> > +boardtype=0x6e4
> > +btc_mode=1
> > +btc_params1=0x7530
> > +btc_params8=0x4e20
> > +btc_params50=0x972c
> > +cbfilttype=1
> > +cckPwrIdxCorr=3
> > +cckTssiDelay=150
> > +deadman_to=481500000
> > +devid=0x43ab
> > +dot11agofdmhrbw202gpo=0x4442
> > +dot11b_opts=0x3aa85
> > +ed_thresh2g=-54
> > +ed_thresh5g=-54
> > +eu_edthresh2g=-54
> > +eu_edthresh5g=-54
> > +extpagain2g=2
> > +extpagain5g=2
> > +fdsslevel_ch11=6
> > +femctrl=0
> > +itrsw=1
> > +ldo1=4
> > +ltecxfnsel=0x22
> > +ltecxgcigpio=0x32
> > +ltecxmux=0
> > +ltecxpadnum=0x0504
> > +macaddr=b8:27:eb:74:f2:6c
> > +manfid=0x2d0
> > +maxp2ga0=80
> > +maxp5ga0=82,82,82,82
> > +mcsbw202gpo=0x98444422
> > +mcsbw205ghpo=0xb9555000
> > +mcsbw205glpo=0xb9555000
> > +mcsbw205gmpo=0xb9555000
> > +mcsbw402gpo=0x98444422
> > +mcsbw405ghpo=0xb9555000
> > +mcsbw405glpo=0xb9555000
> > +mcsbw405gmpo=0xb9555000
> > +mcsbw805ghpo=0xb9555000
> > +mcsbw805glpo=0xb9555000
> > +mcsbw805gmpo=0xb9555000
> > +nocrc=1
> > +ofdmlrbw202gpo=0x0022
> > +ofdmTssiDelay=150
> > +pa2ga0=-129,6525,-718
> > +pa2ga1=-149,4408,-601
> > +pa5ga0=-185,6836,-815,-186,6838,-815,-184,6859,-815,-184,6882,-818
> > +pa5ga1=-202,4285,-574,-201,4312,-578,-196,4391,-586,-201,4294,-575
> > +pdoffset2g40ma0=16
> > +pdoffset2gperchan=0,-2,1,0,1,0,1,1,1,0,0,-1,-1,0
> > +pdoffset40ma0=0x8888
> > +pdoffset80ma0=0x8888
> > +pdoffsetcckma0=2
> > +phycal_tempdelta=15
> > +prodid=0x06e4
> > +rawtempsense=0x1ff
> > +rxchain=1
> > +sromrev=11
> > +swctrlmap_2g=0x00000000,0x00000000,0x00000000,0x010000,0x3ff
> > +swctrlmap_5g=0x00100010,0x00200020,0x00200020,0x010000,0x3fe
> > +swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x3
> > +swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x3
> > +tssipos2g=1
> > +tssipos5g=1
> > +tworangetssi2g=1
> > +tworangetssi5g=1
> > +txchain=1
> > +txpwr2gAdcScale=1
> > +txpwr5gAdcScale=1
> > +vcodivmode=1
> > +vendid=0x14e4
> > +xtalfreq=37400
> > --
> > 2.36.1
> >
