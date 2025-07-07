Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0ACC83F07
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Jul 2025 11:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96F82C4CEF7; Mon,  7 Jul 2025 11:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F3CC4CEE3
	for <linux-firmware@kernel.org>; Mon,  7 Jul 2025 11:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751886301;
	bh=RYsgI1gQh/8IeF//TcwyG1EUmOFW7PSG++uOgzH4EdI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sc0RVuiOzj9GGPkwrvFWc+EWLlwQetIV3/ymA6MeIRTgwvSyvfOwVqkt2RnAgjHQt
	 WIGJzDMXFPspOOf3x+BqyGFTS/SIethNz+TimnbqJElwkSLNc9ym9MDsecxUJ7RO5E
	 Sljl1P+VYQLgu1Fm0WxPZCjjbHIvpfRsL8Mb9YKkEpA/yTFDwQiGr494vCL12ToyeV
	 7fIB91GUkLWLO27y79c5psL/Qhz58JZRGppmNMW2VJkGQeKb3reRn2A/nep0k1v61v
	 DIFzmZFHu9Yl3Wi7GeJLAXGXcXc2oFm6Nnq45gNLS+wkWhnh+WKzcuScYDWWQY3H18
	 Qn0hgpl5JJmKQ==
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d3dd14a7edso487074485a.2
        for <linux-firmware@kernel.org>; Mon, 07 Jul 2025 04:05:01 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz/5e1pkZF9QWxWY/N2EEEdwCjAa05NbQ6FgcEoltVl+aYmemtY
	PBE1pWj4F3RzriRR5hOT7K/sUmMuHK7P3Cm7u/s2GsYBpfTo+AGoowX10ACd8uulmD2afnbCWXh
	fNZVFaVkKclMtR2j9Co8uSQipz/6MP+g=
X-Google-Smtp-Source: AGHT+IGL5g0l6pmHGp/zEGmATZygCe7Hu04P+xabJEzFLBSWPW/DcNh1TMoNBgrCzIa9dtXKiVfsT5irbmDBrJQhJgA=
X-Received: by 2002:a05:620a:1723:b0:7c5:9a09:cb73 with SMTP id
 af79cd13be357-7d5dcc761abmr1978571285a.23.1751886300691; Mon, 07 Jul 2025
 04:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250706171331.78877-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250706171331.78877-1-dmitry.baryshkov@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 7 Jul 2025 07:04:49 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4qXcysuXzb6Gu5Ujm7g+PJfVv1Emq_bauOTfA36WcdYw@mail.gmail.com>
X-Gm-Features: Ac12FXwGAgRrWnZ_XQoDEUQmXc98KKd8T9Nd4tUKgHcW4BxPFb7FOn4j5NoCkzo
Message-ID: <CA+5PVA4qXcysuXzb6Gu5Ujm7g+PJfVv1Emq_bauOTfA36WcdYw@mail.gmail.com>
Subject: Re: [PATCH 1/3] qcom/adreno: sort entries in WHENCE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/605

The other two in the series didn't get picked up by the patch bot.
Will address shortly.

josh

On Sun, Jul 6, 2025 at 1:13=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Sort entries following the GPU version. Lenovo X13s has Adreno A690,
> so its ZAP file is between a663 and a702.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  WHENCE | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index f442a94cb423..92aeaeae3015 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6361,6 +6361,8 @@ Licence: Redistributable. See LICENSE.sdma_firmware=
 for details
>
>  Driver: adreno - Qualcomm Adreno GPU firmware
>
> +File: qcom/leia_pfp_470.fw
> +File: qcom/leia_pm4_470.fw
>  File: qcom/a225_pfp.fw
>  File: qcom/a225_pm4.fw
>  File: qcom/a300_pfp.fw
> @@ -6376,6 +6378,9 @@ File: qcom/a530_pm4.fw
>  File: qcom/a530v3_gpmu.fw2
>  File: qcom/apq8096/a530_zap.mbn
>  Link: qcom/a530_zap.mdt -> apq8096/a530_zap.mbn
> +File: qcom/qcs615/a612_zap.mbn
> +File: qcom/a623_gmu.bin
> +File: qcom/qcs8300/a623_zap.mbn
>  File: qcom/a630_gmu.bin
>  File: qcom/a630_sqe.fw
>  File: qcom/sdm845/a630_zap.mbn
> @@ -6387,18 +6392,13 @@ File: qcom/a660_sqe.fw
>  File: qcom/qcm6490/a660_zap.mbn
>  Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
>  Link: qcom/sm8350/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
> -File: qcom/a702_sqe.fw
> -File: qcom/leia_pfp_470.fw
> -File: qcom/leia_pm4_470.fw
> +File: qcom/a663_gmu.bin
> +File: qcom/sa8775p/a663_zap.mbn
>  File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
> +File: qcom/a702_sqe.fw
>  File: qcom/gen70500_gmu.bin
>  File: qcom/gen70500_sqe.fw
>  File: qcom/x1e80100/gen70500_zap.mbn
> -File: qcom/a663_gmu.bin
> -File: qcom/sa8775p/a663_zap.mbn
> -File: qcom/qcs615/a612_zap.mbn
> -File: qcom/a623_gmu.bin
> -File: qcom/qcs8300/a623_zap.mbn
>  File: qcom/gen71500_gmu.bin
>  File: qcom/gen71500_sqe.fw
>  File: qcom/x1p42100/gen71500_zap.mbn
> --
> 2.47.2
>
