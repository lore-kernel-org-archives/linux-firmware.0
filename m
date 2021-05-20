Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A88EC433B4
	for <linux-firmware@archiver.kernel.org>; Thu, 20 May 2021 23:41:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 18BF760FE5; Thu, 20 May 2021 23:41:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7585611BD;
	Thu, 20 May 2021 23:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621554109;
	bh=ij7hF7nHXyPrUR2x/nV1+rcA8bDOR4UcJ8kFv9dnuMU=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=HN72ycl3w7JOWbob2FbjGP+kdkntsKvmMaNfQush44OpTBY9futHUkhGhGmPdGEoE
	 jkof4VptjuH7rrDb6brOjepnv2laVf43SL72b5C0Iz7xr7WbXP5rzhof1jktHkrVuR
	 uzbo93RrbKyLLGmkj1QreHWiiZmL/XuoiMT6hS3dGQl4kGXdxsKK9McVHvydFuxxDa
	 1aEWepD5rJp/6uIHyGfCsqgLY5cZUn3c89CoNDFQ02hkBsMobV+BKzb83Q17y/TUGZ
	 Nqo7d23PBT51RqJno/rurQFQrlsHUE9imlJx+rHXTiRAzfBWYLbFH1RGyUZHi5seQy
	 PHqDi9tUUVHgg==
Received: by pali.im (Postfix)
	id ABA789D1; Fri, 21 May 2021 01:41:46 +0200 (CEST)
Date: Fri, 21 May 2021 01:41:46 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>,
	Brian Norris <briannorris@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Cathy Luo <xiaohua.luo@nxp.com>,
	Rakesh Parmar <rakesh.parmar@nxp.com>,
	Mayur Arakere <mayur.arakere@nxp.com>
Subject: Re: pull-request mwifiex-firmware 2021-05-19
Message-ID: <20210520234146.vmylm53hw7pax32t@pali>
References: <DB7PR04MB45387F399B5963BD92C57CA3FC2B9@DB7PR04MB4538.eurprd04.prod.outlook.com>
 <20210519182344.cLtegmJLnF6WKlyVBnC-eLey3yEOgyPu_nRJ_hT3WXk@z>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519182344.cLtegmJLnF6WKlyVBnC-eLey3yEOgyPu_nRJ_hT3WXk@z>
User-Agent: NeoMutt/20180716

On Wednesday 19 May 2021 11:23:44 Brian Norris wrote:
> On Wed, May 19, 2021 at 7:45 AM Sharvari Harisangam
> <sharvari.harisangam@nxp.com> wrote:
> >
> > The following changes since commit 2a0a062e79b5fe9007e57c0fcd285e683e22373e:
> >
> >   linux-firmware: update NXP SDSD-8997 firmware image (2020-08-03 06:51:36 +0530)
> >
> > are available in the git repository at:
> >
> >   https://github.com/NXP/mwifiex-firmware.git
> >
> > for you to fetch changes up to db190ade4569c542cd257a9334f8f8956372f7b3:
> >
> >   linux-firmware: update NXP PCIE-USB-8997 firmware image (2021-05-19 12:57:21 -0700)
> >
> > ----------------------------------------------------------------
> > Sharvari Harisangam (1):
> >       linux-firmware: update NXP PCIE-USB-8997 firmware image
> >
> >  WHENCE                       |   2 ++
> >  nxp/pcieusb8997_combo_v4.bin | Bin 0 -> 638992 bytes
> >  2 files changed, 2 insertions(+)
> >  create mode 100644 nxp/pcieusb8997_combo_v4.bin
> 
> I appreciate that NXP now owns what was formerly known as Marvell
> WiFi, but the driver still only recognizes "mrvl/" naming, not "nxp/".
> Did you actually test that this does anything useful? Or are you
> planning on submitting driver patches to use the new path? That seems
> like unnecessary churn to me, and you should just use the old path.
> 
> Brian

Hello! For backward compatibility you really need to store this firmware
file under name "mrvl/pcieusb8997_combo_v4.bin". Moreover this firmware
filename already exists in linux-firmware tree, so you need to replace
old version by a new one. Otherwise kernel driver would use old version.

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/mrvl
