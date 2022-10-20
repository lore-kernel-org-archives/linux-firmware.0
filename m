Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14092C4332F
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Oct 2022 11:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCD29C433D7; Thu, 20 Oct 2022 11:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C4AC433B5
	for <linux-firmware@kernel.org>; Thu, 20 Oct 2022 11:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666265943;
	bh=9PcLVz06myqhxcZohF6nN2lPSSAarLQmW8F7fR6u1jE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=c6HBnESCx+5g/NipPCnEICMVF80bGcyJbaIJak+G+P/YKuXafyJMN1h8oCAb4qa9Q
	 p6t5LrxRFeq6euj9x0CpidVCDEBlIU7qaGha5gEwj4wrhKYNbP59T+6hVFMlNGAdBI
	 789ZzXHXys7gqpMw329OUq4U7wvq2KrBVN3uSkG/nE3+8uU+HSSqaMTde156cqyVSF
	 C7nlaZq/GjsOPxQex9zYTFjdWt+DAAzzTH3HoHQexAwK0tGHPPFfmiVP3tcrq3vXTU
	 LZEC2oLIJLWvtz8ZkTEyCtWTPIyWUG+7znjyHNeP7TjRtzqZPOvtrZNO3EpDk7ZEHr
	 XQD7Sep7vQ+Lw==
Received: by mail-ot1-f43.google.com with SMTP id p24-20020a9d6958000000b00661c528849eso11214774oto.9
        for <linux-firmware@kernel.org>; Thu, 20 Oct 2022 04:39:03 -0700 (PDT)
X-Gm-Message-State: ACrzQf3Su/AcbQH5tc0a9U6JCHUSnrhJCa+Hx0PWhr1ndyBMGSs0sOnm
	ZanHqWhcBKh3zkOHDouUeB1V+i3yteUVojHyqYY=
X-Google-Smtp-Source: AMsMyM7f6xZ+PJH/sd09SiOEgsGAMTrZ6tQjE00T4iyi2H5i2XbAGxjodr9lkmuimPj4rpfpNbRjeM39sSHT0kFz8lQ=
X-Received: by 2002:a9d:12a6:0:b0:661:d26c:708c with SMTP id
 g35-20020a9d12a6000000b00661d26c708cmr6615527otg.160.1666265942889; Thu, 20
 Oct 2022 04:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221014132729.2107129-1-james.hilliard1@gmail.com>
 <CA+5PVA5gLBAxbR4qUSUu3vs+nunM+igokVxd=oAQ7OMD2oGiWg@mail.gmail.com>
 <CADvTj4pF_DqwYofL-PU5os7Dco=XyWJ3fY3C1Wxq35pSe=QqFQ@mail.gmail.com> <f4f48fa5df844d9d8d270fb4310e9ff1@realtek.com>
In-Reply-To: <f4f48fa5df844d9d8d270fb4310e9ff1@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 20 Oct 2022 07:38:51 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7=772c8=04Q6BewZ07pWOpcUs8+xvg3iXmERFG7j-Fag@mail.gmail.com>
Message-ID: <CA+5PVA7=772c8=04Q6BewZ07pWOpcUs8+xvg3iXmERFG7j-Fag@mail.gmail.com>
Subject: Re: [PATCH] rtlwifi: update firmware for rtl8192eu to v35.7
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Jes Sorensen <jes.sorensen@gmail.com>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 19, 2022 at 8:39 PM Ping-Ke Shih <pkshih@realtek.com> wrote:
>
>
>
> > -----Original Message-----
> > From: James Hilliard <james.hilliard1@gmail.com>
> > Sent: Wednesday, October 19, 2022 9:30 PM
> > To: Josh Boyer <jwboyer@kernel.org>
> > Cc: Ping-Ke Shih <pkshih@realtek.com>; linux-firmware@kernel.org; linux-wireless@vger.kernel.org; Jes
> > Sorensen <jes.sorensen@gmail.com>; Bitterblue Smith <rtl8821cerfe2@gmail.com>
> > Subject: Re: [PATCH] rtlwifi: update firmware for rtl8192eu to v35.7
> >
> > On Wed, Oct 19, 2022 at 8:10 AM Josh Boyer <jwboyer@kernel.org> wrote:
> > >
> > > On Fri, Oct 14, 2022 at 9:27 AM James Hilliard
> > > <james.hilliard1@gmail.com> wrote:
> > > >
> > > > This is v35.7 firmware for the rtl8192eu.
> > > >
> > > > This adds 2 new firmware variants extracted from vendor drivers that
> > > > were not previously present:
> > > > rtl8192eu_ap.bin
> > > > rtl8192eu_nic_setupbox.bin
>
> I think these two are not suitable to rtl8xxxu, so I suggest to ignore them.
>
> > > >
> > > > These firmware files occurs as data statements in the latest Realtek
> > > > vendor driver I found for the rtl8192eu in addition to some older
> > > > vendor driver releases:
> > > > rtl8192EU_WiFi_linux_v5.11.2.1-18-g8e7df912b.20210527_COEX20171113-0047
> > >
> > > I have no idea what this is, nor is there any indication that Realtek
> > > wants these published to the linux-firmware repo under redistributable
> > > license terms.  You've extracted firmware from elsewhere and are
> > > assuming it is licensed under the existing license, but there's no
> > > indication that's actually the case.  The provenance of this firmware
> > > is questionable.
> >
> > I just extracted them from the vendor driver same as last time:
> > https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/rtlwifi/rtl8192eu_n
> > ic.bin?id=91d5dd136153e0a199d7bf30fd03763d83586b73
> >
> > The vendor file license just says GPLv2:
> > https://github.com/clnhub/rtl8192eu-linux/blob/5.11.2.1/hal/rtl8192e/hal8192e_fw.c
> >
>
> I'm not a lawyer, no idea about this. I hope someone can comment this.
>
> > >
> > > I've copied Ping-Ke Shih in case they have some insight here, but I
> > > can't really take this patch as it is based on what is represented
> > > here.  An ack or Signed-off-by from someone at Realtek would go a long
> > > way.
>
> I think I can take patches related to Realtek firmware to my github tree,
> and send out pull-request after checking content of firmware patch.
> Does it work to you, Josh?

Yes, that would be great.  Thank you.

josh

> > > > Note that the existing rtl8192eu_ap_wowlan.bin firmware header
> > > > indicates it is actually v18.0 and not v19.0 as indicated by the
> > > > commit that introduced it 91d5dd136153e0a199d7bf30fd03763d83586b73,
> > > > as such it is marked as version 18.0.
> > > >
> > > > So far I have managed to find the following firmware versions for the
> > > > rtl8192eu in various vendor driver releases:
> > > > v18.0
> > > > v19.0
> > > > v27.0
> > > > v35.7
> > > >
> > > > The rtl8192eu_ap_wowlan.bin firmware does not appear to have received
> > > > any updates unlike the other rtl8192eu firmware variants.
> > > >
> > > > Previous firmware load in rtl8xxxu:
> > > > rtl8xxxu: Loading firmware rtlwifi/rtl8192eu_nic.bin
> > > > Firmware revision 19.0 (signature 0x92e1)
> > > >
> > > > Updated firmware load in rtl8xxxu:
> > > > rtl8xxxu: Loading firmware rtlwifi/rtl8192eu_nic.bin
> > > > Firmware revision 35.7 (signature 0x92e1)
> > > >
> > > > Cc: Jes Sorensen <jes.sorensen@gmail.com>
> > > > Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>
> > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > ---
> > > >  WHENCE                             |   9 ++++++++-
> > > >  rtlwifi/rtl8192eu_ap.bin           | Bin 0 -> 25816 bytes
> > > >  rtlwifi/rtl8192eu_nic.bin          | Bin 31818 -> 32286 bytes
> > > >  rtlwifi/rtl8192eu_nic_setupbox.bin | Bin 0 -> 28554 bytes
> > > >  rtlwifi/rtl8192eu_wowlan.bin       | Bin 25878 -> 29008 bytes
> > > >  5 files changed, 8 insertions(+), 1 deletion(-)
> > > >  create mode 100644 rtlwifi/rtl8192eu_ap.bin
> > > >  create mode 100644 rtlwifi/rtl8192eu_nic_setupbox.bin
> > > >
> > > > diff --git a/WHENCE b/WHENCE
> > > > index 816cf7c..e7ae78a 100644
> > > > --- a/WHENCE
> > > > +++ b/WHENCE
> > > > @@ -3257,12 +3257,19 @@ File: rtlwifi/rtl8723bu_wowlan.bin
> > > >  File: rtlwifi/rtl8723bu_ap_wowlan.bin
> > > >
> > > >  Info: rtl8192eu taken from Realtek driver
> > > > -      rtl8192EU_linux_v4.3.1.1_11320.20140505
> > > > +      rtl8192EU_WiFi_linux_v5.11.2.1-18-g8e7df912b.20210527_COEX20171113-0047
> > > >        Firmware is embedded in the driver as data statements. This info
> > > >        has been extracted into a binary file.
> > > >  File: rtlwifi/rtl8192eu_nic.bin
> > > > +Version: 35.7
> > > > +File: rtlwifi/rtl8192eu_nic_setupbox.bin
> > > > +Version: 35.7
> > > >  File: rtlwifi/rtl8192eu_wowlan.bin
> > > > +Version: 35.7
> > > > +File: rtlwifi/rtl8192eu_ap.bin
> > > > +Version: 35.7
> > > >  File: rtlwifi/rtl8192eu_ap_wowlan.bin
> > > > +Version: 18.0
> > > >
> > > >  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
> > > >
>
> [...]
>
