Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E77D41C04
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 12:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE34DC4CEFF; Wed, 13 Nov 2024 12:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCC8C116B1
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731500581;
	bh=+DagNRXUZ51bvdZoLWkk2U2+ypZB6Law0YMyvAmoWRg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nSILL5UGQvEPvzauwD4Ech7z19fE0nFcoZEEf4cm6h/FslUI/whE/qtC949KJDqq9
	 51wtRteDn41rpruC1z4pkiGv6ZGihZIEZX2VM184RYECRSZjvewc12Li9o+v2G5DYY
	 +DCq05P/gtzoQWU/Knb6tx/OlrjgX9hGVPf5opPBmk/hW4ziHCsJe1ubV5IG5ChmNR
	 xrjL2jZGA2E7XMStAkhlDtgT9OvVoweVw5gU1WpHml1Obshldbs6hONPE8E3Rovt4E
	 FV06LSedEUsRKDbmYoL5UkuAWq+DVZYDbwnUIxawJiFf53b4tfOiFoWDY02CFjtCLr
	 WjPseS1/13kZw==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e34339d41bso59924937b3.0
        for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 04:23:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUI7ChglOBpRmf1edJr7u6DPBoa1obripAgRGWKLjWhMuR+0DGquCS0E2ZNsy8mjUqrGxm2UIlqg9TNnmbEZw==@kernel.org
X-Gm-Message-State: AOJu0Yy/Oxjogt9lOSXJcNlO+GAP4127RKa2WsjqCrEf49lk5ohyl0C3
	yy2dJISmEVaxpOg5DpkpLumsMRiOHbVX9s4QgyVLHsuGmed1h9maiHsuWQkgCeGyiP+TET9vB9e
	tWUDXrFW2D+VcAkWqUthboQA2tu8=
X-Google-Smtp-Source: AGHT+IFgzrFBg/GZ4zTyG8L9UbEL7D37Duf8g+f06JfdXKokazlrBnSZrDOAihKx1E0oLCICfkq5D5cij5O2wwrfdCQ=
X-Received: by 2002:a05:690c:6f83:b0:6dd:bace:572 with SMTP id
 00721157ae682-6eadddad874mr193171117b3.19.1731500580839; Wed, 13 Nov 2024
 04:23:00 -0800 (PST)
MIME-Version: 1.0
References: <6353f092-9816-8221-1233-c423767320ac@quicinc.com>
 <25xjjmnyg55hs7mqnqtk6tae26lr2r33qfon6rfimnonqzoitv@3bcpd4ybqqtk>
 <2bab11a5-ad3b-d9c4-f3ca-f077a0a3ceaf@quicinc.com> <CAA8EJpoO=2wcdWcdfvE=CmayGn-a5ms2Hg_hdWF_bWG1JWaXoQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoO=2wcdWcdfvE=CmayGn-a5ms2Hg_hdWF_bWG1JWaXoQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 13 Nov 2024 07:22:49 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4F-Qh6vM8sfkJP9qhaXjwL5Ex+anH91fh+4pcJhhL5-w@mail.gmail.com>
Message-ID: <CA+5PVA4F-Qh6vM8sfkJP9qhaXjwL5Ex+anH91fh+4pcJhhL5-w@mail.gmail.com>
Subject: Re: update venus firmware file for SC7280
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 7:15=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 13 Nov 2024 at 08:14, Dikshita Agarwal
> <quic_dikshita@quicinc.com> wrote:
> >
> >
> >
> > On 11/13/2024 11:15 AM, Dmitry Baryshkov wrote:
> > > On Wed, Nov 13, 2024 at 09:54:51AM +0530, Dikshita Agarwal wrote:
> > >> Hello,
> > >>
> > >> The following changes since commit 6482750d396980a31f76edd5a84b03a96=
bbdf3fe:
> > >>
> > >>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> > >>
> > >> are available in the Git repository at:
> > >>
> > >>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > >> video-fw-update-SC7280
> > >>
> > >> for you to fetch changes up to e95e9e07a7983f9e0e12fe9a6c185cf5b07fe=
2f8:
> > >>
> > >>   qcom: update venus firmware file for SC7280 (2024-11-13 09:48:13 +=
0530)
> > >>
> > >> ----------------------------------------------------------------
> > >> Dikshita Agarwal (1):
> > >>       qcom: update venus firmware file for SC7280
> > >
> > > Commit log says: "Update WHENCE version string to match with updated =
fw
> > > version string.", however there is no WHENCE update.
> > >
> > Oh, Seems missed to add that in the change.
> > I have updated the commit with WHENCE file now.
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/370

josh

>
> >
> > The following changes since commit 6482750d396980a31f76edd5a84b03a96bbd=
f3fe:
> >
> >   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > video-fw-update-SC7280
> >
> > for you to fetch changes up to aeede7afb7a186b62f9e1f959c33fd5f2dea0f7a=
:
> >
> >   qcom: update venus firmware file for SC7280 (2024-11-13 11:40:36 +053=
0)
> >
> > ----------------------------------------------------------------
> > Dikshita Agarwal (1):
> >       qcom: update venus firmware file for SC7280
> >
> >  WHENCE                |   2 +-
> >  qcom/vpu/vpu20_p1.mbn | Bin 2031620 -> 2026452 bytes
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >
> > Thanks,
> > Dikshita
> > >
> > >>
> > >>  qcom/vpu/vpu20_p1.mbn | Bin 2031620 -> 2026452 bytes
> > >>  1 file changed, 0 insertions(+), 0 deletions(-)
> > >>
> > >> Thanks,
> > >> Dikshita
> > >>
> > >
>
>
>
> --
> With best wishes
> Dmitry
