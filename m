Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A164CC433EF
	for <linux-firmware@archiver.kernel.org>; Sat,  9 Oct 2021 11:07:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 66EBF60F6B; Sat,  9 Oct 2021 11:07:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0816760273;
	Sat,  9 Oct 2021 11:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633777638;
	bh=pvyIcJuZ41K3HizC+lAYRyjQwXUoQhxTeZ/XG28nEU0=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=PQDe+aPnvJvGMOAfN8LBrkc7lconps3aQZc7PS/katVhLMc3ngk8JOjXyZ5vZIQ9w
	 Lsjhlp6fDXOESIgba5AUetv1mDjSA8VHveotqQ/XMgDStmE9LERQPT0TR2H+v78BPl
	 O5lJGr2X+aa9ZrmOnXr/lzx93gW2fjfaCPuuaTQ1rXdU5Fj1PKkZXFe2eFe13AbkJL
	 rlYcYx056Z9mQOCFWV2A39lvqq4q+kQ9La07BVCCsoBOcfIek+uFWYEXkEQ9G4yd90
	 NeDDIAuy47N391N/JTvIBhnHWZ3MHj7angN1+m1cycjjhk7ZHxtcRd0QYPGHAK47tp
	 eKs9O1GXLjAGQ==
Received: by pali.im (Postfix)
	id 73056310; Sat,  9 Oct 2021 13:07:15 +0200 (CEST)
Date: Sat, 9 Oct 2021 13:07:15 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Sharvari Harisangam <sharvari.harisangam@nxp.com>,
	Linux Firmware <linux-firmware@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	=?utf-8?Q?G=C3=A9rald?= Kerma <gandalf@gk2.net>,
	Rakesh Parmar <rakesh.parmar@nxp.com>,
	Cathy Luo <xiaohua.luo@nxp.com>,
	Zhiyuan Yang <zhiyuan.yang@nxp.com>,
	prashanthkrishnan.ranganathan@nxp.com,
	Ganapathi Bhat <ganapathi017@gmail.com>, zheng.cao@nxp.com
Subject: Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
Message-ID: <20211009110715.dsq2v6gyf327ltrm@pali>
References: <edeb34bc-7c85-7f1d-79e4-e3e21df86334@gk2.net>
 <fe75e8f2-6f12-052a-81ed-38122b87f1f6@gk2.net>
 <20210926104306.xocctztsuspx6oji@pali>
 <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
User-Agent: NeoMutt/20180716

On Monday 27 September 2021 09:47:23 Josh Boyer wrote:
> On Sun, Sep 26, 2021 at 6:43 AM Pali Rohár <pali@kernel.org> wrote:
> >
> > Hello Josh, Sharvari and other from NXP!
> >
> > On Saturday 25 September 2021 19:23:48 Gérald Kerma wrote:
> > > Correcting old marvell address to new nxp...
> > >
> > > Le 25/09/2021 à 19:19, Gérald Kerma a écrit :
> > > > Héllo All,
> > > >
> > > > I made some few tests on EspressoBin-Ultra from GlobalScaleTechnologies,
> > > > because of problem with the WiFi.
> > > >
> > > > I have done some quick tests on all the firmware of PCIEUSB-8997 using
> > > > the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x
> > > >
> > > > Here is a summary of the tests :
> > > > - W16.68.10.p159 = KO
> > > > - W16.68.1.p195 = KO
> > > > - V16.68.1.p145 = OK
> > > > - 16.68.1.p140 = OK
> > > > - 16.68.1.p133 = OK
> > > > - 16.68.1.p97 = OK
> > > > - 16.68.1.p70 = KO
> >
> > From this user test result can be seen that last two versions of
> > pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with
> > official mainline linux kernel driver mwifiex were not properly tested
> > internally in NXP and are causing serious issues which make 8997 card
> > basically unusable.
> >
> > Sharvari and other NXP developers: Do you have some internal testing of
> > this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 8997
> > wifi chips? Or are you aware of this issue and do you have in NXP some
> > workaround for it (e.g. at driver level)? Could you please look at this
> > serious issue and try to debug firmware and release a new version, as
> > this is obvious fatal error in firmware itself?
> >
> > Josh, how you in linux-firmware repository handle such, I must say,
> > "fatal issues"? Wait for vendor fixes or revert problematic commits? Or
> > something else?
> 
> We can revert if we need to, but I think it's not quite that simple.
> 
> > Because when users starts upgrading linux-firmware packages in their
> > downstream distributions then basically wifi cards on this 8997 chips
> > with official mwifiex driver stops working.
> 
> The first broken version was committed in Feb of 2019.  That's
> approaching 3 years ago.  Given that this is binary firmware, I have
> no idea what else may or may not be included in the updates in the
> meantime.
> 
> josh

Josh, do you have any contact in NXP? Because I really do no know how to
get some information about this issue and seems that everything related
to these firmware issues makes just big silence.

> > > > REF (and all details of tests) :
> > > > https://github.com/NXP/mwifiex-firmware/issues/1
> > > >
> > > >
> > > > Broken firmware :
> > > >
> > > > Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| was included into
> > > > linux-firmware repository by this pull request:
> > > > https://lore.kernel.org/all/CA+5PVA5yQbjg3vaT7F8120B6ngLn7+sZC0OWt0KoUiQR9hS4FA@mail.gmail.com/
> > > > <https://lore.kernel.org/all/CA+5PVA5yQbjg3vaT7F8120B6ngLn7+sZC0OWt0KoUiQR9hS4FA@mail.gmail.com/>
> > > >
> > > > And latest version |W16.68.10.p159| of |pcieusb8997_combo_v4.bin| by
> > > > this pull request:
> > > > https://lore.kernel.org/linux-firmware/CA+5PVA5on7+CRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com/
> > > > <https://lore.kernel.org/linux-firmware/CA+5PVA5on7+CRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com/>
> > > >
> > > > Olders looks to works better.
> > > >
> > > > In quick tests, they allow more than 1 clients at a time !
> > > >
> > > > I am still testing the V16.68.1.p145 and report the results after some
> > > > longer use...
> > > >
> > > > Hopes it will help...
> > > > Regards,
> > > > Gérald Kerma
> > > > gandalf(at)gk2(dot)net
> > >
