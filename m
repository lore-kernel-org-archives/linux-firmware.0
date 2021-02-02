Return-Path: <SRS0=tjp7=HE=raspberrypi.com=phil@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D5EC433E0
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Feb 2021 11:18:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9412864E31; Tue,  2 Feb 2021 11:18:44 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D40464E4C
	for <linux-firmware@kernel.org>; Tue,  2 Feb 2021 11:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D40464E4C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=raspberrypi.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=phil@raspberrypi.com
Received: by mail-oo1-f49.google.com with SMTP id d3so1082075ool.7
        for <linux-firmware@kernel.org>; Tue, 02 Feb 2021 03:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/2EwU4rgVKGwJ5bZvabgydfhXBfaWcCH1vU8fHKMt7w=;
        b=SH0e1wdEseVLy8YIJ0fMErEVfQ1Om0tg7LB0L5UTXqEVZhL1y5p/98GlynB5Le7F9O
         C9eF1pG6bLTF9HkS5glUwfgTvxlnB7ClRPIyFWOLwrbwKvIVXwkUvDPA2wHXIugavM3W
         EwcdNPDkTHdaIBJ2rOX/V+SAQJdBSrJfI+sGxR5Dsl+zPugTkAj1o+eqo0cR2KgwAt3U
         Ep3ld41hL/nMuCi2gJLBa9Fh27lcRRbsmyMEaQYza852b+x/RmR4n3FJp9vlSElWi44k
         L7PDIGYhNIz8IcupXYZdxbmtraFflMutcnQUIZYoP2zAYIXe0VGmM3SGn5MsQVxKerGq
         xBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/2EwU4rgVKGwJ5bZvabgydfhXBfaWcCH1vU8fHKMt7w=;
        b=ajlR2RITnEsIGYdK8halXDBFQ2NfAisH+6qCduAqgUA+w/dd1HMMexA3LEDqUVzS1p
         2Dxt6bBDA4d+iW1YWDE70OfI01apgTqIdjzQo4+t0NAlFmxXpaDs0FXokzjqiQ60khdW
         0a0F7K4JGb3kJgBfiyMfgPVzbdHsLIoyAJGsvmRSa4btGhSNRJVzwbOia2XkVL0YSdTk
         WyJ19noR3OPj6eDa2pepHXpqxrvM8yB8MiBEFgek3j71DQ9Nm+IHurXrS9SZPd58/zKx
         IDTMxNUrXOfyd2t6hM0esXCGBZREuCSPRoL2mw6LLpt5/6YrEgXhxk5OdTseDymLitD3
         h67Q==
X-Gm-Message-State: AOAM532P529iFr2sT3sdrHQ64zeyL/hzsljMjm/UeChe2I7eXA387f/a
	dUL4uWm9f+5e7MCSguOn6fPzDEEkV17ZF6wd/YVSrw==
X-Google-Smtp-Source: ABdhPJxNzZ+mEuPEmxRsx8ce1Oci1rygC35JqOhW94YSEl0L2K6Zkdua1QOJcOyECjYTyOheqABwu/QV/LyRjlJM1mk=
X-Received: by 2002:a4a:c602:: with SMTP id l2mr3653892ooq.5.1612264723174;
 Tue, 02 Feb 2021 03:18:43 -0800 (PST)
MIME-Version: 1.0
References: <20210117074817.1721-1-alistair@alistair23.me> <20210117074817.1721-2-alistair@alistair23.me>
 <CA+5PVA52V5qZQb9q1jhdPoOxxX2ZV1tf3zFP9N1+qsBExe8dWw@mail.gmail.com>
 <CAKmqyKPmSUaZ0snyR1A8h1mbYdLUVkRre_=8gXPWO-GXF3s8FQ@mail.gmail.com>
 <23ee29eb-12e2-16ac-3a6d-aca40a652459@broadcom.com> <CA+5PVA7OKP4mQeWVRGLFYSXVH-gzqBTow6D0QoFveN1as7z_Jw@mail.gmail.com>
 <b8a9d845-7289-190e-90ec-849d33721c7d@broadcom.com>
In-Reply-To: <b8a9d845-7289-190e-90ec-849d33721c7d@broadcom.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Tue, 2 Feb 2021 11:18:33 +0000
Message-ID: <CAMEGJJ2XYvGEekfLzjL1KE6VUF-71s+S8RbJ1DuBkYU98F9nsg@mail.gmail.com>
Subject: Re: [PULL 1/1] brcm: Add the brcmfmac43456-sdio.* files
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, Alistair Francis <alistair23@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>, Linux Firmware <linux-firmware@kernel.org>, 
	Franky Lin <franky.lin@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Feb 2021 at 11:07, Arend Van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> + Phil Elwell
>
> On 2/1/2021 4:14 PM, Josh Boyer wrote:
> > On Tue, Jan 19, 2021 at 5:07 PM Arend van Spriel
> > <arend.vanspriel@broadcom.com> wrote:
> >>
> >> On 19-01-2021 17:47, Alistair Francis wrote:
> >>> On Tue, Jan 19, 2021 at 3:55 AM Josh Boyer <jwboyer@kernel.org> wrote:
> >>>>
> >>>> On Sun, Jan 17, 2021 at 10:05 PM Alistair Francis
> >>>> <alistair@alistair23.me> wrote:
> >>>>>
> >>>>> Add brcm/brcmfmac43456-sdio.bin, brcm/brcmfmac43456-sdio.clm_blob and
> >>>>> brcm/brcmfmac43456-sdio.txt from the
> >>>>> RaspberryPi debian package avaliable at:
> >>>>> https://archive.raspberrypi.org/debian/pool/main/f/firmware-nonfree/
> >>>>
> >>>> I'm confused.  Which package in there, and why is Debian carrying
> >>>> firmware that isn't in the upstream linux-firmware tree?
> >>>
> >>> It's in the `firmware-brcm80211_20190114-1+rpt10_all.deb`. I'm not
> >>> sure why it's there but not in linux-firmware.
> >>
> >> It is not provided by Debian, but by RPi foundation which provides it in
> >> debian package. The URL kinda gives away why it is not in
> >> linux-firmware: /firmware-nonfree/
> >>
> >> Also if you dive into the .deb file it has a copyright notice (attached)
> >> which differs from the license that we have in linux-firmware for
> >> Broadcom/Cypress firmware files.
> >
> > Would it be possible for Broadcom to release the firmware themselves
> > under a license permissible for linux-firmware?
>
> Hi Josh,
>
> Things get confusing for me, but it seems 43456 is a Synaptics chipset
> (now).

Yes, it's a Synaptics chipset. As I've said to Alistair, we haven't
yet received a sensible licence file from Synaptics so I can't support
this upstreaming effort.

Phil
