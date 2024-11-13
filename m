Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502F0D41C04
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 12:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3627BC4CEFE; Wed, 13 Nov 2024 12:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B44C4CEFF
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 12:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731500560;
	bh=D7KD4AVVhy//+7w3CxTCbg4Maysv3FGJJhZOV0maFbI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MkGxfZ3qwT6SJRkSZHzZ0TN0kCN3hc7JZzYhYsQeE2BgyHVje3Hy5+wpBkYguVam5
	 iNEUuxX7NCy4vxnVqOqt5IjJ/XHxMaqo2a+Eo/08VjcqB7/XT4rakNmRMS4uSCPiL3
	 pCs5rMNAgeDSAMDSJF970IJJGu663r9lLUcFW9otlO08J4kdlVX/tl6NG1gXaA+yq/
	 S/THRBZvESlg83wWyhXodRAfm+VMRiWpg2JwzT54FHTF8wd6aqQorArBgQSyEbc2Sy
	 0nFC6RLnsrkHa8LFpyWcwwPI6L5nNRwWgbhygK802tyA05rY0JgnJAwf4ChRo9rEfN
	 +xLuGV2zBJmKQ==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e5a5a59094so63236697b3.3
        for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 04:22:40 -0800 (PST)
X-Gm-Message-State: AOJu0YzHjAo362iCSTJCh+fYeEG0mFIKYdO3zVsRogefomw4wjo/yEmc
	OHX3Z8+LpRABP6AMWEeXfECO/vkGpKKsiDZeUSANUE5ALrHUhW6wtOhe2v17ZXm+a2LlKC2pYSC
	vclbG49sYx62fmM4eiVZn1QA+QBM=
X-Google-Smtp-Source: AGHT+IHIOpL6zRQAtdJBPqaOsymQvJlBKZ7bPeQiFcapB0ao+z9i+u8WcdJWiKqsqI/zXygI5KM20SNxH9yH+N7iXog=
X-Received: by 2002:a05:690c:9a8e:b0:6e3:36cc:eb74 with SMTP id
 00721157ae682-6eaddf8ae0emr183605027b3.32.1731500559284; Wed, 13 Nov 2024
 04:22:39 -0800 (PST)
MIME-Version: 1.0
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
In-Reply-To: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 13 Nov 2024 07:22:28 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>
Message-ID: <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>
Subject: Re: add venus firmware file for qcs615
To: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, 
	"Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, 
	"quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 5:50=E2=80=AFAM Renjiang Han (QUIC)
<quic_renjiang@quicinc.com> wrote:
>
> Hello
>
>
>
> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3=
fe:
>
>
>
>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git video-firmwa=
re-qcs615

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/370

josh

>
>
>
> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
>
>
>
>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:2=
9 +0530)
>
>
>
> ----------------------------------------------------------------
>
> Renjiang Han (1):
>
>       qcom: venus-5.4: add venus firmware file for qcs615
>
>
>
> WHENCE                      |   1 +
>
> qcom/venus-5.4/venus_s6.mbn | Bin 0 -> 922240 bytes
>
> 2 files changed, 1 insertion(+)
>
> create mode 100644 qcom/venus-5.4/venus_s6.mbn
>
>
>
> Best Regards,
>
> Renjiang
