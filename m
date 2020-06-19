Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB50C433E0
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2020 12:34:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 49B0021527; Fri, 19 Jun 2020 12:34:39 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2924020DD4
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2020 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592570079;
	bh=lQJk2PdzJDurABgTMQrsEVei1cznCM6k6lJqz7y/lEE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=S9jQBKfqhT7d625JWfZ+ksMA1z7xqIryVPfJNAgmryVqtIkm2tE+R1eRxfxkHmoX6
	 9tlYpeawTd2wW7NAgcmirFyZmatFbrsKX/8GrUMOWtRvxpe4QdSp0Pb9UmR9GGSi61
	 kpWPx8Yc+6izMQyazsqJnk3ljI7a7fmEUo3WMGuo=
Received: by mail-il1-f173.google.com with SMTP id z2so9061420ilq.0
        for <linux-firmware@kernel.org>; Fri, 19 Jun 2020 05:34:39 -0700 (PDT)
X-Gm-Message-State: AOAM532GyBu4plWYvMSomURiTkSgrycDn5SYg2xhEvL73PUxRL2Ti5b9
	uKufKu4d1rO3pDOsiyHk0826d4X3rbHyalRA6Mo=
X-Google-Smtp-Source: ABdhPJxnajkyLZDjUjDpO4EddHU0iSf0o7oBZG9jSrUub41GbUiZ8hmMeLwDJCGXW1vXlWDf+ZEU0M1lDRnkZoauS1M=
X-Received: by 2002:a05:6e02:eb0:: with SMTP id u16mr3562120ilj.81.1592570078412;
 Fri, 19 Jun 2020 05:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <9417f3c4-40ec-9ece-0d83-f1f8c4112478@gmail.com>
In-Reply-To: <9417f3c4-40ec-9ece-0d83-f1f8c4112478@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 19 Jun 2020 08:34:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA77eFTXQyNoFD78O1HGs61WrrNCZFfxPj5Lgf0FkEbmkA@mail.gmail.com>
Message-ID: <CA+5PVA77eFTXQyNoFD78O1HGs61WrrNCZFfxPj5Lgf0FkEbmkA@mail.gmail.com>
Subject: Re: [PATCH] rtl_nic: add firmware for RTL8125B
To: Heiner Kallweit <hkallweit1@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Chun-Hao Lin <hau@realtek.com>, 
	Realtek linux nic maintainers <nic_swsd@realtek.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 2:59 PM Heiner Kallweit <hkallweit1@gmail.com> wrot=
e:
>
> This adds firmware for RTL8125B rev.a and RTL8125B rev.b.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Chunhao Lin <hau@realtek.com>
> ---
>  WHENCE                |   6 ++++++
>  rtl_nic/rtl8125b-1.fw | Bin 0 -> 9952 bytes
>  rtl_nic/rtl8125b-2.fw | Bin 0 -> 3264 bytes
>  3 files changed, 6 insertions(+)
>  create mode 100644 rtl_nic/rtl8125b-1.fw
>  create mode 100644 rtl_nic/rtl8125b-2.fw

Applied and pushed out.

josh

>
> diff --git a/WHENCE b/WHENCE
> index f8e1585..4a336c9 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3060,6 +3060,12 @@ Version: 0.0.2
>  File: rtl_nic/rtl8125a-3.fw
>  Version: 0.0.1
>
> +File: rtl_nic/rtl8125b-1.fw
> +Version: 0.0.1
> +
> +File: rtl_nic/rtl8125b-2.fw
> +Version: 0.0.1
> +
>  Licence:
>   * Copyright =C2=A9 2011-2013, Realtek Semiconductor Corporation
>   *
> diff --git a/rtl_nic/rtl8125b-1.fw b/rtl_nic/rtl8125b-1.fw
> new file mode 100644
> index 0000000000000000000000000000000000000000..577e1bb61eb95dcea7ab91d3c=
20b4b6c2adbe3c1
> GIT binary patch
> literal 9952
> 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
p
> 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
>
> literal 0
> HcmV?d00001
>
> diff --git a/rtl_nic/rtl8125b-2.fw b/rtl_nic/rtl8125b-2.fw
> new file mode 100644
> index 0000000000000000000000000000000000000000..45b04434263d6d69a8e70e27c=
cf4843bd5f939a4
> GIT binary patch
> literal 3264
> zcmb7GZBUd|6n<G2SXP1+u7s%Yiil{$0*WG05~-|Kew1lLs32fyii8{Xq4wk`p`wzS
> znQo?zqh=3D^p+L$^?j^ao*qs=3D%@)=3DWz}&eV^DKFqJQ=3Dk9yoW|zrk+?g}axz9cKoO91=
T
> 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
> IsCD`M1JTHBJpcdz
>
> literal 0
> HcmV?d00001
>
> --
> 2.27.0
>
