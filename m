Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013CCC4332F
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Nov 2021 11:21:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DE90A61100; Tue,  2 Nov 2021 11:21:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C735F610FD
	for <linux-firmware@kernel.org>; Tue,  2 Nov 2021 11:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635852104;
	bh=2iWp+WTymV6VoKKn43EjoI0LVLm+Ajg9LokdIlPsMHE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=BhbXnrttrCbjZzpsPNSf1L7rPWEokaLIZVFe8MOv/zsqcK5Jg6Eez8UkemgK3XtcD
	 44Po8PmTDY6LaniG6EXP/CJZ6Xcf/PiNCCM2dWHpSy9c/L3l+di//sKQi6SU4KKyb/
	 LQsipTqV5c9dfsT3q+du3fj4Iy81qDZo8PMXJ0CCLXHgxKlGnohztAVhcML0F6oKX5
	 FuWuyzuMxFBprdo4UzHYWKFzndQCLBtTgLPV2YP5Hjm9JILMn/a33FPmB7zb93zl7b
	 0lSf2Pq+XZ19mMppHu8T/ajyatkx4XafaewwWSn3WvOqJmwRMY05pIE7Y2DqdhkVvq
	 gQeBxk/74TjNg==
Received: by mail-io1-f48.google.com with SMTP id i143so744170ioa.13
        for <linux-firmware@kernel.org>; Tue, 02 Nov 2021 04:21:44 -0700 (PDT)
X-Gm-Message-State: AOAM531KlYb+JaRYOPHWO1lJSb3jyJnsFakrmpel2Dwh8oVcTdjoBKn4
	BSMIxH+860LcYTXG0mXKgXQuPxlsc0JuXdmJMDE=
X-Google-Smtp-Source: ABdhPJybbcOws+FPSvEw6uqvvHbCeN0dhZw7yutkm1vLCFgwNEEIfGaarhHIb2+bvw93yXZ0ksfyNhz+G+x1qB5Wtgc=
X-Received: by 2002:a05:6602:2c43:: with SMTP id x3mr10067830iov.175.1635852103888;
 Tue, 02 Nov 2021 04:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211102105221.2121-1-hildawu@realtek.com>
In-Reply-To: <20211102105221.2121-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 2 Nov 2021 07:21:32 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6Rh6mjpLzocmvpMbb940+41+cicuYVdmub8q=uxWbYVg@mail.gmail.com>
Message-ID: <CA+5PVA6Rh6mjpLzocmvpMbb940+41+cicuYVdmub8q=uxWbYVg@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8852A BT USB firmware to 0xDBA9_6937
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Max Chou <max.chou@realtek.com>, =?UTF-8?B?6ZmG5pyx5Lyf?= <alex_lu@realsil.com.cn>, 
	Hsin Yu Chang <hsinyu_chang@realtek.com>, KidmanLee <kidman@realtek.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Tue, Nov 2, 2021 at 6:52 AM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> This firmware patch update for Realtek RTL8852A BT USB controller.
>
> Release Version: 0xDBA9_6937
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8852au_fw.bin | Bin 48884 -> 51636 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8852au_fw.bin b/rtl_bt/rtl8852au_fw.bin
> index cff0a716322c5477b6eb7b9a9b0b18ddc298f96c..ea6376523106d8a25831d3b0ece32521f5406420 100644
> GIT binary patch
> delta 10401
> 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
> Llko{ZlkC0-T_q;%
>
> delta 7692
> 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
> GtjP$PU86Ao
>
> --
> 2.17.1
>
