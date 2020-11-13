Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF2AC61DD8
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Nov 2020 15:23:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B824322265; Fri, 13 Nov 2020 15:23:28 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 92F5522249
	for <linux-firmware@kernel.org>; Fri, 13 Nov 2020 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605281008;
	bh=3YULv81Dah9GJJt+iGQXVZ+TMHlFbXQfVfo57HhEDmk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iI0ozO/tyyxQpEZDYXNQPdfEZPbzTbV3bhA1RnxQeP6vcshy9SLL+ZGHrzvybplCn
	 uZW818IHWhkIqjE1LNcEnCrSWhSkLzsZPYdtqxHIzi+n5ns7vPK17kYEOBcbBh+93T
	 kBROUxaHXCJt0cI7H5kMuCgyJ9S0XmeCtwAa5dZQ=
Received: by mail-io1-f48.google.com with SMTP id m13so10103812ioq.9
        for <linux-firmware@kernel.org>; Fri, 13 Nov 2020 07:23:28 -0800 (PST)
X-Gm-Message-State: AOAM532E0ADvRmield94YRTTwa1HXAegq2yWE4rsMeSyWd/LeCGeIYI7
	kuTTsncwKnT9k+WZ3AY1/so8EEjsp9BLAb9z9gE=
X-Google-Smtp-Source: ABdhPJxtl1XUeovYHCd36fTs/4XCnQbczpZKe/fsrvfbJC99l1eQHs/gtXRjYxNib0knx2Dv7dH/BOtYwOisZ8RATxU=
X-Received: by 2002:a02:70ce:: with SMTP id f197mr2464883jac.120.1605281003068;
 Fri, 13 Nov 2020 07:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20201028184249.11293-1-nikhil.nd@ti.com> <6b7cb928-909f-36fd-3949-ba9fb32f7cfd@ti.com>
 <20201106082241.m6pu6u4ywla6fic5@NiksLab>
In-Reply-To: <20201106082241.m6pu6u4ywla6fic5@NiksLab>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 13 Nov 2020 10:23:12 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7Qb-GKOWsg0nvzs9DRWRDSqiKrYJTZTLAme1Tsc7ibqA@mail.gmail.com>
Message-ID: <CA+5PVA7Qb-GKOWsg0nvzs9DRWRDSqiKrYJTZTLAme1Tsc7ibqA@mail.gmail.com>
Subject: Re: [PATCH v2] vpdma: Move firmware to ti directory
To: Nikhil Devshatwar <nikhil.nd@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linux Firmware <linux-firmware@kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>, 
	Benoit Parrot <bparrot@ti.com>, Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Fri, Nov 6, 2020 at 3:22 AM Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
>
> On 09:07-20201029, Tomi Valkeinen wrote:
> > On 28/10/2020 20:42, Nikhil Devshatwar wrote:
> > > Current ti-connectivity location for the firmware is not the
> > > correct place. It has all the wireless connectivity related firmwares.
> > > Move the vpdma firmware to the ti specific directory.
> > >
> > > Fixes: 5b30b383ce ("linux-firmware: Add new VPDMA firmware 1b8.bin")
> > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> ping
>
> Please merge this, so that I can update the kernel patch
>
> Regards,
> Nikhil D
>
> > > ---
> > >  WHENCE                                |   2 +-
> > >  {ti-connectivity => ti}/vpdma-1b8.bin | Bin
> > >  2 files changed, 1 insertion(+), 1 deletion(-)
> > >  rename {ti-connectivity => ti}/vpdma-1b8.bin (100%)
> > >
> > > diff --git a/WHENCE b/WHENCE
> > > index 473f6fb..d4efee2 100644
> > > --- a/WHENCE
> > > +++ b/WHENCE
> > > @@ -2705,7 +2705,7 @@ Licence: Redistributable. See LICENCE.tda7706-firmware.txt for details.
> > >
> > >  Driver: ti-vpe - Texas Instruments V4L2 driver for Video Processing Engine
> > >
> > > -File: ti-connectivity/vpdma-1b8.bin
> > > +File: ti/vpdma-1b8.bin
> > >
> > >  Licence: Redistributable. See LICENCE.ti-tspa for details.
> > >
> > > diff --git a/ti-connectivity/vpdma-1b8.bin b/ti/vpdma-1b8.bin
> > > similarity index 100%
> > > rename from ti-connectivity/vpdma-1b8.bin
> > > rename to ti/vpdma-1b8.bin
> >
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> >
> >  Tomi
> >
> > --
> > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> > Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
