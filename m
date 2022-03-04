Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E63C433EF
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Mar 2022 13:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53605C340F0; Fri,  4 Mar 2022 13:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB3FC340E9;
	Fri,  4 Mar 2022 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646399078;
	bh=jobNdMexznQlLMpJlEajq8gPNjns/xI1m54tT0ak8uw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PkroZ9NzCrU3TFzDxeuwdvVs4N8l6+27Wn1krSLlrZQMWV1qIZk/06Q6cMCMZaU85
	 ovL5TRgXhRh2A17gcIznGaBAOTUsSwuTgr1Y+Qnc3/MBEkCR9l0RoFl2gRynY8tAKy
	 T5w95iQ+yd15A9yQq+/BwwscnR7c97D+DWnPftrbKl6CHUMOx+6zYy9hRQTKgAje1O
	 E69wzaEedxNtGcSgBwrOA0N39uKTiNycZgqJhS4wgMVpoSPrGiBqe8rmIa41iyzfq1
	 JiAo0KqAoVDQeIk8Cr6SOzYZ80wfXJl1QuNIA5kFoCwqlq9EaYR+XU21+SrtkzX2lW
	 8LhDAwAjVzpsg==
Received: by mail-io1-f54.google.com with SMTP id c14so9342900ioa.12;
        Fri, 04 Mar 2022 05:04:38 -0800 (PST)
X-Gm-Message-State: AOAM531KNZfDTHyPonnZd6LioJSQKd69zVd/0h2cgEcpRkHAYOZ5GqUu
	ec4PBHH8n5+1bwoKthVizSFuUG46XezbIXWtJ3Q=
X-Google-Smtp-Source: ABdhPJzwxCeAWTXWdiGTxXYrOk14Ql681fPrTuqvNLRsMRRfI3eNqY8wwOH/WsLLqM0gneu50RYDUakfG2mZ4CFMews=
X-Received: by 2002:a5e:9b06:0:b0:641:808b:4240 with SMTP id
 j6-20020a5e9b06000000b00641808b4240mr30747155iok.209.1646399077322; Fri, 04
 Mar 2022 05:04:37 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
 <87ee4brodv.fsf@kernel.org> <CA+5PVA5DJmwPqpz8F9iDbJKcF1hDBRLdDT4URgSaiEcjet74Kw@mail.gmail.com>
 <20220302175014.GA14801@w1.fi>
In-Reply-To: <20220302175014.GA14801@w1.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 4 Mar 2022 08:04:26 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6R6F=VqAZRf=xDwGcC+cpqLY1kStkoHck53XiLURVyaw@mail.gmail.com>
Message-ID: <CA+5PVA6R6F=VqAZRf=xDwGcC+cpqLY1kStkoHck53XiLURVyaw@mail.gmail.com>
Subject: Re: [PULL] ath11k firmware 20211223
To: Jouni Malinen <j@w1.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 2, 2022 at 12:50 PM Jouni Malinen <j@w1.fi> wrote:
>
> On Fri, Feb 18, 2022 at 10:55:37AM -0500, Josh Boyer wrote:
> > On Thu, Feb 10, 2022 at 5:45 AM Kalle Valo <kvalo@kernel.org> wrote:
> > > > On Thu, Dec 23, 2021 at 9:03 AM Kalle Valo <kvalo@qca.qualcomm.com>=
 wrote:
> > > >>
> > > >>  WHENCE                           |   14 +-
> > > >>  ath11k/IPQ6018/hw1.0/Notice.txt  |   48 +-
>
> > > > These Notice files seem problematic.  They're clearly well intended=
,
> > > > but they have language that alludes to an agreement with Atheros an=
d a
> > > > confidential nature to some of the files.  Specifically:
> > > >
> > > > "...your use of these software
> > > > components together with the Qualcomm Atheros software (Qualcomm
> > > > Atheros software hereinafter referred to as =E2=80=9CSoftware=E2=80=
=9D) is
> > > > subject to the terms of your agreement from Qualcomm Atheros."
> > > >
> > > > Nobody has an opportunity to agree to anything with Atheros when th=
ey
> > > > consume the files from linux-firmware.  There's also no explicit gr=
ant
> > > > of redistribution for any of these files.
>
> This is not the license; this is a description of the notice.txt file
> containing the notices to cover the 3rd party license requirements for
> attribution/notices included in redistribution of those parts.
>
> > > So this file we are discussing is the notice.txt file. In the WHENCE
> > > file the actual license for ath11k is:
> > >
> > > Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for deta=
ils
>
> And this is where the license is and this includes license to
> redistribute.
>
> > Then is the notice.txt file needed at all?  If a user or distribution
> > were to install this firmware, is the expectation that the notice.txt
> > file also be installed?
>
> Those 3rd party license might require various notifications to be
> included for notification/attribution purposes, so I would expect the
> notice.txt file to be redistributed whenever the firmware image is
> redistributed.
>
> > > Does that cover your concerns about redistribution?
> >
> > Not really.  I understand the logic, but if the binding license for
> > the firmware is LICENSE.QualcommAtheros_ath10k but we still need
> > notice.txt for some reason, they conflict.  It's ambiguous at best.
>
> Could you please be more specific on where you see a conflict? Maybe
> this would be clearer if the WHENCE file would not mark the notice.txt
> files with the "License: <file>" lines since these are not the license
> for the firmware binary and then there would be a single "License:" line
> pointing out the exact license that applies?

That would help.  I spent some time digging into the existing ath
firmware in the tree and see they all have similar notices already.
It leaves me guessing how/why they were merged that way in the past,
but if we can disambiguate what the license actually is that would be
good.

> Would the following in WHENCE work for you?
>
> Driver: ath11k - Qualcomm Technologies 802.11ax chipset support
>
> File: ath11k/IPQ6018/hw1.0/board-2.bin
> ...
> Version: WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
> Notice: ath11k/IPQ6018/hw1.0/Notice.txt

We'd have to teach copy-firmware.sh what to do with a "Notice:" key.
Is there a reason "File:" wouldn't work?  The intention is to install
the notices alongside the binaries, so that would accomplish it.

> ...
> File: ath11k/QCA6390/hw2.0/m3.bin
> Version: WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Notice: ath11k/QCA6390/hw2.0/Notice.txt
>
> Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
>
>
> In other words, there would be only a single "License:" line and one
> "Notice:" line for each firmware version? The license itself (i.e.,
> LICENSE.QualcommAtheros_ath10k) is same for all the versions while the
> set of notices (i.e., those notice.txt files) can be different based on
> what is included in the particular build.

Yes, that would help.  Would you be able to adjust the existing
entries for ath firmware in the same way?

> > > I'm still working on your other comment about notice.txt, will get ba=
ck
> > > on that later.
>
> This part about clearly identifying the files should be clear now, but
> it would be good to resolve that part about the notice.txt files in
> general before sending out an updated pull request.

Given these were merged in the past, perhaps I'm being overly
pedantic.  If we can mark them as Files or Notices instead of
Licenses, I won't hold it up.  It leaves me slightly confused why
attribution files need to reference agreements with Qualcomm, splatter
Confidential and Proprietary throughout the file, and reference
COPYING and README in reference to GPLv2 when the BSD license was
clearly chosen.  Perhaps that could be cleaned up in the future.

josh
