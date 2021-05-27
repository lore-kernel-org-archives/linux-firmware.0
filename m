Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B80C47089
	for <linux-firmware@archiver.kernel.org>; Thu, 27 May 2021 23:05:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F3BE0613D8; Thu, 27 May 2021 23:05:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFA0F613C9;
	Thu, 27 May 2021 23:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622156728;
	bh=qcq/DK0ClzzNFVJPnwzMj/8Flqi3htzfTqhehOUBfnk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=K+TsKldBiCTwtciXg02j2ts0q0BKiGRldoX2BHMXIXz6xncTF9mDXXHnnM9iU2HS9
	 ydeWLiu3uhAhKCpytgEJ5LbCWUHk17vqouwRNkkaCZi/sjQRwoZWNMqhZBMwc4FeB1
	 NqU2KlOwxkC3768KiVM++Rd7ywEG/KOwc/LcWNAR/Ei2aC6jFVGruoAWXX4X7iBzpH
	 y0wOqMWyB5fmNWYnJH6LS96XaEtCRh8yi8hgDi4MUgkxrEAXWus+EI7UzauHmjo71j
	 Fos31t1uWCZQV6CpHPnL7ryjBYJSuCgOvQ1qpje7EN0z5Kg9RtNR5yMXwztUQJn0P6
	 8IsRFJ8Uwl/7A==
Received: by pali.im (Postfix)
	id 59302894; Fri, 28 May 2021 01:05:26 +0200 (CEST)
Date: Fri, 28 May 2021 01:05:26 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Cathy Luo <xiaohua.luo@nxp.com>,
	Rakesh Parmar <rakesh.parmar@nxp.com>,
	Mayur Arakere <mayur.arakere@nxp.com>
Subject: Re: pull-request mwifiex-firmware 2021-05-25
Message-ID: <20210527230526.2skr7pxcpxam3vga@pali>
References: <DB7PR04MB4538AF222036C6549FF460EBFC259@DB7PR04MB4538.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR04MB4538AF222036C6549FF460EBFC259@DB7PR04MB4538.eurprd04.prod.outlook.com>
User-Agent: NeoMutt/20180716

On Tuesday 25 May 2021 06:42:47 Sharvari Harisangam wrote:
> The following changes since commit db190ade4569c542cd257a9334f8f8956372f7b3:
> 
>   linux-firmware: update NXP PCIE-USB-8997 firmware image (2021-05-19 12:57:21 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/NXP/mwifiex-firmware.git
> 
> for you to fetch changes up to 267febb1c43c119a7a65ddabc2c33c28a7803324:
> 
>   linux-firmware: update Marvell 8897/8997 firmware images (2021-05-25 05:09:25 -0700)
> 
> ----------------------------------------------------------------
> Sharvari Harisangam (1):
>       linux-firmware: update Marvell 8897/8997 firmware images
> 
>  mrvl/pcieusb8997_combo_v4.bin | Bin 634228 -> 638992 bytes
>  mrvl/sd8897_uapsta.bin        | Bin 701072 -> 717068 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)

Hello and thank you for this pull request!

Could you send update also for other 8997 firmware variant files?

sdsd8997_combo_v4.bin
usbusb8997_combo_v4.bin
pcieuart8997_combo_v4.bin
