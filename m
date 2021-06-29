Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5DBC11F66
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Jun 2021 11:14:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 31CBC61D03; Tue, 29 Jun 2021 11:14:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AA8F61DBF
	for <linux-firmware@kernel.org>; Tue, 29 Jun 2021 11:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624965285;
	bh=3Y3+008EE6l5NL4iLbT75XEer1+jNTTGljpcIW1VTa8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=G8pdIjy0HhAtsFe18dYke71noNntKUL/QF9NCOUk3oJr+2bnmg4L79snk6jwtrP1e
	 Swc1/+zibCJ8k7fETsjVQd37lYxt8MHmTllhr9GVbwnBLLcsjnTi6ugdtiKheqob0Y
	 nxQzhsykq6tA24LCoA+iEjSP4cuEh9EO6ivXcBh/HtpvORTPXbuHTXHN+sb+/C17vI
	 cnzKsWeWyP4z2yJGtiZeo03yJ6+ZV8g6ztvELe1f6U7HVKSmQvQCThLQhHjGFT2g6E
	 lyJnHFndZS7/qp4TBFX7nEmw/lzveqfEfl6Np4gZpPaLZVGz90SrXskNmCrC1Usurx
	 F9jSrOFT1jbkA==
Received: by mail-il1-f171.google.com with SMTP id i17so20479196ilj.11
        for <linux-firmware@kernel.org>; Tue, 29 Jun 2021 04:14:45 -0700 (PDT)
X-Gm-Message-State: AOAM531vc4T1tYujHj1whMsQNMuKyYLIohMZdJSTHOmb8YD+8tGOc3tg
	/CqcicsgmH/fM0CkH7a7hVQPr/3XyBkp7BaMbLI=
X-Google-Smtp-Source: ABdhPJyg3ESVPuDmzj2TfShTja2ztbDGc7u60Wqb8k8BoVXIT3jSTxNjyo9WTk5xE2hrJXZAtmlDYMv1rw71vE9E9JE=
X-Received: by 2002:a05:6e02:c74:: with SMTP id f20mr22456333ilj.85.1624965284563;
 Tue, 29 Jun 2021 04:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <15d16bdefcfa6a48f39f8de3cf11c2e7@codeaurora.org> <7bbf7086f9b75a3489ee155e9b867eea@codeaurora.org>
In-Reply-To: <7bbf7086f9b75a3489ee155e9b867eea@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 29 Jun 2021 07:14:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7Fi63w2S=YP4NrdgjDZJ=eWs6Bs1A2khwKdyJTp3fnfA@mail.gmail.com>
Message-ID: <CA+5PVA7Fi63w2S=YP4NrdgjDZJ=eWs6Bs1A2khwKdyJTp3fnfA@mail.gmail.com>
Subject: Re: btusb firmware 20210616
To: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pulled and pushed out.

josh

On Tue, Jun 15, 2021 at 11:05 PM Rocky Liao <rjliao@codeaurora.org> wrote:
>
> Sorry, missing the commmit id: 160fd62e7662df212df96650db49baaea1d314cb
>
> =E5=9C=A8 2021-06-16 11:03=EF=BC=8CRocky Liao =E5=86=99=E9=81=93=EF=BC=9A
> > Hi linux-firmware maintainers,
> >
> > Here's a pull request for btusb bluetooth driver. Please let me know
> > if you have any problems.
> >
> > The following change is available for you to fetch in the Git
> > repository at https://github.com/rjliao-qca/qca-btfw.git:
> >
> > Rocky Liao (1):
> >         QCA: Update Bluetooth firmware for QCA6174 (2021-06-16 10:56:11
> > +0800)
