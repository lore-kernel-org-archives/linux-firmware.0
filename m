Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774EEC433DB
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Mar 2021 16:05:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3F3176508D; Fri,  5 Mar 2021 16:05:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 229D86508B
	for <linux-firmware@kernel.org>; Fri,  5 Mar 2021 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614960300;
	bh=9GoQNQDqRHq8trAllir7JBlyPejseQlcsAPDo8/LDeA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=chsD+DF9yke5sqkPu/QmmmTN5H2pLAjCM3R7erC0tUVSrOE8ESHdnJ8pEyYedtFVb
	 /oHzOX5dWdTo4XfSfRCpRras4NS9OaZzlZ4MDHvW+YaG+aur5JhRCZJfPN2+ivnRQs
	 vBo8/TBCShYbDJpSFZslcD8Ag5buLIBGiU+T0DcKuQ31mxivA+XwkpnkfHPnPEuD56
	 e+DZP5nnBKqoNJalr5XXj9SGCI2ACQu5k4jMaqkexPCL2M+Q1phYEofWI0uUp9Z7s6
	 33jnbagn36Dq3hbkLoAVvdzqPce7FmZKTtmi55uEgdOlroaYxG98d3KTmob6EVcm8u
	 dMZtPMosZhjIA==
Received: by mail-io1-f45.google.com with SMTP id f20so2523643ioo.10
        for <linux-firmware@kernel.org>; Fri, 05 Mar 2021 08:05:00 -0800 (PST)
X-Gm-Message-State: AOAM5338PQUmPWJOZlmlNu9ZPBkQv8lw+WwsBEzets3GVUCG8LXPFxwf
	FWmVL9LWoKId+ELbDPVKweVFwOT2eyRi3wbnaWQ=
X-Google-Smtp-Source: ABdhPJyLKnwLS5aJJqhj234fqtIthNei3zOrA8gcGzeA2PnHLuMBPogzG6paaPDQhQNu5qZbRQeeYsWDeE7DPpkjBcw=
X-Received: by 2002:a5d:9501:: with SMTP id d1mr8428819iom.159.1614960299625;
 Fri, 05 Mar 2021 08:04:59 -0800 (PST)
MIME-Version: 1.0
References: <2833354.gXvVfaC4I7@pc-42> <CA+5PVA62OvSOkdw_x=oGgXHcD1y5zz9cf0cdthKgGHddH30eRw@mail.gmail.com>
 <5944333.eMMS12kUo3@pc-42>
In-Reply-To: <5944333.eMMS12kUo3@pc-42>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 5 Mar 2021 11:04:48 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7WmHeK8jL8uy8mnKAfPaPuVdOfz1Nn2ric8HndnLa=ag@mail.gmail.com>
Message-ID: <CA+5PVA7WmHeK8jL8uy8mnKAfPaPuVdOfz1Nn2ric8HndnLa=ag@mail.gmail.com>
Subject: Re: pull-request: linux-firmware: silabs: add new firmware for WF200
To: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 5, 2021 at 9:40 AM J=C3=A9r=C3=B4me Pouiller
<jerome.pouiller@silabs.com> wrote:
>
> On Friday 5 March 2021 14:08:20 CET Josh Boyer wrote:
> > On Wed, Mar 3, 2021 at 12:27 PM J=C3=A9r=C3=B4me Pouiller <jerome.pouil=
ler@silabs.com> wrote:
> > >
> > > Hello,
> > >
> > > I know that PRs are less convenient for review, but it seems that my =
patch
> > > does not want to reach the MLs (because it is too big?).
> >
> > I got both copies :)  I actually prefer PRs for firmware because
> > otherwise it's 1% things we can review and the other 99% is megabytes
> > of non-readable stuff anyway.
>
> Why the hell they do not appear on lore.kernel.org?

https://lore.kernel.org/linux-firmware/20210303131950.635212-1-Jerome.Pouil=
ler@silabs.com/T/#u

?

josh

>
>
> > > So, this PR contains only one commit. It adds the firmware for Silabs
> > > WF200. This firmware is necessary for the wfx driver currently hosted=
 in
> > > the staging/ directory of the Linux kernel.
> >
> > Pulled and pushed out.
>
> Great, thank you.
>
> --
> J=C3=A9r=C3=B4me Pouiller
>
>
