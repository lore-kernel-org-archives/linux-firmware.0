Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0698FCA0EEB
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Aug 2025 11:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF2A8C113D0; Tue, 19 Aug 2025 11:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C24C116B1
	for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 11:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755603799;
	bh=BlOXYPYjLD3j4KMU3gsaZUwBw08LmwrHxCF7UXIztOM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NzZI02B3j1Uet+QWWSzyxnjUz6B3c2NIZdfSJOPlIMazvRtgCSTfJwGPgdam8Lt4m
	 LzsiHh3JsCiipj1WiEjEVLpWdqzfxfKpEyy+U6dlTUZJTSUG39eLHc879baX1lmDv8
	 h6RmAiMS1jXrK2yfd0um2DefyZf+oTMsTqXDQkJcrFs7Ew6A5XwANjzE2VEvS5Ff49
	 Y1Izpr0POqq/dYlqcqsAb5bEryehkOb+cXoa/W8KfE9/DhCziDGys2b+OgfKUpxkPE
	 18FeXjhIwrUpiAqvQJU3XzhIXCeld83RIaOcCIXjtGOwEGqvYPPhaPlR39C6RxzVR3
	 +tp+s0lSwGIgg==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e94eec0de32so212781276.0
        for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 04:43:19 -0700 (PDT)
X-Gm-Message-State: AOJu0YwpnBQGEjYpsFJfttmsAjl2kOtnrUv/tj3WeFmmtG5E+P2V4QZj
	0fImaINvCzurBrkymvdjq2lfpf1iv0Ymi0Kgnn0GXGyYVWCK8VGdoRG7kR9pAsmf00fBtnrz7Do
	NVBafrjyB/rxb/6XMEg0vKitaYgVIgds=
X-Google-Smtp-Source: AGHT+IHxvf2q9GY95Xcm4EFKN0PB79iVkmrO2tLPGLBBejNwDxNdwslQ2912KtHeehkUQhifHrrTQowoznIGDX62nZI=
X-Received: by 2002:a05:6902:728:b0:e93:3738:e0d4 with SMTP id
 3f1490d57ef6-e94e6152661mr2745832276.13.1755603799038; Tue, 19 Aug 2025
 04:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <9761c994-0066-4de1-9b26-171a2baf3e0b@RTKEXHMBS06.realtek.com.tw>
In-Reply-To: <9761c994-0066-4de1-9b26-171a2baf3e0b@RTKEXHMBS06.realtek.com.tw>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Aug 2025 07:43:07 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7H922NYyNP_0RG6=1G-eRpdkJKwOaPRMX7U70brRdf+Q@mail.gmail.com>
X-Gm-Features: Ac12FXwS0wMFGYR06eNmNI7gVyF9YF6ca80KNqpRIgKu-f6SyYzVhzoCk0hTYKQ
Message-ID: <CA+5PVA7H922NYyNP_0RG6=1G-eRpdkJKwOaPRMX7U70brRdf+Q@mail.gmail.com>
Subject: Re: pull-request: update rtw firmware with tag rtw-fw-2025-08-15
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	damon.chen@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/648

josh

On Fri, Aug 15, 2025 at 4:36=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Hi,
>
> Update firmware of Realtwk WiFi driver rtw89. Main update is to correct
> WoWLAN feature.
>
> Thank you
> Ping-Ke
>
> ---
>
> The following changes since commit a312f85c8033086f0cdc96822453089da624c3=
28:
>
>   Merge branch 'rt1321' into 'main' (2025-08-14 16:48:34 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2025-08-15
>
> for you to fetch changes up to 61ae23e359c6dff2795701779cfb2b5994c47247:
>
>   rtw89: 8922a: update fw to v0.35.80.3 (2025-08-15 16:30:44 +0800)
>
> ----------------------------------------------------------------
> Kuan-Chung Chen (3):
>       rtw89: 8852c: update fw to v0.27.129.3
>       rtw89: 8852c: update fw to v0.27.129.4
>       rtw89: 8922a: update fw to v0.35.80.3
>
>  rtw89/rtw8852c_fw-2.bin | Bin 2463394 -> 2466994 bytes
>  rtw89/rtw8922a_fw-4.bin | Bin 1263938 -> 1263938 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
