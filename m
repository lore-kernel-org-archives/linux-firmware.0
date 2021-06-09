Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80F4C48BCF
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Jun 2021 12:07:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 908BC613B6; Wed,  9 Jun 2021 12:07:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A5DC613B1
	for <linux-firmware@kernel.org>; Wed,  9 Jun 2021 12:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623240454;
	bh=Q/1XGKZvYUENarwxCD+bEOnAiBv/cKoMhBbf5KBDaVc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=l35UpHxR2hgC7DdIt0aoB0lJ+4zrqyfUeyuprxILoPqfVaKZAEg3UbymFCzKnatPR
	 X+ldecPXD6SmgOfvdhIlcRNvyAlzPoZJagRA6EXx7WvcY2DJyUhIgDRKmgfvZQlcQg
	 zxcxHvBVwdXDuZM7fmpbIv94Y1+v/RvsTjBHGpDzeqhHdYQ7nq1EVCW1DOWZPI/C9Z
	 xJ/ZEkq4amAIKXw0pIlwuoBoUG+IiJv7BREFzY2Vg1qWf6gC++gcnYL029HuDjuOvF
	 94G+MqMpvC+SLtQcFJtmHXJiwr7b9EIfUTUvwSUZxtV/B5+otPC1XR5mePcjG4uq1F
	 hVoduI1soc9+Q==
Received: by mail-il1-f178.google.com with SMTP id j26so15328578ila.4
        for <linux-firmware@kernel.org>; Wed, 09 Jun 2021 05:07:34 -0700 (PDT)
X-Gm-Message-State: AOAM533VJGdGQM2csR4QNc0W2XI7xqx2IRZPpu6CCkCyDDy2yjRdgN5N
	lb6KLtzvmaBzkfdxEqkwhmikBZV2CgtumN6eM+U=
X-Google-Smtp-Source: ABdhPJwPMpOY66/NP4SBTndGOanW70BI5p5yu47udU6zhK0X9Rqn8UfRiYcm3vZqhQlF0TG292QYz9O8up1blFgg2ZU=
X-Received: by 2002:a6b:d103:: with SMTP id l3mr22465784iob.159.1623240453936;
 Wed, 09 Jun 2021 05:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <DB7PR04MB4538AF222036C6549FF460EBFC259@DB7PR04MB4538.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB4538AF222036C6549FF460EBFC259@DB7PR04MB4538.eurprd04.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Jun 2021 08:07:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4yQA6dH6hbAj4g_V77jL-U5dzLXt0U9O7qLskSgMJTPw@mail.gmail.com>
Message-ID: <CA+5PVA4yQA6dH6hbAj4g_V77jL-U5dzLXt0U9O7qLskSgMJTPw@mail.gmail.com>
Subject: Re: pull-request mwifiex-firmware 2021-05-25
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Cathy Luo <xiaohua.luo@nxp.com>, 
	Rakesh Parmar <rakesh.parmar@nxp.com>, Mayur Arakere <mayur.arakere@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 25, 2021 at 2:42 AM Sharvari Harisangam
<sharvari.harisangam@nxp.com> wrote:
>
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

I can't pull just this one commit.  Your tree is has 3 other commits
that seem unrelated that it's based on.  Can you fix your tree to be
based on the latest linux-firmware repo and submit a new pull request
please?

josh
