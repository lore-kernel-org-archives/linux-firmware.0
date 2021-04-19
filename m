Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FBBC433B4
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Apr 2021 13:51:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6D2906102A; Mon, 19 Apr 2021 13:51:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5662A6101E
	for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 13:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618840301;
	bh=k479T2eOglhcbOXYbGwe9uYdpNkbwTveecd4tvwUSpw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iD8j6NjzhxTV3Ly2g2RqiIn0fHNaWqYmAR9F4J7V9+p8c3svf3D8PwZFhdUd07cLQ
	 uFXmhPBjKQYGsZAO+MAVDs3ZCZixOTQfKgAkCgvRhatVGPHIsVrin74i91ke2g6BuF
	 DifdapnVgVjSs8Q8Xzp9fAxXae/x6STNJYTBcgu6Z02lMykfO08adyf0rloVHvAOsM
	 KQZurq38OzCEBvkTShPm6IVfs2mhUCvvcwNTOrn8Rj9F6gYzUM2bXHDvkEHV1+WjYO
	 3xQvOKPp+TmIteIhJJjEndBb+pzPrn6S9f6lpMDSZgGIEYulz9/PwKBg5x6mnB/dzn
	 1469yYepyEPKg==
Received: by mail-il1-f171.google.com with SMTP id v13so13102217ilj.8
        for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 06:51:41 -0700 (PDT)
X-Gm-Message-State: AOAM531/Qvh7pb4a+xUR+95U0k74Z7IB5AUVLVAPZbR3EWVATv4AG4UH
	vDnpM2n6hf3eQ7i+SwRGqalnTLg9rf3PC6T6ZRk=
X-Google-Smtp-Source: ABdhPJxSd+EhcwjKgTsJqkKU32r3tm9wdMRgFxjf2+uxGFzusHjCvBUPOzy3CtOE7HTU77rg0nKRZA/u90+IClqexTA=
X-Received: by 2002:a92:cd84:: with SMTP id r4mr12310778ilb.206.1618840300643;
 Mon, 19 Apr 2021 06:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210408032554.5836-1-jeremy.linton@arm.com> <3a446883-958d-4465-0a68-6b757ad2d694@redhat.com>
In-Reply-To: <3a446883-958d-4465-0a68-6b757ad2d694@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Apr 2021 09:51:29 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4hq_zxFVfGm8Gc+186XYDDorYbYM30DcqDAjLxq9ygJg@mail.gmail.com>
Message-ID: <CA+5PVA4hq_zxFVfGm8Gc+186XYDDorYbYM30DcqDAjLxq9ygJg@mail.gmail.com>
Subject: Re: [PATCH] brcm: Link CM4's WiFi firmware with DMI machine name.
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jlinton <jeremy.linton@arm.com>, Linux Firmware <linux-firmware@kernel.org>, 
	Peter Robinson <pbrobinson@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, Apr 8, 2021 at 5:15 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/8/21 5:25 AM, jlinton wrote:
> > From: Jeremy Linton <jeremy.linton@arm.com>
> >
> > The kernel when booted in ACPI mode with SMBIOS/DMI
> > data uses the DMI data to set the machine
> > manufacture/model.
> >
> > The WiFi driver uses the machine string to select the
> > correct firmware image. Because of this, an additional
> > link to select the correct firmware is needed.
> >
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Peter Robinson <pbrobinson@gmail.com>
> > Cc: Josh Boyer <jwboyer@kernel.org>
> > Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Regards,
>
> Hans
>
>
>
> > ---
> >  WHENCE | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/WHENCE b/WHENCE
> > index aa96404..1eaee0b 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -2723,6 +2723,7 @@ File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
> >  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
> >  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> >  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> > +Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> >  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
> >  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
> >  File: brcm/brcmfmac4356-sdio.vamrs,rock960.txt
> >
>
