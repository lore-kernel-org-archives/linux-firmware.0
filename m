Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21892C678D4
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 18:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DC9A6C433A7; Tue,  7 Mar 2023 18:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C692DC4339C;
	Tue,  7 Mar 2023 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678212055;
	bh=YnLFKl8BzlEtpcwivk68jJwoGLa+ZP7OwzpbZo1HwsM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=d9drOIYo1n5w39FQRrrOUyU9plu5m5o18kGA7mRc8vEDLZYPMLLDCcTxe7LRjPhnD
	 KZa+0faM4lotivl/fgiyLyqupkjNnTTxCcnBVsDz89yOIlvzLoXkCvUYcgFePGaJBT
	 VJl3b9Mznjm0G3C/hHh9z0sJvM0cIGrTdZOY30hwHVm4+kS0AbnHdQWMS1v6HtiRHO
	 W/iX4d4dO73TfJkl18KTQvNXnDtcgolQlN42OQP9xvKuLktE0OYDkRnqBqgn/cNRh/
	 m8P9P2A9oXSKOxBVFlCrAtwMBpQErca+pcgwmjnpcBQ2O2F2nWUHTiFnqudQjWnqnd
	 ZD0BXgYc+5P+A==
Received: by mail-yb1-f180.google.com with SMTP id y144so12235039yby.12;
        Tue, 07 Mar 2023 10:00:55 -0800 (PST)
X-Gm-Message-State: AO0yUKX76CGoLFg0ZnYiRqZHH6S2QuzwU+jh7db8IJZgYv28vDHlnCUK
	qSURhnQJVXgwbHsmztC8ImBPSPSA6R7C62uHLpw=
X-Google-Smtp-Source: AK7set/3G97mg+P8GneCDArs8NnlewAJ7ZvTBN8R89GI2HtTayQ+m/pTIHyz4HLSGsaevuz5mZoFYovvJXEDOWlEBXE=
X-Received: by 2002:a25:9c46:0:b0:a5d:3d45:26c with SMTP id
 x6-20020a259c46000000b00a5d3d45026cmr9317235ybo.0.1678212054651; Tue, 07 Mar
 2023 10:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
 <20230301-fixes-and-compression-v2-3-e2b71974e842@gmail.com>
 <CA+5PVA7OGYgFxgCACKfZ67ap+Q5kXzVWKVL96MR5QAu2u_P-Tg@mail.gmail.com> <CACvgo52Vwm6w=RsPRuNaXRO7OKvZ5EW8Fgdnvnjta4LsuseyDQ@mail.gmail.com>
In-Reply-To: <CACvgo52Vwm6w=RsPRuNaXRO7OKvZ5EW8Fgdnvnjta4LsuseyDQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 13:00:43 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4B1WN2Hc14suOVRG76ANrgLnzPcUUxMryk+pzjEhUjPQ@mail.gmail.com>
Message-ID: <CA+5PVA4B1WN2Hc14suOVRG76ANrgLnzPcUUxMryk+pzjEhUjPQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 03/16] check_whence, WHENCE, copy-firmware:
 escape filenames with spaces
To: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org, 
	Adam Sampson <ats@offog.org>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 12:30=E2=80=AFPM Emil Velikov <emil.l.velikov@gmail.=
com> wrote:
>
> On Tue, 7 Mar 2023 at 14:58, Josh Boyer <jwboyer@kernel.org> wrote:
> >
> > On Wed, Mar 1, 2023 at 1:56=E2=80=AFPM Emil Velikov via B4 Relay
> > <devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
> > >
> > > From: Emil Velikov <emil.l.velikov@gmail.com>
> > >
> > > We have a handful of instances which have space in the filename - jus=
t
> > > escape them (like we do for the symlinks) and drop the extra re patte=
rn.
> > >
> > > With this we can also drop the extra sed pattern, stripping out the
> > > quotation marks.
> >
> > While that is all true, why is it necessary?  I suspect patch
> > submitters are far more likely to forget to escape the spaces than
> > they are to just include quotes.  I see this change as making it
> > slightly harder to submit correct patches and I'm not sure it's worth
> > it.
> >
>
> We already have properly escaped paths in WHENCE, so it only makes
> sense to fix the outliers.

That's true if we believe escaped paths are the suggested way to do
it.  I'm questioning if we really want that.

If you're a firmware submitter, which is more natural to you?

File: "foo bar with spaces.bin"

or

File: foo\ bar\ with\ spaces.bin

Based on the number of occurrences in WHENCE, quoting the filename
seems to be more prevalent.

> Would you be in favour if check_whence.py checks for quoted files and
> produces meaningful error message?

Not really.  I don't understand why we have to force only one format.
The code already supports both.  What is the benefit of dropping that?

josh
