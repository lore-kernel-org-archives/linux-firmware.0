Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2590AC433EF
	for <linux-firmware@archiver.kernel.org>; Sun, 26 Sep 2021 10:43:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EEE55610A2; Sun, 26 Sep 2021 10:43:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4AB56108E;
	Sun, 26 Sep 2021 10:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632652988;
	bh=EZ6+HzzMrVMSLfFDPKTe/04zODwgGt7O+akW5I8ESOA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=N/+PqFK4Vl0BVQNQdl2l9Hy+V9nLA8MKgfe6XnWzAzg7TTR+aZ3SF3Ahe+QPA0OWS
	 p4T5IVnDVaz6twPAFGUSD+acNaH6ViqeKu7tbIZjadAd68t1IzlEy0ZhQvnxIsk1FD
	 ebQl+2GJ0e6HQj01PZ9TorszsIQdF+PnC+pjELW/rdUazV6L23mBqKy5QS5qPdxFS8
	 Ey0h7bH3a6VG0HQ1NFT0371KCwjFcHtG4g83hzCsifGL9gYniNfwirDkIiS0FkJdnB
	 t9k5gnVWCN387n4iqh9STP+MwbpUin7Sm5rWsIs7AyNmv4QhXgAMBgciSBmzvyl6tp
	 fjMaBtSTgTFBw==
Received: by pali.im (Postfix)
	id 787D060D; Sun, 26 Sep 2021 12:43:06 +0200 (CEST)
Date: Sun, 26 Sep 2021 12:43:06 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Josh Boyer <jwboyer@kernel.org>,
	Sharvari Harisangam <sharvari.harisangam@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
	=?utf-8?Q?G=C3=A9rald?= Kerma <gandalf@gk2.net>,
	Rakesh Parmar <rakesh.parmar@nxp.com>,
	Cathy Luo <xiaohua.luo@nxp.com>, zhiyuan.yang@nxp.com,
	prashanthkrishnan.ranganathan@nxp.com,
	Ganapathi Bhat <ganapathi017@gmail.com>, zheng.cao@nxp.com
Subject: Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
Message-ID: <20210926104306.xocctztsuspx6oji@pali>
References: <edeb34bc-7c85-7f1d-79e4-e3e21df86334@gk2.net>
 <fe75e8f2-6f12-052a-81ed-38122b87f1f6@gk2.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe75e8f2-6f12-052a-81ed-38122b87f1f6@gk2.net>
User-Agent: NeoMutt/20180716

Hello Josh, Sharvari and other from NXP!

On Saturday 25 September 2021 19:23:48 Gérald Kerma wrote:
> Correcting old marvell address to new nxp...
> 
> Le 25/09/2021 à 19:19, Gérald Kerma a écrit :
> > Héllo All,
> >
> > I made some few tests on EspressoBin-Ultra from GlobalScaleTechnologies,
> > because of problem with the WiFi.
> >
> > I have done some quick tests on all the firmware of PCIEUSB-8997 using
> > the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x
> >
> > Here is a summary of the tests :
> > - W16.68.10.p159 = KO
> > - W16.68.1.p195 = KO
> > - V16.68.1.p145 = OK
> > - 16.68.1.p140 = OK
> > - 16.68.1.p133 = OK
> > - 16.68.1.p97 = OK
> > - 16.68.1.p70 = KO

From this user test result can be seen that last two versions of
pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with
official mainline linux kernel driver mwifiex were not properly tested
internally in NXP and are causing serious issues which make 8997 card
basically unusable.

Sharvari and other NXP developers: Do you have some internal testing of
this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 8997
wifi chips? Or are you aware of this issue and do you have in NXP some
workaround for it (e.g. at driver level)? Could you please look at this
serious issue and try to debug firmware and release a new version, as
this is obvious fatal error in firmware itself?

Josh, how you in linux-firmware repository handle such, I must say,
"fatal issues"? Wait for vendor fixes or revert problematic commits? Or
something else?

Because when users starts upgrading linux-firmware packages in their
downstream distributions then basically wifi cards on this 8997 chips
with official mwifiex driver stops working.

> > REF (and all details of tests) :
> > https://github.com/NXP/mwifiex-firmware/issues/1
> >
> >
> > Broken firmware :
> >
> > Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| was included into
> > linux-firmware repository by this pull request:
> > https://lore.kernel.org/all/CA+5PVA5yQbjg3vaT7F8120B6ngLn7+sZC0OWt0KoUiQR9hS4FA@mail.gmail.com/
> > <https://lore.kernel.org/all/CA+5PVA5yQbjg3vaT7F8120B6ngLn7+sZC0OWt0KoUiQR9hS4FA@mail.gmail.com/>
> >
> > And latest version |W16.68.10.p159| of |pcieusb8997_combo_v4.bin| by
> > this pull request:
> > https://lore.kernel.org/linux-firmware/CA+5PVA5on7+CRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com/
> > <https://lore.kernel.org/linux-firmware/CA+5PVA5on7+CRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com/>
> >
> > Olders looks to works better.
> >
> > In quick tests, they allow more than 1 clients at a time !
> >
> > I am still testing the V16.68.1.p145 and report the results after some
> > longer use...
> >
> > Hopes it will help...
> > Regards,
> > Gérald Kerma
> > gandalf(at)gk2(dot)net
> 
