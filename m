Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B227C678D5
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 14:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 212FFC4339E; Tue,  7 Mar 2023 14:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C34FC433EF
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678200106;
	bh=6IIHe8Y8w7U/bSEgRnWXrh/DxQTtNSXLULXJD5wS5fU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sjdTWmin4AFs3LHA5exTNq/5+vN6ngCNZVUtQbkmk5WBB0BEOz2WZ70TxLTqjM6f3
	 xMiRXHZ2Bz8k/bzVdAsmPgnMn8h5Ww6FHlxqUaerYyRMK/wR7YeWx5AyyLRDU51IXh
	 X21cRRzAaLoBu4R6X0UAeNhhMlX2OuCRHVDB5eRXOvLFOFR4yMc942LN3Gv5VmGVOB
	 x1+ZJQsoRCBAmqB6494FdZaJDzX3b4Sj++qrM8MbrYD83JGpY0RV7I562mpEXcNwfw
	 Tt0tQirLRIBxZsqJKc5NdKZZiBTRJnBIWtmuy/SgbUOV72jCw/cg8z9lbRli0LnRvv
	 kdQ1m9eg649wg==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-536bbe5f888so248237987b3.8
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 06:41:45 -0800 (PST)
X-Gm-Message-State: AO0yUKXvj0Mw1Do2U/JbeV07vhSOc1T9anQyQnnLusv7ZRplfEs31eJ/
	IvvSZ2bHxrbaNuQHi0q/YnLgb2PgcVfpmSFcFGQ=
X-Google-Smtp-Source: AK7set8r0PEMQtTW03De3mqIN3Xa8rkdIIhsl8f7x9kVLy+9NzaocZZdx3xBY86M/uW1e+AdCcRGqq4MRt3v+AtIs8s=
X-Received: by 2002:a81:ae10:0:b0:535:18be:4126 with SMTP id
 m16-20020a81ae10000000b0053518be4126mr9332714ywh.6.1678200105085; Tue, 07 Mar
 2023 06:41:45 -0800 (PST)
MIME-Version: 1.0
References: <ab0289ec80471df43308c550e9fe4e0ac8b9cdc5.camel@realtek.com>
In-Reply-To: <ab0289ec80471df43308c550e9fe4e0ac8b9cdc5.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 09:41:34 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6MyhaD_aXqH6V1h9TKu+8upzDx-gzZuWb4URUQRSiAFg@mail.gmail.com>
Message-ID: <CA+5PVA6MyhaD_aXqH6V1h9TKu+8upzDx-gzZuWb4URUQRSiAFg@mail.gmail.com>
Subject: Re: pull request: rtlwifi: Add firmware v16.0 for RTL8710BU aka RTL8188GU
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 5, 2023 at 8:23=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> wr=
ote:
>
> Hi,
>
> rtl8xxxu is going to support 8710BU, so add firmware for this device.
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 60971a6485ee604c47cc905ff77c583ae001f9=
df:
>
>   Merge branch 'liquidio-20230222' of https://github.com/dchickles/linux-=
firmware (2023-02-27
> 12:33:07 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Pulled and pushed out.

josh

>
> for you to fetch changes up to 4cc3eda6360f0daa31647de129a001e408602e97:
>
>   rtlwifi: Add firmware v16.0 for RTL8710BU aka RTL8188GU (2023-03-06 09:=
16:58 +0800)
>
> ----------------------------------------------------------------
> Bitterblue Smith (1):
>       rtlwifi: Add firmware v16.0 for RTL8710BU aka RTL8188GU
>
>  WHENCE                       |   5 +++++
>  rtlwifi/rtl8710bufw_SMIC.bin | Bin 0 -> 23750 bytes
>  rtlwifi/rtl8710bufw_UMC.bin  | Bin 0 -> 22654 bytes
>  3 files changed, 5 insertions(+)
>  create mode 100644 rtlwifi/rtl8710bufw_SMIC.bin
>  create mode 100644 rtlwifi/rtl8710bufw_UMC.bin
>
>
