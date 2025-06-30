Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D765C7EE39
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Jun 2025 11:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B52CC4CEF3; Mon, 30 Jun 2025 11:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5563AC4CEF1
	for <linux-firmware@kernel.org>; Mon, 30 Jun 2025 11:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751282550;
	bh=FJ6GAZQNRg2ID8Zlzu8aJJH8OHBkqqBWyBnq7Gm+1A8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dImza1iuayG0VvT1YTAnYV98fKq3thVx7c/9dQmvAn4DRC9m1Wq3T6VxnD1AaT9cn
	 eJktI9wV15IFFmgl2nbPaQUayZVDB4/ZdNpmE6lINYWGFLfwgl3VBOPYz4adcgoKdH
	 WaOLWEPdf6mmxeHHhICinGCbJujPnmRhtL5TkMHrhNY/OzRvlQq88PKjP7x+n46fGh
	 ktcLmaM6ZCyF6CTXl1Grx3/uQFJdhPMtAjFFF+a/Z5SV6426qSEucY332zEcarlUtk
	 1XJWStl/bKwiiT21L39sL10p9vk7fjNgDQKUXWPHVerHcPqaOgonK1ZCdtwt0ZXYe2
	 yi8UXkEWs9itw==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7115e32802bso19667747b3.1
        for <linux-firmware@kernel.org>; Mon, 30 Jun 2025 04:22:30 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywkt/PYaSey/oVS2bjYTFKEDze28KDrM9wpfR3H1gJANEUtYAIX
	CFuio+cDNTpmaPdzaqOQUyUJJpirhsKoUSSqsiqxrHH1j6sVieXmX8EeHodB3KrnD3UB0omNSJo
	79lRtN9vgPrs8w/qPuTI+SYdQNA4qgWA=
X-Google-Smtp-Source: AGHT+IF2EK6kNLxQd+7KEiZUv65dPoK+WTb0weXLnqPtewC7SoPSeosH2KCXUYCLUMAxIsVvT/ykL8kae9IlQyrUas0=
X-Received: by 2002:a05:690c:f07:b0:714:21c:5553 with SMTP id
 00721157ae682-7151713840fmr184044707b3.3.1751282549604; Mon, 30 Jun 2025
 04:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <eb81e590-2a34-4578-a9e4-e83b8bd6819d@RTEXMBS04.realtek.com.tw>
In-Reply-To: <eb81e590-2a34-4578-a9e4-e83b8bd6819d@RTEXMBS04.realtek.com.tw>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 30 Jun 2025 07:22:18 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7KeA_fpsa=QpjfFk90Rmzh6kH16PCQfJZ8YFAS=18uBQ@mail.gmail.com>
X-Gm-Features: Ac12FXzLfKfTWwh9WU6ZNrhvSGGlqiJVv3U8VG7Ktv05i8sL3RKtBa2iHULCWdk
Message-ID: <CA+5PVA7KeA_fpsa=QpjfFk90Rmzh6kH16PCQfJZ8YFAS=18uBQ@mail.gmail.com>
Subject: Re: pull-request: update rtw firmware rtw-fw-2025-06-30
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	timlee@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 1:28=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Hi,
>
> Update firmware of RTL8852C and RTL8922A for rtw89 WiFi driver.
>
> Thank you
> Ping-Ke
>
> ---
>
> The following changes since commit f40eafe216833d083f4e5598b7f45e894c373a=
d1:
>
>   Merge branch 'license' into 'main' (2025-06-27 11:45:29 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2025-06-30

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/602

josh

>
> for you to fetch changes up to 78478bfc44319c14eeb35d4098c3a84f55fc6bb5:
>
>   rtw89: 8922a: update fw to v0.35.80.0 (2025-06-30 13:26:58 +0800)
>
> ----------------------------------------------------------------
> Chin-Yen Lee (1):
>       rtw89: 8852c: update fw to v0.27.128.0
>
> Ping-Ke Shih (2):
>       rtw89: 8852c: update fw to v0.27.129.1
>       rtw89: 8922a: update fw to v0.35.80.0
>
>  WHENCE                  |   1 +
>  rtw89/rtw8852c_fw-2.bin | Bin 2444568 -> 2461176 bytes
>  rtw89/rtw8922a_fw-4.bin | Bin 0 -> 1259006 bytes
>  3 files changed, 1 insertion(+)
>  create mode 100644 rtw89/rtw8922a_fw-4.bin
