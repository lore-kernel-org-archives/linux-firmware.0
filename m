Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADC5C433E0
	for <linux-firmware@archiver.kernel.org>; Sat,  9 Jan 2021 12:32:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4694923A1C; Sat,  9 Jan 2021 12:32:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2543B235DD
	for <linux-firmware@kernel.org>; Sat,  9 Jan 2021 12:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610195560;
	bh=bhLtZhvEXLJD7rCl2xp/xFJE153vjDG0ZruPLQLL4/w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XPjut7GttcrgcgQLu2nS3iPpba2E2DsAm/Tx2KlLEeU2N1BRQ4ocg+4RDP0jT0ZYi
	 1t3YgxVGfBk3bxGbkAEyjmhSdf2nPUZjITIU2qYCAv7CwUE1nY1rNFwO9A/halo/bc
	 1WIkc9mmb3XuhHuEyypnXfPoeIIRgAJnOBZn5rvnnIT0s/vZ4qjANxw4nwdr1IBgaH
	 WdEHf2GBT9xfwQSdRNlz5HinnRWx/18hFQiyNq3zqcW96/KuvCjq1nJfoA9W9HZr5i
	 1YV37aSZk8Yzm2tTeAbYeetLts6ANW1iaGRK4NNQcnhEzgnF/zp/wsj9rSF83Hm1tl
	 guBljF7iEM3Fw==
Received: by mail-io1-f53.google.com with SMTP id q137so12649911iod.9
        for <linux-firmware@kernel.org>; Sat, 09 Jan 2021 04:32:40 -0800 (PST)
X-Gm-Message-State: AOAM532SI/6hIl3zWj7hsEam/8De1Eamo07s61mdsztL6qhT/K4bn5H2
	TUP0v0th7SXzvjrjfE9i6CvJT22szO8u/nhlMQA=
X-Google-Smtp-Source: ABdhPJzXIxLMOIfcB9DmdYyRdu4f8ajF3/Ek/mnEOGTfqsQGFcwy1Qbtz2LHJgZ9SqE/YViZkQi741B46WQE8crKD58=
X-Received: by 2002:a6b:f112:: with SMTP id e18mr8927141iog.195.1610195559570;
 Sat, 09 Jan 2021 04:32:39 -0800 (PST)
MIME-Version: 1.0
References: <20210108115513.740899-1-pbrobinson@gmail.com> <20210108115840.GB74017@thinkpad>
In-Reply-To: <20210108115840.GB74017@thinkpad>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sat, 9 Jan 2021 07:32:28 -0500
X-Gmail-Original-Message-ID: <CA+5PVA40SV8KJnckvKZ5W9vTRsf4LFPqnOPkV8ammRDQTt798w@mail.gmail.com>
Message-ID: <CA+5PVA40SV8KJnckvKZ5W9vTRsf4LFPqnOPkV8ammRDQTt798w@mail.gmail.com>
Subject: Re: [PATCH] brcm: Add NVRAM for Vamrs 96boards Rock960
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Peter Robinson <pbrobinson@gmail.com>, Linux Firmware <linux-firmware@kernel.org>, 
	Sahaj Sarup <sahaj.sarup@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 6:58 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Fri, Jan 08, 2021 at 11:55:13AM +0000, Peter Robinson wrote:
> > The 96boards Rock960 has a Cypress 4356 WiFi module, this adds the
> > a NVRAM based on the downstream NVRAM.
> >
> > https://people.linaro.org/~manivannan.sadhasivam/rock960_wifi/brcmfmac4356-sdio.txt
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied and pushed out.

josh

>
> Thanks,
> Mani
>
> > Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Cc: Sahaj Sarup <sahaj.sarup@linaro.org>
> > ---
> >  WHENCE                                   |   1 +
> >  brcm/brcmfmac4356-sdio.vamrs,rock960.txt | 122 +++++++++++++++++++++++
> >  2 files changed, 123 insertions(+)
> >  create mode 100644 brcm/brcmfmac4356-sdio.vamrs,rock960.txt
> >
> > diff --git a/WHENCE b/WHENCE
> > index 676bb18..2602e03 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -2713,6 +2713,7 @@ Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sd
> >  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> >  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
> >  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
> > +File: brcm/brcmfmac4356-sdio.vamrs,rock960.txt
> >
> >  Licence: GPLv2. See GPL-2 for details.
> >
> > diff --git a/brcm/brcmfmac4356-sdio.vamrs,rock960.txt b/brcm/brcmfmac4356-sdio.vamrs,rock960.txt
> > new file mode 100644
> > index 0000000..4b38c26
> > --- /dev/null
> > +++ b/brcm/brcmfmac4356-sdio.vamrs,rock960.txt
> > @@ -0,0 +1,122 @@
> > +aa2g=3
> > +aa5g=3
> > +aga0=2
> > +aga1=2
> > +agbg0=2
> > +agbg1=2
> > +antswitch=0
> > +boardflags=0x02400201
> > +boardflags2=0x00802000
> > +boardflags3=0x0000010a
> > +boardrev=0x1121
> > +boardtype=0x073e
> > +cckbw202gpo=0x1222
> > +cckbw20ul2gpo=0x0000
> > +ccode=0x5855
> > +devid=0x43a3
> > +dot11agduphrpo=0x0
> > +dot11agduplrpo=0x0
> > +dot11agofdmhrbw202gpo=0x4444
> > +extpagain2g=2
> > +extpagain5g=2
> > +femctrl=10
> > +macaddr=00:90:4c:1a:10:01
> > +manfid=0x2d0
> > +maxp2ga0=72
> > +maxp2ga1=71
> > +maxp5ga0=69,70,69,68
> > +maxp5ga1=67,67,67,67
> > +mcsbw202gpo=0x9E644422
> > +mcsbw205ghpo=0xCC986663
> > +mcsbw205glpo=0xEEA86661
> > +mcsbw205gmpo=0xAAA86663
> > +mcsbw402gpo=0xE9744424
> > +mcsbw405ghpo=0xEEA86663
> > +mcsbw405glpo=0xEEB86663
> > +mcsbw405gmpo=0xECB86663
> > +mcsbw805ghpo=0xEEA86663
> > +mcsbw805glpo=0xEEB86663
> > +mcsbw805gmpo=0xEEA86663
> > +mcslr5ghpo=0x0000
> > +mcslr5glpo=0x0000
> > +mcslr5gmpo=0x0000
> > +muxenab=0x10
> > +nocrc=1
> > +ofdmlrbw202gpo=0x0022
> > +otpimagesize=502
> > +pa2ga0=-135,5769,-647
> > +pa2ga1=-143,6023,-677
> > +pa5ga0=-183,5746,-697,-172,5801,-685,-176,5707,-680,-180,5445,-659
> > +pa5ga1=-186,5543,-669,-193,5506,-675,-210,5282,-661,-199,5367,-665
> > +paprdis=0
> > +pdgain2g=4
> > +pdgain5g=4
> > +pdoffset40ma0=0x0000
> > +pdoffset40ma1=0x0000
> > +pdoffset80ma0=0x0000
> > +pdoffset80ma1=0x0000
> > +pdoffsetcckma0=0x4
> > +pdoffsetcckma1=0x4
> > +phycal_tempdelta=255
> > +rawtempsense=0x1ff
> > +regrev=1
> > +rssicorrnorm5g_c0=1,2,3,1,2,3,6,6,8,6,6,8
> > +rssicorrnorm5g_c1=1,2,3,2,2,2,7,7,8,7,7,8
> > +rssicorrnorm_c0=4,4
> > +rssicorrnorm_c1=4,4
> > +rxchain=3
> > +rxgains2gelnagaina0=0
> > +rxgains2gelnagaina1=0
> > +rxgains2gtrelnabypa0=0
> > +rxgains2gtrelnabypa1=0
> > +rxgains2gtrisoa0=7
> > +rxgains2gtrisoa1=7
> > +rxgains5gelnagaina0=0
> > +rxgains5gelnagaina1=0
> > +rxgains5ghelnagaina0=0
> > +rxgains5ghelnagaina1=0
> > +rxgains5ghtrelnabypa0=0
> > +rxgains5ghtrelnabypa1=0
> > +rxgains5ghtrisoa0=12
> > +rxgains5ghtrisoa1=11
> > +rxgains5gmelnagaina0=0
> > +rxgains5gmelnagaina1=0
> > +rxgains5gmtrelnabypa0=0
> > +rxgains5gmtrelnabypa1=0
> > +rxgains5gmtrisoa0=13
> > +rxgains5gmtrisoa1=11
> > +rxgains5gtrelnabypa0=0
> > +rxgains5gtrelnabypa1=0
> > +rxgains5gtrisoa0=11
> > +rxgains5gtrisoa1=10
> > +sb20in40hrpo=0x0
> > +sb20in40lrpo=0x0
> > +sb20in80and160hr5ghpo=0x0
> > +sb20in80and160hr5glpo=0x0
> > +sb20in80and160hr5gmpo=0x0
> > +sb20in80and160lr5ghpo=0x0
> > +sb20in80and160lr5glpo=0x0
> > +sb20in80and160lr5gmpo=0x0
> > +sb40and80hr5ghpo=0x0
> > +sb40and80hr5glpo=0x0
> > +sb40and80hr5gmpo=0x0
> > +sb40and80lr5ghpo=0x0
> > +sb40and80lr5glpo=0x0
> > +sb40and80lr5gmpo=0x0
> > +sromrev=11
> > +subband5gver=0x4
> > +swctrlmap_2g=0x00001040,0x00004010,0x00004010,0x200010,0xff
> > +swctrlmap_5g=0x00000202,0x00000101,0x00000101,0x000000,0x47
> > +swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x000
> > +swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x000
> > +tempoffset=255
> > +temps_hysteresis=15
> > +temps_period=15
> > +tempthresh=255
> > +tssipos2g=1
> > +tssipos5g=1
> > +tworangetssi2g=0
> > +tworangetssi5g=0
> > +txchain=3
> > +vendid=0x14e4
> > +xtalfreq=37400
> > --
> > 2.29.2
> >
