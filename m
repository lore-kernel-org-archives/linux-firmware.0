Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7822AC433EF
	for <linux-firmware@archiver.kernel.org>; Sat,  9 Oct 2021 12:45:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3DA0760F6D; Sat,  9 Oct 2021 12:45:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBE0860F70;
	Sat,  9 Oct 2021 12:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633783515;
	bh=B/hi74ljqc3YHoZpkc5JJWPP9DfY1Qu0MMNYxzcFtX8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=dSM4QgC7gzmtYWiBsKcygfLE85/R3JUr1UFGGjOJfM0ipoFhBj5bzKJb4VEtRi2lu
	 mbVR4UfhC3xz6zSfKkvy4Wd8+F6ibQzmRdABkXrSktt8nk9WXiwNyf35xTubqa8uOk
	 bEZ2z5vsyd/L3JuRADLyUT1FOYKvFfRM/AD7w2m+B7M86PCQIRPmk/0y0AyChpGMmW
	 mmlsw0gW5YlIvN5BwhpPDlBH0NNDY2cp6xmsZwGgPjEe1QCiuNMJjg2VH7SH5KM1AU
	 yDfFTFZsrLgK23j9lAnE1+TLmpAuR8AfMU2tZ/z5c5BntXuV/syMkxbCwY/gmbHAWe
	 mP2YoccBb6c6g==
Received: by pali.im (Postfix)
	id 0AE36310; Sat,  9 Oct 2021 14:45:11 +0200 (CEST)
Date: Sat, 9 Oct 2021 14:45:11 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>,
	Rakesh Parmar <rakesh.parmar@nxp.com>,
	Cathy Luo <xiaohua.luo@nxp.com>,
	prashanthkrishnan.ranganathan@nxp.com, zheng.cao@nxp.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	=?utf-8?Q?G=C3=A9rald?= Kerma <gandalf@gk2.net>,
	Ganapathi Bhat <ganapathi017@gmail.com>
Subject: Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
Message-ID: <20211009124511.6apo3nox5jgn6n5o@pali>
References: <edeb34bc-7c85-7f1d-79e4-e3e21df86334@gk2.net>
 <fe75e8f2-6f12-052a-81ed-38122b87f1f6@gk2.net>
 <20210926104306.xocctztsuspx6oji@pali>
 <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
 <20211009110715.dsq2v6gyf327ltrm@pali>
 <CA+5PVA50+fUTVo4xHbCmfH_A3t9=wJywAD6HzWvyYx4y_DbEVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA50+fUTVo4xHbCmfH_A3t9=wJywAD6HzWvyYx4y_DbEVQ@mail.gmail.com>
User-Agent: NeoMutt/20180716

Sharvari, Rakesh, Cathy, Zheng: could you please look at this issue?
NXP sent firmware to linux-firmware repository which does not work and
it is causing issues to users.

On Saturday 09 October 2021 08:36:21 Josh Boyer wrote:
> On Sat, Oct 9, 2021 at 7:07 AM Pali Rohár <pali@kernel.org> wrote:
> >
> > On Monday 27 September 2021 09:47:23 Josh Boyer wrote:
> > > On Sun, Sep 26, 2021 at 6:43 AM Pali Rohár <pali@kernel.org> wrote:
> > > >
> > > > Hello Josh, Sharvari and other from NXP!
> > > >
> > > > On Saturday 25 September 2021 19:23:48 Gérald Kerma wrote:
> > > > > Correcting old marvell address to new nxp...
> > > > >
> > > > > Le 25/09/2021 à 19:19, Gérald Kerma a écrit :
> > > > > > Héllo All,
> > > > > >
> > > > > > I made some few tests on EspressoBin-Ultra from GlobalScaleTechnologies,
> > > > > > because of problem with the WiFi.
> > > > > >
> > > > > > I have done some quick tests on all the firmware of PCIEUSB-8997 using
> > > > > > the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x
> > > > > >
> > > > > > Here is a summary of the tests :
> > > > > > - W16.68.10.p159 = KO
> > > > > > - W16.68.1.p195 = KO
> > > > > > - V16.68.1.p145 = OK
> > > > > > - 16.68.1.p140 = OK
> > > > > > - 16.68.1.p133 = OK
> > > > > > - 16.68.1.p97 = OK
> > > > > > - 16.68.1.p70 = KO
> > > >
> > > > From this user test result can be seen that last two versions of
> > > > pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with
> > > > official mainline linux kernel driver mwifiex were not properly tested
> > > > internally in NXP and are causing serious issues which make 8997 card
> > > > basically unusable.
> > > >
> > > > Sharvari and other NXP developers: Do you have some internal testing of
> > > > this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 8997
> > > > wifi chips? Or are you aware of this issue and do you have in NXP some
> > > > workaround for it (e.g. at driver level)? Could you please look at this
> > > > serious issue and try to debug firmware and release a new version, as
> > > > this is obvious fatal error in firmware itself?
> > > >
> > > > Josh, how you in linux-firmware repository handle such, I must say,
> > > > "fatal issues"? Wait for vendor fixes or revert problematic commits? Or
> > > > something else?
> > >
> > > We can revert if we need to, but I think it's not quite that simple.
> > >
> > > > Because when users starts upgrading linux-firmware packages in their
> > > > downstream distributions then basically wifi cards on this 8997 chips
> > > > with official mwifiex driver stops working.
> > >
> > > The first broken version was committed in Feb of 2019.  That's
> > > approaching 3 years ago.  Given that this is binary firmware, I have
> > > no idea what else may or may not be included in the updates in the
> > > meantime.
> > >
> > > josh
> >
> > Josh, do you have any contact in NXP? Because I really do no know how to
> > get some information about this issue and seems that everything related
> > to these firmware issues makes just big silence.
> 
> I do not.
> 
> josh
> 
> >
> > > > > > REF (and all details of tests) :
> > > > > > https://github.com/NXP/mwifiex-firmware/issues/1
> > > > > >
> > > > > >
> > > > > > Broken firmware :
> > > > > >
> > > > > > Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| was included into
> > > > > > linux-firmware repository by this pull request:
> > > > > > https://lore.kernel.org/all/CA+5PVA5yQbjg3vaT7F8120B6ngLn7+sZC0OWt0KoUiQR9hS4FA@mail.gmail.com/
> > > > > > <https://lore.kernel.org/all/CA+5PVA5yQbjg3vaT7F8120B6ngLn7+sZC0OWt0KoUiQR9hS4FA@mail.gmail.com/>
> > > > > >
> > > > > > And latest version |W16.68.10.p159| of |pcieusb8997_combo_v4.bin| by
> > > > > > this pull request:
> > > > > > https://lore.kernel.org/linux-firmware/CA+5PVA5on7+CRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com/
> > > > > > <https://lore.kernel.org/linux-firmware/CA+5PVA5on7+CRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com/>
> > > > > >
> > > > > > Olders looks to works better.
> > > > > >
> > > > > > In quick tests, they allow more than 1 clients at a time !
> > > > > >
> > > > > > I am still testing the V16.68.1.p145 and report the results after some
> > > > > > longer use...
> > > > > >
> > > > > > Hopes it will help...
> > > > > > Regards,
> > > > > > Gérald Kerma
> > > > > > gandalf(at)gk2(dot)net
> > > > >
