Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5FFCAC592
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Sep 2025 12:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25273C16AAE; Mon, 22 Sep 2025 12:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB58C116D0
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 12:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758545593;
	bh=LQYmCatPDNuJWLEb5GqmIL8fAu9V5AtZkAMDo+tPk1M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jRAbWAHjr9/rNDWr+eDx70P30B5kI38kNKXC1BsW1ZH4croS5wwX/+tpDR7Fj9dpS
	 4STneZ8dwKPi9we0RRbdP3LcFV+PXIK+wGgR8a0jRL8c8s6HuylqDuYiEMNFiXLaJV
	 ErUJvKZnl5b8Vuenqd3/d7dUHKMmccdLs6n25dLnBXPbB1tvSDFnATaRse2qrx4J7d
	 vPI42ura6pIbiN8Dwe48gvggiqaabKNVvGd+OZPKunF3goT+q6YKjuEOlGOuxSJRuI
	 Ks90VMr9L3tH6wzlVNpjdzSDB07EDCk8z396+Ohr1tDo9EJJbmcJ0fOnpBSbn9zXWf
	 hibvrMHiThQrg==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ea7cdf867cbso3028565276.1
        for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 05:53:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsmODBW3hFOOOoUBcDByLL50Fh5kcMIEJFtRSQnx2x8b3kN74YFY3kKr/6o/1B9cvrtS0AGqhRFHSDr5rRZw==@kernel.org
X-Gm-Message-State: AOJu0Yy4kU38M/sJD1vhMgI1ozfp8T3NjHa34+fbTs5DTVQBv0XO9/oi
	gipqFhk/EkNna9bwoMYoGuw9pRTZVQPGRZHmslJ37M5W8k6PV+MpTQPpaXs3qZcAdo0YnAogx+f
	0kqAQwVb7RDC5kYogBm3JI3egUakpXhk=
X-Google-Smtp-Source: AGHT+IERB0vAWj+4CSx2nBkJlAozCc+IuV6k/xED6Sulx3XSia8iM4YUcyC0iYrLWM2DSDVk6lLFN+HfyKbMUNhe8V4=
X-Received: by 2002:a05:690e:249b:b0:62a:e5e3:b1f with SMTP id
 956f58d0204a3-6347f5514ffmr7136053d50.18.1758545592257; Mon, 22 Sep 2025
 05:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <575b65b7-a9c8-481a-bdaf-bbab39389b62@oss.qualcomm.com>
 <mtdzhkdv7ex76o5gdfw3llz7r2g6yfonzsmvny6gy5wpf2onuo@m7kibf5nhoji>
 <14c359f7-d451-4cb6-9e38-5035566c0a2c@oss.qualcomm.com> <vqxdvetghn334szzrtwkgb2hgjck63lz25autamu5doru6co2j@ur7ptcbx2f6n>
In-Reply-To: <vqxdvetghn334szzrtwkgb2hgjck63lz25autamu5doru6co2j@ur7ptcbx2f6n>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 22 Sep 2025 08:53:01 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6pMQH9ZappwdrjdN1PiLy8ZBw9OweHAaPshVxjksJzNQ@mail.gmail.com>
X-Gm-Features: AS18NWCZ3eY2kp_dsOT8W-2D3gr3-TgkkuQ4LW4X4jP-l8Hkh5cmLQjbZhmh1nU
Message-ID: <CA+5PVA6pMQH9ZappwdrjdN1PiLy8ZBw9OweHAaPshVxjksJzNQ@mail.gmail.com>
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Venkata Kota <venkata.kota@oss.qualcomm.com>, linux-firmware@kernel.org, 
	bkumar@qti.qualcomm.com, ekansh.gupta@oss.qualcomm.com, kssb@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 7:04=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Sep 22, 2025 at 03:59:02PM +0530, Venkata Kota wrote:
> >
> >
> > On 9/22/2025 3:49 PM, Dmitry Baryshkov wrote:
> > > On Mon, Sep 22, 2025 at 03:39:54PM +0530, Venkata Kota wrote:
> > > > The following changes since commit 493de17dee9901605e69ad804815cd74=
08d84547:
> > > >
> > > >    Merge branch 'robot/pr-0-1758303798' into 'main' (2025-09-19 18:=
33:44
> > > > +0000)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > dsp-fw-qcs8300-dspmon-125
> > > >
> > > > for you to fetch changes up to 704b227a99683715bc8f3fb514bc6b9d1837=
2f28:
> > > >
> > > >    qcom: Update DSP firmware for qcs8300 platform. (2025-09-22 15:3=
0:25
> > > > +0530)
> > >
> > > This commit isn't present inside the branch.
> > I see them now. Please check.>>
>
> Now it's good.
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/701

josh
