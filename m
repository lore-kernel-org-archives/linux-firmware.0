Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE91ED462BF
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 15:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1DD8C4CED7; Wed, 13 Nov 2024 15:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD79C4CECF;
	Wed, 13 Nov 2024 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731510010;
	bh=rOTKgEN7AQTPtDYa90FhNhr0jkFxIaC9XwCYe1Rw9L8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fo74Cp5T20xGuBuJoWDCvx6LD5fW2whKrRrXb17TPB4OMRT1LOA9Us25T5mAjPlyR
	 nrsDeXnaopY0k8Ts8b8Uqehjn1K7kYCdkInuP/6R4qlZ6RMGVxJn3ZlWL5HRVwU1lo
	 TH61mvq5rxaTeCsP4wDNHeigL+beLbizUaOmrxwQCy1zRkBrlomPGLIpGt/UBAa/Nd
	 wCyUoJ8za/wau7sCbE/qdEkPshIzaqKo5HYhYUI2c2JJ3pI5uyuZ8ifFp5qFCU/EWZ
	 kYuNrF/luth8/mOtWqFwqnfKsrzKDtvkl4pdy+E+D9vp37Dx7HUnq7mCrz0fDclzoD
	 qpSUYLOmwl9sA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e8063533b5so59255157b3.1;
        Wed, 13 Nov 2024 07:00:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVO2q3K0EP+fUau9/P/2+8JG7piTxLsl0bargYjd7T4QN1aX9tYN/UBUanr3Aso8gyhAWGvHwc81xbQJv9HJJM=@kernel.org, AJvYcCWi9MvxunJG2xB2pyXmS1lkTxjc/MLxx3dyEyY2NARpc6OlUwti3ipKD5ClqQlE0FQnG4kCxgnTcMOlRIM=@kernel.org, AJvYcCXP6GuMS/GdzNPcwXScMPi3NFC0og993rOL9pW35W/lrEoK23kxyBiCAUqazEMJfYOt8QYQHogH86c=@kernel.org
X-Gm-Message-State: AOJu0YyERc9B3QY9uLmLyHs37jYDRuB5yINGHrYH07lCaMnMODE8KVJq
	vBGLxGMdv4J0RZGXUtp6x9EXXuKT9xDDsG+Tgb1RpmCFFLNqTiLwisQ3fnZo2FBMedY3AS8FQVB
	zbPxRiL788Mhyt+zzLGvZvWPzYEA=
X-Google-Smtp-Source: AGHT+IEmP17XOlHyVHoRfkmmhg8PsBNAz28CtWvLaddcY42EXpWkdkEdFUm+d5rnkoo6+m2flCQkGCHiYPvxN7tMfRM=
X-Received: by 2002:a05:690c:6f88:b0:6e2:12e5:35b4 with SMTP id
 00721157ae682-6eaddc1e448mr203356657b3.0.1731510009127; Wed, 13 Nov 2024
 07:00:09 -0800 (PST)
MIME-Version: 1.0
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com> <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>
 <v7ltgyxqzrt7pmcgy7bfsanfxbuu5fr4rn7yxg7hal5londeqj@44v32zea44hg>
In-Reply-To: <v7ltgyxqzrt7pmcgy7bfsanfxbuu5fr4rn7yxg7hal5londeqj@44v32zea44hg>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 13 Nov 2024 09:59:57 -0500
X-Gmail-Original-Message-ID: <CA+5PVA79SNW6rPF7XCMTE5LswQu5Jxf+ajAzV+JWRpXz8EZc6w@mail.gmail.com>
Message-ID: <CA+5PVA79SNW6rPF7XCMTE5LswQu5Jxf+ajAzV+JWRpXz8EZc6w@mail.gmail.com>
Subject: Re: add venus firmware file for qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, 
	"Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, 
	"quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 9:43=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Nov 13, 2024 at 07:22:28AM -0500, Josh Boyer wrote:
> > On Wed, Nov 13, 2024 at 5:50=E2=80=AFAM Renjiang Han (QUIC)
> > <quic_renjiang@quicinc.com> wrote:
> > >
> > > Hello
> > >
> > >
> > >
> > > The following changes since commit 6482750d396980a31f76edd5a84b03a96b=
bdf3fe:
> > >
> > >
> > >
> > >   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> > >
> > >
> > >
> > > are available in the Git repository at:
> > >
> > >
> > >
> > >   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git video-fi=
rmware-qcs615
> >
> > Merged and pushed out.
> >
> > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/370
>
> Josh, it is very nice to see a promt merging of the firmware, thanks a
> lot. However is there a chance that you can give reviewers a time to
> react? Usually there are no issues, but I think it is important to let
> the comminity to be able to review the patch / pull request.

Happy to let things sit for a while.  Out of curiosity, what exactly
are you reviewing?  They're binary blobs.

josh
