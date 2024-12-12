Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E36E7717F
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Dec 2024 12:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C751FC4AF09; Thu, 12 Dec 2024 12:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AEAC4CECE
	for <linux-firmware@kernel.org>; Thu, 12 Dec 2024 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734005901;
	bh=lWAoiG5uGukFWOhg/FPQgIVqPaEsBUc7RSF0tu24Xxo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ntx/oMbZ2bfPKpw/7o7KhkdeNIhcjnuvhhhw+vc4K2NY66DZ4jL1FsT5YzlBK+JUy
	 5TeUg5H9IiJ25ttCPHyzxoZtX5urTEEmjj4B5s3UOwyJ6R2Urm9CWUz2gmtR8o19N8
	 nYYtAjWB6alh1xrGEVmfXEv+F/pL9qvNcLG6o9vDPalGe/VPAc/BxhoMIGoiLuwXSv
	 v5zS/FLvd3tY1RIP/clK9Kk3JhCY4P4WHkI0jabgYpsCqZkmur70buYe7l3ArxdyR4
	 D7Qe/SRQNcsoGkB5NnEdpeLBCGT/i4Gol5JIuBL/vb0TBU/deneHmS/F5Fy3X6UFeD
	 6egvA1rXT/VNA==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e39841c8fd6so346463276.3
        for <linux-firmware@kernel.org>; Thu, 12 Dec 2024 04:18:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWr8w/1mLOTJrGeqpBJDZENdYKioG3Dr8c1wvQhwFCdESjwezMXS05fBJ9a2mpyRcYbZUMvftlc0pxeuLuY0A==@kernel.org
X-Gm-Message-State: AOJu0Yw+pnqr2hghaYA1Fhimo8JiRjbXMmZHb4BsGiCWj1E5HYcY2Kow
	ue+YO2GykAApmNRjbJNRLU+eIeJDpTIPpP8K7YjeqEaDC1v6o5LrWJ3EcFh6nQR1giusywfV8bR
	cHczqWwMx7oyoaqc9F9VeTLfmFbI=
X-Google-Smtp-Source: AGHT+IGCM2B0i9y2fVet2R9vYw6j9leFWGPwt/StuAqDQf0e9Alpawy/ZzDFN2WMp2RX+HZan7KZZ24GKkCe3liJp24=
X-Received: by 2002:a05:6902:2185:b0:e38:4eb3:f5f7 with SMTP id
 3f1490d57ef6-e41c9740f63mr114876276.50.1734005900935; Thu, 12 Dec 2024
 04:18:20 -0800 (PST)
MIME-Version: 1.0
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com> <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>
 <6efc5b19-563c-c170-c2d6-179fef78ffeb@quicinc.com>
In-Reply-To: <6efc5b19-563c-c170-c2d6-179fef78ffeb@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 12 Dec 2024 07:18:09 -0500
X-Gmail-Original-Message-ID: <CA+5PVA55BowPa2SN5iF773kzzgThUd+qfmRNfD0SRM+0_wVpvw@mail.gmail.com>
Message-ID: <CA+5PVA55BowPa2SN5iF773kzzgThUd+qfmRNfD0SRM+0_wVpvw@mail.gmail.com>
Subject: Re: add venus firmware file for qcs615
To: Vikash Garodia <quic_vgarodia@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, 
	"quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 4:23=E2=80=AFAM Vikash Garodia
<quic_vgarodia@quicinc.com> wrote:
>
> Hello Josh,
>
> On 11/13/2024 5:52 PM, Josh Boyer wrote:
> > On Wed, Nov 13, 2024 at 5:50=E2=80=AFAM Renjiang Han (QUIC)
> > <quic_renjiang@quicinc.com> wrote:
> >>
> >> Hello
> >>
> >>
> >>
> >> The following changes since commit 6482750d396980a31f76edd5a84b03a96bb=
df3fe:
> >>
> >>
> >>
> >>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>
> >>
> >>
> >> are available in the Git repository at:
> >>
> >>
> >>
> >>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git video-fir=
mware-qcs615
> >
> > Merged and pushed out.
> With this, we have now 2 binaries in qcom/venus-5.4 folder, namely venus.=
mbn and
> venus_s6.mbn. There are no active client using venus_s6.mbn at the moment=
, and
> it was added to support video usecase on qcs615. It seems like qcs615 can=
 use
> venus.mbn itself and we do not need separate bin. Let me know if you are =
good to
> delete venus_s6.mbn, given that there are no active client using it. If y=
ou are
> ok, we will raise a PR to delete it and update venus.mbn. You can find th=
e more
> discussion here [1] on the same.

Seems fine, but you likely want to include a symlink for venus_sb6.mbn
as Dmitry suggested.

josh
