Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D122C48BD1
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Jun 2021 12:00:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E915F61364; Wed,  9 Jun 2021 12:00:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2318613B1
	for <linux-firmware@kernel.org>; Wed,  9 Jun 2021 12:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623240046;
	bh=tOXXALkRW1wNEpyQppDgmNYmD5jDIFLg/Dh8VDjVUs4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PHPFC/MQsFhmqB43FGTNWTOcyNKLj1UQO5fB0xiMqz8BkO7eXiagQQPoT/az1IA8Z
	 dfVXYXGKv3Piy7SC8s/PtgWxqPHmCLTTLRX25dGjIpac0ujW/ovVmrwl6aghb2RLAh
	 N2HvIROgcefcNJLqvrcqeqdLCUMR9UB6Zi/gayKQCuWjCLJVp1IKEoHfHc6+w7P0xw
	 hdZlWe6OXSLM39ILNau3o4eBiokx9EGMOMcY1LUNVDC4vO/RtDUpCMVjGve78al5Qd
	 4UPo34gn8omMqvRTIhU62HREUPoWOWK7yhyaOAfwsOrIQS/Uw+A1r5yIO8wbAJBUrm
	 tzmydqUw5mSgA==
Received: by mail-il1-f182.google.com with SMTP id b9so25414386ilr.2
        for <linux-firmware@kernel.org>; Wed, 09 Jun 2021 05:00:46 -0700 (PDT)
X-Gm-Message-State: AOAM533t+9lp5kKHrjaS2s4AI81YESPaXyK1adoceBaEmpQvx+xIpd4o
	PFI1rRbXoTakQs+lWZMVPIeEyFtGogJbsgvnmVw=
X-Google-Smtp-Source: ABdhPJw/STu4UnB7r3OumbzoQvq5DS/6wvJdpkoKeD7H2pGl1WMS/DklhgbzAi8+cAqkLqWp/XUA86yg2o7A9FkEjwg=
X-Received: by 2002:a5d:8190:: with SMTP id u16mr23382658ion.158.1623240046315;
 Wed, 09 Jun 2021 05:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <a7032e79a0456a4375453613ffab47fc@codeaurora.org>
 <12c9ae4818ee072ea81d4fe2e6438b5f@codeaurora.org> <ea5b7ab62b5f03091b1551e9d387100e@codeaurora.org>
In-Reply-To: <ea5b7ab62b5f03091b1551e9d387100e@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Jun 2021 08:00:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA625OwK2-qtUgnkJu-ZQeSgZevJLqNsmvW=2tam6pfP=g@mail.gmail.com>
Message-ID: <CA+5PVA625OwK2-qtUgnkJu-ZQeSgZevJLqNsmvW=2tam6pfP=g@mail.gmail.com>
Subject: Re: btqca firmware 20210525
To: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pulled and pushed out.

josh

On Mon, May 31, 2021 at 2:08 AM Rocky Liao <rjliao@codeaurora.org> wrote:
>
> Hi,
>
> Add one more pull request:
>
> commit-id: 4adb20b44c1aa98eff0f6c8311a9611b1c6db3a6
>
> Rocky Liao (1):
>           QCA: Add Bluetooth firmware for WCN685x (2021-05-31 13:49:24
> +0800)
>
> =E5=9C=A8 2021-05-27 16:44=EF=BC=8CRocky Liao =E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >
> > Add one more pull request in the same
> > https://github.com/rjliao-qca/qca-btfw.git:
> >
> > commit-id: 48237834129d17f9d77301f4c6ec4afc0c83fbac
> > ----------------------------------------------------------------
> > Rocky Liao (1):
> >          QCA: Update Bluetooth firmware for QCA6174 (2021-05-27
> > 16:31:22 +0800)
> >
> >
> > =E5=9C=A8 2021-05-25 17:48=EF=BC=8CRocky Liao =E5=86=99=E9=81=93=EF=BC=
=9A
> >> Hi linux-firmware maintainers,
> >>
> >> Here's a pull request for btqca bluetooth driver. Please let me know
> >> if you have any problems.
> >>
> >> The following changes since commit
> >> f8462923ed8fc874f770b8c6dfad49d39b381f14:
> >>
> >>    nvidia: fix symlinks for tu104/tu106 acr unload firmware
> >> (2021-05-18 16:36:31 +1000)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://github.com/rjliao-qca/qca-btfw.git
> >>
> >> for you to fetch changes up to
> >> 293c78917c8113b7e3193733cb15d8f66b0249c7:
> >> ----------------------------------------------------------------
> >> Rocky Liao (1):
> >>         QCA: Update Bluetooth firmware for QCA6390 (2021-05-25
> >> 17:36:19 +0800)
