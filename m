Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647E7C61DB9
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Aug 2026 12:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B3481F000E9; Tue, 25 Aug 2026 12:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258951F00A3F
	for <linux-firmware@kernel.org>; Tue, 25 Aug 2026 12:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787662579;
	bh=D91NWjMQzdlWVi70uYrd+PFsY6Va65wClxw7tvNxzps=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc;
	b=cDMRRB/Q+0LYPDhTdeizbl2VH1g5Wq/6GQwlnuaa1EqKEkWP5gwt1ff63VXHnrxaX
	 p20bOC4f+KSemWp/57PaNkd2JUdi1g5ruK2VIw/FGXsSnKdaP0APmMchPDcYEQoBk2
	 fkRbOxhPHWYGrQ1zHyzlo4z6ASAopbH6pZ7KJ/K/Y28SG5KVXGrSyRYCqmJYM+RxEA
	 W/OZttxCQi6wskQQ3SICGxM186vBKBZFJMyLTXdNNS0r1KiPUySVUWKXiSnrozg5Di
	 xEmijwGuWH0gb9DqD3BQ/HLt3dl8wxXuqGY7UQQp6CJL+kl6KYJNb3vQCfkeuBuUcg
	 HUAcCUpuGRayA==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66cecabf777so1254192d50.1
        for <linux-firmware@kernel.org>; Tue, 25 Aug 2026 05:56:19 -0700 (PDT)
X-Gm-Message-State: AFuF++lV7R9nDhNOoyFwFH25H4S7QAah0hPH//6zPsf2L8JNOEbf6HUl
	d6fX11+BZnD/qjYUFTVE+XSzOTT7lbDoixEQtOfoEvYVnkHn5evyCC4eU6QM2rsQJkHNDZ5+BVD
	TFaxL5D6HYWel2I6+zbxahNaMuY0LutE=
X-Received: by 2002:a53:dac6:0:b0:66c:e9ae:d90 with SMTP id
 956f58d0204a3-66d14714278mr1668826d50.18.1787662578413; Tue, 25 Aug 2026
 05:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260822025106.211-1-shenghao-ding@ti.com> <20260822025106.211-2-shenghao-ding@ti.com>
In-Reply-To: <20260822025106.211-2-shenghao-ding@ti.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 25 Aug 2026 08:56:05 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6JQcpP_AtmFGqOzM5LVKPSb1=w7GePpWnkpQN5Ca9Q1w@mail.gmail.com>
X-Gm-Features: AcwNN1WQmAjQceplXyYe2x1hW76nJV3aypRBzqZh9rfj2LhaKVJvAIkaUdDGHQU
Message-ID: <CA+5PVA6JQcpP_AtmFGqOzM5LVKPSb1=w7GePpWnkpQN5Ca9Q1w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] linux-firmware: Upload firmware for tas2573 stereo
To: Shenghao Ding <shenghao-ding@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, k-lu@ti.com, baojun.xu@ti.com, 
	13916275206@139.com, mengw@qti.qualcomm.com, honglan@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1194

josh

On Fri, Aug 21, 2026 at 10:51=E2=80=AFPM Shenghao Ding <shenghao-ding@ti.co=
m> wrote:
>
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> ---
>  WHENCE                                |  29 ++++++++++++++++++++------
>  ti/audio/tas257x/tas2573-2amp-reg.bin | Bin 0 -> 928 bytes
>  2 files changed, 23 insertions(+), 6 deletions(-)
>  create mode 100644 ti/audio/tas257x/tas2573-2amp-reg.bin
>
> diff --git a/WHENCE b/WHENCE
> index bbd31dad..66c10e30 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -9792,12 +9792,30 @@ Licence: Redistributable. See LICENCE.linaro for =
details
>  Originates from https://github.com/linux-msm/audioreach-topology.git
>
>  ------------------------------------------------------------------------=
--
> -Driver: ti-tas2781 - tas2781 firmware
> +
> +Driver: ti-tas257x - tas257x firmware
> +
> +File: ti/audio/tas257x/tas2573-2amp-reg.bin
>  File: ti/audio/tas257x/tas2572-1-1amp-reg.bin
>  File: ti/audio/tas257x/tas2572-2-1amp-reg.bin
>  File: ti/audio/tas257x/tas2572-3-1amp-reg.bin
>  File: ti/audio/tas257x/tas2572-3amp-reg.bin
>  File: ti/audio/tas257x/tas257x-1amp-reg.bin
> +
> +Link: tas2573-2amp-reg.bin -> ti/audio/tas257x/tas2573-2amp-reg.bin
> +Link: tas2572-1-1amp-reg.bin -> ti/audio/tas257x/tas2572-1-1amp-reg.bin
> +Link: tas2572-2-1amp-reg.bin -> ti/audio/tas257x/tas2572-2-1amp-reg.bin
> +Link: tas2572-3-1amp-reg.bin -> ti/audio/tas257x/tas2572-3-1amp-reg.bin
> +Link: tas2572-3amp-reg.bin -> ti/audio/tas257x/tas2572-3amp-reg.bin
> +Link: tas257x-1amp-reg.bin -> ti/audio/tas257x/tas257x-1amp-reg.bin
> +
> +Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
> +        Copyright (C) 2023 - 2026 Texas Instruments
> +
> +------------------------------------------------------------------------=
--
> +
> +Driver: ti-tas2781 - tas2781 firmware
> +
>  File: ti/audio/tas2781/TAS2XXX0C94.bin
>  File: ti/audio/tas2781/TAS2XXX0C95.bin
>  File: ti/audio/tas2781/TAS2XXX0C96.bin
> @@ -9891,11 +9909,7 @@ File: ti/audio/tas2781/TXNW2781RCA0.bin
>  File: ti/audio/tas2781/TXNW2781RCA1.bin
>  File: ti/audio/tas2781/TIAS2781RCA2.bin
>  File: ti/audio/tas2781/TIAS2781RCA4.bin
> -Link: tas2572-1-1amp-reg.bin -> ti/audio/tas257x/tas2572-1-1amp-reg.bin
> -Link: tas2572-2-1amp-reg.bin -> ti/audio/tas257x/tas2572-2-1amp-reg.bin
> -Link: tas2572-3-1amp-reg.bin -> ti/audio/tas257x/tas2572-3-1amp-reg.bin
> -Link: tas2572-3amp-reg.bin -> ti/audio/tas257x/tas2572-3amp-reg.bin
> -Link: tas257x-1amp-reg.bin -> ti/audio/tas257x/tas257x-1amp-reg.bin
> +
>  Link: TAS2XXX0C94.bin -> ti/audio/tas2781/TAS2XXX0C94.bin
>  Link: TAS2XXX0C95.bin -> ti/audio/tas2781/TAS2XXX0C95.bin
>  Link: TAS2XXX0C96.bin -> ti/audio/tas2781/TAS2XXX0C96.bin
> @@ -10423,14 +10437,17 @@ Link: 9028-3-0x9.bin -> ti/audio/tas2783/9028-3=
-0x9.bin
>  Link: 9028-3-0xA.bin -> ti/audio/tas2783/9028-3-0xA.bin
>  Link: 9029-2-0xC.bin -> ti/audio/tas2783/9029-2-0xC.bin
>  Link: 9029-3-0x9.bin -> ti/audio/tas2783/9029-3-0x9.bin
> +
>  Licence: Redistributable. LICENCE.ti-tspa for details. Marked:
>          Copyright (C) 2026 Texas Instruments
>
>  ------------------------------------------------------------------------=
--
>
>  Driver: ti-tas2563 - tas2563 firmware
> +
>  File: ti/audio/tas2563/TAS2XXX3870.bin
>  File: ti/audio/tas2563/INT8866RCA2.bin
> +
>  Link: TAS2XXX3870.bin -> ti/audio/tas2563/TAS2XXX3870.bin
>  Link: INT8866RCA2.bin -> ti/audio/tas2563/INT8866RCA2.bin
>
> diff --git a/ti/audio/tas257x/tas2573-2amp-reg.bin b/ti/audio/tas257x/tas=
2573-2amp-reg.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..50d5f5190d2f6f07bf71be81f=
6d4487d91433b8c
> GIT binary patch
> literal 928
> zcmd^-F$%&!5JmsaMp3~CF{PcoX9yxzf}jUT6*VFeB!ynW$^%$>4G&=3D}cmdDgA22Bv
> zY?9ImpKNw#GH*T$*z5Uye*mUIne99Z4ItK{2#<>kb)&9d@%2BEW@%n?S}~q^^B)7s
> z@M!{m1av1rkN&nhK)}6zAf7ood1K~H-MnR<9Fl!Jix<qU7M4s;mMW8wNjbReMr32p
> zk?!yo2w;uRgBGRidOd`k0l(c^&f}AHBt`8kS>^FO+ntzPG3s&-**BzgMh>GhmVB~E
> b*PEJv%BMcKJqrKihkq~Dxc)_7?@RwaXh<M#
>
> literal 0
> HcmV?d00001
>
> --
> 2.43.0
>
