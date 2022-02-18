Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F83FC433EF
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Feb 2022 15:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 047A2C340F1; Fri, 18 Feb 2022 15:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20B6C340F0;
	Fri, 18 Feb 2022 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645199748;
	bh=+p12Ks4PSnp/sDqUyTuQK3jFCFRJkgZY6MkXa7nJmyM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=GkUhL+SdSf7kN4n1kw8CFYyqwIMsoj/ZNXIwzNipiWir4Dvm6pF5HC4qxciuneRV+
	 KaFzLecUIDeHie1crI7ID8F+xEBDRORzKGb61jpXsLQo0tXY5gNhrBLZUWEBAokYdX
	 lLUKa6Z1FSZ1gFDIlXZtnnw6ivbGbWfev1h42jOfK/NLUnsMEBdB8JPJhDm5PeoL8+
	 2Q8bYAxFDOHJqxKQiNR998+SBUshdVUx/JN48UcTBAe9PZiRPYR/e+CsiUjFU+g7RM
	 +Dv9b8BPe+dgoMS2+DQXYmD0qkoBO7/rlKX/xsEqkMQHesbQvAFi+WChs/BY0LFsLY
	 I8lBbQ/QkbbBQ==
Received: by mail-il1-f173.google.com with SMTP id d7so4939189ilf.8;
        Fri, 18 Feb 2022 07:55:48 -0800 (PST)
X-Gm-Message-State: AOAM5310HGzIytpAk4a1fjGI92Em/CRAwZNGlaAV4Ziuo0OQipXkXXX0
	bprccd+mrk1Qpnd0OlP7lRehYQrqNlCsjCUhcrI=
X-Google-Smtp-Source: ABdhPJyP+OrrjwEL115ivR3yvmv3Lx9hzyvIpOYhri6Y0J0csGhwCcHuExO8hCklIT0buOXdtmV0/MjeT2+wybNgDLA=
X-Received: by 2002:a05:6e02:1544:b0:2c1:eb43:db10 with SMTP id
 j4-20020a056e02154400b002c1eb43db10mr371806ilu.251.1645199748082; Fri, 18 Feb
 2022 07:55:48 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com> <87ee4brodv.fsf@kernel.org>
In-Reply-To: <87ee4brodv.fsf@kernel.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 18 Feb 2022 10:55:37 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5DJmwPqpz8F9iDbJKcF1hDBRLdDT4URgSaiEcjet74Kw@mail.gmail.com>
Message-ID: <CA+5PVA5DJmwPqpz8F9iDbJKcF1hDBRLdDT4URgSaiEcjet74Kw@mail.gmail.com>
Subject: Re: [PULL] ath11k firmware 20211223
To: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2022 at 5:45 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> Hi Josh,
>
> Josh Boyer <jwboyer@kernel.org> writes:
>
> > On Thu, Dec 23, 2021 at 9:03 AM Kalle Valo <kvalo@qca.qualcomm.com> wro=
te:
> >>
> >>  WHENCE                           |   14 +-
> >>  ath11k/IPQ6018/hw1.0/Notice.txt  |   48 +-
> >
> > These Notice files seem problematic.  They're clearly well intended,
> > but they have language that alludes to an agreement with Atheros and a
> > confidential nature to some of the files.  Specifically:
> >
> > "...your use of these software
> > components together with the Qualcomm Atheros software (Qualcomm
> > Atheros software hereinafter referred to as =E2=80=9CSoftware=E2=80=9D)=
 is
> > subject to the terms of your agreement from Qualcomm Atheros."
> >
> > Nobody has an opportunity to agree to anything with Atheros when they
> > consume the files from linux-firmware.  There's also no explicit grant
> > of redistribution for any of these files.
>
> So this file we are discussing is the notice.txt file. In the WHENCE
> file the actual license for ath11k is:
>
> Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details

Then is the notice.txt file needed at all?  If a user or distribution
were to install this firmware, is the expectation that the notice.txt
file also be installed?

> Does that cover your concerns about redistribution?

Not really.  I understand the logic, but if the binding license for
the firmware is LICENSE.QualcommAtheros_ath10k but we still need
notice.txt for some reason, they conflict.  It's ambiguous at best.

josh

> I'm still working on your other comment about notice.txt, will get back
> on that later.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches
