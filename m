Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A28BC433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Jan 2022 19:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 443B7C340E5; Thu, 20 Jan 2022 19:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0428C340E0;
	Thu, 20 Jan 2022 19:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642707044;
	bh=4MJ50RJFUV3lHNyaLuMwwygETH/taGyBwG/PCoAF5q4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=CTkijSW3Z9tbbA9dZtBO+3QKf5JbLJpHbA5SHORJ0qkr7YY6tohem/o9s6U4hCZom
	 8rLXd5geY6l/CF5CpgGVXvXE7rxcKgaHBcx9OrMUvaMcpTXF4LrPu5hHd6KmOmCdLG
	 33H+O4ErRmbGmfPOPt+aISjEimCeHkBI4I3TC+lTgZzjuDHTuo914imaSACUH90QcC
	 XWiCNpaekxnc1Sqt2FAPAQcKGhg9Lo6O8oY2p5jfskzTyJvAtasWXM53UPs4Gse/S8
	 cuymOC+8Rc7m1cV31nDsYIhFPe3P8BZ8Cfu/vOaJIBbzoLfBrfPs3Xz/ioEYUaHero
	 a1O053krcSBhg==
Received: by pali.im (Postfix)
	id 2F005791; Thu, 20 Jan 2022 20:30:41 +0100 (CET)
Date: Thu, 20 Jan 2022 20:30:41 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Sharvari Harisangam <sharvari.harisangam@nxp.com>,
	Rakesh Parmar <rakesh.parmar@nxp.com>,
	Cathy Luo <xiaohua.luo@nxp.com>, James Cao <james.cao@nxp.com>,
	Linux Firmware <linux-firmware@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	=?utf-8?Q?G=C3=A9rald?= Kerma <gandalf@gk2.net>,
	Ganapathi Bhat <ganapathi017@gmail.com>,
	Josh Boyer <jwboyer@kernel.org>
Subject: Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
Message-ID: <20220120193041.fmmmd77ingjvyqe4@pali>
References: <edeb34bc-7c85-7f1d-79e4-e3e21df86334@gk2.net>
 <fe75e8f2-6f12-052a-81ed-38122b87f1f6@gk2.net>
 <20210926104306.xocctztsuspx6oji@pali>
 <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
 <20220114170051.sx2p6m2ihrv3ojzt@pali>
 <AS8PR04MB9192076DB3CB59EC049B7B9CFB549@AS8PR04MB9192.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB9192076DB3CB59EC049B7B9CFB549@AS8PR04MB9192.eurprd04.prod.outlook.com>
User-Agent: NeoMutt/20180716

Hello Prashanth!

Thank you for reply. Did you have a time to check this issue?

Gérald did a great testing which shows that version W16.68.1.p195 and
higher of pcieuart8997_combo_v4.bin firmware does not work.

On Friday 14 January 2022 17:11:18 Prashanth Ranganathan wrote:
> Hi Pali,
> Please allow me to check this and respond ASAP.
> Best,
> Prashanth
> ________________________________
> From: Pali Rohár <pali@kernel.org>
> Sent: Friday, January 14, 2022 9:00 AM
> To: Sharvari Harisangam <sharvari.harisangam@nxp.com>; Rakesh Parmar <rakesh.parmar@nxp.com>; Cathy Luo <xiaohua.luo@nxp.com>; Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>; James Cao <james.cao@nxp.com>
> Cc: Linux Firmware <linux-firmware@kernel.org>; Linux Wireless <linux-wireless@vger.kernel.org>; Gérald Kerma <gandalf@gk2.net>; Ganapathi Bhat <ganapathi017@gmail.com>; Josh Boyer <jwboyer@kernel.org>
> Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
> 
> Caution: EXT Email
> 
> NXP people: Sharvari, Rakesh, Cathy, Zheng: could you please look at
> this issue? It is really serous!
> 
> On Monday 27 September 2021 09:47:23 Josh Boyer wrote:
> > On Sun, Sep 26, 2021 at 6:43 AM Pali Rohár <pali@kernel.org> wrote:
> > >
> > > Hello Josh, Sharvari and other from NXP!
> > >
> > > On Saturday 25 September 2021 19:23:48 Gérald Kerma wrote:
> > > > Correcting old marvell address to new nxp...
> > > >
> > > > Le 25/09/2021 à 19:19, Gérald Kerma a écrit :
> > > > > Héllo All,
> > > > >
> > > > > I made some few tests on EspressoBin-Ultra from GlobalScaleTechnologies,
> > > > > because of problem with the WiFi.
> > > > >
> > > > > I have done some quick tests on all the firmware of PCIEUSB-8997 using
> > > > > the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x
> > > > >
> > > > > Here is a summary of the tests :
> > > > > - W16.68.10.p159 = KO
> > > > > - W16.68.1.p195 = KO
> > > > > - V16.68.1.p145 = OK
> > > > > - 16.68.1.p140 = OK
> > > > > - 16.68.1.p133 = OK
> > > > > - 16.68.1.p97 = OK
> > > > > - 16.68.1.p70 = KO
> > >
> > > From this user test result can be seen that last two versions of
> > > pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with
> > > official mainline linux kernel driver mwifiex were not properly tested
> > > internally in NXP and are causing serious issues which make 8997 card
> > > basically unusable.
> > >
> > > Sharvari and other NXP developers: Do you have some internal testing of
> > > this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 8997
> > > wifi chips? Or are you aware of this issue and do you have in NXP some
> > > workaround for it (e.g. at driver level)? Could you please look at this
> > > serious issue and try to debug firmware and release a new version, as
> > > this is obvious fatal error in firmware itself?
> > >
> > > Josh, how you in linux-firmware repository handle such, I must say,
> > > "fatal issues"? Wait for vendor fixes or revert problematic commits? Or
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
> Josh, as Gérald wrote, current binary in linux-firmware repository is
> unusable. And there is no reply from NXP for 3 months.
> 
> You are right that nobody knows what is in firmware binary, but working
> binary is at least usable than non-working binary.
> 
> So I would really suggest to start reverting non-working firmware files
> if NXP does not respond in few days.
> 
> Gérald, what is your opinion? Do you see other way how to make mainline
> linux driver work (again)?
> 
> > > > > REF (and all details of tests) :
> > > > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FNXP%2Fmwifiex-firmware%2Fissues%2F1&amp;data=04%7C01%7Cprashanthkrishnan.ranganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Dt9GPodlLhnKXOvovRMHabvd5DLiEQ3We4%2FsMBDfMQw%3D&amp;reserved=0
> > > > >
> > > > >
> > > > > Broken firmware :
> > > > >
> > > > > Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| was included into
> > > > > linux-firmware repository by this pull request:
> > > > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;data=04%7C01%7Cprashanthkrishnan.ranganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=vr9a9ZEDsOPqNyafaEbAJ69CU9RgpXIvzpYMvhRv5GE%3D&amp;reserved=0
> > > > > <https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;data=04%7C01%7Cprashanthkrishnan.ranganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=vr9a9ZEDsOPqNyafaEbAJ69CU9RgpXIvzpYMvhRv5GE%3D&amp;reserved=0>
> > > > >
> > > > > And latest version |W16.68.10.p159| of |pcieusb8997_combo_v4.bin| by
> > > > > this pull request:
> > > > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;data=04%7C01%7Cprashanthkrishnan.ranganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=V2pZdm8AMwhdFUa%2FMyodXk8BW6hJEiTvguxqFBQgEpI%3D&amp;reserved=0
> > > > > <https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;data=04%7C01%7Cprashanthkrishnan.ranganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=V2pZdm8AMwhdFUa%2FMyodXk8BW6hJEiTvguxqFBQgEpI%3D&amp;reserved=0>
> > > > >
> > > > > Olders looks to works better.
> > > > >
> > > > > In quick tests, they allow more than 1 clients at a time !
> > > > >
> > > > > I am still testing the V16.68.1.p145 and report the results after some
> > > > > longer use...
> > > > >
> > > > > Hopes it will help...
> > > > > Regards,
> > > > > Gérald Kerma
> > > > > gandalf(at)gk2(dot)net
> > > >
