Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36EDC433E0
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Aug 2020 11:43:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C007C20B1F; Wed, 12 Aug 2020 11:43:51 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9895720838
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2020 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597232631;
	bh=hDFUwjvRbEXJelumslPVUUr5YP7Win/vCM1rGBm0o6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pop5D+ucDjE8GF3c1tB+m1i9DTnwHQrE3ZJ30til1/zjIMx/ItY5VzUkJoc9spcCV
	 3+x4KxUax9jw+SgqA6N8zW9oaMzZ9/sBz5PnhA5u3Fc3qc/EO3AChBS7AV+aH7/MZR
	 8UwGfqWwKh9Km29URRWYwRSng82fZug2l+zPlBRk=
Received: by mail-io1-f51.google.com with SMTP id b17so2152072ion.7
        for <linux-firmware@kernel.org>; Wed, 12 Aug 2020 04:43:51 -0700 (PDT)
X-Gm-Message-State: AOAM530AtOYtkx0BDx4U9t0gh6JZnka6y66fmsO7nydqufSKDjq2HLMQ
	G4A42FLeccIZen4FAkgvSySp8gWg/nFfVePe3wI=
X-Google-Smtp-Source: ABdhPJyNjGqqac50LgCrj1VLmvzYpsKc7Gt2kTWWV21L8k0eSp3Tf1+pAWVb3nyY9YqfJ+5KPuEfT1760VcKVlRjVO0=
X-Received: by 2002:a6b:e419:: with SMTP id u25mr27053617iog.159.1597232631025;
 Wed, 12 Aug 2020 04:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200812034611.2944-1-jian-hong@endlessm.com>
In-Reply-To: <20200812034611.2944-1-jian-hong@endlessm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 12 Aug 2020 07:43:39 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7Hg_BS1VEp18Jif+DUfdouDx-Fv7kpCjR0QXDNhzH2uA@mail.gmail.com>
Message-ID: <CA+5PVA7Hg_BS1VEp18Jif+DUfdouDx-Fv7kpCjR0QXDNhzH2uA@mail.gmail.com>
Subject: Re: [PATCH] brcm: Add 4356 based AP6356S NVRAM for the khadas VIM2
To: Jian-Hong Pan <jian-hong@endlessm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, 
	Linux Firmware <linux-firmware@kernel.org>, Linux Wireless <linux-wireless@vger.kernel.org>, 
	brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, 
	netdev <netdev@vger.kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Nick Xie <nick@khadas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 11, 2020 at 11:49 PM Jian-Hong Pan <jian-hong@endlessm.com> wrote:
>
> Add a NVRAM file for the wireless module used in khadas VIM2.  This
> source comes from khadas fenix project's commit 022fdc3a1333 ("hwpacks:
> wlan-firmware: add AP6356S firmware for mainline linux"). [1]
>
> [1]: https://github.com/khadas/fenix/commit/022fdc3a1333d2d16f84c2e59e4507c92a668a3d
>
> Suggested-by: Nick Xie <nick@khadas.com>
> Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>

I don't think I can accept this.  The repo you're pulling it from only
has a GPLv2 license in it, and I very much doubt this is licensed
under GPLv2.  Also, the original committer includes no indication of
where they got it from and whether they had the right to release it
under this license.  If someone from Broadcom wants to correct the
redistribution rights and provide a SoB, I'd be happy to add it.

josh

> ---
>  brcm/brcmfmac4356-sdio.khadas,vim2.txt | 128 +++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 brcm/brcmfmac4356-sdio.khadas,vim2.txt
>
> diff --git a/brcm/brcmfmac4356-sdio.khadas,vim2.txt b/brcm/brcmfmac4356-sdio.khadas,vim2.txt
> new file mode 100644
> index 0000000..4c286cc
> --- /dev/null
> +++ b/brcm/brcmfmac4356-sdio.khadas,vim2.txt
> @@ -0,0 +1,128 @@
> +#AP6356SL_V1.1_NVRAM_20150805
> +#Modified from AP6356SDP_V1.0_NVRAM_20150216
> +NVRAMRev=$Rev: 373428 $
> +sromrev=11
> +boardrev=0x1121
> +boardtype=0x073e
> +boardflags=0x02400201
> +boardflags2=0x00802000
> +boardflags3=0x0000010a
> +macaddr=00:90:4c:1a:10:01
> +ccode=0x5855
> +regrev=1
> +antswitch=0
> +pdgain5g=4
> +pdgain2g=4
> +tworangetssi2g=0
> +tworangetssi5g=0
> +paprdis=0
> +femctrl=10
> +vendid=0x14e4
> +devid=0x43a3
> +manfid=0x2d0
> +nocrc=1
> +otpimagesize=502
> +xtalfreq=37400
> +rxgains2gelnagaina0=0
> +rxgains2gtrisoa0=7
> +rxgains2gtrelnabypa0=0
> +rxgains5gelnagaina0=0
> +rxgains5gtrisoa0=11
> +rxgains5gtrelnabypa0=0
> +rxgains5gmelnagaina0=0
> +rxgains5gmtrisoa0=13
> +rxgains5gmtrelnabypa0=0
> +rxgains5ghelnagaina0=0
> +rxgains5ghtrisoa0=12
> +rxgains5ghtrelnabypa0=0
> +rxgains2gelnagaina1=0
> +rxgains2gtrisoa1=7
> +rxgains2gtrelnabypa1=0
> +rxgains5gelnagaina1=0
> +rxgains5gtrisoa1=10
> +rxgains5gtrelnabypa1=0
> +rxgains5gmelnagaina1=0
> +rxgains5gmtrisoa1=11
> +rxgains5gmtrelnabypa1=0
> +rxgains5ghelnagaina1=0
> +rxgains5ghtrisoa1=11
> +rxgains5ghtrelnabypa1=0
> +rxchain=3
> +txchain=3
> +aa2g=3
> +aa5g=3
> +agbg0=2
> +agbg1=2
> +aga0=2
> +aga1=2
> +tssipos2g=1
> +extpagain2g=2
> +tssipos5g=1
> +extpagain5g=2
> +tempthresh=255
> +tempoffset=255
> +rawtempsense=0x1ff
> +pa2ga0=-135,5769,-647
> +pa2ga1=-143,6023,-677
> +pa5ga0=-183,5746,-697,-172,5801,-685,-176,5707,-680,-180,5445,-659
> +pa5ga1=-186,5543,-669,-193,5506,-675,-210,5282,-661,-199,5367,-665
> +subband5gver=0x4
> +pdoffsetcckma0=0x4
> +pdoffsetcckma1=0x4
> +pdoffset40ma0=0x0000
> +pdoffset80ma0=0x0000
> +pdoffset40ma1=0x0000
> +pdoffset80ma1=0x0000
> +maxp2ga0=72
> +maxp5ga0=69,70,69,68
> +maxp2ga1=71
> +maxp5ga1=67,67,67,67
> +cckbw202gpo=0x1222
> +cckbw20ul2gpo=0x0000
> +mcsbw202gpo=0x99E644422
> +mcsbw402gpo=0xE9744424
> +dot11agofdmhrbw202gpo=0x4444
> +ofdmlrbw202gpo=0x0022
> +mcsbw205glpo=0xEEA86661
> +mcsbw405glpo=0xEEB86663
> +mcsbw805glpo=0xEEB86663
> +mcsbw205gmpo=0xAAA86663
> +mcsbw405gmpo=0xECB86663
> +mcsbw805gmpo=0xEEA86663
> +mcsbw205ghpo=0xCC986663
> +mcsbw405ghpo=0xEEA86663
> +mcsbw805ghpo=0xEEA86663
> +mcslr5glpo=0x0000
> +mcslr5gmpo=0x0000
> +mcslr5ghpo=0x0000
> +sb20in40hrpo=0x0
> +sb20in80and160hr5glpo=0x0
> +sb40and80hr5glpo=0x0
> +sb20in80and160hr5gmpo=0x0
> +sb40and80hr5gmpo=0x0
> +sb20in80and160hr5ghpo=0x0
> +sb40and80hr5ghpo=0x0
> +sb20in40lrpo=0x0
> +sb20in80and160lr5glpo=0x0
> +sb40and80lr5glpo=0x0
> +sb20in80and160lr5gmpo=0x0
> +sb40and80lr5gmpo=0x0
> +sb20in80and160lr5ghpo=0x0
> +sb40and80lr5ghpo=0x0
> +dot11agduphrpo=0x0
> +dot11agduplrpo=0x0
> +phycal_tempdelta=255
> +temps_period=15
> +temps_hysteresis=15
> +rssicorrnorm_c0=4,4
> +rssicorrnorm_c1=4,4
> +rssicorrnorm5g_c0=1,2,3,1,2,3,6,6,8,6,6,8
> +rssicorrnorm5g_c1=1,2,3,2,2,2,7,7,8,7,7,8
> +
> +swctrlmap_2g=0x00001040,0x00004010,0x00004010,0x200010,0xff
> +swctrlmap_5g=0x00000202,0x00000101,0x00000101,0x000000,0x47
> +swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x000
> +swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x000
> +
> +muxenab=0x10
> +
> --
> 2.28.0
>
