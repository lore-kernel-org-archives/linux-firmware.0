Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7E9CAC59A
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Sep 2025 12:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F7F2C4CEF7; Thu, 18 Sep 2025 12:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197C4C4CEFA
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758198419;
	bh=F1scJMEAlHUDmEWKQRe9jioYSx5KShQSYJ9zwRnuVdo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Z4Uq6WAtPIMsJJkFVpSeQCgKHKGfEiKvpPJOTDSYgkeP9DvhnPT8q83d8Mr3LSxPQ
	 kpe0qrPzaxlMQHAUheTQN9jkz1vOH65J5wE6VWsVTaWh2R6dspHn4vM65ENMgV+UkM
	 a60TbjxMZ0RtXexnKdWU6nFE2rYPIji1cX83WxAOTow0ga8Zl/a4yFJJG9KBej1GT0
	 MtBehtICV6lJn3Pu1XCE0KmVLHTGRvi/uYSarH9vgDRbzTTp2v6UE/1x7USinQkbUy
	 7ZFRgItL+g3qJOzIjs8vCnvdEXZ/TT349IDlnmncGkhqhXOkxvrEtFVPoDMOxwGfp9
	 eMsMN84O8o1tA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d6083cc69so9208987b3.2
        for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 05:26:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YwsR03iFA1dwY46hKOMRjSEO14If52mOyZygQ4hBpLan6MUbBtc
	ZEdzO5ZoRLSUVLHFMNmYoJSTZuUCPL1qSN2ZIO/MPmqt99S4GvmQzobvSYp0Zh07Yr6YHkFpqUs
	wgA0sTWh6tI7xLfb2LCXmHhUfK/Ezlro=
X-Google-Smtp-Source: AGHT+IGYmDfU+Ppeq9dF34GH7Jt6mLPPjfPuSOoq+p1zc3ck3FS2ISRX3R/kdBnlMO2rJJEL2G/tJzg4TcKwxBSY1Oc=
X-Received: by 2002:a05:690c:6602:b0:722:6f24:6293 with SMTP id
 00721157ae682-73891b8537bmr44699147b3.32.1758198418341; Thu, 18 Sep 2025
 05:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250918023713.1504758-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250918023713.1504758-1-dmitry.baryshkov@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 18 Sep 2025 08:26:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5iS8LbT5_5KJE9Rv6cjtHzKPk-iLJfL_KKJu0M6k-_tA@mail.gmail.com>
X-Gm-Features: AS18NWCo4X0p5-LZLmcZwdxKK4jXAsWky_8Ul7V6GHZzq-oh2KLLbNgfSFTF0-k
Message-ID: <CA+5PVA5iS8LbT5_5KJE9Rv6cjtHzKPk-iLJfL_KKJu0M6k-_tA@mail.gmail.com>
Subject: Re: [PATCH] qcom: move LEMANS EVK firmware to correct location
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 10:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> All firmware for the Lemans platform is located under qcom/sa8775p/
> subdir. Move audio topology for Lemans EVK to the same location and
> provide (ugh) backwards-compatible symlink.
>
> Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/694

josh

> ---
>  WHENCE                                        |   3 ++-
>  qcom/{qcs9100 =3D> sa8775p}/LEMANS-EVK-tplg.bin | Bin
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  rename qcom/{qcs9100 =3D> sa8775p}/LEMANS-EVK-tplg.bin (100%)
>
> diff --git a/WHENCE b/WHENCE
> index a93effa5008b..e22d8218959f 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -8469,7 +8469,8 @@ Originates from https://github.com/linux-msm/audior=
each-topology.git
>  ------------------------------------------------------------------------=
--
>
>  Driver: qcom-qcs9100 - Qualcomm ASoC topology
> -File: qcom/qcs9100/LEMANS-EVK-tplg.bin
> +File: qcom/sa8775p/LEMANS-EVK-tplg.bin
> +Link: qcom/qcs9100/LEMANS-EVK-tplg.bin -> ../sa8775p/LEMANS-EVK-tplg.bin
>  Version: v0.1.0
>
>  Licence: Redistributable. See LICENCE.linaro for details
> diff --git a/qcom/qcs9100/LEMANS-EVK-tplg.bin b/qcom/sa8775p/LEMANS-EVK-t=
plg.bin
> similarity index 100%
> rename from qcom/qcs9100/LEMANS-EVK-tplg.bin
> rename to qcom/sa8775p/LEMANS-EVK-tplg.bin
> --
> 2.47.3
>
