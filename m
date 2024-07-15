Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044C6C3DA59
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Jul 2024 13:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CAA2EC4AF0E; Mon, 15 Jul 2024 13:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4065C4AF0D;
	Mon, 15 Jul 2024 13:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721051290;
	bh=pqxMzZ9ylaa/c/L2lBUhRSnbTqXYR2aT7mkDhR4L1uM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UycriWBrQssHXa6D9Ur7ZvTI+D6pl0eZYJGzE4ZGi61+YlzEqMGiV2j9ZRHlmGpu6
	 ritFkGamTddnJZ+8z55U1VqQwreB5kKtDYg/FwNKbdycW+Sl7aaF2oKhisBR5dQX89
	 8P5X8ABBQcqSuR5u0QbRpbE0XzOduwxIvClzR/KVlyB8Dc0iH7+d9AOvJyi3+X9+X9
	 QRXr7xlRSWxBEXFY0ljKbQsJjEs+dQwxbP/vaeUeM6XqYIJvS3QNKInmCCE5gZq1f5
	 3TGVJ0yKXIKrGS548Qw4ZRlbNx4vsHuoHNCnJW1748gZYebN3jLBH3d3tJaivZng+l
	 KJBo6yYNxo+DQ==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-65f8b0df1f0so18240497b3.2;
        Mon, 15 Jul 2024 06:48:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQTpYSUK4IIu0JkGqXaae7vodycg/rUMK2kfm8EIDZHnj53kg3kojxnjyGqk7n0lSOUaNImyuM+mbL1+Col2HLBCMysg==
X-Gm-Message-State: AOJu0YxSuu5BAy7Af/nt3kWHt5p7psbxtZkmUe2aabGzdmbrQugjPK0u
	hX+jRBf9+4oCYaGEU5ik2/udGKjGFZftall1f+jdMz4K6TLwUwh39FE4W15l8Gj7TlyTwT1Avum
	HBIh2Ei8tJMhKqJMhdxaTqaJpM6M=
X-Google-Smtp-Source: AGHT+IFCrmysz+nWKnHRmtzHQcWIvgOCy2tA9d6yEGmAMYsEEM5MRD8v8yfgsMQl+jqO/XDMQOq7c6m0lJb12D/9eEU=
X-Received: by 2002:a81:c304:0:b0:65f:8a8e:1064 with SMTP id
 00721157ae682-65f8a8e1267mr69685097b3.47.1721051289784; Mon, 15 Jul 2024
 06:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240715122500.3115456-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240715122500.3115456-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 Jul 2024 09:47:58 -0400
X-Gmail-Original-Message-ID: <CA+5PVA50rRtwzCqDD4c4RBeyp+cLorptG7Ff6dTJMyeURAWqZw@mail.gmail.com>
Message-ID: <CA+5PVA50rRtwzCqDD4c4RBeyp+cLorptG7Ff6dTJMyeURAWqZw@mail.gmail.com>
Subject: Re: [PATCH] qcom: move signed x1e80100 signed firmware to the SoC subdir
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 8:25=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The ZAP shader is signed and is specific for the particular SoC. As such
> it should be put the corresponding subdir rather than the topdir.
>
> Move it to the subdir (like all other zap.mbn files).
>
> Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/251

josh

> ---
>  WHENCE                               |   2 +-
>  qcom/{ =3D> x1e80100}/gen70500_zap.mbn | Bin
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename qcom/{ =3D> x1e80100}/gen70500_zap.mbn (100%)
>
> diff --git a/WHENCE b/WHENCE
> index e4e06b966e89..b6451372a6ef 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5992,7 +5992,7 @@ File: qcom/leia_pm4_470.fw
>  File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
>  File: qcom/gen70500_gmu.bin
>  File: qcom/gen70500_sqe.fw
> -File: qcom/gen70500_zap.mbn
> +File: qcom/x1e80100/gen70500_zap.mbn
>
>  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for detai=
ls
>
> diff --git a/qcom/gen70500_zap.mbn b/qcom/x1e80100/gen70500_zap.mbn
> similarity index 100%
> rename from qcom/gen70500_zap.mbn
> rename to qcom/x1e80100/gen70500_zap.mbn
> --
> 2.43.0
>
