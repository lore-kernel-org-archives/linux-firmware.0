Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59309C433ED
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Apr 2021 14:03:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2746C60FD8; Mon, 19 Apr 2021 14:03:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 116ED6100A
	for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 14:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618841012;
	bh=LH1ThKWe5/ewlWrUdZseS1M1wPgfga56ILueMUruc5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tuHETpX0Rzpqlfpxo3BYadFy/MAYvivFznMEaIjMXjXfoUnf5pALfyCn5z1nJ/qxJ
	 lZRgg8IDoRCfgTLfKxeCYENTvYN1YXQrGSgkBzorUCSxtevGBHxj7OIJ+TjBeI9yit
	 c5vBS7REeJu2GPe4H+Tw1Ge1aDax+ax8D17OKi6KtG0oXEwvQaRuylF7D/EkwZMHYb
	 ncyQ+G30/HTch2opLqQ7P2FD61ypDP7on2KCp/s/fcHtmbkHqlR9qV5bC944SnSbt5
	 fjvLT/iCKohnfdxLSW9NbCS/MX7wVXRX/MJT5vGYflHtEe4VJvxfiIvvP8094nnHM1
	 1sFiFco7s4GWA==
Received: by mail-io1-f41.google.com with SMTP id b9so5210182iod.13
        for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 07:03:32 -0700 (PDT)
X-Gm-Message-State: AOAM531RxdAzH6T6EJEmar4JZWz7tvbfsQYZW10699Pmv2pI7Op2S/Hz
	kIues71P58zyM/s9T57dgXggY2dHqlnbzkKcYug=
X-Google-Smtp-Source: ABdhPJzLfGPhKHIPfafenLO04iNpd1zrowThXkIGSM/5bsLloR0HgZhV/d5jKd60y0yKyyNKfWVZoOIzXJjOxBAoAN8=
X-Received: by 2002:a6b:e20d:: with SMTP id z13mr8894176ioc.195.1618841011392;
 Mon, 19 Apr 2021 07:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <dc41d16e192c7e78cdf23463db8483e3@codeaurora.org>
In-Reply-To: <dc41d16e192c7e78cdf23463db8483e3@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Apr 2021 10:03:20 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7LA=45VE2QyChmh3xn__d=46mxiB9smnFsVFOm21XN-Q@mail.gmail.com>
Message-ID: <CA+5PVA7LA=45VE2QyChmh3xn__d=46mxiB9smnFsVFOm21XN-Q@mail.gmail.com>
Subject: Re: btusb firmware 20210419
To: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Sun, Apr 18, 2021 at 11:09 PM Rocky Liao <rjliao@codeaurora.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btusb bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit
> af1ca28f03287b0c60682ab37cc684c773de853f:
>
>     amdgpu: add arcturus firmware (2021-03-18 22:24:41 -0400)
>
> are available in the Git repository at:
>
>     https://github.com/rjliao-qca/qca-btfw.git
>
> for you to fetch changes up to c2968499147efaa071536c81c8c426d36325059a:
> ----------------------------------------------------------------
> Rocky Liao (1):
>          QCA: Update Bluetooth firmware for QCA6174 (2021-04-19 10:55:15
> +0800)
