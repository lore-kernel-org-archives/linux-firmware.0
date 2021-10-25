Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0681EC433F5
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Oct 2021 11:15:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DD66160F46; Mon, 25 Oct 2021 11:15:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7C2F60238
	for <linux-firmware@kernel.org>; Mon, 25 Oct 2021 11:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635160552;
	bh=dzhbBrO+THoMwYNFtN/Tk+Jxt7FjWWb5PyFpsaA6cjs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=F/NtzF3SOZWvXUJS71ksHuuI4+ut7/59ZHlI7gbpgh+4cnSNpPMuZORV/pagGGFji
	 bkmJArEP/YkxtGavwyac8dUAEHOaeEBGyBHwZ0l4EnGvpByzaFtfzxF2aPSu7J9Ujq
	 igSpGjE8yHrb9kUtq8ae9Rl2NQAZsejc9X5gFk249nA0P7ltRUo3iJTDsIhLKclkx2
	 OCi1Fxi18tZJJMDOyNF2mMbFGAIvdfn7kSsuA6qrEw24jL3KpUpHPpKpsl5SZxsv6L
	 Zn8oYL7pXvEx0DHofOp9Z97Bd4EhwBEqwFc7kk9VevD4eCkyyorKse9pc2iJxAEClO
	 aptYwg7Gy/14Q==
Received: by mail-il1-f179.google.com with SMTP id 3so9939207ilq.7
        for <linux-firmware@kernel.org>; Mon, 25 Oct 2021 04:15:52 -0700 (PDT)
X-Gm-Message-State: AOAM533xCeAumGEqtDAbQ1U5QLUXm43pXK7h8gIlKFKFP3C1RdoPtic8
	06yTXGG83kXlk8Kluhu1SKDu/e1jD/ycm0jM5b0=
X-Google-Smtp-Source: ABdhPJzvZ3ft0dBlPft2FjobFluv+xPK4DAqqTVyUpT+51Y17iFda7pYGB7aVHh313jgDjFmw+ziUGVgsxZCMu80tOw=
X-Received: by 2002:a92:911:: with SMTP id y17mr9369811ilg.218.1635160552143;
 Mon, 25 Oct 2021 04:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <b3dc77916dc7486eb312e1e44119116b@realtek.com> <CA+5PVA5qbQEr5d-dKa77vQWmztyRc_JrBi2WTCNcuL4BCQ=z7Q@mail.gmail.com>
 <2b6bb42ae75f4a6dae59e0773f21367a@realtek.com>
In-Reply-To: <2b6bb42ae75f4a6dae59e0773f21367a@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 25 Oct 2021 07:15:41 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5zfinj2mTNrKFTn8ttU4YeV8F-L412PLaHJvUNRkzBxA@mail.gmail.com>
Message-ID: <CA+5PVA5zfinj2mTNrKFTn8ttU4YeV8F-L412PLaHJvUNRkzBxA@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852a: update fw to v0.13.30.0
To: Pkshih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 8:43 PM Pkshih <pkshih@realtek.com> wrote:
>
>
> > -----Original Message-----
> > From: Josh Boyer <jwboyer@kernel.org>
> > Sent: Monday, October 18, 2021 9:11 PM
> > To: Pkshih <pkshih@realtek.com>
> > Cc: linux-firmware@kernel.org; linux-wireless@vger.kernel.org
> > Subject: Re: pull request: rtw89: 8852a: update fw to v0.13.30.0
> >
> > On Wed, Oct 13, 2021 at 5:46 AM Pkshih <pkshih@realtek.com> wrote:
> > >
> > > Hi,
> > >
> > > Update firmware of rtw89 driver that get merged.
> > >
> > > Ping-Ke
> > >
> > > --
> > >
> > > The following changes since commit ec17b637b7ab928ca7ebc0389e0e3921f1cc7d17:
> > >
> > >   rtw89: 8852a: update fw to v0.13.30.0 (2021-10-13 17:40:46 +0800)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/pkshih/linux-firmware.git
> > >
> > > for you to fetch changes up to ec17b637b7ab928ca7ebc0389e0e3921f1cc7d17:
> > >
> > >   rtw89: 8852a: update fw to v0.13.30.0 (2021-10-13 17:40:46 +0800)
> >
> > Is this from the 8852AE-0.13.30.0 branch?  The github repo defaults to
> > 8852AE-v6 which does not have this commit.
> >
>
> Yes. To avoid confusing, I push this to master branch and use it as default.

Thank you.  Pulled and pushed out.

josh
