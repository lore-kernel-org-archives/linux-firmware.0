Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4230CAC5B8
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Oct 2025 12:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 886ECC4CEFC; Thu,  2 Oct 2025 12:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA31C4CEFF
	for <linux-firmware@kernel.org>; Thu,  2 Oct 2025 12:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759407677;
	bh=t0N6yeDWrsWVNPmfCDAclOlGwoCtRSUCfDPEXMg6iZc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kpBpXNK5VXplejH64m2eSYb4Fb/2HOVawV06mx8RrDmg47Om+G3FgJV+lL4zPqB9X
	 eTX5adEv70IvhY3Nk0ngbGrKtFDSJ1MTrL6pU9kARTV/43xdb4ucc9Z5yOuACbxeJx
	 rZMdtLTifGAX5q2yYPpLkzlH8/9NnYQ8kRauhvxMns4XnS/D72WvrWECjtXhm73May
	 9fbInUc5QQ2zciWvaXnMNIz63U057m/ZyfuhJUcYigv6T28zJQcb3+aY+EKwRk9ZJ0
	 9E3mvXUU2kHYvEZkmfrlIwzOW0HzHTa0CHLJVOEz9e5e65YL1k16Wp5MCO8jjR9FDH
	 mWIzMQ32n3gqQ==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6352c8b683eso1329885d50.2
        for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 05:21:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzv0j4Wz68NscPxOzGQwbTk9XSYNV3hJ7rupOP5SZFnePCU8oOkC5jw0yqLeFJdK/aItIKYkwVeEh6IXpYBg==@kernel.org
X-Gm-Message-State: AOJu0YzO9hou+nNQ2C5WW8z5eRPQuoYxhCcvdTHYdloM+Yom+qj515k9
	QzcSC/sWEc+XtKeJUYH56ZRpYnudea5qtcwp3HYm6STlh4n6i/5eFxkMMU3cap2dF9iawLwmxRN
	levNPIUvh1jyv6VTxPp/SX2bS6Y5Zie4=
X-Google-Smtp-Source: AGHT+IFOu5+kArP0ZmvZFioUg9pd5G7NKn5p/XSeLttF8C9L+Ut43odOIq4lxyPflHX9JPz1zgpjGOa8EBfjhhDa4VQ=
X-Received: by 2002:a53:bdc6:0:b0:636:1fde:a4e1 with SMTP id
 956f58d0204a3-63b6ff7eb86mr7353847d50.24.1759407676651; Thu, 02 Oct 2025
 05:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <ff27f712-a96e-4fa6-7572-a0091537d8ac@oss.qualcomm.com> <cxo6jagoe5dnlrnezjqlbnchxnkyqnce42vbikpzgyi2vdecof@lngzd5nrd25u>
In-Reply-To: <cxo6jagoe5dnlrnezjqlbnchxnkyqnce42vbikpzgyi2vdecof@lngzd5nrd25u>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 2 Oct 2025 08:21:05 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5J+4KC1RUf4+DLf6gPLaRM30ANk50M-Pnbcn0zeQyxeQ@mail.gmail.com>
X-Gm-Features: AS18NWCi6QU63wz2MNyFdlv83YCWv1rTcydsfhT3ymv3I8j8yU7AS12DlJA6KUA
Message-ID: <CA+5PVA5J+4KC1RUf4+DLf6gPLaRM30ANk50M-Pnbcn0zeQyxeQ@mail.gmail.com>
Subject: Re: update video firmware binary for SM8550
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, linux-firmware@kernel.org, 
	DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 9:52=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Oct 01, 2025 at 05:09:37PM +0530, Dikshita Agarwal wrote:
> > Hi,
> >
> > The following changes since commit ed924f6db3c973f941fd6c6317c0d52664e8=
3e5a:
> >
> >   Merge branch 'robot/pr-0-1759253351' into 'main' (2025-09-30 17:36:46=
 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > video-fw-sm8550-update
> >
> > for you to fetch changes up to 208c760dc79677e0ab4fa596e23e4dd9394e00c3=
:
> >
> >   qcom: vpu: update video firmware binary for SM8550 (2025-10-01 12:14:=
09
> > +0530)
> >
> > ----------------------------------------------------------------
> > Dikshita Agarwal (1):
> >       qcom: vpu: update video firmware binary for SM8550
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/715

josh
