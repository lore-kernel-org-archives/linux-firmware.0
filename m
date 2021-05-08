Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39624C433B4
	for <linux-firmware@archiver.kernel.org>; Sat,  8 May 2021 11:37:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 10B96611ED; Sat,  8 May 2021 11:37:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0AC761264;
	Sat,  8 May 2021 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620473857;
	bh=al92buAxE6Gr+Sd6MzWqNTNF7HGeCrSgtJTSAhzLPWA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=BzzBjxnmc1zuh23siA27bgv/vnXBWTuT0d0Fe2nNebidEj+HxJSxmYD56tHLtLB9l
	 LxB6nALfpocaK5GgQZFXFAjofZJWotD32bMYgQykXtW4D3FsHystGkUp6tq4IeQBYh
	 icOk/KowZh1nlTOtCjJCndOCJha4NdV+LaSWCqHrfhP1UEZV0AhoN6/0taKy/WxUXA
	 HJvw4vzHy5vxsLQ3M0pA5U6a7QGZuxc5bClk7fTKLvMlb73Hg6geMitgDBpE6fBuwc
	 8uby4orOvWj2aWCz0/zlUZrdtVrSFQlqpys6G/YyxADx5prMBzYrNNeukq103fApfw
	 R4LR1Zj+ScSAw==
Received: by pali.im (Postfix)
	id 6382676E; Sat,  8 May 2021 13:37:34 +0200 (CEST)
Date: Sat, 8 May 2021 13:37:34 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, l.majewski@majess.pl,
	Sharvari Harisangam <sharvari.harisangam@nxp.com>,
	Ganapathi Bhat <ganapathi.bhat@nxp.com>,
	Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
Subject: Re: wifi: 88W8801: Newest firmware for sd8801_uapsta.bin bug
Message-ID: <20210508113734.4kdyt6z6xsjtrrq2@pali>
References: <20210507151702.4848a5b3@jawa>
 <20210508112911.aigklhaw225ftwtj@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210508112911.aigklhaw225ftwtj@pali>
User-Agent: NeoMutt/20180716

On Saturday 08 May 2021 13:29:11 Pali Rohár wrote:
> + Sharvari and Ganapathi
> 
> To let you know about this mwifiex firmware issue. Could you look at it?
> 
> On Friday 07 May 2021 15:17:02 Lukasz Majewski wrote:
> > Dear community,
> > 
> > I would like to report that the version: 14.68.36.p204 of
> > sd8801_uapsta.bin binary (newest, SHA1:
> > ecdfcf8e2ca15f5682ab94fd30ba29fb869b24a7) has the issue with getting
> > channel info (HostCmd_CMD_STA_CONFIGURE command execution).
> > 
> > As a result the module seems to be stuck and no transmission is
> > performed.
> > 
> > The issue is not present in 14.68.36.p146 verson of the firmware.

And FYI, NXP has newer version 14.76.36.p139 of this sd8801_uapsta.bin
firmware in their mwifiex-firmware github repository:

https://github.com/NXP/mwifiex-firmware/commit/c38b125a920a695d360b62e8b1f7fb1c4e1afd46

I hope that Sharvari or Ganapathi brings some light in this issue...

Lukasz, meanwhile could you try to check if this new firmware version
has this issue fixed?

> > For reproduction one needs to execute:
> > #! /bin/sh
> > set -x
> > wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
> > sleep 3
> > dhclient mlan0
> > 
> > exit 0
> > 
> > 
> > 
> > I'm using the Azurewave AW-NM191NF module (with 88W8801 SoC).
> > 
> > Best regards,
> > 
> > Lukasz Majewski
> > 
> > --
> > 
> > DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> > Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de
