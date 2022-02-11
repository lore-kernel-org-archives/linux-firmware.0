Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F2FC433F5
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Feb 2022 11:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12CE2C340EE; Fri, 11 Feb 2022 11:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969EAC340E9;
	Fri, 11 Feb 2022 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644578897;
	bh=MuWqLsPBer6OyRUO8+JpPPhKXdXHwAHR6VB2cgGSCtY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=BpbG/rF0iREgF+0tZfCHRUlMnhGSYpCgO0f4hYkI9H+Nm9LJFsqYn8YqrFecTY+S5
	 Ne5gxc93F0Hw76i3mn+5fwB7+k6wOHPgTtDhzi+9CrjI5ywQ4CaLie5HmoJ8q4dxzx
	 Xve4KL7eFWHtF/SXfxzKH3KIdoUewUDiA4CF8PWaZBch5z1RqHq9suMdu63q3stTCs
	 Y9lrsc+0hl8y8yrqIIB1YI8SA/fMHNfR9FwYpfma0cwLOmYq1KrTBlmWyZNwJA8RnP
	 t5/lbJ81rXo+PmXXwzKLjdT1IasXyEPMwERDdPo1T1xaEDCgBE20a3fovWAko2jgTi
	 v1YjghM8n64Pw==
Received: by pali.im (Postfix)
	id D8A2E6E9; Fri, 11 Feb 2022 12:28:13 +0100 (CET)
Date: Fri, 11 Feb 2022 12:28:13 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: James Cao <james.cao@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: =?utf-8?Q?G=C3=A9rald?= Kerma <gandalf@gk2.net>,
	Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>,
	Sharvari Harisangam <sharvari.harisangam@nxp.com>,
	Rakesh Parmar <rakesh.parmar@nxp.com>,
	Cathy Luo <xiaohua.luo@nxp.com>,
	Linux Firmware <linux-firmware@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	Josh Boyer <jwboyer@kernel.org>
Subject: Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
Message-ID: <20220211112813.qhgxmtq6onfq6jah@pali>
References: <fe75e8f2-6f12-052a-81ed-38122b87f1f6@gk2.net>
 <20210926104306.xocctztsuspx6oji@pali>
 <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
 <20220114170051.sx2p6m2ihrv3ojzt@pali>
 <AS8PR04MB9192076DB3CB59EC049B7B9CFB549@AS8PR04MB9192.eurprd04.prod.outlook.com>
 <20220120193041.fmmmd77ingjvyqe4@pali>
 <AS8PR04MB8419C8377C9458ADA340AC24E0209@AS8PR04MB8419.eurprd04.prod.outlook.com>
 <20220127121514.daptjsxkgrt5zlov@pali>
 <849ea3f2-a6c1-8814-3713-4d8b14db5029@gk2.net>
 <AS8PR04MB8419A1473C69E9869471EC17E0219@AS8PR04MB8419.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8419A1473C69E9869471EC17E0219@AS8PR04MB8419.eurprd04.prod.outlook.com>
User-Agent: NeoMutt/20180716

Hello James!

The issue which Gérald observing is that firmware version W16.68.1.p195
or new is unable to start access point on PCIe-USB 8997.

As Gérald wrote in that NXP ticket on github, error message is
following:

[56066.999853] mwifiex_pcie 0000:01:00.0: CMD_RESP: cmd 0xb1 error, result=0x1
[56067.007152] mwifiex_pcie 0000:01:00.0: Failed to start the BSS
[56067.013195] mwifiex_pcie 0000:01:00.0: Failed to start AP

Older firmware versions (e.g. V16.68.1.p145) are working fine.

James, do you need some more information?

Pali

On Friday 28 January 2022 00:58:59 James Cao wrote:
> Hi Gérald, Pali,
> 
> For NXP Wi-Fi/BT FW, we only have binary release, which is under proprietary license.
> 
> Regarding the issue, which kind of adapter (PCIe-USB or PCIe-UART) did you use? Suppose PCIe-USB/PCIe-UART FW may not work on PCIe-UART/PCIe-USB board. What's the failure symptom?
> 
> Thanks,
> James
> 
> ________________________________
> From: Gérald Kerma <gandalf@gk2.net>
> Sent: Thursday, January 27, 2022 6:50 AM
> To: Pali Rohár <pali@kernel.org>; James Cao <james.cao@nxp.com>
> Cc: Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>; Sharvari Harisangam <sharvari.harisangam@nxp.com>; Rakesh Parmar <rakesh.parmar@nxp.com>; Cathy Luo <xiaohua.luo@nxp.com>; Linux Firmware <linux-firmware@kernel.org>; Linux Wireless <linux-wireless@vger.kernel.org>; Josh Boyer <jwboyer@kernel.org>
> Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
> 
> Caution: EXT Email
> 
> Héllo James,
> 
> As Pali wrote, if fimrware requires signing NDA, I can propose my own
> collaboration to NXP !
> 
> I am still okay to help, in anyway, with testing or more...
> Please, feel free to contact me.
> 
> Gérald Kerma
> CyberMind.FR
> gandalf(at)gk2(dot)net
> 00.33.651.27.66.88
> 
> PS: I add my answer which was lost for some of the CC... (sorry)...
> 
> 
> Le 27/01/2022 à 13:15, Pali Rohár a écrit :
> > Hello James!
> >
> > Thank you for reply, but this is something which we did not want to hear :-(
> >
> > There is an issue in the latest pcieuart8997_combo_v4.bin firmware file
> > which NXP sent to linux-firmware repository and it is really needed to
> > fix this issue. It was sent by NXP, so it is expected that NXP do it.
> > And because it is binary-only file, people outside of NXP cannot do it.
> >
> > Would you be able to look at this firmware issue as the last thing?
> >
> > Or as Gérald wrote, could NXP provide source code of that firmware? So
> > people outside of NXP could look at it? If firmware requires signing NDA
> > (either individually or via company), then some professional skilled
> > kernel developers can do it.
> Le 27/01/2022 à 02:13, Gérald Kerma a écrit :
>  > Héllo James,
>  >
>  > Was it only ever supported ?
>  >
>  > May be NXP can free and share the firmware source to the community,
> and let anyone who care try to debug it ?
>  >
>  > As far as my tests shown, the mwifiex driver never has work
> correctly, and none version is sufficiently stable to be state as working.
>  >
>  > Please, NXP, take cares of your end clients !
>  > Be simple, be smart, be respectuous, give us the source…
>  >
>  > Thanks in advance,
>  > Gérald Kerma
>  >
>  > [%]<\@~{
> > On Wednesday 26 January 2022 23:28:48 James Cao wrote:
> >> Hi Pali,
> >>
> >> NXP doesn't have a plan to support mwifiex driver anymore. How should we handle this kind of retired project in upstream?
> >>
> >> Thanks,
> >> James
> >>
> >> ________________________________
> >> From: Pali Rohár <pali@kernel.org>
> >> Sent: Thursday, January 20, 2022 11:30 AM
> >> To: Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>
> >> Cc: Sharvari Harisangam <sharvari.harisangam@nxp.com>; Rakesh Parmar <rakesh.parmar@nxp.com>; Cathy Luo <xiaohua.luo@nxp.com>; James Cao <james.cao@nxp.com>; Linux Firmware <linux-firmware@kernel.org>; Linux Wireless <linux-wireless@vger.kernel.org>; Gérald Kerma <gandalf@gk2.net>; Ganapathi Bhat <ganapathi017@gmail.com>; Josh Boyer <jwboyer@kernel.org>
> >> Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
> >>
> >> Caution: EXT Email
> >>
> >> Hello Prashanth!
> >>
> >> Thank you for reply. Did you have a time to check this issue?
> >>
> >> Gérald did a great testing which shows that version W16.68.1.p195 and
> >> higher of pcieuart8997_combo_v4.bin firmware does not work.
> >>
> >> On Friday 14 January 2022 17:11:18 Prashanth Ranganathan wrote:
> >>> Hi Pali,
> >>> Please allow me to check this and respond ASAP.
> >>> Best,
> >>> Prashanth
> >>> ________________________________
> >>> From: Pali Rohár <pali@kernel.org>
> >>> Sent: Friday, January 14, 2022 9:00 AM
> >>> To: Sharvari Harisangam <sharvari.harisangam@nxp.com>; Rakesh Parmar <rakesh.parmar@nxp.com>; Cathy Luo <xiaohua.luo@nxp.com>; Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>; James Cao <james.cao@nxp.com>
> >>> Cc: Linux Firmware <linux-firmware@kernel.org>; Linux Wireless <linux-wireless@vger.kernel.org>; Gérald Kerma <gandalf@gk2.net>; Ganapathi Bhat <ganapathi017@gmail.com>; Josh Boyer <jwboyer@kernel.org>
> >>> Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
> >>>
> >>> Caution: EXT Email
> >>>
> >>> NXP people: Sharvari, Rakesh, Cathy, Zheng: could you please look at
> >>> this issue? It is really serous!
> >>>
> >>> On Monday 27 September 2021 09:47:23 Josh Boyer wrote:
> >>>> On Sun, Sep 26, 2021 at 6:43 AM Pali Rohár <pali@kernel.org> wrote:
> >>>>> Hello Josh, Sharvari and other from NXP!
> >>>>>
> >>>>> On Saturday 25 September 2021 19:23:48 Gérald Kerma wrote:
> >>>>>> Correcting old marvell address to new nxp...
> >>>>>>
> >>>>>> Le 25/09/2021 à 19:19, Gérald Kerma a écrit :
> >>>>>>> Héllo All,
> >>>>>>>
> >>>>>>> I made some few tests on EspressoBin-Ultra from GlobalScaleTechnologies,
> >>>>>>> because of problem with the WiFi.
> >>>>>>>
> >>>>>>> I have done some quick tests on all the firmware of PCIEUSB-8997 using
> >>>>>>> the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x
> >>>>>>>
> >>>>>>> Here is a summary of the tests :
> >>>>>>> - W16.68.10.p159 = KO
> >>>>>>> - W16.68.1.p195 = KO
> >>>>>>> - V16.68.1.p145 = OK
> >>>>>>> - 16.68.1.p140 = OK
> >>>>>>> - 16.68.1.p133 = OK
> >>>>>>> - 16.68.1.p97 = OK
> >>>>>>> - 16.68.1.p70 = KO
> >>>>>  From this user test result can be seen that last two versions of
> >>>>> pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with
> >>>>> official mainline linux kernel driver mwifiex were not properly tested
> >>>>> internally in NXP and are causing serious issues which make 8997 card
> >>>>> basically unusable.
> >>>>>
> >>>>> Sharvari and other NXP developers: Do you have some internal testing of
> >>>>> this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 8997
> >>>>> wifi chips? Or are you aware of this issue and do you have in NXP some
> >>>>> workaround for it (e.g. at driver level)? Could you please look at this
> >>>>> serious issue and try to debug firmware and release a new version, as
> >>>>> this is obvious fatal error in firmware itself?
> >>>>>
> >>>>> Josh, how you in linux-firmware repository handle such, I must say,
> >>>>> "fatal issues"? Wait for vendor fixes or revert problematic commits? Or
> >>>>> something else?
> >>>> We can revert if we need to, but I think it's not quite that simple.
> >>>>
> >>>>> Because when users starts upgrading linux-firmware packages in their
> >>>>> downstream distributions then basically wifi cards on this 8997 chips
> >>>>> with official mwifiex driver stops working.
> >>>> The first broken version was committed in Feb of 2019.  That's
> >>>> approaching 3 years ago.  Given that this is binary firmware, I have
> >>>> no idea what else may or may not be included in the updates in the
> >>>> meantime.
> >>>>
> >>>> josh
> >>> Josh, as Gérald wrote, current binary in linux-firmware repository is
> >>> unusable. And there is no reply from NXP for 3 months.
> >>>
> >>> You are right that nobody knows what is in firmware binary, but working
> >>> binary is at least usable than non-working binary.
> >>>
> >>> So I would really suggest to start reverting non-working firmware files
> >>> if NXP does not respond in few days.
> >>>
> >>> Gérald, what is your opinion? Do you see other way how to make mainline
> >>> linux driver work (again)?
> >>>
> >>>>>>> REF (and all details of tests) :
> >>>>>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FNXP%2Fmwifiex-firmware%2Fissues%2F1&amp;data=04%7C01%7Cjames.cao%40nxp.com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=jeHkO95c2IlIftGxZGaTDOj5em2dU%2FCiIcSPM4NitUk%3D&amp;reserved=0
> >>>>>>>
> >>>>>>>
> >>>>>>> Broken firmware :
> >>>>>>>
> >>>>>>> Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| was included into
> >>>>>>> linux-firmware repository by this pull request:
> >>>>>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;data=04%7C01%7Cjames.cao%40nxp.com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=tTxWzBFlt0tg1sRwXSapYPdG61BME5f%2B3K7dwSUHRZo%3D&amp;reserved=0
> >>>>>>> <https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;data=04%7C01%7Cjames.cao%40nxp.com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=tTxWzBFlt0tg1sRwXSapYPdG61BME5f%2B3K7dwSUHRZo%3D&amp;reserved=0>
> >>>>>>>
> >>>>>>> And latest version |W16.68.10.p159| of |pcieusb8997_combo_v4.bin| by
> >>>>>>> this pull request:
> >>>>>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;data=04%7C01%7Cjames.cao%40nxp.com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=LNx2xSp39whINLxyrkgoyNeb53YjX6s1QjyonB5iJUE%3D&amp;reserved=0
> >>>>>>> <https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;data=04%7C01%7Cjames.cao%40nxp.com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=LNx2xSp39whINLxyrkgoyNeb53YjX6s1QjyonB5iJUE%3D&amp;reserved=0>
> >>>>>>>
> >>>>>>> Olders looks to works better.
> >>>>>>>
> >>>>>>> In quick tests, they allow more than 1 clients at a time !
> >>>>>>>
> >>>>>>> I am still testing the V16.68.1.p145 and report the results after some
> >>>>>>> longer use...
> >>>>>>>
> >>>>>>> Hopes it will help...
> >>>>>>> Regards,
> >>>>>>> Gérald Kerma
> >>>>>>> gandalf(at)gk2(dot)net
> 
