Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA2FC433EF
	for <linux-firmware@archiver.kernel.org>; Sat,  9 Oct 2021 12:36:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 173376105A; Sat,  9 Oct 2021 12:36:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F218060FC1;
	Sat,  9 Oct 2021 12:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633782993;
	bh=MntcXtnr6pLQc4jWYXMRhxpGAL7NKY62+dkmNR0CwEw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TD0ipfF6S2RxfA4gCRYzW/ERSSCxT3xyxno2smhU3kaK3sOFQnZCWdoRgSSJEUWPz
	 yS3qKc8jT6F6q9qTVag/x7SS0ZqRl9/46/S1do/eHl+0lYjLMslbEPQyqKugwSelDq
	 JQnai1xqdSpy99i4laI2v8ku/YSNhl93fz5BZZwYohrvdlMqSgtH4nAchSHgKFktxy
	 LwU8MoRvBPReJZtdYONgMDVGxChfEkx6YtIGVAsq5nyHUgA/pD9WFxZ4WUgK7MOsvR
	 D1C4OUHLAB4f34IhpAXNsCwn/dMyCXzMFIaOSIrx/xBqS2u+eAinyVHaPr5Uo4I1WP
	 bsMjMael1DMtg==
Received: by mail-io1-f51.google.com with SMTP id y67so1935290iof.10;
        Sat, 09 Oct 2021 05:36:32 -0700 (PDT)
X-Gm-Message-State: AOAM530+lfszip5zyusJksKxYwIJhJ01viKpqFN3Usfy3I/4PZ7a1jOO
	dzmnSSIvbCISUUcw8QU5aZEkcLn9U1VYpqWime4=
X-Google-Smtp-Source: ABdhPJwPNdDBUtanfzLRgdjU1m4kEIcpkbUtH0fqL1KnUmIHH+nmilJfY7piSQR/nosjebVXfwU87MxiHaOE5vAuxeI=
X-Received: by 2002:a5d:8f86:: with SMTP id l6mr11399268iol.55.1633782992343;
 Sat, 09 Oct 2021 05:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <edeb34bc-7c85-7f1d-79e4-e3e21df86334@gk2.net> <fe75e8f2-6f12-052a-81ed-38122b87f1f6@gk2.net>
 <20210926104306.xocctztsuspx6oji@pali> <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
 <20211009110715.dsq2v6gyf327ltrm@pali>
In-Reply-To: <20211009110715.dsq2v6gyf327ltrm@pali>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sat, 9 Oct 2021 08:36:21 -0400
X-Gmail-Original-Message-ID: <CA+5PVA50+fUTVo4xHbCmfH_A3t9=wJywAD6HzWvyYx4y_DbEVQ@mail.gmail.com>
Message-ID: <CA+5PVA50+fUTVo4xHbCmfH_A3t9=wJywAD6HzWvyYx4y_DbEVQ@mail.gmail.com>
Subject: Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, Sharvari Harisangam <sharvari.harisangam@nxp.com>, 
	Linux Firmware <linux-firmware@kernel.org>, Linux Wireless <linux-wireless@vger.kernel.org>, 
	=?UTF-8?Q?G=C3=A9rald_Kerma?= <gandalf@gk2.net>, 
	Rakesh Parmar <rakesh.parmar@nxp.com>, Cathy Luo <xiaohua.luo@nxp.com>, 
	Zhiyuan Yang <zhiyuan.yang@nxp.com>, prashanthkrishnan.ranganathan@nxp.com, 
	Ganapathi Bhat <ganapathi017@gmail.com>, zheng.cao@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 9, 2021 at 7:07 AM Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> On Monday 27 September 2021 09:47:23 Josh Boyer wrote:
> > On Sun, Sep 26, 2021 at 6:43 AM Pali Roh=C3=A1r <pali@kernel.org> wrote=
:
> > >
> > > Hello Josh, Sharvari and other from NXP!
> > >
> > > On Saturday 25 September 2021 19:23:48 G=C3=A9rald Kerma wrote:
> > > > Correcting old marvell address to new nxp...
> > > >
> > > > Le 25/09/2021 =C3=A0 19:19, G=C3=A9rald Kerma a =C3=A9crit :
> > > > > H=C3=A9llo All,
> > > > >
> > > > > I made some few tests on EspressoBin-Ultra from GlobalScaleTechno=
logies,
> > > > > because of problem with the WiFi.
> > > > >
> > > > > I have done some quick tests on all the firmware of PCIEUSB-8997 =
using
> > > > > the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x
> > > > >
> > > > > Here is a summary of the tests :
> > > > > - W16.68.10.p159 =3D KO
> > > > > - W16.68.1.p195 =3D KO
> > > > > - V16.68.1.p145 =3D OK
> > > > > - 16.68.1.p140 =3D OK
> > > > > - 16.68.1.p133 =3D OK
> > > > > - 16.68.1.p97 =3D OK
> > > > > - 16.68.1.p70 =3D KO
> > >
> > > From this user test result can be seen that last two versions of
> > > pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with
> > > official mainline linux kernel driver mwifiex were not properly teste=
d
> > > internally in NXP and are causing serious issues which make 8997 card
> > > basically unusable.
> > >
> > > Sharvari and other NXP developers: Do you have some internal testing =
of
> > > this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 8997
> > > wifi chips? Or are you aware of this issue and do you have in NXP som=
e
> > > workaround for it (e.g. at driver level)? Could you please look at th=
is
> > > serious issue and try to debug firmware and release a new version, as
> > > this is obvious fatal error in firmware itself?
> > >
> > > Josh, how you in linux-firmware repository handle such, I must say,
> > > "fatal issues"? Wait for vendor fixes or revert problematic commits? =
Or
> > > something else?
> >
> > We can revert if we need to, but I think it's not quite that simple.
> >
> > > Because when users starts upgrading linux-firmware packages in their
> > > downstream distributions then basically wifi cards on this 8997 chips
> > > with official mwifiex driver stops working.
> >
> > The first broken version was committed in Feb of 2019.  That's
> > approaching 3 years ago.  Given that this is binary firmware, I have
> > no idea what else may or may not be included in the updates in the
> > meantime.
> >
> > josh
>
> Josh, do you have any contact in NXP? Because I really do no know how to
> get some information about this issue and seems that everything related
> to these firmware issues makes just big silence.

I do not.

josh

>
> > > > > REF (and all details of tests) :
> > > > > https://github.com/NXP/mwifiex-firmware/issues/1
> > > > >
> > > > >
> > > > > Broken firmware :
> > > > >
> > > > > Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| was include=
d into
> > > > > linux-firmware repository by this pull request:
> > > > > https://lore.kernel.org/all/CA+5PVA5yQbjg3vaT7F8120B6ngLn7+sZC0OW=
t0KoUiQR9hS4FA@mail.gmail.com/
> > > > > <https://lore.kernel.org/all/CA+5PVA5yQbjg3vaT7F8120B6ngLn7+sZC0O=
Wt0KoUiQR9hS4FA@mail.gmail.com/>
> > > > >
> > > > > And latest version |W16.68.10.p159| of |pcieusb8997_combo_v4.bin|=
 by
> > > > > this pull request:
> > > > > https://lore.kernel.org/linux-firmware/CA+5PVA5on7+CRtEV7tThPxguc=
wt3W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com/
> > > > > <https://lore.kernel.org/linux-firmware/CA+5PVA5on7+CRtEV7tThPxgu=
cwt3W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com/>
> > > > >
> > > > > Olders looks to works better.
> > > > >
> > > > > In quick tests, they allow more than 1 clients at a time !
> > > > >
> > > > > I am still testing the V16.68.1.p145 and report the results after=
 some
> > > > > longer use...
> > > > >
> > > > > Hopes it will help...
> > > > > Regards,
> > > > > G=C3=A9rald Kerma
> > > > > gandalf(at)gk2(dot)net
> > > >
