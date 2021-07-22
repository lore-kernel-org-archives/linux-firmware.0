Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469CBC4338F
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Jul 2021 23:00:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1D38760EB1; Thu, 22 Jul 2021 23:00:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE25C60EB4;
	Thu, 22 Jul 2021 23:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626994842;
	bh=wgcPROMXdPLJGKmL6ZYYx0nPDg40j0eEeR0sDl80mcI=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=XeQykKpqGlcoFa41JDdhAhwEYNGqHZbnNklC+YdFFbxPzbbgwLiMcCVRFtS0tPe/5
	 B5IXPI50JikhVHgY+26KYerIqaH7LX1KERSBQjS+8SWKIFFrPyZ1HOVq1ALANv0iBy
	 umZ1Q44YUl4rgT3lOYOGBY4Nd6vznD/lZwu9GLxqvdybWeVqCZYQRtOhvea8PGlV0m
	 7YsghHokNJDHmZDkhP0/jdyU3VV+z90G6Pwn9bdPFrq1byq/OfutfsxJMtI8QKCN9t
	 jBhWEcTKfYZTIrFl2mFmL9Q53N9UJdUtLOfQgKZQKOuFixSW6TNwag2Qskj0366sRh
	 pFm9e195XBbdA==
Received: by pali.im (Postfix)
	id 8B5A2805; Fri, 23 Jul 2021 01:00:39 +0200 (CEST)
Date: Fri, 23 Jul 2021 01:00:39 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Rakesh Parmar <rakesh.parmar@nxp.com>,
	Cathy Luo <xiaohua.luo@nxp.com>
Subject: Re: pull-request mwifiex-firmware 2021-07-05
Message-ID: <20210722230039.ykpenycigvj6jjy4@pali>
References: <DB7PR04MB453855B0D6C41923BCB0922EFC1C9@DB7PR04MB4538.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR04MB453855B0D6C41923BCB0922EFC1C9@DB7PR04MB4538.eurprd04.prod.outlook.com>
User-Agent: NeoMutt/20180716

On Monday 05 July 2021 07:40:50 Sharvari Harisangam wrote:
> The following changes since commit 2a0a062e79b5fe9007e57c0fcd285e683e22373e:
> 
>   linux-firmware: update NXP SDSD-8997 firmware image (2020-08-03 06:51:36 +0530)
> 
> are available in the git repository at:
> 
>   https://github.com/NXP/mwifiex-firmware.git
> 
> for you to fetch changes up to 312ca028298317d2babb54080c056408cdb9448b:
> 
>   linux-firmware: update NXP 8897/8997 firmware images (2021-07-05 05:42:09 -0700)
> 
> ----------------------------------------------------------------
> Sharvari Harisangam (1):
>       linux-firmware: update NXP 8897/8997 firmware images
> 
>  mrvl/pcieusb8997_combo_v4.bin | Bin 634228 -> 638992 bytes
>  mrvl/sd8897_uapsta.bin        | Bin 701072 -> 717068 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
> ~

Hello Sharvari! Could you send pull request also with update of SDIO
firmware for 8997 chip? As this pull request contains only PCIe firmware
for 8997 chip.
