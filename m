Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9D0C4708F
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Jun 2021 08:25:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D13E4613AB; Tue,  1 Jun 2021 08:25:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E34E613AD;
	Tue,  1 Jun 2021 08:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622535923;
	bh=3Cd/aCF+YOsLvU/Q7WcAaxcjOPoVb1rw4MOhnhOurEc=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Hogq/NaM7BKjdb5VnpFdh+ICDtbC8RunLBXUFs03Y6gWaDg0Ma8VuhmPOQSlfcLkS
	 l26H2EIZqNYNiYls07HCDcP54XcF1uPp4TRQ07LSo3pAX8g7nYc1BKe8sLd5dklJhk
	 /pKs/LpGqliUKpUGfvjc5O93nBDjM2KxKhQ4Sv7EZvDBgBNomEFL77xadWjXirQQw9
	 1QSh/XatB2MzgUhwyqfeP4jnqEB1Wd1vJH6An0MfKUiszukZ0m2HlNke6LZLQ9nXeZ
	 clGFBlT4WpV/1IiB3Zuh8d//34WT05v2v5FaXbojLL3FwoTjk+ikd/2blLuzRVHXq4
	 u0fOBemjyqK4A==
Received: by pali.im (Postfix)
	id 3BD4DBC7; Tue,  1 Jun 2021 10:25:21 +0200 (CEST)
Date: Tue, 1 Jun 2021 10:25:21 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Cathy Luo <xiaohua.luo@nxp.com>,
	Rakesh Parmar <rakesh.parmar@nxp.com>
Subject: Re: [EXT] Re: pull-request mwifiex-firmware 2021-05-25
Message-ID: <20210601082521.exvwms54siyhozst@pali>
References: <DB7PR04MB4538AF222036C6549FF460EBFC259@DB7PR04MB4538.eurprd04.prod.outlook.com>
 <20210527230526.2skr7pxcpxam3vga@pali>
 <DB7PR04MB4538C0AFF34981AEC26C54EFFC3E9@DB7PR04MB4538.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB7PR04MB4538C0AFF34981AEC26C54EFFC3E9@DB7PR04MB4538.eurprd04.prod.outlook.com>
User-Agent: NeoMutt/20180716

Perfect!

On Tuesday 01 June 2021 07:43:55 Sharvari Harisangam wrote:
> We are planning to update the firmware in phases.
> 
> Thanks,
> Sharvari
> 
> > -----Original Message-----
> > From: Pali Rohár <pali@kernel.org>
> > Sent: Friday, May 28, 2021 4:35 AM
> > To: Sharvari Harisangam <sharvari.harisangam@nxp.com>
> > Cc: linux-firmware@kernel.org; linux-wireless@vger.kernel.org; Cathy Luo
> > <xiaohua.luo@nxp.com>; Rakesh Parmar <rakesh.parmar@nxp.com>; Mayur
> > Arakere <mayur.arakere@nxp.com>
> > Subject: [EXT] Re: pull-request mwifiex-firmware 2021-05-25
> > 
> > Caution: EXT Email
> > 
> > On Tuesday 25 May 2021 06:42:47 Sharvari Harisangam wrote:
> > > The following changes since commit
> > db190ade4569c542cd257a9334f8f8956372f7b3:
> > >
> > >   linux-firmware: update NXP PCIE-USB-8997 firmware image (2021-05-19
> > 12:57:21 -0700)
> > >
> > > are available in the git repository at:
> > >
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.co
> > m%2FNXP%2Fmwifiex-
> > firmware.git&amp;data=04%7C01%7Csharvari.harisangam%40nxp.com%7C23c
> > cf252b3cf4bb04e9508d92163ed1b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7
> > C0%7C0%7C637577535329511768%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC
> > 4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a
> > mp;sdata=iUx3hV9qMv36jIz8wT22NbKoqbwNvylhmNT6ElRd9jg%3D&amp;reser
> > ved=0
> > >
> > > for you to fetch changes up to
> > 267febb1c43c119a7a65ddabc2c33c28a7803324:
> > >
> > >   linux-firmware: update Marvell 8897/8997 firmware images (2021-05-25
> > 05:09:25 -0700)
> > >
> > > ----------------------------------------------------------------
> > > Sharvari Harisangam (1):
> > >       linux-firmware: update Marvell 8897/8997 firmware images
> > >
> > >  mrvl/pcieusb8997_combo_v4.bin | Bin 634228 -> 638992 bytes
> > >  mrvl/sd8897_uapsta.bin        | Bin 701072 -> 717068 bytes
> > >  2 files changed, 0 insertions(+), 0 deletions(-)
> > 
> > Hello and thank you for this pull request!
> > 
> > Could you send update also for other 8997 firmware variant files?
> > 
> > sdsd8997_combo_v4.bin
> > usbusb8997_combo_v4.bin
> > pcieuart8997_combo_v4.bin
