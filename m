Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533EDD132B5
	for <linux-firmware@archiver.kernel.org>; Mon,  4 Nov 2024 12:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B6E2C4CED2; Mon,  4 Nov 2024 12:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E8BC4CED4
	for <linux-firmware@kernel.org>; Mon,  4 Nov 2024 12:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730723499;
	bh=YCB9Ba6MUIZZUlo5wSLzfXDPz0pSxTc94MV/wk9HJIo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jmrgkLhYLaDbphA2CA4yfZ3IextVhvE46scM+r9+QbaCufO+khdjiTIbbtUji4N8B
	 LjTyayK9/IrCoUJv2MYWt0klBeS/1XJ+skJQvuVa+ZEWJ66X6P9RzECpXY/u2qH5ql
	 hFANlv8SBS0EYOBtmoVFJSTg9uxd2DKaR76H8P2uSe37Ef9VTCHwXg5gp3uV+b8bPJ
	 c490bbrjEjBoicvGlvizrcauQIL+oOV3auuezJ1k4qYwqFcrRwn2y6xhLPmeRSlOa1
	 6A9j8wWelgMD1eKqSAqF0s8XzBcCX6Y9J03JvV+7jPjR4XHsiiwNsBUdUUB1SX3dsH
	 OY1eyAbiKxyHw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e5a5a59094so36965607b3.3
        for <linux-firmware@kernel.org>; Mon, 04 Nov 2024 04:31:39 -0800 (PST)
X-Gm-Message-State: AOJu0Yzxp7mIR3nuZgcF0IZiomFUrJjrjlVDpnfcnuvvhUeq7MQhffgd
	7dBpctPfH4FlgizRZ5O5QhAazJutyvFtf2lLITNcTmHdLABdPem0ucmMyKnRwbHG8HXuC0JyEbz
	aHLiqQuLuaLx5rvZuLRH6ItU2a0s=
X-Google-Smtp-Source: AGHT+IHpoMwUPxN91mpvsALhArLsVfGPWK7ANGXrVv+HQEXyjNNSqlZBksrRBUGGQHiLTeTR5iMwTQnwVnpUPgf/+88=
X-Received: by 2002:a05:690c:74c1:b0:6e3:36cc:eb74 with SMTP id
 00721157ae682-6ea64bb239emr126228357b3.32.1730723498259; Mon, 04 Nov 2024
 04:31:38 -0800 (PST)
MIME-Version: 1.0
References: <20241101-qcs6490-firmware-v1-1-9bdb81ee3b89@quicinc.com>
In-Reply-To: <20241101-qcs6490-firmware-v1-1-9bdb81ee3b89@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 4 Nov 2024 07:31:26 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7A0RV73sm8g3u1BMYOhEE3z6jHjeFVimOKEMQxzP2dKw@mail.gmail.com>
Message-ID: <CA+5PVA7A0RV73sm8g3u1BMYOhEE3z6jHjeFVimOKEMQxzP2dKw@mail.gmail.com>
Subject: Re: [PATCH] qcom: Add link for QCS6490 GPU firmware
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 12:22=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> Create a symlink between qcom/qcm6490/a660_zap.mbn and
> qcom/qcs6490/a660_zap.mbn.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> To: linux-firmware@kernel.org
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/352

josh

> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index ff5b05f4ed01..ea8c2fc70b1f 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6188,6 +6188,7 @@ File: qcom/sm8250/a650_zap.mbn
>  File: qcom/a660_gmu.bin
>  File: qcom/a660_sqe.fw
>  File: qcom/qcm6490/a660_zap.mbn
> +Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
>  File: qcom/a702_sqe.fw
>  File: qcom/leia_pfp_470.fw
>  File: qcom/leia_pm4_470.fw
>
> ---
> base-commit: 3cdc52d83e478e189669697eb244d48b592d1652
> change-id: 20241101-qcs6490-firmware-c5eb17946cac
>
> Best regards,
> --
> Akhil P Oommen <quic_akhilpo@quicinc.com>
>
