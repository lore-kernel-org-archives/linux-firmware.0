Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3732DC77B73
	for <linux-firmware@archiver.kernel.org>; Wed, 31 May 2023 11:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01038C433A0; Wed, 31 May 2023 11:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE94C4339E
	for <linux-firmware@kernel.org>; Wed, 31 May 2023 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685533160;
	bh=1r003H+hkeIV/2Wjz6Nwpjwn2DpIHru3I59xBcLyA68=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tOT+/3uq9yPD0mfXhobNnjyfr2skxafA24A/mH5jKYzY+2kCdGmL3R2N8NeZ7dSG8
	 a2VNOvDuZFKGpMM79FBLPJBSUZ0khqFwgH2TJhaDesM/fjRxsRIDuzT8hXWCRMYtRk
	 ljU0+pJN3fOAf/Zil4XoZsCp1js9ttZgMK2wzBfxmJpWGeWKrW38cg6qEDz+COgzWh
	 PfyAObr6jDKazurZIDu6vg8AoQpI/a9Qj832XAXYlcy2tlt/WeF2DqYpJQ9xEyLk8P
	 43TUHsVlqCWEzcXBhszDbfRNsCeuoNQhDD4H/I7vNalJJxbE5ahwr0DslO58fpMN7D
	 THRM43VjZsnyw==
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-3f83114e0c6so25751711cf.0
        for <linux-firmware@kernel.org>; Wed, 31 May 2023 04:39:20 -0700 (PDT)
X-Gm-Message-State: AC+VfDzZixlQwkG+gkYTU0/wzcIu/YcEbQb8c3MMEOyZhTWLH04NKEnu
	o0cIm+jBytG6tX7mSI4GdwOWW4eD1Grl5DcbAb8=
X-Google-Smtp-Source: ACHHUZ55ZpYwaPAHvibtrEgnJa2xzdr5CMvV5XenyZvfVNQq9Un7TQ9DtrijQ1wWQMHETftWkb3PE79hQOsQVh39y0c=
X-Received: by 2002:a05:622a:189d:b0:3f4:cfed:96bd with SMTP id
 v29-20020a05622a189d00b003f4cfed96bdmr7128873qtc.21.1685533159846; Wed, 31
 May 2023 04:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230531102147.380502-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230531102147.380502-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 31 May 2023 07:39:08 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4m=K_ij1Z84Jxco4vLAygpBYQWQEkwgEOvoVswCMJv5Q@mail.gmail.com>
Message-ID: <CA+5PVA4m=K_ij1Z84Jxco4vLAygpBYQWQEkwgEOvoVswCMJv5Q@mail.gmail.com>
Subject: Re: [PULL] qcom: apq8016: add Dragonboard 410c WiFi and modem firmware
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 6:21=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add firmware for the Qualcomm Dragonboard 410c, an SBC using Qualcomm APQ=
8016
> platform.
>
> The following changes since commit 1f9667ebd8e6aac23bab8e95b0d555181dd432=
ba:
>
>   Merge branch 'for-upstream' of http://git.chelsio.net/pub/git/linux-fir=
mware (2023-05-30 07:46:20 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware db410c

Pulled and pushed out.

josh

>
> for you to fetch changes up to 9d4c9a52c2377c367978ff7b2ec4963b0704613e:
>
>   qcom: apq8016: add Dragonboard 410c WiFi and modem firmware (2023-05-31=
 06:30:31 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       qcom: apq8016: add Dragonboard 410c WiFi and modem firmware
>
>  WHENCE                                  |   5 +++++
>  qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin | Bin 0 -> 31723 bytes
>  qcom/apq8016/mba.mbn                    | Bin 0 -> 230272 bytes
>  qcom/apq8016/modem.mbn                  | Bin 0 -> 10678876 bytes
>  qcom/apq8016/wcnss.mbn                  | Bin 0 -> 4111376 bytes
>  5 files changed, 5 insertions(+)
>  create mode 100644 qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin
>  create mode 100644 qcom/apq8016/mba.mbn
>  create mode 100644 qcom/apq8016/modem.mbn
>  create mode 100644 qcom/apq8016/wcnss.mbn
