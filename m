Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9827AC433ED
	for <linux-firmware@archiver.kernel.org>; Sat,  8 May 2021 11:20:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 645B961019; Sat,  8 May 2021 11:20:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A3776102A;
	Sat,  8 May 2021 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620472830;
	bh=oKtMmm97FDFFqMJ0V4wgNvrkUFRBez9yw+RqfMZbnTc=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=SVQYEGO1dJAnGIdceHm72OVp5VROFjQ1pYuwsFjM/u+ACmMQnAaFAvVNwhgYBLU+n
	 nQtUHtEoycMT6AYI2vhPZK6DzHJU7CmAEOAYjwNBd7h64X/myD89uMBsUNE2jhMhKT
	 DHH0B79rLYGTSZMVC9+rgLliJx5V/32gA3M4jdGg/Svnho21y2At5xdVliZiIBtSJ4
	 8UJiQ8PxQ/FY1FgwslNkLAMQM3VPkqyp//k8z6QIdjXOyYUwf42VW8+h0GLQ2XSNmX
	 KvNewNi32SslvRlm0IEvAdRDWrxvAoDC7BQR8ao6DlysP+C1qRJ8fZy4G8hHnX5FRL
	 RRJlFcKw3MsGg==
Received: by pali.im (Postfix)
	id 6F59076E; Sat,  8 May 2021 13:20:26 +0200 (CEST)
Date: Sat, 8 May 2021 13:20:26 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-firmware@kernel.org,
	Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>,
	Ganapathi Bhat <ganapathi.bhat@nxp.com>
Subject: Re: New firmware 16.68.10.p56 for mwifiex 88W8997 SDIO wifi chip
Message-ID: <20210508112026.zfeoa7t3qxxrvt6j@pali>
References: <20201113154727.ndk5pcijd2qdvrrf@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113154727.ndk5pcijd2qdvrrf@pali>
User-Agent: NeoMutt/20180716

Hello Sharvari!

Could you please update firmware for 88W8997 wifi chip in linux-firmware
repository? On NXP portal is for a longer time newer version.

On Friday 13 November 2020 16:47:27 Pali Rohár wrote:
> Hello Ganapathi,
> 
> there is a new firmware version 16.68.10.p56 for 88W8997 SDIO wifi chip.
> Current version of firmware file sdsd8997_combo_v4.bin for this chip in
> linux-firmware repository is 16.68.1.p197:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/mrvl/sdsd8997_combo_v4.bin
> 
> Ganapathi, could you please send an update for this firmware file?
