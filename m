Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A00C433DF
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jun 2020 19:10:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C367920720; Mon, 29 Jun 2020 19:10:38 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A2267206E2
	for <linux-firmware@kernel.org>; Mon, 29 Jun 2020 19:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593457838;
	bh=8UJTIqrpx1LHJg+AutJegCvjVrBN3wSGr2JIMzA+G9Q=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=2cphn04v6TkgqX+6uUW1pKDOBh7meOlcz6DI5w1I60K0h3Gt0q8AfQ13AIpaCUWWK
	 Vh+FROxKa+AsMTcwYSRgOxoH9II7VhGGSkYHbnk2sYNiTEbOUsBJ6hYd3TmQHGFJm1
	 auLaP43Y7pvmuiLlayc2HxFaqUx1xKhcQgGv70rI=
Received: by mail-io1-f45.google.com with SMTP id e64so13443865iof.12
        for <linux-firmware@kernel.org>; Mon, 29 Jun 2020 12:10:38 -0700 (PDT)
X-Gm-Message-State: AOAM533L7UYE2MXI5eY7x75uupZi0QhNP3jKO8dLCaYdOLU2iHWSj0ma
	9sSr9TOHr6eQClrzpYg7dFbgnZn9WoICNJWjnlM=
X-Google-Smtp-Source: ABdhPJxvKqnxsjMnfh1SfEbi2D9kr9NuiOh3Zb4o7QIxYzXYsmk4i06BeSxAyEc2GCxKmOobFHqQowoVq/XD40/8TE0=
X-Received: by 2002:a05:6638:d96:: with SMTP id l22mr19784569jaj.120.1593457838123;
 Mon, 29 Jun 2020 12:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_NiL9ErKKspDTY+Q3AnrgMxv5jXY79Zjw-vEVAmKQuERQ@mail.gmail.com>
 <CA+5PVA5=vzsH62YHQ-pUpv3bgB=piMLtxcjdYiRtTTr1o42NcQ@mail.gmail.com>
 <CADnq5_NU+Z2qxDwSpwnwXgUF8dh3ggwAAugY8RZvJhMVBQc6Fw@mail.gmail.com>
 <CADnq5_O9Ga9eo-h842b=pb2+JxuGe2nD1gQ+mm39=gTZSQK2_Q@mail.gmail.com> <CADnq5_O9Un8TAMHn3zURRXPkw74f4w2OD5yL5AsU2ZVhmYYA7g@mail.gmail.com>
In-Reply-To: <CADnq5_O9Un8TAMHn3zURRXPkw74f4w2OD5yL5AsU2ZVhmYYA7g@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 29 Jun 2020 15:10:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4xR_y=cOV=1QzVqanS7hRQUz-Xh69dBK6=u7_PQL=OaA@mail.gmail.com>
Message-ID: <CA+5PVA4xR_y=cOV=1QzVqanS7hRQUz-Xh69dBK6=u7_PQL=OaA@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 29, 2020 at 2:44 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Nevermind, I didn't realize the master had been replaced with main.

They're in both branches.

josh

> On Mon, Jun 29, 2020 at 2:31 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > These don't seem to have landed in linux-firmware git.  Maybe the push failed?
> >
> > Alex
> >
> > On Fri, Jun 19, 2020 at 10:52 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > Thanks!
> > >
> > > On Fri, Jun 19, 2020 at 8:37 AM Josh Boyer <jwboyer@kernel.org> wrote:
> > > >
> > > > On Mon, Jun 15, 2020 at 5:48 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > > > >
> > > > > Updated amdgpu firmware for 20.20.  Please apply!
> > > >
> > > > Applied and pushed out.
> > > >
> > > > josh
