Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16FCC433E0
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Jan 2021 12:44:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7042D2312D; Tue, 19 Jan 2021 12:44:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 505512311C
	for <linux-firmware@kernel.org>; Tue, 19 Jan 2021 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611060250;
	bh=amJZ1Y79+s9UFR5M88nXf8QKv5baLcCZnX8AqK0GPdo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Y0O3BGVWnAX52plhekU1ewzgsDfQsDQHZsfw7xye4OVcn1YVcdQbgacemd/gBIb2v
	 K6uRQ2T3Nsq6T2Lw3eJaePZqlw9IIE+BEKfzkA6JLZdEURWRDWmGqf9Ken0vDhL7j/
	 BLqITBligPd9qQaNlKplHKDkrjafA6G48xENF7yfx6sWk1bwtWwq+5T/XK5q+gS5yr
	 wlT/dWu388DXBNthr2lCKFtc4o1sSdknyzTUU846iqBERarcPnrdzKetNKwEniqpXE
	 d9CyDfR+uxMTHm+V3M9gyD8oLGbNwc946FWU7kM4NgZzCy4X+wdCZk2CDRNCwp3fo+
	 57CHa5HLq2zjA==
Received: by mail-io1-f45.google.com with SMTP id d81so24034557iof.3
        for <linux-firmware@kernel.org>; Tue, 19 Jan 2021 04:44:10 -0800 (PST)
X-Gm-Message-State: AOAM532WMq9ObO8cboWd4pO5kFXjHzTzybZChKaC52i+Gvrx1AzQY1mW
	iXNXjQWRNdJQl8sQMdoY+szh4Hz4AhxdroiFcH0=
X-Google-Smtp-Source: ABdhPJxwUgZHNmbXjo6PkWXoyOnUsaFA+7jAJ3wVYRRkoL6bnxEBxGwYmy1/KxLu2JvFDqzXFv8CfuJ7BVqXwlwrmn8=
X-Received: by 2002:a05:6638:22c1:: with SMTP id j1mr3214806jat.81.1611060249808;
 Tue, 19 Jan 2021 04:44:09 -0800 (PST)
MIME-Version: 1.0
References: <20210111231850.1745213-1-jeremy.linton@arm.com> <CALeDE9MXqGeoPcwEdCqwXxst_CW3dE0K7zLFvL2fHk+_wr03Lw@mail.gmail.com>
In-Reply-To: <CALeDE9MXqGeoPcwEdCqwXxst_CW3dE0K7zLFvL2fHk+_wr03Lw@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Jan 2021 07:43:58 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6HRADxAcm+6N8Pea06sRrGw5e63gQJqL5jv-JvRV4vfA@mail.gmail.com>
Message-ID: <CA+5PVA6HRADxAcm+6N8Pea06sRrGw5e63gQJqL5jv-JvRV4vfA@mail.gmail.com>
Subject: Re: [PATCH v3] brcm: Link RPi4's WiFi firmware with DMI machine name.
To: Peter Robinson <pbrobinson@gmail.com>, Jeremy Linton <jeremy.linton@arm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 11, 2021 at 6:35 PM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> On Mon, Jan 11, 2021 at 11:18 PM Jeremy Linton <jeremy.linton@arm.com> wrote:
> >
> > The kernel when booted in ACPI mode with SMBIOS/DMI
> > data uses that data to set the machine manufacture/model.
> >
> > The RPi's WiFi driver uses the machine string to
> > select the correct firmware image. Because of
> > this, an additional link to select the correct
> > firmware is needed.
> >
> > Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Peter Robinson <pbrobinson@gmail.com>

Applied and pushed out.

josh

> > ---
> >  WHENCE | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/WHENCE b/WHENCE
> > index cbde48d..abda387 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -2711,6 +2711,7 @@ File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
> >  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
> >  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
> >  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> > +Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> >  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
> >  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
> >
> > --
> > 2.26.2
> >
