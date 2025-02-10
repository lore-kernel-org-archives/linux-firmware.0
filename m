Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BFEC02198
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Feb 2025 12:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6858DC4CEE6; Mon, 10 Feb 2025 12:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526CAC4CED1
	for <linux-firmware@kernel.org>; Mon, 10 Feb 2025 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739191528;
	bh=1KouI6U9s2AEiIrZG/01shJAZ2IJ24wHgW8h7gZkL7c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ryWmO4keV8xCNvElg4G3IUZ+C2ojNS3eshicQKYUIS6IkuHlyNsFbnzrClGW+qWM6
	 mNu+xERa2wXjAUtZroAo8sdcr3DnCKdafrVk+F7qvz301frjk3PCv7Mg7EDh1H2Yc5
	 bl5AxdTYjE9yMVLtG+1V5M754hIC5yrWKanPj+D0yHGNV70PIzA0GEkALsCaZ6kD8C
	 TlLN1DbbYlpN6YC0sO0XkCa1tgkNNhhpx0w9oDyzXW2abp8qZ3VKO4VdmKoQZzrr5k
	 q+7TBVbS3Y+XkjPW2cWo9kObYXDpCh/RIbZ5Ujho44/xxv0nPK4a1bzH5m7uOnpcvG
	 tEFnTyAPaTZgg==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so2998095276.3
        for <linux-firmware@kernel.org>; Mon, 10 Feb 2025 04:45:28 -0800 (PST)
X-Gm-Message-State: AOJu0YxNEltSoml532hWsPFdTJ7wR2jHMydpQB9dn2uxJEp9ZD3ozkoy
	hjQssFgKbOvE3MxoqflnVIuWKkfLl2J1YBx8jQnWO2TysyhbUGT7BZkhsIrrQqZlf3hAt8/MwSU
	rA62z1A//4F4rk/w+V1GWKJQwpCI=
X-Google-Smtp-Source: AGHT+IHYdEC+xlKxV6wjsKBJRECDgT3O2kPNIuxbd+bZ6StT0FsNHdUVuphRTwcT6z+ieLfi6RBfqKnsIvSjt/rTVtQ=
X-Received: by 2002:a05:6902:2601:b0:e5b:257e:c3b1 with SMTP id
 3f1490d57ef6-e5b46166090mr10669106276.8.1739191527540; Mon, 10 Feb 2025
 04:45:27 -0800 (PST)
MIME-Version: 1.0
References: <20250207223625.49891-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20250207223625.49891-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 10 Feb 2025 07:45:16 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7jkKeSu+qkBdi8VpX3aebOWDYOVKHmqUSS+D9nOe6rDw@mail.gmail.com>
X-Gm-Features: AWEUYZmNvGqmxeGI8Nyl3QgdNdXkpmcdDNAfxTmo5yP4mvfk2j95Tskhzuf3d0o
Message-ID: <CA+5PVA7jkKeSu+qkBdi8VpX3aebOWDYOVKHmqUSS+D9nOe6rDw@mail.gmail.com>
Subject: Re: [PATCH] WHENCE: split generic QCA section into USB and serial sections
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 5:36=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> In order to help distributions to package a proper set of QCA firmware,
> split the single QCA61x4 section into two: one for serial-attached chips
> and another one for the USB-attached chips.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/444

josh

> ---
>  WHENCE | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 16441127bf0e..a8df012d4b4c 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4721,26 +4721,16 @@ Licence: GPLv2 or later. See GPL-2 and GPL-3 for =
details.
>
>  ------------------------------------------------------------------------=
--
>
> -Driver: btqca - Qualcomm Atheros Bluetooth support for QCA61x4 chips
> +Driver: btqca - Qualcomm Atheros Bluetooth support for QCA61x4 USB chips
>
>  File: qca/nvm_usb_00000201.bin
>  File: qca/nvm_usb_00000200.bin
>  File: qca/nvm_usb_00000300.bin
>  File: qca/nvm_usb_00000302.bin
> -File: qca/nvm_00130300.bin
> -File: qca/nvm_00130302.bin
> -File: qca/nvm_00230302.bin
>  File: qca/rampatch_usb_00000200.bin
>  File: qca/rampatch_usb_00000201.bin
>  File: qca/rampatch_usb_00000300.bin
>  File: qca/rampatch_usb_00000302.bin
> -File: qca/rampatch_00130300.bin
> -File: qca/rampatch_00130302.bin
> -File: qca/rampatch_00230302.bin
> -File: qca/nvm_00440302.bin
> -File: qca/rampatch_00440302.bin
> -File: qca/nvm_00440302_eu.bin
> -File: qca/nvm_00440302_i2s_eu.bin
>  File: qca/nvm_usb_00000302_eu.bin
>  File: qca/rampatch_usb_00130200.bin
>  File: qca/nvm_usb_00130200.bin
> @@ -4768,6 +4758,23 @@ Licence: Redistributable. See LICENSE.QualcommAthe=
ros_ath10k and qca/NOTICE.txt
>
>  ------------------------------------------------------------------------=
--
>
> +Driver: btqca - Qualcomm Atheros Bluetooth support for QCA61x4 serial ch=
ips
> +
> +File: qca/rampatch_00130300.bin
> +File: qca/rampatch_00130302.bin
> +File: qca/rampatch_00230302.bin
> +File: qca/nvm_00130300.bin
> +File: qca/nvm_00130302.bin
> +File: qca/nvm_00230302.bin
> +File: qca/rampatch_00440302.bin
> +File: qca/nvm_00440302.bin
> +File: qca/nvm_00440302_eu.bin
> +File: qca/nvm_00440302_i2s_eu.bin
> +
> +Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOT=
ICE.txt for details
> +
> +------------------------------------------------------------------------=
--
> +
>  Driver: qca - Qualcomm Atheros Bluetooth support for WCN3950 chips
>
>  File: qca/cmbtfw12.tlv
> --
> 2.47.2
>
