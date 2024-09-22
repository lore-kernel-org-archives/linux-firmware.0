Return-Path: <SRS0=aqJY=QU=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EF0CF9C64
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 14:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61B2BC4CEC6; Sun, 22 Sep 2024 14:35:30 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65C89C4CEC3
	for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 14:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65C89C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5365c512b00so4055439e87.3
        for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727015727; x=1727620527; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EVAVnX1SQkagmpRQSsh94R9JzDFRn+lfQhyYETcKO7w=;
        b=IWpkk6cz5XWGixn0We8gIZxSq8FIGh0z9/0NxNpCu8bQh8SH3i4BB3ut8srMHRpojR
         OXGouEZuixYOUddOZzHPlLZ1ANwUdLFjnn2QvYjOgyZZZqc1KHccy7+F/9oZAwVeKh3Q
         mWWZqyXImCu9BjriY+EHyOiOsnKoEGxaBpFQyejoP6JgNRC6urb153MvuIK6fbjSNC7r
         jqTlCw0ZNxOYxaA5JN8vVvR0YnjvQVwWmsJ+UFIelTdLX6bqamuHXgg3MB0PwVO0pJYw
         CAIzB2JaNsLXnB/0DI8BfNOFuVzQH8rNFBK3Z8KZkiNtMdrMsPFMtoQQ3zbNQwQDuGYb
         VbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727015727; x=1727620527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVAVnX1SQkagmpRQSsh94R9JzDFRn+lfQhyYETcKO7w=;
        b=q5/XFR0u9xBFEJJepXcpJZs23jfCLIeneWNR99SuUp5+kYO/Q99XekDrCNIH3oUc0u
         kKZXb+lNeJqyCaUa7fG0KBMdEba6rQtKfaln+0j9AMq/PRgPMtCmBmftXXlF7j/FFXrv
         wVrTjlb/mNJ7Za0zG0J96bTOJQr/8tkyQ0Y3v9ZTO8L5x3Ysv0zLvYD29W/ElSCxg2wJ
         3XDJRN1eQp4sN13FbA9vtQs6lHBOpZzkjVWn8yNMPm8W6/R/2p0KSDR5u1ytDOUafQmE
         Toz6T5JjPMeQyAMGG+IrjAk5g0PKdrVz0LuwpUAFmLQ+9dFmf/2/PZkTCYh+ro2mwzTB
         LuBw==
X-Gm-Message-State: AOJu0Yw4Lliz0JddGH1YA14LpxWccA22+zv7N3JJcFC30kOiurZe3pUr
	1rGUaE2T2SGlpyjApcRqszQXRXQtqEplPbrtdpVh6EbvhurwfMdJgyWIgcwwAEI=
X-Google-Smtp-Source: AGHT+IFSkm3QKlfTQXNgHtnvlIkQawa6CTxdr9XcC3iMcLpZTyR0En1C3ZvBqDgnFTWVlRi6V9+rNQ==
X-Received: by 2002:a05:6512:3f0d:b0:536:7b56:6b90 with SMTP id 2adb3069b0e04-536ac33f079mr4555311e87.56.1727015727189;
        Sun, 22 Sep 2024 07:35:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870b402asm3007502e87.243.2024.09.22.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 07:35:25 -0700 (PDT)
Date: Sun, 22 Sep 2024 17:35:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PATCH] Add AMCC QT2025 Ethernet Phy firmware
Message-ID: <7xoyvgxj3rs6msm6yb4usnilnvbpgbgnzkc6wy4z6lg77fuklk@nfuybhnmfybi>
References: <20240922102024.218191-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922102024.218191-1-fujita.tomonori@gmail.com>

On Sun, Sep 22, 2024 at 10:20:24AM GMT, FUJITA Tomonori wrote:
> Add firmware for Applied Micro Circuits Corporation QT2025 10G
> Ethernet Phy.
> 
> The firmware data was stored as an array in the source code for Tehuti
> Networks TN40xx Network cards, distributed under GPL2. Tehuti Networks
> went out of business without the driver merged into the mainline.
> 
> The driver for QT2025 Phy has been merged into the mainline recently.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  WHENCE            |   8 ++++++++
>  qt2025-2.0.3.3.fw | Bin 0 -> 24543 bytes
>  2 files changed, 8 insertions(+)
>  create mode 100644 qt2025-2.0.3.3.fw
> 
> diff --git a/WHENCE b/WHENCE
> index 3897121a..6b4f2308 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -7534,3 +7534,11 @@ File: intel/ish/ish_lnlm.bin
>  Version: 5.8.0.7716
>  
>  License: Redistributable. See LICENCE.ish for details
> +
> +--------------------------------------------------------------------------
> +
> +Driver: qt2025 - Applied Micro Circuits Corporation QT2025 Ethernet Phy
> +File: qt2025-2.0.3.3.fw
> +Version: 2.0.3.3
> +
> +Licence: GPLv2.

If it is GPLv2, where is the source code?

-- 
With best wishes
Dmitry
