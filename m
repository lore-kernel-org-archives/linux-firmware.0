Return-Path: <SRS0=4i0d=RS=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA572D2C54E
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Oct 2024 13:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98A56C4CEC3; Tue, 22 Oct 2024 13:19:56 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 951E8C4CEC7;
	Tue, 22 Oct 2024 13:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 951E8C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so59684621fa.3;
        Tue, 22 Oct 2024 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729603193; x=1730207993; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJxdqatVc33+GS1yJCHk1cTpA4rXR4Jg/uPCLv7bEEs=;
        b=Isv0nyAQGTd+FMgg/d7ZxI3jBIi8juxtOlWpAXoqzCejQKOHMZM6gLWv+d5aXCZH2V
         cMBy0Xh6yENn3Kbkx2A/D4teJqB/4nrm6XVG89h6asZoDZ9BBoNQW9aUvHjEigsp7dLP
         aAC2h/kpIeDiNcifXVfrVkwxY8lDnRpwMja8MjrJ/Mm4m18h11k8lMaoBTTcfixKB7ah
         d76h1Y+zjmSh8rEfp7d6aM51Lu6iJGHKuWabxvdbDvA4l5gEpyZMPROJS8ULCgtUFO05
         780z2OBedFoKeSTm23/t9Y8qWkI2wiMHJX5y13BgGzwBYnhAl9RUAMgXtya5MmHXbEGF
         YxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729603193; x=1730207993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJxdqatVc33+GS1yJCHk1cTpA4rXR4Jg/uPCLv7bEEs=;
        b=aooCaernwVJ0Oeok/bnq/iaBiFG8PCj/AqrXdfdBilfV4yEtBuYk3PmjnE74ql4U1b
         61h4Ni9Voexd34nZWuxQUyEWnLuqdWttDPaNA41TXQ4kUEHh2LHINVOrL8tPoI3umpKr
         99Ti2KzZE/xe6R1RSblcoIONHjztRq+EGXKwfK3YDs/HbxLLZN+pPU/3Sg69Goryd0w8
         cobKx1u+IzHhs+TsPYmclyDdDU/5oppKnlRnxKt94o1lzbsR2nGP6e87beyqXf04bbs4
         3gmP8AqeNMS8EsFLE+mpeZLc4OP/3FjePkpMaRHJn2H0whcKvHi3bw/070HVtU/pLrVk
         5Aag==
X-Forwarded-Encrypted: i=1; AJvYcCWm4aoy1ZwmuyxMCjuCHqh5/axqZb2KYFTbI4DBB6CJq/3+NaEYM8B+D3AagKAWOtDrM+2uWKM1UcfZ7Mv8Ew==@kernel.org
X-Gm-Message-State: AOJu0YyEUEwtRlN7NeXeN1aOy8p/hAP/38+uXGuv26j9EexrbxXSsdqw
	YKfiulsrN/w2R1jN6oAwvRrUyjqnIGqbwgNDbW/LQA0+dmlKi0jVzmkfH3rOmTOp35abX/Lrdc3
	WuomEw/J3zaVfJIAsq69auGp8ZtVk5JWF
X-Google-Smtp-Source: AGHT+IGt5DHyUGOgMmj5JshBnqJabtsFXbsju1MNmBJ/Xp+Uu6W15SaEQ28ktceYtuK3CBqBToJ9Fk1Z+nJ1PE7cHZI=
X-Received: by 2002:a05:651c:1549:b0:2fa:ddb5:77f9 with SMTP id
 38308e7fff4ca-2fb8320b2a9mr68494401fa.40.1729603192922; Tue, 22 Oct 2024
 06:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <56dd4ed2-a4a2-4d9d-b23b-2a817fca1f94@quicinc.com> <CA+5PVA65e_3w-gh-ZQPS8PDzxyPNZ_NNFcp7TcMhWi0pNO-x+g@mail.gmail.com>
In-Reply-To: <CA+5PVA65e_3w-gh-ZQPS8PDzxyPNZ_NNFcp7TcMhWi0pNO-x+g@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 22 Oct 2024 14:19:41 +0100
Message-ID: <CACvgo520miap4jYcKOgirscGzhZiM3TzrT8-18FTZ16gZ7ERhw@mail.gmail.com>
Subject: Re: check_whence.py: Add function to get listing of files
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Vivek Puar <quic_vpuar@quicinc.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vivek,

On Tue, 22 Oct 2024 at 13:20, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Fri, Oct 18, 2024 at 6:22=E2=80=AFAM Vivek Puar <quic_vpuar@quicinc.co=
m> wrote:
> >
> > Hi,
> >
> > Please find below git pull request to update check_whence.py file.
> >
> >
> > The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b27555709=
5558:
> >
> >    Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17
> > 15:40:04 +0000)
> >
> > are available in the Git repository at:
> >
> >    https://github.com/vivpuar/linux-firmware
> >
> > for you to fetch changes up to 95c238e821c95749b50f24f9b6fed080417daadf=
:
> >
> >    check_whence.py: Add function to get listing of files (2024-10-18
> > 15:19:04 +0530)
> >
> > ----------------------------------------------------------------
> > Vivek Puar (1):
> >        check_whence.py: Add function to get listing of files
>
> This doesn't apply cleanly any longer.  Can you rebase it?
>

I worked around the root issue in a different way with
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/339.
Your approach looks reasonable, plus I don't have an opinion on the
route we take.

If you prefer we fallback to file listing, can you please open a MR
against the gitlab repo and I would happily review it.

Thanks o/
Emil
