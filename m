Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0A4CA0EFA
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Aug 2025 15:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68B30C113D0; Mon, 25 Aug 2025 15:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B90C116C6
	for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 15:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756136378;
	bh=740njoQiM2JsbFHM7xbP1yY4paD1tpjY5nApfpuwEtc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=M2+WnFqHFHmAWbfdvUhEgbuiJSJmTlu0qopLFC0vyccGALWi1LXdyWBr4gAEPEQx9
	 tTHygbNK8KaNOL3Dq1twqJ2mrf42UP4/nUakXfBgqAQEXVHFXb9VqN+MWXVVwTP+57
	 NO0w92+cXeyPdp6TCG07iT7JMaohlcsJvuR2fCZRt+zCBI/mFrotM3shbJumsZkWQV
	 RtigJhvPYGVFOCri0bOA579WuJyKLzThZH3mvrEjyjGoeJL6O+0VVxOFOTrJcYCi0V
	 U7iWWLVbLB4Kw1nujKVY3U9TNFyU319YKPbn6z+Xt3IIsvJg6HqjItlVR9QJGHWS88
	 HXRBQ1Ief56RA==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e9537b957caso1357277276.2
        for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 08:39:38 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz56a2PHaizVPhvaLVYbkAHT90bAuxEjq058GAltbkpL4KBW0x8
	Kg1Y8fgZEclJ9T5YD8pPuD6CaCvksNB8XzQxLav+xje41CZTvs6w4HScAOXtEev71c1M3Ph9Z/G
	MvWMq8zmOYh05i6NEN9eJhdchYZ/gxg4=
X-Google-Smtp-Source: AGHT+IFa/cTsXnbHf76H1/iluINL3SGdVTnl0kih8ad3X5weLjAma0Sa5Ofs+Krh9qI5CVFJb6pj1i1Khtvm8R5aBdE=
X-Received: by 2002:a05:6902:1003:b0:e95:2ca0:871b with SMTP id
 3f1490d57ef6-e952ca09accmr10120962276.42.1756136377490; Mon, 25 Aug 2025
 08:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <089a2122-0e4d-6a7f-5a03-885a5c67e3a6@quicinc.com>
In-Reply-To: <089a2122-0e4d-6a7f-5a03-885a5c67e3a6@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 25 Aug 2025 11:39:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA72LOmeygzbNXJuWbH8u5DLY-WdrmhH5Fez4QV-2TZ8rQ@mail.gmail.com>
X-Gm-Features: Ac12FXwyFv8YKvbghFB8qGX0cyGMEbYP-xeaBie0Zf2VMtf0SjoOtdRfDXJ_DRU
Message-ID: <CA+5PVA72LOmeygzbNXJuWbH8u5DLY-WdrmhH5Fez4QV-2TZ8rQ@mail.gmail.com>
Subject: Re: Reorder VPU firmware entries in WHENCE
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 7:16=E2=80=AFAM Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Hi,
>
> The following changes since commit ffaf66fcc58457e8920d430d7d1e28ef4707fe=
64:
>
>   Merge branch 'amd-staging' into 'main' (2025-08-25 03:33:12 +0000)
>
> are available in the Git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> reorder-video-fw-name

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/661

josh

>
> for you to fetch changes up to 04ee01e56d787607342d8168dd2f2500a4787714:
>
>   firmware: qcom: Reorder VPU firmware entries in WHENCE (2025-08-25
> 16:43:24 +0530)
>
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       firmware: qcom: Reorder VPU firmware entries in WHENCE
>
>  WHENCE | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> Thanks,
> Dikshita
