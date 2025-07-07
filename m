Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069F9C8303C
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Jul 2025 11:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5BFEC4CEEF; Mon,  7 Jul 2025 11:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0159C4CEF5
	for <linux-firmware@kernel.org>; Mon,  7 Jul 2025 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751886611;
	bh=Ww07XHjJ0kGXS0uMVgubSDnMTDVmkhHKWIfgRU5pQJY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pyfmmFzxQxyXO4S+3wUC6G/6SgOBOpUzYzjjsEP9YXKa6RS8vuSQBxZ7t7XaA4GIL
	 kKEzextr/kFDvRTTVknqOaghdRfEyHPlulUoKdCM7S/lSvuA8g66LmqeVLnT7ptONc
	 vFfqlbGrGegMPPOzF5SetSLwM5wE047hCYz/PW33x5jwcFhPA7ZENgZBnHwGAeWjkV
	 qBSGCGT31izXToVzLTL7fDn5X/M6boJHhLOBxbZhZR1BPlHBLWkX0SNTVlZ6jydSf4
	 owMazubC1LviZbOcaVcdNss4dG+4PR3CY+3phoV+mCLO+QoWdTeTlVTgRGRd/4YT1w
	 zZDh67OSB15bg==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e8b3ec5c82eso1208705276.0
        for <linux-firmware@kernel.org>; Mon, 07 Jul 2025 04:10:11 -0700 (PDT)
X-Gm-Message-State: AOJu0YwVEb7nVY5MN2pMBHUM53daX571vtTN0/L1gkzAf6YmrPtnbRI5
	EjwKhPPvIBaxyByRdhKxiKU3jZJOC0syUOxTtL2yvdttPeK6cUUk1j8m1JcKbCes3+OsRw37we8
	B75QeLqcjEvsipFgEPrlb5D76HVkkXfw=
X-Google-Smtp-Source: AGHT+IECJv2iunyp8BdvELBkkB9hxOJYQEUoozoZLZvC0kfMuDaehmqtqnPrft4665BXH5QbbLCFiSn3kZzKbAjkJwc=
X-Received: by 2002:a05:690c:6a0e:b0:70e:6c9c:e123 with SMTP id
 00721157ae682-7166710db08mr170125777b3.0.1751886610983; Mon, 07 Jul 2025
 04:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250706171331.78877-1-dmitry.baryshkov@oss.qualcomm.com> <20250706171331.78877-3-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250706171331.78877-3-dmitry.baryshkov@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 7 Jul 2025 07:09:58 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4BexHutfZ3HaCwMb=Gw5CuC3WNeToty+cPEw5YU9z1JA@mail.gmail.com>
X-Gm-Features: Ac12FXzTFvj4JtrldxIAWlZdDaKqFWEXuDl_DbMfI3zHXBFnEFS5TtRXftUwYDo
Message-ID: <CA+5PVA4BexHutfZ3HaCwMb=Gw5CuC3WNeToty+cPEw5YU9z1JA@mail.gmail.com>
Subject: Re: [PATCH 3/3] qcom/adreno: document firmware revisions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patches 2 and 3 both merged.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/607

josh

On Sun, Jul 6, 2025 at 1:13=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Document known versions for Qualcomm Adreno firmware files.
>
> Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  WHENCE | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index d1740c514019..f38e4af6f2a2 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6374,6 +6374,7 @@ File: qcom/a330_pm4.fw
>  File: qcom/a420_pfp.fw
>  File: qcom/a420_pm4.fw
>  File: qcom/a530_pfp.fw
> +Version: 1.87.01
>  File: qcom/a530_pm4.fw
>  File: qcom/a530v3_gpmu.fw2
>  File: qcom/apq8096/a530_zap.mbn
> @@ -6381,29 +6382,45 @@ Link: qcom/a530_zap.mdt -> apq8096/a530_zap.mbn
>  File: qcom/qrb4210/a610_zap.mbn
>  File: qcom/qcs615/a612_zap.mbn
>  File: qcom/a623_gmu.bin
> +Version: v3.06.00
>  File: qcom/qcs8300/a623_zap.mbn
> +Version: v0.12
>  File: qcom/a630_gmu.bin
>  File: qcom/a630_sqe.fw
> +Version: v2.07
>  File: qcom/sdm845/a630_zap.mbn
>  File: qcom/a650_gmu.bin
>  File: qcom/a650_sqe.fw
> +Version: v1.12
>  File: qcom/sm8250/a650_zap.mbn
>  File: qcom/a660_gmu.bin
> +Version: v3.01.0B
>  File: qcom/a660_sqe.fw
> +Version: v1.12
>  File: qcom/qcm6490/a660_zap.mbn
> +Version: v0.09
>  Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
>  Link: qcom/sm8350/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
>  File: qcom/a663_gmu.bin
> +Version: v3.05.01
>  File: qcom/sa8775p/a663_zap.mbn
> +Version: v0.09
>  File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
>  File: qcom/a702_sqe.fw
> +Version: v0.47
>  File: qcom/qcm2290/a702_zap.mbn
>  File: qcom/gen70500_gmu.bin
> +Version: v4.03.11
>  File: qcom/gen70500_sqe.fw
> +Version: v1.62
>  File: qcom/x1e80100/gen70500_zap.mbn
> +Version: v0.15
>  File: qcom/gen71500_gmu.bin
> +Version: v4.06.04
>  File: qcom/gen71500_sqe.fw
> +Version: v1.81
>  File: qcom/x1p42100/gen71500_zap.mbn
> +Version: v0.13
>
>  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for detai=
ls
>
> --
> 2.47.2
>
