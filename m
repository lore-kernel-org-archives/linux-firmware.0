Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F941C02198
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Feb 2025 12:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13D24C4CEE6; Mon, 10 Feb 2025 12:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29D0C4CED1
	for <linux-firmware@kernel.org>; Mon, 10 Feb 2025 12:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739191626;
	bh=TN5AAGzZnYVl5y65Kw3gKq+LO3+GxmXvbxuZNmL3g4E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ua9GlUgXxZMy1TMIKCfy6J0jm4m0UfmMhiHNAJ84awOZt75FyJ95+NDQsi8dWXGV8
	 n0QtSoNme5Er8wP8azPymbUAUfOkEl8QJMeossEkEy2di46z8GOcYRermL/GNWSIjU
	 9mKqxCBnHU2Gvk8aqzrbmBRWsU0To1NShJQVla+7DAWhOQfSqvo7mIOv6VOmn3w2gj
	 zf73/0qnYpVLAgB6Kf6ZPf2tFjB82Hs2KxZN3ZttmMMGtgTldiE5UYoa7LOrvoVsAr
	 juJWlkYyXpblEEDP3qqDJx+Vudpil+dt5l9Ef8XgK1bMamK0Mu3UX5k4AOqfy1zHb2
	 Tb9trxBYEdEjg==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e3983426f80so3232191276.1
        for <linux-firmware@kernel.org>; Mon, 10 Feb 2025 04:47:05 -0800 (PST)
X-Gm-Message-State: AOJu0YzpSkxUgXWTm0DyYcCeLeJbNDLSYJbhAwPcYhhaCn4+/6vawI1M
	UMkHKrueaUBsWJrpJl99scw1RyQw5xxNHa8Y/HxT8rYxgxu1tuizLhWIKijOUq+wbjRrVgxtlWS
	HwjDvxv5h/bit7dt/5CKAf2ODYmw=
X-Google-Smtp-Source: AGHT+IFZywLj/gkD0WKI3ePbmBiI+47hn1IatZnHZt5VW4tmdBW41vABDuMlEk2FWkjecQGQ5tALSAcH/HMhcZjr7Qs=
X-Received: by 2002:a05:6902:248a:b0:e58:2c4c:9fa with SMTP id
 3f1490d57ef6-e5b461621d8mr11211288276.4.1739191625204; Mon, 10 Feb 2025
 04:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20250208103040.69125-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20250208103040.69125-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 10 Feb 2025 07:46:54 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5GtSwWM_+74trAM=OMeHchysWk310WdR30SVyRJE1hmA@mail.gmail.com>
X-Gm-Features: AWEUYZnMqEJkyMZhSV0pqvqF_DON4M1JezZu6LCFU054ixUqb7o4Zi9sTvsj66U
Message-ID: <CA+5PVA5GtSwWM_+74trAM=OMeHchysWk310WdR30SVyRJE1hmA@mail.gmail.com>
Subject: Re: [PATCH] WHENCE: qca: add missing version information
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 5:30=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add Version strings for USB and serial-attached QCA61x4 serial firmware.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/446

josh

> ---
>  WHENCE | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index d2ccfbb29866..73e0cc58efb8 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4730,9 +4730,12 @@ File: qca/nvm_usb_00000302.bin
>  File: qca/rampatch_usb_00000200.bin
>  File: qca/rampatch_usb_00000201.bin
>  File: qca/rampatch_usb_00000300.bin
> +Version: BTFM.RM.2.2.c3-00031-QCABTFMSWP-1
>  File: qca/rampatch_usb_00000302.bin
> +Version: BTFM.RM.4.4.1-00028-QCABTFMSWP-1
>  File: qca/nvm_usb_00000302_eu.bin
>  File: qca/rampatch_usb_00130200.bin
> +Version: BTFW.HSP.2.0.0-00609-USB_PATCHZ-1
>  File: qca/nvm_usb_00130200.bin
>  File: qca/nvm_usb_00130200_0104.bin
>  File: qca/nvm_usb_00130200_0105.bin
> @@ -4741,6 +4744,7 @@ File: qca/nvm_usb_00130200_0107.bin
>  File: qca/nvm_usb_00130200_0109.bin
>  File: qca/nvm_usb_00130200_0110.bin
>  File: qca/rampatch_usb_00130201.bin
> +Version: BTFW.HSP.2.1.0-00650-USB_PATCHZ-1
>  File: qca/nvm_usb_00130201.bin
>  File: qca/nvm_usb_00130201_010a.bin
>  File: qca/nvm_usb_00130201_010b.bin
> @@ -4750,6 +4754,7 @@ File: qca/nvm_usb_00130201_gf_010a.bin
>  File: qca/nvm_usb_00130201_gf_010b.bin
>  File: qca/nvm_usb_00130201_gf_0303.bin
>  File: qca/rampatch_usb_00190200.bin
> +Version: BTFW.HAMILTON.2.0.0-00515-USB_PATCHZ-2
>  File: qca/nvm_usb_00190200.bin
>  File: qca/nvm_usb_00190200_010e.bin
>  File: qca/nvm_usb_00190200_0112.bin
> @@ -4761,12 +4766,16 @@ Licence: Redistributable. See LICENSE.QualcommAth=
eros_ath10k and qca/NOTICE.txt
>  Driver: btqca - Qualcomm Atheros Bluetooth support for QCA61x4 serial ch=
ips
>
>  File: qca/rampatch_00130300.bin
> +Version: BTFM.RM.2.2.c3-00031-QCABTFMSWP-1
>  File: qca/rampatch_00130302.bin
> +Version: BTFM.RM.2.2.c3-00031-QCABTFMSWP-1
>  File: qca/rampatch_00230302.bin
> +Version: QCA6174_DEV.BLD.0111
>  File: qca/nvm_00130300.bin
>  File: qca/nvm_00130302.bin
>  File: qca/nvm_00230302.bin
>  File: qca/rampatch_00440302.bin
> +Version: BTFM.RM.4.4.1-00028-QCABTFMSWP-1
>  File: qca/nvm_00440302.bin
>  File: qca/nvm_00440302_eu.bin
>  File: qca/nvm_00440302_i2s_eu.bin
> --
> 2.47.2
>
