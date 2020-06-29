Return-Path: <SRS0=JoT4=AK=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D545EC433E1
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jun 2020 18:44:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CF93020656; Mon, 29 Jun 2020 18:44:06 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82DAD2063A;
	Mon, 29 Jun 2020 18:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/IlwuVX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82DAD2063A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-wr1-f54.google.com with SMTP id b6so17576218wrs.11;
        Mon, 29 Jun 2020 11:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PqDJbXDvhVbBdTP1HdZiP5vTu5Xvn/eQVh8vvPP0bI8=;
        b=I/IlwuVX/5iMNh3OqaY6ZEraXGHVgeqwoeI2fYRv1uxjSsRRbWn9PMfEBtii29vHSP
         C/tUklxVqzpKi4gikBpeVSf0C+y9MY5szeHVL2iyu2cWh4o/DfAnCNqdEIz6LNxV+FhA
         Khvwo5aHxcRNRUftpV+CuUgwrsDECjcjJhZY9HGxi/nuPeNX6TXnhJ7RSJ460Qh2SoyX
         3pfIan50GTs0XF+/pZZg6d+FFM3A3VZJ5rp+DfXZ+Bjzw3OBsAh4nt20uVmfVkEkz3YR
         Ppe6RWig74gxX1K/A6CEQdmmegHxRwTgpGDHfhyfADBCj+mmmd5GNcNfUD/QOUCjcCJ4
         fmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PqDJbXDvhVbBdTP1HdZiP5vTu5Xvn/eQVh8vvPP0bI8=;
        b=R1nXTBS0A+6d7Al/yJ8anPuRwTzheh4hc/WltoaAEg77o4vN9JOB3Qntdl8BLMsw5p
         IQ/fWDyEn55PfiH4jYrqPgdoZ2Uo+3AePD7U4BjHSW/jZRcSH8cjZWnJYKNxbVznWZmn
         KPm7MgmZsorHoMOYwhSq5nwEANBwOjXVOEZlJc1vZ7jlQu+tMYS7hfbsuUJb2r478uKR
         DS0jJ/lpFtLVZwL1Budngxoo8KvLT2pO8cf67S2eOWFbxMW4tJUxXChw7HpIlFk3YYJO
         0xILwlfNWvVvw3sWhMJnpdhuu7aEaEOKsZYGwnoO1dh0M+533zgO0C81xe8L2aAzCMq4
         Pugg==
X-Gm-Message-State: AOAM533Lip8+Q4cVfHaBvYr2OZhSdftNdWBPwEgUXRHkw8JJjJpud5Pl
	FMAAibif5hfW2wA7tS9JddWs26wIM0mfhfJ1qW3S7A==
X-Google-Smtp-Source: ABdhPJw+9KkwkTQSCV2VzWFu++unWBBrWzURzhASkwkVZ+bbWBV2HJ60AAt3MldkxnEhSx+fICrIYvlmCYlVU81H1Yc=
X-Received: by 2002:a5d:5549:: with SMTP id g9mr19394201wrw.419.1593456245038;
 Mon, 29 Jun 2020 11:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_NiL9ErKKspDTY+Q3AnrgMxv5jXY79Zjw-vEVAmKQuERQ@mail.gmail.com>
 <CA+5PVA5=vzsH62YHQ-pUpv3bgB=piMLtxcjdYiRtTTr1o42NcQ@mail.gmail.com>
 <CADnq5_NU+Z2qxDwSpwnwXgUF8dh3ggwAAugY8RZvJhMVBQc6Fw@mail.gmail.com> <CADnq5_O9Ga9eo-h842b=pb2+JxuGe2nD1gQ+mm39=gTZSQK2_Q@mail.gmail.com>
In-Reply-To: <CADnq5_O9Ga9eo-h842b=pb2+JxuGe2nD1gQ+mm39=gTZSQK2_Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Jun 2020 14:43:54 -0400
Message-ID: <CADnq5_O9Un8TAMHn3zURRXPkw74f4w2OD5yL5AsU2ZVhmYYA7g@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Nevermind, I didn't realize the master had been replaced with main.

Thanks!

Alex

On Mon, Jun 29, 2020 at 2:31 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> These don't seem to have landed in linux-firmware git.  Maybe the push failed?
>
> Alex
>
> On Fri, Jun 19, 2020 at 10:52 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Thanks!
> >
> > On Fri, Jun 19, 2020 at 8:37 AM Josh Boyer <jwboyer@kernel.org> wrote:
> > >
> > > On Mon, Jun 15, 2020 at 5:48 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > > >
> > > > Updated amdgpu firmware for 20.20.  Please apply!
> > >
> > > Applied and pushed out.
> > >
> > > josh
