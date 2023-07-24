Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F348C0015E
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Jul 2023 14:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87B17C433C8; Mon, 24 Jul 2023 14:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7205BC433C9
	for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690209995;
	bh=IrNyU3eu3p0QPWb3mUFBQ9Gs3L2p3ilTDLkL+sDvqms=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Sm/MgFJuulrR/YrC2ntvFagktss92KaWCgWytGcGXm4Km7nUQYMKkvKliU0bNAqvs
	 rrwkrN2QnNmRZZhbmH7c2lfEFrGJ+I3awk+uTwSAENcoC8z3oQIIDaCm5Tr+quHg0g
	 pDeFooW8UvXtHAGhuGSEvh/MSpHUv/uR8v0FTGUOFqV9KfuWT0ZfcEQbRSkONHA0En
	 SWu0uyYHzZjd0xRWD9IW2uPyeY8wpx0AxPuX+ddTQDsv1ExWE1EdhtGFGSscySrdDF
	 rPEM+XCxdwDTxIRtcj99dbyg1m+5eFrL6w4pP4kSVZrEBqXJ0myA3Xns4DS5FZsLmN
	 k/BcfhP87JB2Q==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d074da73c7dso2897652276.1
        for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 07:46:35 -0700 (PDT)
X-Gm-Message-State: ABy/qLbjwUjhKgPwJVWpfltj0M6FnGgU++53CINyS2WdlOgjzpKCHuIi
	j86YUmLC7IAIFBPtOQE/ZmNuzPfSyozUPLXyO9U=
X-Google-Smtp-Source: APBJJlGytYOFSs61+8STYNLgjfaJu3BiFMdcJ1066KzpnmhJa3vHjCWpqhOnsPM3OFDRbgqZkBWeOfPOMFQovpFHIfQ=
X-Received: by 2002:a25:1882:0:b0:c76:173c:6718 with SMTP id
 124-20020a251882000000b00c76173c6718mr9070420yby.1.1690209994429; Mon, 24 Jul
 2023 07:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_MQM1sG50oq4FoOTVOrg+b+Q5is7X3rpbwSFZu7s7ZhSg@mail.gmail.com>
 <CA+5PVA5Mx0eym4qSappjmS_5kTfz3n-fAmPVtrUn266Sn6cuiQ@mail.gmail.com> <CADnq5_MnJQ-EYvXR4F1rcUgEOinpncwTaScUSRjTAAj_p_r=dQ@mail.gmail.com>
In-Reply-To: <CADnq5_MnJQ-EYvXR4F1rcUgEOinpncwTaScUSRjTAAj_p_r=dQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jul 2023 10:46:23 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7eFWqEis8OeSLEmoi=qZhEMftwHF6c4vgRjdvaM9BdZQ@mail.gmail.com>
Message-ID: <CA+5PVA7eFWqEis8OeSLEmoi=qZhEMftwHF6c4vgRjdvaM9BdZQ@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.  Thanks for the quick response!

josh

On Mon, Jul 24, 2023 at 10:39=E2=80=AFAM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> Fixed up.  New patches attached.  Sorry about that.
>
> Alex
>
> On Mon, Jul 24, 2023 at 8:25=E2=80=AFAM Josh Boyer <jwboyer@kernel.org> w=
rote:
> >
> > The first patch generates:
> >
> > [jwboyer@vader linux-firmware]$ ./check_whence.py
> > E: amdgpu/gc_11_0_3_mes.bin listed in WHENCE does not exist
> > [jwboyer@vader linux-firmware]$
> >
> > Can you fix it up and resubmit?
> >
> > josh
> >
> > On Fri, Jul 14, 2023 at 10:21=E2=80=AFAM Alex Deucher <alexdeucher@gmai=
l.com> wrote:
> > >
> > > Hi,
> > >
> > > New amdgpu firmware.  Please apply!
> > >
> > > Thanks,
> > >
> > > Alex
