Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78784C433DB
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Feb 2021 15:15:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4AD5B64EA5; Mon,  1 Feb 2021 15:15:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2746164EA3;
	Mon,  1 Feb 2021 15:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612192506;
	bh=SVjmvoXw4LyJHro2oH3k7FJypXpNaIgbk4IMIbLpgEQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=cOrs53107sL0d0e0RM0U8/A73IUhjsuYaR5TnZtS5EsanRjYHE6QW7QEcmeUbLO8+
	 13g08lxKMuIg6OUnKfB8QZwmEYYrsCvQfOmFRmNcJfuPOmmwnabjaIs81weJ3Yq54n
	 +TVvsPXEeOblzlQD2SxHDdxKnbsuzFSBNVvgkkw7xFigoOxB5E8m8F9n8ckIkRdGg+
	 WLhVQUKUudPlRelVPCM4mb8rdOrZ56oVtqMpURKqqWECPMdv1v/cZ2e/nrY7RQIvxs
	 u+ZRfUwcs2WAVd2KaDfhxstzei3chakm6Kxg2rhgBH+W9MsFgF1xiEf/rFdOlpUx4Z
	 pJVHSxsUCRogg==
Received: by mail-il1-f180.google.com with SMTP id y5so15873431ilg.4;
        Mon, 01 Feb 2021 07:15:06 -0800 (PST)
X-Gm-Message-State: AOAM533WR1QVcMufnA+Ma3oQo/c2jE7suRDo4vxfEzUR6u2AE9U2Ti+O
	1/IQtpDf6YDa4RKaz5XlVU3vR7v9vYm6iRUawis=
X-Google-Smtp-Source: ABdhPJyGKIQvBilbv2kHvusPlATmP0lHoF2Fndc6phGM348Fk97nEHsZt3vb4XdCIO+lXxB1JDTARuD6qstW69OxUFI=
X-Received: by 2002:a05:6e02:1845:: with SMTP id b5mr8603610ilv.11.1612192505569;
 Mon, 01 Feb 2021 07:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20210117074817.1721-1-alistair@alistair23.me> <20210117074817.1721-2-alistair@alistair23.me>
 <CA+5PVA52V5qZQb9q1jhdPoOxxX2ZV1tf3zFP9N1+qsBExe8dWw@mail.gmail.com>
 <CAKmqyKPmSUaZ0snyR1A8h1mbYdLUVkRre_=8gXPWO-GXF3s8FQ@mail.gmail.com> <23ee29eb-12e2-16ac-3a6d-aca40a652459@broadcom.com>
In-Reply-To: <23ee29eb-12e2-16ac-3a6d-aca40a652459@broadcom.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 1 Feb 2021 10:14:54 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7OKP4mQeWVRGLFYSXVH-gzqBTow6D0QoFveN1as7z_Jw@mail.gmail.com>
Message-ID: <CA+5PVA7OKP4mQeWVRGLFYSXVH-gzqBTow6D0QoFveN1as7z_Jw@mail.gmail.com>
Subject: Re: [PULL 1/1] brcm: Add the brcmfmac43456-sdio.* files
To: Arend van Spriel <arend.vanspriel@broadcom.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Alistair Francis <alistair23@gmail.com>, Josh Boyer <jwboyer@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, Linux Firmware <linux-firmware@kernel.org>, phaber@broadcom.com, 
	frankyl@broadcom.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 19, 2021 at 5:07 PM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 19-01-2021 17:47, Alistair Francis wrote:
> > On Tue, Jan 19, 2021 at 3:55 AM Josh Boyer <jwboyer@kernel.org> wrote:
> >>
> >> On Sun, Jan 17, 2021 at 10:05 PM Alistair Francis
> >> <alistair@alistair23.me> wrote:
> >>>
> >>> Add brcm/brcmfmac43456-sdio.bin, brcm/brcmfmac43456-sdio.clm_blob and
> >>> brcm/brcmfmac43456-sdio.txt from the
> >>> RaspberryPi debian package avaliable at:
> >>> https://archive.raspberrypi.org/debian/pool/main/f/firmware-nonfree/
> >>
> >> I'm confused.  Which package in there, and why is Debian carrying
> >> firmware that isn't in the upstream linux-firmware tree?
> >
> > It's in the `firmware-brcm80211_20190114-1+rpt10_all.deb`. I'm not
> > sure why it's there but not in linux-firmware.
>
> It is not provided by Debian, but by RPi foundation which provides it in
> debian package. The URL kinda gives away why it is not in
> linux-firmware: /firmware-nonfree/
>
> Also if you dive into the .deb file it has a copyright notice (attached)
> which differs from the license that we have in linux-firmware for
> Broadcom/Cypress firmware files.

Would it be possible for Broadcom to release the firmware themselves
under a license permissible for linux-firmware?

josh
