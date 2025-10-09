Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3F9CCD185
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Oct 2025 14:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0613BC4CEFE; Thu,  9 Oct 2025 14:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4718C4CEF8
	for <linux-firmware@kernel.org>; Thu,  9 Oct 2025 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760019492;
	bh=Xyhb4n2WVKbThy/1HVCHZVj0P9id4xKf5fCndCcArCs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KvURui1xg15BOamhhz+KvUwj5uzKfxmPCEOqruv5HRsbuU3Ez4gUKuf8d1/0lv8H3
	 9mRIVYXp31zrAIxj4mSd87ATJd3fffpq/7vXE0xzXjdARg37HrcbbMABnowKlQBBjW
	 pzTCUEOk0TSuHaRxXAagofmf8w1KfWtG2xi5bZyS2eMxOBj10MeibyXnDoxPAf+4OU
	 K2hHxBuASuZ6duz4b5Yj+zZ7D36cSAbg5X1aIHETGUWDLV45r8hULubkqoxBvjUltb
	 7Vf7CqSZGGvctnZ9VsrHfj8C0cWbh3/z5sOk+BcUzxH8scyfqJdAl8QC5jlGi6lM1l
	 3WLyMvm622BQA==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-743ba48eb71so27601387b3.1
        for <linux-firmware@kernel.org>; Thu, 09 Oct 2025 07:18:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxgs3p5KEA63Pigcjqz2U9ybMr1q0TbEzIYrKFqRdT9wRES1KztS1O55J+twpg4thFQmJXmdU3L1HY3h4giA==@kernel.org
X-Gm-Message-State: AOJu0YxtPPDMAMalKF7wszTAW+yfFSK9tpMlUUPObePxXNWWGOATuE5n
	IigXF6zjPocgsCKIaIDAAFHRwm67YT2AHHt6nnHvf2uUmjo0dBGiYKegnxUQaCoFfivql7/k3o/
	UPy4io/XgqDtkrKcy0IOgtxregoFqTXI=
X-Google-Smtp-Source: AGHT+IFfNyo0gbwiA3WzIX6Q1y6llspXG/OMF8RwRcnwHopv174EPBY5Q5B3nzL33WkeMPe3ht340K+NPAwMdB98m1A=
X-Received: by 2002:a53:acc3:0:10b0:63c:da71:e38f with SMTP id
 956f58d0204a3-63cda71ff12mr2523729d50.3.1760019492162; Thu, 09 Oct 2025
 07:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <00280310-a655-4251-b3b8-a5ff26d0cd97@oss.qualcomm.com> <6m6qyzti23x5h5wb5k3zui5ixpvjnswozhtfmwwowopqswqdoo@6ckuycojgn5w>
In-Reply-To: <6m6qyzti23x5h5wb5k3zui5ixpvjnswozhtfmwwowopqswqdoo@6ckuycojgn5w>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 9 Oct 2025 10:18:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5LHirLaNPB03ZBLn-MLquP0oDbggbdYc7VDVw3HeT6wQ@mail.gmail.com>
X-Gm-Features: AS18NWCa80R_tTHMu6O8UAxs2OOz8qWhK4iPCcUXB77Jn90XSVy8oQgitNlr5gw
Message-ID: <CA+5PVA5LHirLaNPB03ZBLn-MLquP0oDbggbdYc7VDVw3HeT6wQ@mail.gmail.com>
Subject: Re: [GIT PULL] qcom: GPU firmwares for Kaanapali/QCS615/QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>, linux-firmware@kernel.org, 
	Rob Clark <robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 5:07=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Oct 09, 2025 at 02:08:27AM +0530, Rajesh Kemisetti wrote:
> > Hi,
> >
> > Please pull the gpu firmwares required for Qualcomm's Kaanapali chipset=
.
> > Also, updates for QCS615 and QCS8300 GPU firmwares.
> >
> > -Rajesh
> >
> > ---
> > The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f5=
9034:
> >
> >   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21=
 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw=
-oct-9
> >
> > for you to fetch changes up to d387533db74fa60ee973007d6ba2455d9ae054bb=
:
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/726

josh

>
>
> >
> >   qcom: Add firmwares for Kaanapali GPU (2025-10-09 01:17:50 +0530)
> >
> > ----------------------------------------------------------------
> > Rajesh Kemisetti (3):
> >       qcom: Fix QCS615 chipset's GPU secure fw
> >       qcom: Update A623 GMU fw
> >       qcom: Add firmwares for Kaanapali GPU
> >
> >  WHENCE                          |  10 +++++++++-
> >  qcom/a623_gmu.bin               | Bin 51544 -> 53516 bytes
> >  qcom/gen80200_aqe.fw            | Bin 0 -> 25880 bytes
> >  qcom/gen80200_gmu.bin           | Bin 0 -> 108518 bytes
> >  qcom/gen80200_sqe.fw            | Bin 0 -> 118100 bytes
> >  qcom/kaanapali/gen80200_zap.mbn | Bin 0 -> 12088 bytes
> >  qcom/qcs615/a612_zap.mbn        | Bin 2977 -> 14256 bytes
> >  7 files changed, 9 insertions(+), 1 deletion(-)
> >  create mode 100644 qcom/gen80200_aqe.fw
> >  create mode 100644 qcom/gen80200_gmu.bin
> >  create mode 100644 qcom/gen80200_sqe.fw
> >  create mode 100644 qcom/kaanapali/gen80200_zap.mbn
> >
> >
>
> --
> With best wishes
> Dmitry
