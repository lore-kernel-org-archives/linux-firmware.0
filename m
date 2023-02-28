Return-Path: <SRS0=wfpw=6Y=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3FEC64EC7
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Feb 2023 16:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F8A4C4339B; Tue, 28 Feb 2023 16:46:40 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1622AC433EF;
	Tue, 28 Feb 2023 16:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1622AC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-536cd8f6034so289363157b3.10;
        Tue, 28 Feb 2023 08:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fxg7PHIw1UA2z0x1XzALKzkLBbW8RVnD7MP0HPAX6ZY=;
        b=e3O++/KP5KnYSzHBeB+iXfL4ka3Ocu1vqUyruq8i7UCTCK0+KO+tlB2wbOvuSlOs78
         yb/rynC0+bpcQ2dADp2u3QH1GhpnJPaLBQGi5xYKtmptiDhszpE0Kj4tD0Wvjj3TFxNU
         dyAPgYocS8tzhb0eX357gNt8UiHKqhsi2U6AIQeH+lyM2Oh2ZEvxRFHmQjaSBBLB/dRQ
         Ja+hqjxmNOgW3ThOB+b50fWFgc+pxftRRLLh0h7Cs+lMqa3ynrQHqkFLsYmcDMheYoCf
         76tbfIJcZVQRuFCanEoOploYwQONIx68Jr7PxtCe1l914bTk4XmTbd8PdXyJVrh3Vj0h
         xxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxg7PHIw1UA2z0x1XzALKzkLBbW8RVnD7MP0HPAX6ZY=;
        b=hlasXnM5btup+EIBqghJ1LnY56EREseYC3YqaLtLTJ2pc+MFJWr6NYjshkz61XoICr
         nwlhfMquEiJ/afixzIw+NxjtfpXO1mtG27Wtf9o7JUVDBg8gmgBWZ3k08O60rhBEe89O
         swiqZgWqZHV2hBgOpoYt7baQ2m/x/1ugABbu1wSSyKZgqUysFAHBwfay+s/wktGS6TBF
         pcbTzQD6wswW+ujyWw/grtCoYrNpy5kUQ95oLdDP9x4KVuNwrhhWp4vpGLivXRZuf3AZ
         YxDGPlh1Mc6kfud4tB3IFLar3LkRmATT6L9u43v+tpFc8NHD7DG2iuNrz4uMbmCJUq5L
         F7pQ==
X-Gm-Message-State: AO0yUKXu3YuiA13yEjAEKVlYLQ7vag9ItB+pBP+llbmrsY8z1ScWIytH
	aMR0LVYtMkR0uwe+viDA3y8iwjwShVRR2vuVFEk=
X-Google-Smtp-Source: AK7set+V6KyqzpPZjVmhNrSEddeEaXiBkDqunwPZch96b4D8UjBVvm2pMdxci9S/NBZbiH/ZZe/YEv609YFi3X1besY=
X-Received: by 2002:a81:ac16:0:b0:536:4194:e6eb with SMTP id
 k22-20020a81ac16000000b005364194e6ebmr2097404ywh.0.1677602797932; Tue, 28 Feb
 2023 08:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
 <CACvgo50K0kSFh_bRUz5=0oSL2W92XERiyzGZhD1SjT5u6A0cgg@mail.gmail.com> <09c319d0c79967377239df12fa8a857107235bca.camel@infradead.org>
In-Reply-To: <09c319d0c79967377239df12fa8a857107235bca.camel@infradead.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 28 Feb 2023 16:46:26 +0000
Message-ID: <CACvgo53kg-_htw8ecrBnJHyFqD5tx2KjmJvByvAVZtsA5gzZ9Q@mail.gmail.com>
Subject: Re: [PATCH 00/15] Misc fixes, sanity checks and xz/zstd compression
To: David Woodhouse <dwmw2@infradead.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Feb 2023 at 14:37, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Tue, 2023-02-28 at 14:18 +0000, Emil Velikov wrote:
> > On Sat, 18 Feb 2023 at 18:46, Emil Velikov <emil.l.velikov@gmail.com>
> > wrote:
> > >
> > > Greetings everyone,
> > >
> > > For a while now, the kernel has been accepting compressed firmware - be that xz
> > > or zstd. There is a patch for the former on the ML, yet the latter is still
> > > lacking.
> > >
> > > While working through I've noticed a few issues - of various severity - so
> > > decided to fix them all.
> > >
> > > Mind you, I'm sending everything as single patch series to gauge feedback. I'm
> > > quite happy to split and rework as per the community's feedback.
> > >
> > > In a gist:
> > >  - remove quoted filenames in WHENCE - escape white space as needed
> > >  - remove _nearly_ all duplicate entries in WHENCE && add check
> > >    - NOTE: one entry remains, which I'm not sure how to resolve cleanly
> > >  - check if directory is listed as File - had a mistake like that locally
> > >  - check we have no symlinks and drop symlink workarounds
> > >  - quote deskdir (genuine bug) + few more shellcheck inspired fixes
> > >  - support xz and zstd compressed firmware - no intermediate files, pipe
> > >    directly into destdir
> > >
> > >
> > > Kind regards
> > > Emil
> > >
> > >
> > > Emil Velikov (15):
> > >   WHENCE: remove trailing white space
> > >   WHENCE: remove unnecessary filename quotation
> > >   check_whence, WHENCE, copy-firmware: escape filenames with spaces
> > >   WHENCE: remove duplicate File entries
> > >   check_whence: error on duplicate file entries
> > >   check_whence: error on directory listed as File
> > >   copy-firmware: remove non-applicable file presence test
> > >   check_whence: error if File: is actually a link
> > >   check_whence: error if symlinks are in-tree
> > >   copy-firmware: remove unreachable symlink workarounds
> > >   copy-firmware: quote deskdir to prevent word splitting
> > >   copy-firmware: tweak sed invocation
> > >   copy-firmware: quote the output of dirname
> > >   copy-firmware: silence the last shellcheck warnings
> > >   Makefile, copy-firmware: support xz/zstd compressed firmware
> > >
> > >  Makefile         |  8 ++++
> > >  WHENCE           | 97 +++++++++++++++++++-----------------------------
> > >  check_whence.py  | 44 +++++++++++++++++++---
> > >  copy-firmware.sh | 71 +++++++++++++++++------------------
> > >  4 files changed, 119 insertions(+), 101 deletions(-)
> > >
> >
> > Adding Josh Boyer - the maintainer, according to git log.
> >
> > Josh, do you have any objections to the patches - part or in full? Can
> > you pick these off the ML or shall I send you a git request-pull?
>
> Does this work even for early microcode loading?
>

Greetings David

Don't think I follow - the series is completely unrelated to microcode
loading. There isn't any mention of microcode in there, so I'm not
sure what inspired the question. Perhaps it was meant for another
thread?

Thanks
Emil
