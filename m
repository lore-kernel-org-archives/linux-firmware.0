Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05086C433E0
	for <linux-firmware@archiver.kernel.org>; Mon,  3 Aug 2020 16:20:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E923A22B3F; Mon,  3 Aug 2020 16:20:46 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C55C120781;
	Mon,  3 Aug 2020 16:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596471646;
	bh=8jwLUZuvj9yjgO74667OWeFQe3f77c56kkmiC7CCtVM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=aC7tsakVWztDdR40cpPo1Kwc/pZffc5sHQhleGl5TzhQlaONBT0rI9aIv4LSse3qr
	 Ce+XGKeAMjo90dgVKyTX87i4YEWoVpxXg0+yiVz4FQGoIKblT/qOUXD/26103lpVgb
	 AEriAbTkIAQ3D9lLNBVT3Mc46MlLUw2uOCtro/J4=
Received: by mail-io1-f46.google.com with SMTP id l1so39103808ioh.5;
        Mon, 03 Aug 2020 09:20:47 -0700 (PDT)
X-Gm-Message-State: AOAM531EPzNC7geWEajKHKcfa0ppQ4gH7ZvNN2E8Nb+QnjfaKfZOZZbr
	+w100KoQe/y6sA3vLOrhz8vHgtp5Eq+FsNVdFiU=
X-Google-Smtp-Source: ABdhPJyGBbF+mfFDqotdiCLzOIFjWhBrO/wJvpQFr3hK2MqWyyH74D5ET6C+yx1LSnqZNXJNzsEcod7reafzd3z3NGY=
X-Received: by 2002:a6b:e419:: with SMTP id u25mr595137iog.159.1596471647268;
 Mon, 03 Aug 2020 09:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR04MB4366D4FA1242A8CAF7D2A34D8F4D0@VI1PR04MB4366.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB4366D4FA1242A8CAF7D2A34D8F4D0@VI1PR04MB4366.eurprd04.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 3 Aug 2020 12:20:36 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4ZjjssUwH_LY0JP2BX++4P_=+O+s-U3MAXt2yCK5LyUA@mail.gmail.com>
Message-ID: <CA+5PVA4ZjjssUwH_LY0JP2BX++4P_=+O+s-U3MAXt2yCK5LyUA@mail.gmail.com>
Subject: Re: pull-request mwifiex-firmware 2020-08-03
To: Ganapathi Bhat <ganapathi.bhat@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Rakesh Parmar <rakesh.parmar@nxp.com>, James Cao <james.cao@nxp.com>, 
	Cathy Luo <xiaohua.luo@nxp.com>, Zhiyuan Yang <yangzy@marvell.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Mon, Aug 3, 2020 at 8:30 AM Ganapathi Bhat <ganapathi.bhat@nxp.com> wrote:
>
> The following changes since commit c38b125a920a695d360b62e8b1f7fb1c4e1afd46:
>
>   linux-firmware: update NXP SD-8801 firmware image (2020-02-06 09:19:04 +0530)
>
> are available in the git repository at:
>
>   https://github.com/NXP/mwifiex-firmware.git master
>
> for you to fetch changes up to 2a0a062e79b5fe9007e57c0fcd285e683e22373e:
>
>   linux-firmware: update NXP SDSD-8997 firmware image (2020-08-03 06:51:36 +0530)
>
> ----------------------------------------------------------------
> Ganapathi Bhat (1):
>       linux-firmware: update NXP SDSD-8997 firmware image
>
>  mrvl/sdsd8997_combo_v4.bin | Bin 621896 -> 623240 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
