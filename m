Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28417C433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Sep 2021 13:47:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0AA7B6108E; Mon, 27 Sep 2021 13:47:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E819761058;
	Mon, 27 Sep 2021 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632750454;
	bh=96rkfonfUwt+3X6QdTuB5/50v7XFPk8xwtoO5vUen6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XSAl/a/aChBcR2VY5uLuPw69JJVKbYHJ9EiOgoWvqQNIhrCHie9B1brVubc3QobJO
	 B0InG7RijkYV89LBFHPdhDHMQQ8VN1xMnqwVPD2ZB94aTUJTmZuBPWKmBcfM8Ld+MG
	 wr9C6cj7OHokvlB3xDKG+ghI/cJOLDJCgEi4PnMZmoDwHY2dLQJoz5sdpdrGlu7uHP
	 wSMb4C/FUA417miDwaUMb+E5wDnVEPZ7EsVABWkmXM3VmSqOJi0gEQW+g6MZAxxXN9
	 dgKcS4jk9mAbi5mCN5z1r0CzhgwVYplzfu53Y4jVL3tGAovMi3pYNkdFiJrmC54K6h
	 2iytZr4OnoK9Q==
Received: by mail-il1-f174.google.com with SMTP id b6so19368033ilv.0;
        Mon, 27 Sep 2021 06:47:34 -0700 (PDT)
X-Gm-Message-State: AOAM533uvdQg7ya9IHTfYsqj6tpSppTxiebUqjOV1zupQHcTQ2dFRMub
	XTMFXrAVYrlZNz2DGWuKp4aR0tz6t7muhGG05Og=
X-Google-Smtp-Source: ABdhPJxGqfnHMU5btyFD4Q8FSduGkKADhOLKhKZxQOG0oaq/QRdK8Fp5vWYKocmDoEA8jUbBXXpTUBCAkriPayf9PLE=
X-Received: by 2002:a92:d14e:: with SMTP id t14mr94837ilg.218.1632750454237;
 Mon, 27 Sep 2021 06:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <edeb34bc-7c85-7f1d-79e4-e3e21df86334@gk2.net> <fe75e8f2-6f12-052a-81ed-38122b87f1f6@gk2.net>
 <20210926104306.xocctztsuspx6oji@pali>
In-Reply-To: <20210926104306.xocctztsuspx6oji@pali>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 27 Sep 2021 09:47:23 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
Message-ID: <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
Subject: Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Sharvari Harisangam <sharvari.harisangam@nxp.com>, Linux Firmware <linux-firmware@kernel.org>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, =?UTF-8?Q?G=C3=A9rald_Kerma?= <gandalf@gk2.net>, 
	Rakesh Parmar <rakesh.parmar@nxp.com>, Cathy Luo <xiaohua.luo@nxp.com>, 
	Zhiyuan Yang <zhiyuan.yang@nxp.com>, prashanthkrishnan.ranganathan@nxp.com, 
	Ganapathi Bhat <ganapathi017@gmail.com>, zheng.cao@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 26, 2021 at 6:43 AM Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> Hello Josh, Sharvari and other from NXP!
>
> On Saturday 25 September 2021 19:23:48 G=C3=A9rald Kerma wrote:
> > Correcting old marvell address to new nxp...
> >
> > Le 25/09/2021 =C3=A0 19:19, G=C3=A9rald Kerma a =C3=A9crit :
> > > H=C3=A9llo All,
> > >
> > > I made some few tests on EspressoBin-Ultra from GlobalScaleTechnologi=
es,
> > > because of problem with the WiFi.
> > >
> > > I have done some quick tests on all the firmware of PCIEUSB-8997 usin=
g
> > > the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x
> > >
> > > Here is a summary of the tests :
> > > - W16.68.10.p159 =3D KO
> > > - W16.68.1.p195 =3D KO
> > > - V16.68.1.p145 =3D OK
> > > - 16.68.1.p140 =3D OK
> > > - 16.68.1.p133 =3D OK
> > > - 16.68.1.p97 =3D OK
> > > - 16.68.1.p70 =3D KO
>
> From this user test result can be seen that last two versions of
> pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with
> official mainline linux kernel driver mwifiex were not properly tested
> internally in NXP and are causing serious issues which make 8997 card
> basically unusable.
>
> Sharvari and other NXP developers: Do you have some internal testing of
> this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 8997
> wifi chips? Or are you aware of this issue and do you have in NXP some
> workaround for it (e.g. at driver level)? Could you please look at this
> serious issue and try to debug firmware and release a new version, as
> this is obvious fatal error in firmware itself?
>
> Josh, how you in linux-firmware repository handle such, I must say,
> "fatal issues"? Wait for vendor fixes or revert problematic commits? Or
> something else?

We can revert if we need to, but I think it's not quite that simple.

> Because when users starts upgrading linux-firmware packages in their
> downstream distributions then basically wifi cards on this 8997 chips
> with official mwifiex driver stops working.

The first broken version was committed in Feb of 2019.  That's
approaching 3 years ago.  Given that this is binary firmware, I have
no idea what else may or may not be included in the updates in the
meantime.

josh

> > > REF (and all details of tests) :
> > > https://github.com/NXP/mwifiex-firmware/issues/1
> > >
> > >
> > > Broken firmware :
> > >
> > > Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| was included in=
to
> > > linux-firmware repository by this pull request:
> > > https://lore.kernel.org/all/CA+5PVA5yQbjg3vaT7F8120B6ngLn7+sZC0OWt0Ko=
UiQR9hS4FA@mail.gmail.com/
> > > <https://lore.kernel.org/all/CA+5PVA5yQbjg3vaT7F8120B6ngLn7+sZC0OWt0K=
oUiQR9hS4FA@mail.gmail.com/>
> > >
> > > And latest version |W16.68.10.p159| of |pcieusb8997_combo_v4.bin| by
> > > this pull request:
> > > https://lore.kernel.org/linux-firmware/CA+5PVA5on7+CRtEV7tThPxgucwt3W=
9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com/
> > > <https://lore.kernel.org/linux-firmware/CA+5PVA5on7+CRtEV7tThPxgucwt3=
W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com/>
> > >
> > > Olders looks to works better.
> > >
> > > In quick tests, they allow more than 1 clients at a time !
> > >
> > > I am still testing the V16.68.1.p145 and report the results after som=
e
> > > longer use...
> > >
> > > Hopes it will help...
> > > Regards,
> > > G=C3=A9rald Kerma
> > > gandalf(at)gk2(dot)net
> >
