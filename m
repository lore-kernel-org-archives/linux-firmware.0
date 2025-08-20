Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7151FCA0EDC
	for <linux-firmware@archiver.kernel.org>; Wed, 20 Aug 2025 16:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B585C4CEEB; Wed, 20 Aug 2025 16:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A6CC116B1
	for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755706593;
	bh=vwrYXJYKmXj8qQFDaHkQ8YY6Cz1WiVaPipGjMesa/lM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UZYEw5t2Zs0j00RieVmo25tiHbR3mztf4iyUFtz99c5ouYYBO6/SVjpzxyGMwFyZp
	 1iQqzp4o9dh0n0rPJFbZQZhUEZmHW95ygw6aXBQeEipC/Nh4w9guwZPzkhNsEyX+gS
	 xYjz5k09Eb1FpaIjDqRRjORg1Gqld3LUiU2zFgekpORl2VaV9S9Ts3bdRWkiCKYKq3
	 a+JyaF84ZRTW9EpzCblC/olaFkSv7ueqNsMP9ZZLyBKWxWtqtfNA+tzuJ0zPIhuyf7
	 TmN5CIo5BwFFKhv/OgW5O2n+jFZYzo/9jnRt4cZkv05WQsLzmwqS4IUqS/XE8iPwKm
	 +Js8iBHut6L0g==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e94fe8c509aso88355276.1
        for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 09:16:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxP7tGiJfuWDOhnvhd/HOAxMa+kt21bCuewQivN9txDxb9yXK1YKGR7y/76iHvPEtLBpjPB+7mmM02hcwWsA==@kernel.org
X-Gm-Message-State: AOJu0YxIywJcVSSHknAQ5HLAaVTxT66gr4/w2DjcWZ4ADiK7i+wuoUKJ
	UZX80VmxHXptwMABAcmFqkmySzz82jbsEkbNoG+mxbGkAqTIi2zmsRsKH32CWCD2UN1UgRyJkkT
	igGM8DQrruTS7iq/X5Ve1kC5IegDe5fM=
X-Google-Smtp-Source: AGHT+IGJlP1IY6kYG4ld/nQGU0iUfYEYhptAMuewWOjNnmyotGv5BeOsilNHW3qvnL5lAR2lZSWPJt5sWP0kUnu2us4=
X-Received: by 2002:a05:6902:4a8a:b0:e94:edc8:966c with SMTP id
 3f1490d57ef6-e95048cfd1bmr158978276.16.1755706592334; Wed, 20 Aug 2025
 09:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <000001dc11cb$edb66860$c9233920$@opensource.cirrus.com> <b7e87ad1-c120-4089-8a3f-1e6a0670f702@app.fastmail.com>
In-Reply-To: <b7e87ad1-c120-4089-8a3f-1e6a0670f702@app.fastmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 20 Aug 2025 12:16:20 -0400
X-Gmail-Original-Message-ID: <CA+5PVA66Xv1mMaCz33i03iBuO3ysa0aT78-+fE=5qVx=5Mp0Dw@mail.gmail.com>
X-Gm-Features: Ac12FXz0Z6aTouYwxth95bZMFlhKr23kHsh6rg-bgY3jdb_0iu2ToZny5Y3e_sM
Message-ID: <CA+5PVA66Xv1mMaCz33i03iBuO3ysa0aT78-+fE=5qVx=5Mp0Dw@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Amps for some
 Lenovo laptops
To: Mark Pearson <mpearson-lenovo@squebb.ca>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Simon Trimmer <simont@opensource.cirrus.com>, linux-firmware@kernel.org, 
	patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/655

josh

On Wed, Aug 20, 2025 at 9:26=E2=80=AFAM Mark Pearson <mpearson-lenovo@squeb=
b.ca> wrote:
>
> Thanks Simon,
>
> On Wed, Aug 20, 2025, at 8:14 AM, Simon Trimmer wrote:
> > Hi,
> >
> > We'd like to add the firmware for the Cirrus CS35L56 smart amplifier fo=
r
> > some Lenovo Laptops.
> >
> > Thanks,
> >
> > -Simon
> >
> >
> >
> > The following changes since commit 697065607ca2e09fe02b0d6c7c2bf7bcc962=
43a5:
> >
> >
> >
> >   Merge branch 'rtl8723-bt' into 'main' (2025-08-19 13:23:06 +0000)
> >
> >
> >
> > are available in the Git repository at:
> >
> >
> >
> >   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250820
> >
> >
> >
> > for you to fetch changes up to 8362841c38da7548fa306aba4d1e899a2437ba2e=
:
> >
> >
> >
> >   cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops
> > (2025-08-20 12:04:51 +0000)
> >
> >
> >
> > ----------------------------------------------------------------
> >
> > Simon Trimmer (1):
> >
> >       cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo lap=
tops
> >
> >
> >
> > WHENCE                                        |  10 ++++++++++
> >
> > cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp1.bin | Bin 0 -> 10928 bytes
> >
> > cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp2.bin | Bin 0 -> 10928 bytes
> >
> > cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp1.bin | Bin 0 -> 10928 bytes
> >
> > cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp2.bin | Bin 0 -> 10928 bytes
> >
> > cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp1.bin | Bin 0 -> 11220 bytes
> >
> > cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp2.bin | Bin 0 -> 11220 bytes
> >
> > cirrus/cs35l56/CS35L56_Rev3.13.3R.wmfw        | Bin 0 -> 41364 bytes
> >
> > 8 files changed, 10 insertions(+)
> >
> > create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp1.bin
> >
> > create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp2.bin
> >
> > create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp1.bin
> >
> > create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp2.bin
> >
> > create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp1.bin
> >
> > create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp2.bin
> >
> > create mode 100644 cirrus/cs35l56/CS35L56_Rev3.13.3R.wmfw
>
> Tested on Lenovo P1 G8 and P16 G3 - works well.
> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>
> Mark
