Return-Path: <SRS0=rOY7=NO=dolcini.it=francesco@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4E7C27C53
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Jun 2024 06:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E29DDC32786; Wed, 12 Jun 2024 06:48:11 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27FD9C3277B
	for <linux-firmware@kernel.org>; Wed, 12 Jun 2024 06:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27FD9C3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id AE6B91FAA6;
	Wed, 12 Jun 2024 08:47:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1718174879;
	bh=xWQ2b0LzefD90xJtB1kvzHYc/zIlacWMUpz1BpNh0x0=;
	h=Received:From:To:Subject;
	b=gaWk0xZ5JoGm6TpSgyYnwfXZZcQqy0Xh/ds4o4GRJV1aO3hh+Gm9I+5ZzugtXAFYW
	 3RpE7M/0Y4Mf9+Nl+buiHqhHDr9Ep9AvWSQwfqwh0MSbNQk4lMdmc/kDUXlavmTlYI
	 ZDtagOoQNLI9nTiXpaKqYAWTCOfFxc0fHoWsTE+aDF1F8LUBUnOX8OLbaNmve+i/NT
	 eSwoCUqPvE1t0BD1El0lqkSBwsLV6NK0phVAxOJZghxKzUBE1nTWMFBoYRG1CV53gg
	 YjphZvDVvTn9iVJB52+dNiMecRwflwvy80MpOflfP23UbskaUUL5eSK2fBz5Mg3Wfq
	 S7mtTTh/w6pPw==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 56AAF7F93B; Wed, 12 Jun 2024 08:47:59 +0200 (CEST)
Date: Wed, 12 Jun 2024 08:47:59 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: David Lin <yu-hao.lin@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Andreas Kemnade <andreas@kemnade.info>,
	Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>,
	=?utf-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@protonmail.ch>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"briannorris@chromium.org" <briannorris@chromium.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"lukas@wunner.de" <lukas@wunner.de>
Subject: Re: [EXT] Re: mwifiex firmware mrvl/sd8987_uapsta.bin missing in the
 firmware git
Message-ID: <ZmlEny2W0nArOf1T@gaggiata.pivistrello.it>
References: <20240605160013.6bea8d4d@aktux>
 <_pNnwoI9WHlb2EY635KdIv6t_goU-ZYp9Vav31jkFOCf9fCE9EeKdyCea2m-L8pgfsKIQvODlnQLhQqmWSYip9e6FFZwaJHL5-u5rdOS_kY=@protonmail.ch>
 <20240605174709.5043af8f@akair>
 <20240606101839.GA76158@francesco-nb>
 <PA4PR04MB9638D1FD47BFBFDDB096C778D1C02@PA4PR04MB9638.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR04MB9638D1FD47BFBFDDB096C778D1C02@PA4PR04MB9638.eurprd04.prod.outlook.com>

Hello David,

On Wed, Jun 12, 2024 at 02:17:46AM +0000, David Lin wrote:
> > From: Francesco Dolcini <francesco@dolcini.it>
> > On Wed, Jun 05, 2024 at 05:47:09PM +0200, Andreas Kemnade wrote:
> > > But that is all legalese and I am not a lawyer... Best is of course
> > > something officially added from NXP. No idea if it can be done
> > > otherwise. How to make NXP add something?
> > 
> > Would it be possible for you to get these firmware files added to the official
> > linux-firmware git repo?
> > 
> > I am not using sd8987 myself, from what I read in the thread probably some
> > file name would need to be corrected (I would say in the mwifiex driver).
> 
> I am not responsible for firmware release.
> You can get updated firmware from https://github.com/nxp-imx/imx-firmware/.
Yes, I am aware of both, and most of the people in this thread is aware of the second.

I was wondering if you could facilitate within NXP having these firmware files
added to the linux firmware git repository, where they should be for various
reasons. To whom should I write such a request? Can you help in any way?

Francesco

