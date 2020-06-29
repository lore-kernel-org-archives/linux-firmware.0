Return-Path: <SRS0=JoT4=AK=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D86C433E0
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jun 2020 18:31:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3AC43255DA; Mon, 29 Jun 2020 18:31:55 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF7E4255D8;
	Mon, 29 Jun 2020 18:31:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4NRhuTp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF7E4255D8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-wr1-f47.google.com with SMTP id s10so17529577wrw.12;
        Mon, 29 Jun 2020 11:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/KhaZRj/ZwHzU9yRr47MuLJSL1EJm0KzMtKfShAJZmE=;
        b=c4NRhuTp5apyf01prGmlT7vXrX9nIUOdDJU58gxHrCLAr8qFxUKb7Z47UTRqiWnJPA
         UHWACcgwD9ML2kwKW7zcrFy/S3oq5TnD0tVFKyGqVAnM/VmQXyNJf6rv7XvBhSEAxmOR
         18+A3MszaI/I/mygsSgs64jIRsJiBwm2cY9DFqzxCIow7QWZBKHxFZT/yKSb31XWoy5t
         YKWeyICM/On082E7e+zyWsEfJf/bTPrTOdQnHSB41xXuJz9QXa8Pms2ObgcPf41ovH0H
         eGlX5s3v4gqqPpfLbdCJkzVLplkQ0ETMAfbpkdIF3Y0szSIpmfbBW64NY5Ebmm8nIXTF
         aS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/KhaZRj/ZwHzU9yRr47MuLJSL1EJm0KzMtKfShAJZmE=;
        b=i5zdo6pJmEyYh7xPQjU4OcaAqL5O2lfkgYTSV3pR4JO+Y7mtJOAIImhB6waK3dKEH3
         CSTZDDFCbUJRtEC1OGbKYcbljMaTZTvwJEPm1Yp6yOog2BQCgVuKXdHMYFD2YbJ+2HYN
         5+g4SLzt/e0hd7V3ksFK0fbF6dUbLvLyMebsOCLuYmMCSlGtDd9+PCe+Na2uAouQKCuB
         FGXMhJchbHTN6fiyp1713YjUEsyn9Qb9acdSDxoh5PJ46ZSkwJ+pDyBtq3Ym2yH6fXKK
         VZow3qHNORWRydt3CoElwlafhEnFngVOxdS7GCFQzGlMQNY3EUoQHUFX8+BqL6w/ZUbB
         Ufdw==
X-Gm-Message-State: AOAM532oiRN/YhSlr2Xtpv9ko8QZsAuG8UDzpwp1fhju5tbnBG15PaRQ
	yC2cO0SzaFN2NPJXphyZzRLEZdwrBdkoCuEdxkUInw==
X-Google-Smtp-Source: ABdhPJx7WUfHo03PyFXUMFY9JScFpWzYadGYuffGeTK083CTc7vDc+Ih0jqEDS1FIwPoBtQeXVfdbo9VciNPH6F98Ec=
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr18882468wrw.374.1593455513353;
 Mon, 29 Jun 2020 11:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_NiL9ErKKspDTY+Q3AnrgMxv5jXY79Zjw-vEVAmKQuERQ@mail.gmail.com>
 <CA+5PVA5=vzsH62YHQ-pUpv3bgB=piMLtxcjdYiRtTTr1o42NcQ@mail.gmail.com> <CADnq5_NU+Z2qxDwSpwnwXgUF8dh3ggwAAugY8RZvJhMVBQc6Fw@mail.gmail.com>
In-Reply-To: <CADnq5_NU+Z2qxDwSpwnwXgUF8dh3ggwAAugY8RZvJhMVBQc6Fw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Jun 2020 14:31:41 -0400
Message-ID: <CADnq5_O9Ga9eo-h842b=pb2+JxuGe2nD1gQ+mm39=gTZSQK2_Q@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

These don't seem to have landed in linux-firmware git.  Maybe the push failed?

Alex

On Fri, Jun 19, 2020 at 10:52 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Thanks!
>
> On Fri, Jun 19, 2020 at 8:37 AM Josh Boyer <jwboyer@kernel.org> wrote:
> >
> > On Mon, Jun 15, 2020 at 5:48 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > Updated amdgpu firmware for 20.20.  Please apply!
> >
> > Applied and pushed out.
> >
> > josh
