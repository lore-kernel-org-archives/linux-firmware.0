Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C159EC433B4
	for <linux-firmware@archiver.kernel.org>; Sat,  8 May 2021 11:29:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7461461350; Sat,  8 May 2021 11:29:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EFA96128E;
	Sat,  8 May 2021 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620473354;
	bh=gKZTqjiaLtXHr0YowntuiZu3TjJhOG7QyaHYL+925dg=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=FNUn8a1yWeDeFBKE/gOr19INPJ7EcLEq0mzFGhFCAm7qxYa7OALaun0VwKIDwdHNu
	 SAsFO++6WXKMHRBNRQoUltGLpCPpKyif9XxOw5gw0pLdGKZBfjBArXmSA6LGWLIyS3
	 lTnzDvpbjtFYxNPWyG86bRflLw4FQt6yKJgpETQAwSpvrSztoUcKSeFkJI7C1Ho37v
	 Zx1vx8ks49l3EK8BXMhE2APwZj7SklwpQK+fixoXD7z45s68EBvKdIGPmqcb/3uUkC
	 tQuSWCzlcD31E1KrwaDb1Kg6a3po4oBIDFaEk79iUUxWlBTTZVbR4behfkkayDBeAZ
	 AMG60hY54RxPQ==
Received: by pali.im (Postfix)
	id B17A376E; Sat,  8 May 2021 13:29:11 +0200 (CEST)
Date: Sat, 8 May 2021 13:29:11 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>,
	Ganapathi Bhat <ganapathi.bhat@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, l.majewski@majess.pl,
	Lukasz Majewski <lukma@denx.de>,
	Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
Subject: Re: wifi: 88W8801: Newest firmware for sd8801_uapsta.bin bug
Message-ID: <20210508112911.aigklhaw225ftwtj@pali>
References: <20210507151702.4848a5b3@jawa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507151702.4848a5b3@jawa>
User-Agent: NeoMutt/20180716

+ Sharvari and Ganapathi

To let you know about this mwifiex firmware issue. Could you look at it?

On Friday 07 May 2021 15:17:02 Lukasz Majewski wrote:
> Dear community,
> 
> I would like to report that the version: 14.68.36.p204 of
> sd8801_uapsta.bin binary (newest, SHA1:
> ecdfcf8e2ca15f5682ab94fd30ba29fb869b24a7) has the issue with getting
> channel info (HostCmd_CMD_STA_CONFIGURE command execution).
> 
> As a result the module seems to be stuck and no transmission is
> performed.
> 
> The issue is not present in 14.68.36.p146 verson of the firmware.
> 
> For reproduction one needs to execute:
> #! /bin/sh
> set -x
> wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
> sleep 3
> dhclient mlan0
> 
> exit 0
> 
> 
> 
> I'm using the Azurewave AW-NM191NF module (with 88W8801 SoC).
> 
> Best regards,
> 
> Lukasz Majewski
> 
> --
> 
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de
