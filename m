Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A25AC07E95
	for <linux-firmware@archiver.kernel.org>; Sun,  4 Jul 2021 23:57:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DCEBB613D1; Sun,  4 Jul 2021 23:57:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9CDE6128D;
	Sun,  4 Jul 2021 23:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625443069;
	bh=9SPYR1kYQQLxvX4X5oPgBIysF+KDPlRDsjbzF+hXIHo=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=k/v6pD9MjpQ97pj2b/Zb/RPDetCh2Z4QEBvQYmZzLQ8IOuJbmJS058O3Qkr0NIV/v
	 /0UQu2vqbUbtM/M7138gs5ZNn3y+U0RtIoE7VUtoDplcgZ8Y8LCRa7oEUDEsr+yBul
	 kGg2P/jz+lGVbJ764MhDDyYL8LwJdltZGVnW/7llAPr/yFjk5c4gRKU/PVePBD1D88
	 87mHnf+320q+kUJxqFaotbZqAv/4ULcG6OgELbt2PgWOvllSYS3hddpeAQjTeLwFr6
	 K+1vY+Mj9mWiHFxqj9x4z82beXI/81xPbWqX5onZpPqDPh/3WEwg5dbgGclh51ulLY
	 Dx+DRH9oAcRfQ==
Received: by pali.im (Postfix)
	id 515249CA; Mon,  5 Jul 2021 01:57:47 +0200 (CEST)
Date: Mon, 5 Jul 2021 01:57:47 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>,
	Cathy Luo <xiaohua.luo@nxp.com>,
	Rakesh Parmar <rakesh.parmar@nxp.com>,
	Mayur Arakere <mayur.arakere@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: pull-request mwifiex-firmware 2021-05-25
Message-ID: <20210704235747.kjkrtqm5yvqgdvxy@pali>
References: <DB7PR04MB4538AF222036C6549FF460EBFC259@DB7PR04MB4538.eurprd04.prod.outlook.com>
 <CA+5PVA4yQA6dH6hbAj4g_V77jL-U5dzLXt0U9O7qLskSgMJTPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+5PVA4yQA6dH6hbAj4g_V77jL-U5dzLXt0U9O7qLskSgMJTPw@mail.gmail.com>
User-Agent: NeoMutt/20180716

Hello Sharvari!

On Wednesday 09 June 2021 08:07:00 Josh Boyer wrote:
> On Tue, May 25, 2021 at 2:42 AM Sharvari Harisangam
> <sharvari.harisangam@nxp.com> wrote:
> >
> > The following changes since commit db190ade4569c542cd257a9334f8f8956372f7b3:
> >
> >   linux-firmware: update NXP PCIE-USB-8997 firmware image (2021-05-19 12:57:21 -0700)
> >
> > are available in the git repository at:
> >
> >   https://github.com/NXP/mwifiex-firmware.git
> >
> > for you to fetch changes up to 267febb1c43c119a7a65ddabc2c33c28a7803324:
> >
> >   linux-firmware: update Marvell 8897/8997 firmware images (2021-05-25 05:09:25 -0700)
> >
> > ----------------------------------------------------------------
> > Sharvari Harisangam (1):
> >       linux-firmware: update Marvell 8897/8997 firmware images
> >
> >  mrvl/pcieusb8997_combo_v4.bin | Bin 634228 -> 638992 bytes
> >  mrvl/sd8897_uapsta.bin        | Bin 701072 -> 717068 bytes
> >  2 files changed, 0 insertions(+), 0 deletions(-)
> 
> I can't pull just this one commit.  Your tree is has 3 other commits
> that seem unrelated that it's based on.  Can you fix your tree to be
> based on the latest linux-firmware repo and submit a new pull request
> please?
> 
> josh

Could you try to fix your git tree, so updated firmware files can be
merged into linux-firmware git repository? Lot of people are waiting for
updated firmware files. If needed, I can help with updating / rebasing
git tree to make repository ready for merge.
