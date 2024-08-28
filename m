Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7505FC54EDA
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Aug 2024 11:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42C5BC98EC7; Wed, 28 Aug 2024 11:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0E6C98EC4
	for <linux-firmware@kernel.org>; Wed, 28 Aug 2024 11:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724844726;
	bh=REoZKAc1yMTnOQJYPSGWd9I+o0ZUPaPmBnJt5CfSLL4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FbqVYr7u0sCMKZ2mFziJXb6JaIpaRy58LsB5yfVW0Ov1NuBMG4avIVHLgt4eZ5rU8
	 5Mv09Vd7TL2HLtZtVU/R6+9NgwfVgwpLUy/kNbH1lM5WAI/mRy8oGmA5FllwU8X7XS
	 +0QhfihyUBFtKx+PnCu2CxGwDHC1HOlZAE4MGMPJu5qQwwQcoN1hksMB3xJuV74ajZ
	 26InAWVrbQV83gjTe1/QvkidnJE4bqxhOmnxLGOo64AiogiLIfFNbsvlFiFOrlXXvN
	 QTtt0iMtidWIJtHw+eRZ+c8+D7+ysk8AP90Biv5EkgKa53rDEwMiYgjqU3WtVU/N8X
	 quCv6F2/5wStg==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6c3f1939d12so54678097b3.2
        for <linux-firmware@kernel.org>; Wed, 28 Aug 2024 04:32:06 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw9U7L2dtqupKbW98cn9HABsggxlj3QSfHFkSq3T6V4sAaNzQ22
	08A5+ceDMHA9jCFFuf7E6xMS3S5MwNw2eSZxg/413TX1xw1paMJDyKFzjLP7KcYqYi1aQVDijO6
	2T7hxr5yCrTS1w7ZeutBwDG7tX4A=
X-Google-Smtp-Source: AGHT+IGYp3ocWRUWS/qmneza+0PAqQTNPNO7Z3ktEUqqXJFw9DtKyRVnu9V4xpriH1ol3U97fvTn8bz2H2nSOQ5LDVg=
X-Received: by 2002:a05:690c:26ca:b0:6b1:3bf8:c161 with SMTP id
 00721157ae682-6d16fa488efmr12750847b3.13.1724844725309; Wed, 28 Aug 2024
 04:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240828060831.34519-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240828060831.34519-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 28 Aug 2024 07:31:53 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4XWPZ07JDiG6WXpSBwcvU5wocJ+uvn_vsH7FnMOcOUdw@mail.gmail.com>
Message-ID: <CA+5PVA4XWPZ07JDiG6WXpSBwcvU5wocJ+uvn_vsH7FnMOcOUdw@mail.gmail.com>
Subject: Re: [PATCH] qcom: vpu: restore compatibility with kernels before 6.6
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Dikshita Agarwal <quic_dikshita@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:08=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Linux kernels before 6.6 used qcom/vpu-1.0/venus.mdt as a firmware
> filename for Qualcomm SM8250 devices. Commit 36db650dae03 ("qcom: update
> path for video firmware for vpu-1/2/3.0") moved the VPU firmware, added
> the venus.mbn compatibility symlink, but at the same time it dropped
> the venus.mdt symlink. Bring the historical name back to restore
> compatibility with kernels older than 6.6.
>
> Fixes: 36db650dae03 ("qcom: update path for video firmware for vpu-1/2/3.=
0")
> Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/284

josh

> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index 06c3c6fff673..4d9cd340a9dd 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5974,6 +5974,7 @@ Version: VIDEO.VE.6.0-00049-PROD-1
>
>  File: qcom/vpu/vpu20_p4.mbn
>  Link: qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
> +Link: qcom/vpu-1.0/venus.mdt -> ../vpu/vpu20_p4.mbn
>
>  Version: VIDEO.VPU.1.0-00087-PROD-1
>
> --
> 2.45.2
>
