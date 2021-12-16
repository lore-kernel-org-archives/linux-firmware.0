Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A7AC433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Dec 2021 14:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 101C2C36AE6; Thu, 16 Dec 2021 14:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DDFC36AE5
	for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 14:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639665163;
	bh=9rVhRRIcD1NwL+XbnII3xzlaZGfhwFIfUt4HDwMtxnY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=M0bzHfY05zuG8zfxCf6zOR8PdrWET54PlfiK0YHIFkCNn/DsHPt4GMdMoor32kQCu
	 QUMjAtNJ+2L132/ZErO4ESEuFqiC6ChU6vyqNX1bYNjjd1VI3CFYSDjz3nYny3Opxv
	 iyNCQfM/zy2pQMErTPmWLWiF4FQXpFhOxdaI4DI++Xug7sVEAbjnCXOnVSRm2rfndv
	 ORt9iHc6w57gB59cBLQLzK6W22YfoTPG5v2jNonfDRX5g+tzNI+WHTE0YZ6/0K8QMW
	 1gV3mY1QW1tB7/VJgAA0jVbm/kQpCk+YXFfk3J+Bp4oQ2dyBHzHAtcioXc4Hto9WD/
	 trJO/tsewssdw==
Received: by mail-io1-f41.google.com with SMTP id 14so35250470ioe.2
        for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 06:32:42 -0800 (PST)
X-Gm-Message-State: AOAM533x4l8nJC41nUoSqFJttZVs/0HPAnRcb9PrI20NYdFoSreOhfSg
	NiyzhGR6JaO2G+jVWi1rXRI6tiy923sNaUxu8RU=
X-Google-Smtp-Source: ABdhPJxw0yB/uCH4GQqiSZ31gAo72u2QNiQqr/juQSrSpHqgUJ1cIMspTP+GhZ0Jnpyx86w0mlvjdeSGb7Jnkb4MIrY=
X-Received: by 2002:a02:ccb3:: with SMTP id t19mr9463266jap.145.1639665162002;
 Thu, 16 Dec 2021 06:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20211125090549.21839-1-hildawu@realtek.com>
In-Reply-To: <20211125090549.21839-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 16 Dec 2021 09:32:30 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5tArz+jzqMufaWYpV5KFACHET=LctYgVRk24T-wQXFag@mail.gmail.com>
Message-ID: <CA+5PVA5tArz+jzqMufaWYpV5KFACHET=LctYgVRk24T-wQXFag@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8761B BT UART firmware to 0x0CA9_8A6B
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Max Chou <max.chou@realtek.com>, =?UTF-8?B?6ZmG5pyx5Lyf?= <alex_lu@realsil.com.cn>, 
	Hsin Yu Chang <hsinyu_chang@realtek.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, Nov 25, 2021 at 4:05 AM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> This firmware patch update for Realtek RTL8761B BT UART controller.
>
> Release Version: 0x0CA9_8A6B
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8761b_fw.bin | Bin 35644 -> 44204 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8761b_fw.bin b/rtl_bt/rtl8761b_fw.bin
> index b6b9f1fbdfb49e26926806790dcd1bf126d47eed..4b04eb63a4fff3f22a0100eedb9a924619efbecb 100644
> GIT binary patch
> delta 15224
> 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
>
> delta 6540
> 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
>
> --
> 2.17.1
>
