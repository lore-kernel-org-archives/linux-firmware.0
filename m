Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC32C28B2F
	for <linux-firmware@archiver.kernel.org>; Tue, 11 Mar 2025 16:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 591EBC4CEEC; Tue, 11 Mar 2025 16:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A07C4CEED;
	Tue, 11 Mar 2025 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741708937;
	bh=FATqXdTmqUlbjh8aXD7sgyEgU9iJORMV0z+sodYGG+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OGidhN9dOMgRBkAhnB/B8WdaSOlgxlPKdtOaXS7CeVTSpSH1S87Rd50YNdyzQR07B
	 +jIXyPCFzd9PaenVEC5Qzd74rg3HqPnr0E8ILQFGFAevoZ/SlO+DKE8xh01TRSyquN
	 Z5rK6+v009YIuYWlv/LkVh8/XHyg2AmtzABW0Xt1JbIOAXKmc/fMMOWKTQFWGAcuEx
	 NQfq04oMK44a8qSZZf/FrCG4LZRCJ1Cv8cN0Wz/e9EB0UMrSRlUDYGdUcy8y7h0EIn
	 esk+LgHgItTgYd8WUTawn71ql/7cyQVglmyNMCuyMH6sktNlVWim8HqF/qdmO2U8Ty
	 hnIgPN2r4YgTQ==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e62d132a6a7so4019590276.3;
        Tue, 11 Mar 2025 09:02:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5KsvVxWwNuaTEbUV5FVoI4kIFbXSzhzrLV9eu1j9r2rEaqH+GzPbvyfr74bfNpEU1/yf4foP1V4veXenZVg==@kernel.org
X-Gm-Message-State: AOJu0YxnrfyUup5idxQNDVvdT1jTJmPL7CEVxeVj7OBl+GpjxmunDeJK
	eHIlLu0S2ENVzB+fEQutnHBCVAh+zHfhEP/dGv7lHQAGDxDNhHKkSgUYEDDOJjN3ZILc8YeFlUO
	XtGScGY3d0dSvXhsWN7onawembzM=
X-Google-Smtp-Source: AGHT+IHrF1IAVXdSLTH4KJiA28Lnvz/dIIudAIWoqxa1n6nZBRDwtn2klIIvwDPFylF+aBlNoOUaWzmvpaUFw6wEvA8=
X-Received: by 2002:a05:6902:2386:b0:e3c:9fb5:837a with SMTP id
 3f1490d57ef6-e63b5231e7dmr4682689276.41.1741708936470; Tue, 11 Mar 2025
 09:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <3c83ecf5-2536-4fe5-bf01-08d6f9d12d82@quicinc.com>
 <fe88e76a-0f6a-4d21-b3b5-bf5d76b1f872@quicinc.com> <ltok2u6ubjreqel7j4uuh3sxlixysjafdj5k4ncspem443rwiz@p4zdcdkmmwfd>
In-Reply-To: <ltok2u6ubjreqel7j4uuh3sxlixysjafdj5k4ncspem443rwiz@p4zdcdkmmwfd>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 11 Mar 2025 12:02:05 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6QOecGC4n8O=51ktJ3DQm9m4Qh6KfNMW_G13pnqyGRww@mail.gmail.com>
X-Gm-Features: AQ5f1Jpo8Oi3KKn3XiQDz6unQNfBeGRHje1avR04QTOCIMjNKKLXljTFZ5yUBQQ
Message-ID: <CA+5PVA6QOecGC4n8O=51ktJ3DQm9m4Qh6KfNMW_G13pnqyGRww@mail.gmail.com>
Subject: Re: [RESEND] qcom: Update gpu firmwares for QCS8300 chipset
To: Dmitry Baryshkov <lumag@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-firmware@kernel.org, 
	dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/476

josh

On Tue, Mar 11, 2025 at 11:03=E2=80=AFAM Dmitry Baryshkov <lumag@kernel.org=
> wrote:
>
> On Tue, Mar 11, 2025 at 03:01:31AM +0530, Akhil P Oommen wrote:
> > Hi,
> >
> > Add/update the gpu firmwares required for Qualcomm's QCS8300 chipset.
>
> Nice!
>
> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
>
>
> >
> > -Akhil
> >
> > ---
> > The following changes since commit 11c4e60f95736ebd7fd98be5f54287d204c7=
1bfd:
> >
> >   Merge branch 'amd-staging' into 'main' (2025-03-10 17:46:53 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw=
-QCS8300
> >
> > for you to fetch changes up to fe52903ce2a8c3be254b34b20b9dae76aadf19d8=
:
> >
> >   qcom: Update gpu firmwares for qcs8300 chipset (2025-03-11 02:39:02 +=
0530)
> >
> > ----------------------------------------------------------------
> > Rajesh Kemisetti (1):
> >       qcom: Update gpu firmwares for qcs8300 chipset
> >
> >  WHENCE                    |   2 ++
> >  qcom/a623_gmu.bin         | Bin 0 -> 51544 bytes
> >  qcom/a650_sqe.fw          | Bin 31804 -> 31964 bytes
> >  qcom/qcs8300/a623_zap.mbn | Bin 0 -> 1054364 bytes
> >  4 files changed, 2 insertions(+)
> >  create mode 100644 qcom/a623_gmu.bin
> >  create mode 100644 qcom/qcs8300/a623_zap.mbn
>
> --
> With best wishes
> Dmitry
