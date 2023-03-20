Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751B5C6FD1D
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Mar 2023 11:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44BA8C433D2; Mon, 20 Mar 2023 11:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B29CC4339B
	for <linux-firmware@kernel.org>; Mon, 20 Mar 2023 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679312942;
	bh=xYoKbi3EPEulvU/42TL+kqOghy4hykp67kyxVj2Zvt0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KHNdua/0HElKSjqw+k98R0obxaf7yDY8YQYsYob7CdRbqCC9A0GMPPSBURTFDIHax
	 DP6wpBpqXceRH4+6YGf0W//VuUgS2fojNzLi9hu6Esd+6mfR37AJcQubn/B2+NeXz2
	 TL5nX6mFz1OnsiN0FUS9U8RQ7INbXjjTdxlH0aJkRclCoYDPWdW9lQ6MMpaypTiBqF
	 qNdFE1poRkHhCIsy81HsqiW5Zh7EPxYrQ5/PV+KxELSGtLovLvVxPECFe0aDBUXxJt
	 T2ZbA1v1xwdX1pT98BCea4ebMVBcqkWXuHZo5EwyYnfCwsdNG8l30LkEvp0ySHcC1y
	 mXXhzSYgkl0GQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54184571389so219413987b3.4
        for <linux-firmware@kernel.org>; Mon, 20 Mar 2023 04:49:02 -0700 (PDT)
X-Gm-Message-State: AO0yUKWrzab2B0DYDDN/2eEyh9104+GRTEcOrVgJ4WKKs9Q4XvWrAEWw
	SftfolJ03JveQMt3L0a+2B+ivJ5ShZKj4I20qr0=
X-Google-Smtp-Source: AK7set+Zsrv8TpQw5ElWguXfmCGG89KaGnMpv0UZbdPeMqoSJrQYL0b9vna0JL/vBq/Xm/WNt58iApSgh0ZMY9XfXSc=
X-Received: by 2002:a81:ad28:0:b0:521:db3f:9e27 with SMTP id
 l40-20020a81ad28000000b00521db3f9e27mr10471198ywh.2.1679312941156; Mon, 20
 Mar 2023 04:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <a43524a089a783f70adbe89b83eeb01fbd405d04.camel@mediatek.com>
In-Reply-To: <a43524a089a783f70adbe89b83eeb01fbd405d04.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 20 Mar 2023 07:48:50 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7OFubTCtt8NpaT5Obf8ay6+0d3Hw_jZ-+bL2ygHdi=JA@mail.gmail.com>
Message-ID: <CA+5PVA7OFubTCtt8NpaT5Obf8ay6+0d3Hw_jZ-+bL2ygHdi=JA@mail.gmail.com>
Subject: Re: pull request: update mediatek mt8192/mt8195 SCP firmware
To: =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	=?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 11:20=E2=80=AFPM TingHan Shen (=E6=B2=88=E5=BB=B7=
=E7=BF=B0)
<TingHan.Shen@mediatek.com> wrote:
>
> Hi ,
>
> This is a companion update for https://lore.kernel.org/all/20230314072557=
.29669-1-yunfei.dong@mediatek.com/.
>
> Please let me know if there is any issue, thank you.
>
> --
>
> The following changes since commit c761dbe804f903cc2df81f251d367cca285eca=
06:
>
>   Merge tag 'iwlwifi-fw-2023-03-13' of http://git.kernel.org/pub/scm/linu=
x/kernel/git/iwlwifi/linux-firmware (2023-03-13 09:20:47 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp mtk-20230315

Pulled and pushed out.

josh

> for you to fetch changes up to d0997ff65cb1edd0a0d6d96c998618a912132c12:
>
>   mediatek: Update mt8192/mt8195 SCP firmware to support MM21 and MT21 (2=
023-03-15 10:55:00 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Update mt8192/mt8195 SCP firmware to support MM21 and MT2=
1
>
>  WHENCE                  |   4 ++--
>  mediatek/mt8192/scp.img | Bin 328096 -> 309164 bytes
>  mediatek/mt8195/scp.img | Bin 429920 -> 587828 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
>
> --
> Best regards,
> TingHan
