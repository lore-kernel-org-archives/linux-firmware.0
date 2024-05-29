Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ECEC25B75
	for <linux-firmware@archiver.kernel.org>; Wed, 29 May 2024 11:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C6E2C32789; Wed, 29 May 2024 11:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB363C32781
	for <linux-firmware@kernel.org>; Wed, 29 May 2024 11:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716980774;
	bh=POureUtDv1u6o03NTd4nOir0iq1M3FSZZQY4tufoYxE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dzbiiKJK3zqjT95HQ2GFx7jIsiJNE9pQ84GgrO2pFo4DBGMeRv8lQXCjUE27X0hA5
	 VHxgplxtMmCAO0PdAS0Hmr7KdJarDZy1BJKw6iPFCevUurPOfoz1WjX3tfzj0bK/Oa
	 n9X+Qa63QTIRnGbN95TEbIoH71CdSQrljXVvb1fT/qlmLMFDiXSqUVtgRJ7i4xN/AM
	 iArJInvbWNT2bWuu03jcrHHLc5IZyECBP4m4JAEjkbIvcXBk3lMQpcsHYaC0MriOFe
	 SEqG5U1vy8Ju0XzAQblBfiaHaVyoIqmwNsDZ6LaG+gxG/XlhuWu0BXrHeiWpPSqiVF
	 HSCQxKTglHELA==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df771b6cc9cso1959398276.3
        for <linux-firmware@kernel.org>; Wed, 29 May 2024 04:06:13 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxnq/N+PT52U5UHFSTeg04h0E5Cbr3LTXIcaExfyZqUPStdwYcU
	qt4erA1kWz4897ZxsTeroJoZC8nuo2w1PDkpTdeCEkmftr1KqtZQVYorpLYpggDdIri2Cb38fMY
	LRkVh8MlRXKyeXDpv8iHMlNzQ/H8=
X-Google-Smtp-Source: AGHT+IEj3vK4okWOulEQAr7I0b3b3Ro1ISlmTHIqp/vwJ0Vhrpzm3qa5NNXVcNVdBiWLnmyqMnG0e0IdEYZTNhSm5RE=
X-Received: by 2002:a25:293:0:b0:df7:93e1:a130 with SMTP id
 3f1490d57ef6-df793e1b421mr13791430276.36.1716980773052; Wed, 29 May 2024
 04:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240529022258.5392-1-nas.chung@chipsnmedia.com>
In-Reply-To: <20240529022258.5392-1-nas.chung@chipsnmedia.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 29 May 2024 07:06:01 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6haPCVj3KEMr5sdQG=qdp-7-H_=By9gKRXfCBV4FDTgA@mail.gmail.com>
Message-ID: <CA+5PVA6haPCVj3KEMr5sdQG=qdp-7-H_=By9gKRXfCBV4FDTgA@mail.gmail.com>
Subject: Re: [PATCH] cnm: update chips&media wave521c firmware.
To: Nas Chung <nas.chung@chipsnmedia.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, sebastian.fricke@collabora.com, 
	lafley.kim@chipsnmedia.com, jackson.lee@chipsnmedia.com, b-brnich@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/216

josh

On Tue, May 28, 2024 at 10:23=E2=80=AFPM Nas Chung <nas.chung@chipsnmedia.c=
om> wrote:
>
> Update the wave521c video IP firmware for K3 devices.
>
> FW version : 1.0.4
>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  cnm/wave521c_k3_codec_fw.bin | Bin 998848 -> 998848 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/cnm/wave521c_k3_codec_fw.bin b/cnm/wave521c_k3_codec_fw.bin
> index 09b67c19b71779abc99407aa4d83355d5ebcbbbb..6753d1d3d250d82031e274aa6=
637e0c96f2c4287 100644
> GIT binary patch
> delta 12492
> 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
=3D
> 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
> WrfJ~`f+rZB5O_kJS8jw!lm8noJdK0^
>
> delta 12409
> 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
J
> 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
> NpVocpS{G^Be*;-KS*-v7
>
> --
> 2.25.1
>
