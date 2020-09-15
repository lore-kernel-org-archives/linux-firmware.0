Return-Path: <SRS0=wkDw=CY=endlessos.org=jhp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233A9C43461
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Sep 2020 06:54:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F141020897; Tue, 15 Sep 2020 06:54:43 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D3B920756
	for <linux-firmware@kernel.org>; Tue, 15 Sep 2020 06:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=endlessos-org.20150623.gappssmtp.com header.i=@endlessos-org.20150623.gappssmtp.com header.b="1hkKgUZr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D3B920756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=endlessos.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jhp@endlessos.org
Received: by mail-ot1-f68.google.com with SMTP id o8so2258046otl.4
        for <linux-firmware@kernel.org>; Mon, 14 Sep 2020 23:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y0qvxTHf2JfeUgxFZVNGDV0irX/AIvZAOhWO9mjas04=;
        b=1hkKgUZrOvOyCH0PecAv6/ERyZJAWx34PdEyLNQm9I9r8Y+oTaBpvaRN8RgqANIR9S
         Qcx9l1bLWmL9on/nOyUtkxK4QPAIHPHxxzYT64qayFgPx8DsK+k/JJFgqKRV/SRlMECp
         aaacj+Wp5OcuoA3OfYyMnEehRotXQB1uLGHuUnMwatne3eMgKDNFxjDjiXAsuAwwfLs7
         De7UCGGrXDLqH3us9cwG1lnM99OFPu+B3UaRo1Zq/2wdvBmadfpSOvBysXz+c2Sohzs0
         6TLWrTLRq5cVJ3Zpg4JOIJzMxeV+ILCEho9SO4/P9+w/9SYSE4EY8ckuPmlSzr9Bm30b
         WY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y0qvxTHf2JfeUgxFZVNGDV0irX/AIvZAOhWO9mjas04=;
        b=uLeG0tAHEQz5Raj8xVRB204xQpFyeYuArAirC75MTG15P8nWvMyTJNyI2/d7hYuGzU
         1bIU3lqaai/CbG9wR00R2JoxnueF4mS4tAqiU26dkGxCBgkG4rtJcEM7ejMqFLUA1scn
         U6+lQTsTI/KGSsqAZZstmr2fgAdm2IofYdSL/x9RBLMpdE0lqu9WNuo7jaIj5swRhGzz
         NWh71+n5EZnxsmucf32Q9+wW4BYyyb+KM7hIhkyNomWU3DzNdfX5SiJTyXfrUpWjgqKB
         J03Ntefm03MS4Q0ilO/auLJFVjHZ/9GCTdV8Uv51vC820SGS8jViscYNZj90c7IOU6V+
         OAWA==
X-Gm-Message-State: AOAM532fwE7ktUE3UdSjgxAP14C+eg12T9LMvOEKmrORCOjHplRKbGiu
	kZk+9lv+JONgqoL5VwUPEoNFx/kIhkbs4oosW5SShMQjEDwIrZyz
X-Google-Smtp-Source: ABdhPJyK2AzIUCJWePegdU5MmyvnS/diWBjJcIwWkrLc0Wz1jZ/vE06pzh/ybDr+DD9Etf9wnsBZUi45chgscvwS8GU=
X-Received: by 2002:a9d:1:: with SMTP id 1mr10284648ota.81.1600152882483; Mon,
 14 Sep 2020 23:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200812034611.2944-1-jian-hong@endlessm.com> <CA+5PVA7Hg_BS1VEp18Jif+DUfdouDx-Fv7kpCjR0QXDNhzH2uA@mail.gmail.com>
In-Reply-To: <CA+5PVA7Hg_BS1VEp18Jif+DUfdouDx-Fv7kpCjR0QXDNhzH2uA@mail.gmail.com>
From: Jian-Hong Pan <jhp@endlessos.org>
Date: Tue, 15 Sep 2020 14:53:09 +0800
Message-ID: <CAPpJ_efLJ0ZW_6jjDtKO9okJZdfOYLDO9dknP22PXAwksXrpbw@mail.gmail.com>
Subject: Re: [PATCH] brcm: Add 4356 based AP6356S NVRAM for the khadas VIM2
To: Nick Xie <nick@khadas.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Jian-Hong Pan <jian-hong@endlessm.com>, Kalle Valo <kvalo@codeaurora.org>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, 
	Wright Feng <wright.feng@cypress.com>, Linux Firmware <linux-firmware@kernel.org>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, brcm80211-dev-list.pdl@broadcom.com, 
	brcm80211-dev-list@cypress.com, netdev <netdev@vger.kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Josh Boyer <jwboyer@kernel.org>, 
	Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Josh Boyer <jwboyer@kernel.org> =E6=96=BC 2020=E5=B9=B48=E6=9C=8812=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Aug 11, 2020 at 11:49 PM Jian-Hong Pan <jian-hong@endlessm.com> w=
rote:
> >
> > Add a NVRAM file for the wireless module used in khadas VIM2.  This
> > source comes from khadas fenix project's commit 022fdc3a1333 ("hwpacks:
> > wlan-firmware: add AP6356S firmware for mainline linux"). [1]
> >
> > [1]: https://github.com/khadas/fenix/commit/022fdc3a1333d2d16f84c2e59e4=
507c92a668a3d
> >
> > Suggested-by: Nick Xie <nick@khadas.com>
> > Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
>
> I don't think I can accept this.  The repo you're pulling it from only
> has a GPLv2 license in it, and I very much doubt this is licensed
> under GPLv2.  Also, the original committer includes no indication of
> where they got it from and whether they had the right to release it
> under this license.  If someone from Broadcom wants to correct the
> redistribution rights and provide a SoB, I'd be happy to add it.

If khadas can share some information about this, that will be appreciated, =
too.

Jian-Hong Pan

> > ---
> >  brcm/brcmfmac4356-sdio.khadas,vim2.txt | 128 +++++++++++++++++++++++++
> >  1 file changed, 128 insertions(+)
> >  create mode 100644 brcm/brcmfmac4356-sdio.khadas,vim2.txt
> >
> > diff --git a/brcm/brcmfmac4356-sdio.khadas,vim2.txt b/brcm/brcmfmac4356=
-sdio.khadas,vim2.txt
> > new file mode 100644
> > index 0000000..4c286cc
> > --- /dev/null
> > +++ b/brcm/brcmfmac4356-sdio.khadas,vim2.txt
> > @@ -0,0 +1,128 @@
> > +#AP6356SL_V1.1_NVRAM_20150805
> > +#Modified from AP6356SDP_V1.0_NVRAM_20150216
> > +NVRAMRev=3D$Rev: 373428 $
> > +sromrev=3D11
> > +boardrev=3D0x1121
> > +boardtype=3D0x073e
> > +boardflags=3D0x02400201
> > +boardflags2=3D0x00802000
> > +boardflags3=3D0x0000010a
> > +macaddr=3D00:90:4c:1a:10:01
> > +ccode=3D0x5855
> > +regrev=3D1
> > +antswitch=3D0
> > +pdgain5g=3D4
> > +pdgain2g=3D4
> > +tworangetssi2g=3D0
> > +tworangetssi5g=3D0
> > +paprdis=3D0
> > +femctrl=3D10
> > +vendid=3D0x14e4
> > +devid=3D0x43a3
> > +manfid=3D0x2d0
> > +nocrc=3D1
> > +otpimagesize=3D502
> > +xtalfreq=3D37400
> > +rxgains2gelnagaina0=3D0
> > +rxgains2gtrisoa0=3D7
> > +rxgains2gtrelnabypa0=3D0
> > +rxgains5gelnagaina0=3D0
> > +rxgains5gtrisoa0=3D11
> > +rxgains5gtrelnabypa0=3D0
> > +rxgains5gmelnagaina0=3D0
> > +rxgains5gmtrisoa0=3D13
> > +rxgains5gmtrelnabypa0=3D0
> > +rxgains5ghelnagaina0=3D0
> > +rxgains5ghtrisoa0=3D12
> > +rxgains5ghtrelnabypa0=3D0
> > +rxgains2gelnagaina1=3D0
> > +rxgains2gtrisoa1=3D7
> > +rxgains2gtrelnabypa1=3D0
> > +rxgains5gelnagaina1=3D0
> > +rxgains5gtrisoa1=3D10
> > +rxgains5gtrelnabypa1=3D0
> > +rxgains5gmelnagaina1=3D0
> > +rxgains5gmtrisoa1=3D11
> > +rxgains5gmtrelnabypa1=3D0
> > +rxgains5ghelnagaina1=3D0
> > +rxgains5ghtrisoa1=3D11
> > +rxgains5ghtrelnabypa1=3D0
> > +rxchain=3D3
> > +txchain=3D3
> > +aa2g=3D3
> > +aa5g=3D3
> > +agbg0=3D2
> > +agbg1=3D2
> > +aga0=3D2
> > +aga1=3D2
> > +tssipos2g=3D1
> > +extpagain2g=3D2
> > +tssipos5g=3D1
> > +extpagain5g=3D2
> > +tempthresh=3D255
> > +tempoffset=3D255
> > +rawtempsense=3D0x1ff
> > +pa2ga0=3D-135,5769,-647
> > +pa2ga1=3D-143,6023,-677
> > +pa5ga0=3D-183,5746,-697,-172,5801,-685,-176,5707,-680,-180,5445,-659
> > +pa5ga1=3D-186,5543,-669,-193,5506,-675,-210,5282,-661,-199,5367,-665
> > +subband5gver=3D0x4
> > +pdoffsetcckma0=3D0x4
> > +pdoffsetcckma1=3D0x4
> > +pdoffset40ma0=3D0x0000
> > +pdoffset80ma0=3D0x0000
> > +pdoffset40ma1=3D0x0000
> > +pdoffset80ma1=3D0x0000
> > +maxp2ga0=3D72
> > +maxp5ga0=3D69,70,69,68
> > +maxp2ga1=3D71
> > +maxp5ga1=3D67,67,67,67
> > +cckbw202gpo=3D0x1222
> > +cckbw20ul2gpo=3D0x0000
> > +mcsbw202gpo=3D0x99E644422
> > +mcsbw402gpo=3D0xE9744424
> > +dot11agofdmhrbw202gpo=3D0x4444
> > +ofdmlrbw202gpo=3D0x0022
> > +mcsbw205glpo=3D0xEEA86661
> > +mcsbw405glpo=3D0xEEB86663
> > +mcsbw805glpo=3D0xEEB86663
> > +mcsbw205gmpo=3D0xAAA86663
> > +mcsbw405gmpo=3D0xECB86663
> > +mcsbw805gmpo=3D0xEEA86663
> > +mcsbw205ghpo=3D0xCC986663
> > +mcsbw405ghpo=3D0xEEA86663
> > +mcsbw805ghpo=3D0xEEA86663
> > +mcslr5glpo=3D0x0000
> > +mcslr5gmpo=3D0x0000
> > +mcslr5ghpo=3D0x0000
> > +sb20in40hrpo=3D0x0
> > +sb20in80and160hr5glpo=3D0x0
> > +sb40and80hr5glpo=3D0x0
> > +sb20in80and160hr5gmpo=3D0x0
> > +sb40and80hr5gmpo=3D0x0
> > +sb20in80and160hr5ghpo=3D0x0
> > +sb40and80hr5ghpo=3D0x0
> > +sb20in40lrpo=3D0x0
> > +sb20in80and160lr5glpo=3D0x0
> > +sb40and80lr5glpo=3D0x0
> > +sb20in80and160lr5gmpo=3D0x0
> > +sb40and80lr5gmpo=3D0x0
> > +sb20in80and160lr5ghpo=3D0x0
> > +sb40and80lr5ghpo=3D0x0
> > +dot11agduphrpo=3D0x0
> > +dot11agduplrpo=3D0x0
> > +phycal_tempdelta=3D255
> > +temps_period=3D15
> > +temps_hysteresis=3D15
> > +rssicorrnorm_c0=3D4,4
> > +rssicorrnorm_c1=3D4,4
> > +rssicorrnorm5g_c0=3D1,2,3,1,2,3,6,6,8,6,6,8
> > +rssicorrnorm5g_c1=3D1,2,3,2,2,2,7,7,8,7,7,8
> > +
> > +swctrlmap_2g=3D0x00001040,0x00004010,0x00004010,0x200010,0xff
> > +swctrlmap_5g=3D0x00000202,0x00000101,0x00000101,0x000000,0x47
> > +swctrlmapext_5g=3D0x00000000,0x00000000,0x00000000,0x000000,0x000
> > +swctrlmapext_2g=3D0x00000000,0x00000000,0x00000000,0x000000,0x000
> > +
> > +muxenab=3D0x10
> > +
> > --
> > 2.28.0
> >
