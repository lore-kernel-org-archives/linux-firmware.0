Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5554C4361B
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Dec 2020 19:05:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 88FA523B86; Fri, 18 Dec 2020 19:05:05 +0000 (UTC)
X-Gm-Message-State: AOAM532wvs7U0AG3jzMh6nUySCYZM7dXU3tRavlh0bIQOJYqIDC+oVYa
	PgveoAT6SrFPcOlWM/nbNSrXrs3dKpwUpDE06+Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608318305;
	bh=Iy9SxT9GUgDVreOu6zjvcsB3rpscn1polhAKsk1D3wg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PJGETP9kmgBA2o/eATgmpNP2kSt5miLy+Z1icBWVDLUjSGgByphBbRBUX7fUuTKp4
	 IKi5DQjyJmNeiAs8+Dh87z2StCjNlsACKmyll94unkRFWjKfLcXz2FnNCAz/KZJ4hf
	 P1wJ8MmBdZg0IgfO783LVIl76oMJkU//qZQtKmgKAd6+UIMZ3QVWkHb7m2S2CUuv1+
	 8MvlPnavWBGCYmYn/tS5RqoEXTNZJTCENOH7smQ5PDeLYjupm++fEYVL3Ut1uIoknX
	 pJ+XCIcC0/jsRIlU0qji2UE38gvR9HbzaSutrFBhBNRGGDbPWYOWSk6SeElfc5e6UN
	 0xT70IgJkm8xw==
X-Google-Smtp-Source: ABdhPJxydTxCqfcBipo/PZmwdFGfpsxY9gx6p/51yBH1IZmj1w15XC1V8poFK2kOI3nEKGhTwc8glj8v/uLPlNroU7E=
X-Received: by 2002:a05:6602:2dcf:: with SMTP id l15mr5016416iow.120.1608318304839;
 Fri, 18 Dec 2020 11:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20201210020740.21467-1-irui.wang@mediatek.com>
In-Reply-To: <20201210020740.21467-1-irui.wang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 18 Dec 2020 14:04:53 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6O1QesF_1LWktM-+VE+yOYDjt-VU1Bkc8O=p=qqORwWg@mail.gmail.com>
Message-ID: <CA+5PVA6O1QesF_1LWktM-+VE+yOYDjt-VU1Bkc8O=p=qqORwWg@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Update Mediatek MT8173 VPU firmware
To: Irui Wang <irui.wang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, linux-arm-kernel@lists.infradead.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Maoguang Meng <Maoguang.Meng@mediatek.com>, Longfei Wang <Longfei.Wang@mediatek.com>, 
	Yunfei Dong <Yunfei.Dong@mediatek.com>, Andrew-CT.Chen@mediatek.com, 
	Erin Lo <erin.lo@mediatek.com>, PoChun.Lin@mediatek.com, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Wed, Dec 9, 2020 at 9:07 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> The following changes since commit 7455a36066741a6e52fba65e04f6451b4cdfd9c4:
>
>   Merge branch 'guc_v49' of git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30 09:26:11 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/irui-wang/linux_fw_vpu_v1.1.6.git v1.1.6
>
> for you to fetch changes up to 0fe0fe022b7f88f581254487b1d1768df1b218bb:
>
>   mediatek: update MT8173 VPU firmware to v1.1.6 (2020-12-10 09:38:07 +0800)
>
> ----------------------------------------------------------------
> Irui Wang (1):
>       mediatek: update MT8173 VPU firmware to v1.1.6
>
>  mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
>
