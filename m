Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D470C71136
	for <linux-firmware@archiver.kernel.org>; Mon, 16 Jun 2025 12:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6043C4CEF1; Mon, 16 Jun 2025 12:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0429C4CEEF
	for <linux-firmware@kernel.org>; Mon, 16 Jun 2025 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750075248;
	bh=79RAhYgTe/CYxfMQWrMakwWfTUmvf6PjZDXz11MMlkA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=co7MkRDTMPIXJhqb0C4DwZML0+R5fOm3kNPtDxoMlJ12z+AVdcm6/2C5ktgirz91R
	 KsNPurNlRR47unjhHg9S4xnmcLiXZpee+vZBTqooTh6d9hOp5Q11Kn22DF0O0Nd7qf
	 rQUW41zAP2/rxOiV64Z3Z9lldw/Du3iXUAIP6AyhcgtUBX3WafPzkefVJh4diYKIlY
	 t2b1tm+VuNbKOMWrLPq18BdnXiB3odYR4A6SiliVVhpDVlcshRsbHMZGDjgH97ksN4
	 EMcCQK2hMY/iszdaovIBLw/ILmLEi7PXcZkPZDkfZUxB5bEmFeVwrV5TvZ40pnSMD2
	 +3fpWXiMmuwGw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70e3e0415a7so39780077b3.0
        for <linux-firmware@kernel.org>; Mon, 16 Jun 2025 05:00:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAmx5RjpdGGf6tkeddMXNRS2HpOIoeCgt6bX5o6ZH1wkEysiNauF1+0OsWpOcJ5VDvtRxfp1kHE+tumXrM2Q==@kernel.org
X-Gm-Message-State: AOJu0YxCXgcXujGK6UAYw1/5rm+Yqx0gT5snOBoxkh5NLBC8LVIEhVdi
	gBGnAk0rErmUAKTYfLhKxDhP8KLmNaFXiOepmWJYIgxWwDHBQ3lJSa+8Nm1AXYM3VmcDuc7jlae
	tK0lbARudoU8dhVqyF25alNsMiGs4bR0=
X-Google-Smtp-Source: AGHT+IGq7e6wM9u+650yv5+r7yNy87/ef/G6jtTSfeUw6s0SBTZPqtEBZqNSbLUZnnVji4B7Sn5zZhWQoyGst6P2SJY=
X-Received: by 2002:a05:690c:7105:b0:710:e81e:1364 with SMTP id
 00721157ae682-71174831507mr125162307b3.6.1750075247781; Mon, 16 Jun 2025
 05:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <e036373e-0356-4fa1-b39b-78eaf02179d6@oss.qualcomm.com> <bwgnaeh2ozuqmkmognsvnpumqdprlr6rmcbvyd2dezglgna534@qftt6iydraol>
In-Reply-To: <bwgnaeh2ozuqmkmognsvnpumqdprlr6rmcbvyd2dezglgna534@qftt6iydraol>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 16 Jun 2025 08:00:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4WkiYLOOP9r2nAZArt29xberP-=P2+ed1Q76ShkcrioA@mail.gmail.com>
X-Gm-Features: AX0GCFuG-RmQH7Ivq2Y3gYLcgwttpBCbdWNhH0r0A-uY3rKKP6FyT-1h2RMBg5k
Message-ID: <CA+5PVA4WkiYLOOP9r2nAZArt29xberP-=P2+ed1Q76ShkcrioA@mail.gmail.com>
Subject: Re: [GIT PULL] qcom: GPU firmwares for X1P42100 chipset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-firmware@kernel.org, 
	dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
	Rob Clark <robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 6:56=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Jun 16, 2025 at 10:34:06AM +0530, Akhil P Oommen wrote:
> > Hi,
> >
> > Please pull the gpu firmwares required for Qualcomm's X1P42100 series c=
hipset.
> >
> > -Akhil
> >
> > ---
> > The following changes since commit 12fe085fa4096dedd82a9af0901fb8721379=
011f:
> >
> >   Merge branch 'qca-btfw' into 'main' (2025-06-13 12:32:39 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw=
-x1p
> >
> > for you to fetch changes up to 4cb2b59c30c23fdda8c4b00f00397fb7b4992758=
:
> >
> >   qcom: add gpu firmwares for X1P42100 chipset (2025-06-16 10:14:53 +05=
30)
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/585

josh
