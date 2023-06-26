Return-Path: <SRS0=FMAw=CO=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060C9EB64D7
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Jun 2023 10:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BDE2DC433C0; Mon, 26 Jun 2023 10:44:37 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BEC93C433C8;
	Mon, 26 Jun 2023 10:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BEC93C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-765a5d31d0aso82753185a.2;
        Mon, 26 Jun 2023 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687776275; x=1690368275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOaytTwbAuFYLrBtcVwUV9Kc9ODc1Zsfe6HTszJ4RGM=;
        b=Cpr+akzjo+TvWlpJGz7olb5uvcnMkkdOK1G5K9S7BIiNQhE2XfeiWkx0G0hz3Vksbl
         9jZ6g1IBMI49TRQNsxjXmQHpK6qJVcHhmKF/RAiKx6PizebXjCf61L4pDrmV65Jflbo+
         3Bp6ulQziis1gOu5YAw3/gBJyJvIrVlQdzlzoUG9OzPgsQOfvL0u+AtDYZ2wPpDqxq6h
         tV8LhDhKZQ6eV8jUnckFl2kjy9/Y1qY5UpRALNGePHiGWxWTWBX9gKGh//um5uMPEats
         LKUqGzny0ww6LtpoMB6urvvl6n6ZEvdn3GtQCY8DXQt/3k4/VZLdCpUN1JisLUtpZWqf
         DsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687776275; x=1690368275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOaytTwbAuFYLrBtcVwUV9Kc9ODc1Zsfe6HTszJ4RGM=;
        b=MXwTAGdoqD0D1enKm3QdK4vZXMeJnIi3FAtL1YeTvZUscAHy5U17F1kql5DvAHDKV0
         vhj9b2Zo6laIH5h8mHU1I+VcdgJplnV019pAmbqQSuQTIOYS9I2vQU+0cWkat9fkacnv
         l+PVV4Ksr3sLhO6mv+pZu4jKaKvUUjty9+OB5q2/ubNifVqd5h5QLPOCqlEpHkl+O6YF
         TZPgAG4kO/dLRHcY5PHqlyGsXJjMdtwwHEcEbYEXqR3c9aKaYbfS+ZR25rQjzQoaRJ1A
         iSDF+K/kAr1moZJkP6rRtHitfH1p6U8eCKGg6vfDY4DSHRGr1fk8qbYGSTtbSB2/bodc
         Epvg==
X-Gm-Message-State: AC+VfDzt7ZuNFxL/jWWm4wYdKCvtvNJ/wNmOXapaUykRV1+0xrvJ3MRd
	ZnFiclk/JhOqbyDfUfa5A8CMBkInfi2u5BVRUbOgqiDG3/U=
X-Google-Smtp-Source: ACHHUZ62BYHcs/PAr9xUAhofHjSla8kcVqGXcu9cnCmInZaqReMCuTEwIJFhTYGcVR0L3xG6V5CPldKZg+/nta9LnQA=
X-Received: by 2002:a05:620a:bc9:b0:75d:e308:8366 with SMTP id
 s9-20020a05620a0bc900b0075de3088366mr31601709qki.16.1687776275020; Mon, 26
 Jun 2023 03:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230605141343.880621-2-emil.l.velikov@gmail.com>
 <CACvgo53fiiG52=khyqE+X=kkxRoQ28JUN4E+vYt3SCU_MNQNKg@mail.gmail.com> <CA+5PVA6EEBtY2BisMhsDL8BkHqB1CUL18Y+8uyb-cH9TTS_w6Q@mail.gmail.com>
In-Reply-To: <CA+5PVA6EEBtY2BisMhsDL8BkHqB1CUL18Y+8uyb-cH9TTS_w6Q@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 26 Jun 2023 11:44:23 +0100
Message-ID: <CACvgo51BOgi5aXYJ5O6wOMKvLX9po+nd=Zy=1F1DeTySosDCRg@mail.gmail.com>
Subject: Re: Misc fixes, sanity checks and xz/zstd compression
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 25 Jun 2023 at 17:20, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Tue, Jun 20, 2023 at 10:25=E2=80=AFAM Emil Velikov <emil.l.velikov@gma=
il.com> wrote:
> >
> > On Mon, 5 Jun 2023 at 15:14, Emil Velikov <emil.l.velikov@gmail.com> wr=
ote:
> > >
> > > Hello Josh, everyone,
> > >
> > > Here is the third, and hopefully final, revision of this patch series=
. In a gist
> > > we have:
> > >  - extends the existing check_whence checks
> > >  - fixes a bunch of glaring issues with copy-firmware - props to shel=
lcheck
> > >  - adds xz/zstd firmware compression support
> > >
> > > Note: despite being sent as a single piece, all the patches (apart fr=
om the last
> > > one) can be picked independently.
> > >
> > > With v2 we have:
> > >  - dropped already applied patches
> > >  - dropped copy-firmware.sh changes, as requested by Josh
> > >  - couple of extra fixes
> > >    - copy-firmware - drop backticks && quote - code used to be remove=
d with v2
> > >    - strip quotation marks in check_whence - quoted filenames are her=
e to stay
> > >
> > > Josh, sorry for the delay with this respin. Hope all your concerns ha=
ve been
> > > addressed, alternatively let me know and I'll send v4.
> > >
> > > Thanks
> > > Emil
> > >
> > > Link to v1:
> > > https://lore.kernel.org/linux-firmware/CACvgo50RhmRKnUoos2wGWOP-Pb8oG=
o1BMPunfTtBQO0eX1D2Dg@mail.gmail.com/T/
> > >
> > > Link to v2:
> > > https://lore.kernel.org/linux-firmware/CACvgo52CK-sJjx26tEz=3Dec2PqqF=
z0bWuUMgUNjtZEjGm8f7mig@mail.gmail.com/T/
> > >
> >
> > Josh, others, humble ping?
>
> Thanks for the respin, it's much appreciated.  I've applied all 8
> patches, with a minor change to 8/8 to remove an errata verbose=3Decho
> statement in the zstd case.
>
> The timings for this are interesting.  These are from a decently
> spec'd machine with NVME storage.
>

Thank you Josh

To be honest I was also surprised at the fast (default) compression
for zstd, which is how I forgot the spurious `verbose=3Decho`. And yes,
I'm seeing similar numbers on my end.

Changing topic:
Looking at [1] makes me wonder if we should not add a test to `make
check`. There have been a few mistakes like that in the past, which is
understandable.

At the same time, it's fairly easy to test in an automated way. Namely:
Run make install into a random generated prefix, ensure all links are
valid and are pointing to files within the prefix.

Modulo any objections, I can send a patch in a few weeks. WDYT?

Thanks again,
Emil

[1] https://lore.kernel.org/linux-firmware/CA+5PVA4QL8+_vkkRjo=3DXN+VuU1dQ8=
kfk9h2KyvqpqY8JbAagmQ@mail.gmail.com/T/#u
