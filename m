Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9E5C02198
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Feb 2025 12:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F415DC4CEE6; Mon, 10 Feb 2025 12:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1E4C4CEE5
	for <linux-firmware@kernel.org>; Mon, 10 Feb 2025 12:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739191578;
	bh=p4F9tWHbatfwQ7NWAfaDmuAhsg06NxOtRfjlmnAG9v8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bS9mS0JmHGXH3gFpqAhDzx3JZGtVOT4DZrbmf30oDRRAMu9aaD08+Q9aykPPzqRAK
	 J5oTCBDU0uWoBeoBZ/YtRA77vW0xLyTuR6EjnLaK5Vh+x3jTtVrNoyETH+lmI70aLG
	 /FD43INgSjrmGKe7g19n+1wj4XidbTKiiMgdvoW4IFYgYVEOe+3l/gjWcluuU+YiON
	 nUNGy6cKc/Ay8VdIYZw+mBZCbf2T+eHFY3ieSLglBC2a0FcDuw6Lc75f6Bl7iyQHZu
	 xIIScp9LbT6Y4ejFjiiU0wTavchr1/I2Q6s2nHbYloqRrEkk7UZndNCohV+RtPjtPQ
	 2UJBNmhnk4FZQ==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e46c6547266so3346288276.3
        for <linux-firmware@kernel.org>; Mon, 10 Feb 2025 04:46:18 -0800 (PST)
X-Gm-Message-State: AOJu0Yz+kZdWeU3aKSKPes7y9nT2Zbygt3IYeFHKGBmZc+IPyCX0wqlX
	BjHYklUptXDR4kWOLAVsm66UzUAfhatwnAbuv296YutdI4XcKGppZd5/7CBU+ww6DZ+NOgh9Kv+
	6Y7JkhEEQ6Oj7+xvmJU5UUNbZ2/k=
X-Google-Smtp-Source: AGHT+IEKFwHK139wuOoldvhjjdbCtTxFH1a6M6IEeVwdbPc600voPwCpPaYxRbRTlP8448zRHPerk8rz0M7IKgiw6x4=
X-Received: by 2002:a05:6902:2402:b0:e5b:2a51:dea7 with SMTP id
 3f1490d57ef6-e5b4626ddc5mr10648085276.36.1739191578070; Mon, 10 Feb 2025
 04:46:18 -0800 (PST)
MIME-Version: 1.0
References: <20250207231645.50980-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20250207231645.50980-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 10 Feb 2025 07:46:07 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5VUtM2ub-U41_e9+OfVYg1+vMFBPCOYzkCkSWLHq6-AQ@mail.gmail.com>
X-Gm-Features: AWEUYZkajHyW_NFqIaFIJedemlDETqJlIhMFx3q-bHRN0jy6tvNHynu5ni5UsfA
Message-ID: <CA+5PVA5VUtM2ub-U41_e9+OfVYg1+vMFBPCOYzkCkSWLHq6-AQ@mail.gmail.com>
Subject: Re: [PATCH] WHENCE: qca: add missing version information
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 6:16=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add Version strings for most QCA serial firmware.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/445

josh

> ---
>  WHENCE | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index a8df012d4b4c..d2ccfbb29866 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4793,7 +4793,9 @@ Licence: Redistributable. See LICENSE.qcom and qca/=
NOTICE.txt for details
>  Driver: qca - Qualcomm Atheros Bluetooth support for WCN3988 chips
>
>  File: qca/apbtfw10.tlv
> +Version: BTFM.CHE.2.0.0-00082-QCACHROMZ-1
>  File: qca/apbtfw11.tlv
> +Version: BTFM.CHE.2.1.3-00357-QCACHROMZ-1
>  File: qca/apnv10.bin
>  File: qca/apnv11.bin
>
> @@ -4804,8 +4806,10 @@ Licence: Redistributable. See LICENSE.qcom and qca=
/NOTICE.txt for details
>  Driver: qca - Qualcomm Atheros Bluetooth support for WCN399x chips
>
>  File: qca/crbtfw21.tlv
> +Version: BTFM.CHE.2.1.3.c7-00024-QCACHROM-1
>  File: qca/crnv21.bin
>  File: qca/crbtfw32.tlv
> +Version: BTFM.CHE.3.2.0.c2-00044-QCACHROMZ-1
>  File: qca/crnv32.bin
>  File: qca/crnv32u.bin
>
> @@ -4816,7 +4820,9 @@ Licence: Redistributable. See LICENSE.QualcommAther=
os_ath10k and qca/NOTICE.txt
>  Driver: qca - Qualcomm Atheros Bluetooth support for WCN6750 chips
>
>  File: qca/msbtfw11.mbn
> +Version: BTFW.MOSELLE.1.1.3-00069-MSL_PATCHZ-1
>  File: qca/msbtfw11.tlv
> +Version: BTFW.MOSELLE.1.1.3-00069-MSL_PATCHZ-1
>  File: qca/msnv11.bin
>  File: qca/msnv11.b0a
>  File: qca/msnv11.b09
> @@ -4828,6 +4834,7 @@ Licence: Redistributable. See LICENSE.QualcommAther=
os_ath10k and qca/NOTICE.txt
>  Driver: qca - Qualcomm Atheros Bluetooth support for QCA2066 chips
>
>  File: qca/hpbtfw21.tlv
> +Version: BTFW.HSP.2.1.0-00641-VER_PATCHZ-1
>  File: qca/hpnv21.bin
>  File: qca/hpnv21g.bin
>  File: qca/hpnv21.301
> @@ -4866,6 +4873,7 @@ Licence: Redistributable. See LICENSE.QualcommAther=
os_ath10k and qca/NOTICE.txt
>  Driver: qca - Qualcomm Atheros Bluetooth support for QCA6390 chips
>
>  File: qca/htbtfw20.tlv
> +Version: BTFM.HST.2.0.0-00943-QCACHROM-1
>  File: qca/htnv20.bin
>
>  Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for detail=
s
> @@ -4875,6 +4883,7 @@ Licence: Redistributable. See LICENSE.qcom and qca/=
NOTICE.txt for details
>  Driver: qca - Qualcomm Atheros Bluetooth support for WCN7850 chips
>
>  File: qca/hmtbtfw20.tlv
> +Version: BTFW.HAMILTON.2.0.1-00349-WOS_PATCHZ-2
>  File: qca/hmtnv20.b10f
>  File: qca/hmtnv20.b112
>  File: qca/hmtnv20.bin
> @@ -4886,6 +4895,7 @@ Licence: Redistributable. See LICENSE.qcom and qca/=
NOTICE.txt for details
>  Driver: qca - Qualcomm Atheros Bluetooth support for QCA6698AQ chips
>
>  File: qca/QCA6698/hpbtfw21.tlv
> +Version: BTFW.HSP.2.1.2-00035-PATCHZ-1
>  File: qca/QCA6698/hpnv21.b206
>  File: qca/QCA6698/hpnv21.b207
>  File: qca/QCA6698/hpnv21.bin
> --
> 2.47.2
>
