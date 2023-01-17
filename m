Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06CFC63797
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Jan 2023 12:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7ABE3C43396; Tue, 17 Jan 2023 12:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650D7C433D2
	for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 12:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673960158;
	bh=JbYPt4p2onD8DcJA13bax/c5L0PgnAuh0LVelYGuT4s=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=EBhB93H6x6Vp9X8mynBnhNqUTiF3kQt5CcIPDPPiyAZdRcXRfUlTHBYEvMlYUgRdW
	 /GSigTW60+bl/jKRan7WZNTo+1q0h6xh/tuzAZ7JlJoxksJVGlWlCQNXFQa9lYd1lx
	 7ONcGRLBQsd8ud+9ZUMHxBI0dXU/VFaPt1THMPBK1yO2LBWMaS+nHAPoIDZpubwJRr
	 nrpI6u6qAFAR0CCnM5Ie7jpAsFtYhsSVXKHQtEoAQlFOrxeDNn3SxLw+n/qluW5nSL
	 AE5BFnJqzp1hGaYGudukXJYmlht4Iuksq87bQ78agdpVJP4gQ3zJSkYlbyKSQ4efhd
	 a79aFzv8GWm9A==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-4e9adf3673aso84198917b3.10
        for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 04:55:58 -0800 (PST)
X-Gm-Message-State: AFqh2kqNuxFqp6j2YiuCXqVJTdeAgCdBOFI4ZLsj1WRgjiogaHneuf2j
	A2z8KHy1iPTeCuGqcLcuktU7hXr7crPgrZHTzA8=
X-Google-Smtp-Source: AMrXdXvFsB15VQXo15ANtrh23o+Yv6SIr2VzAAsHVReYF/IYqlnX3U8No09BRRBtjHu1PPXFtX1fgU8S5JKE6uNBNQo=
X-Received: by 2002:a81:174e:0:b0:3dd:bcc2:e359 with SMTP id
 75-20020a81174e000000b003ddbcc2e359mr333486ywx.341.1673960157446; Tue, 17 Jan
 2023 04:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20230111205525.2105230-1-andreas@kemnade.info>
In-Reply-To: <20230111205525.2105230-1-andreas@kemnade.info>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 17 Jan 2023 07:55:46 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5d059GJD5wgtS9fcBVpqMnoX7YXMgmXb-8TPd2C6O1ww@mail.gmail.com>
Message-ID: <CA+5PVA5d059GJD5wgtS9fcBVpqMnoX7YXMgmXb-8TPd2C6O1ww@mail.gmail.com>
Subject: Re: [PATCH] brcm: add configuration files for CyberTan WC121
To: Andreas Kemnade <andreas@kemnade.info>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 11, 2023 at 3:55 PM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> These chips are found in some ebook readers with
> devicetree in mainline kernel.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  WHENCE                            |  3 +++
>  brcm/brcmfmac43362-sdio.WC121.txt | 36 +++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 brcm/brcmfmac43362-sdio.WC121.txt

Applied and pushed out.

josh

>
> diff --git a/WHENCE b/WHENCE
> index f31fa30..b84f426 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2930,7 +2930,10 @@ File: "brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
>  File: "brcm/brcmfmac43340-sdio.meegopad-t08.txt"
>  File: "brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt"
>  File: "brcm/brcmfmac43340-sdio.predia-basic.txt"
> +File: "brcm/brcmfmac43362-sdio.WC121.txt"
>  File: "brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt"
> +Link: brcm/brcmfmac43362-sdio.kobo,aura.txt -> brcmfmac43362-sdio.WC121.txt
> +Link: brcm/brcmfmac43362-sdio.kobo,tolino-shine2hd.txt -> brcmfmac43362-sdio.WC121.txt
>  Link: brcm/brcmfmac43362-sdio.lemaker,bananapro.txt -> brcmfmac43362-sdio.cubietech,cubietruck.txt
>  File: "brcm/brcmfmac43430a0-sdio.ilife-S806.txt"
>  File: "brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt"
> diff --git a/brcm/brcmfmac43362-sdio.WC121.txt b/brcm/brcmfmac43362-sdio.WC121.txt
> new file mode 100644
> index 0000000..9a2aa1b
> --- /dev/null
> +++ b/brcm/brcmfmac43362-sdio.WC121.txt
> @@ -0,0 +1,36 @@
> +aa2g=1
> +boardflags=0xa00
> +boardnum=777
> +boardrev=0x1207
> +boardtype=0x0598
> +cckPwrOffset=4
> +ccode=0
> +devid=0x4343
> +edoffthd=-71
> +edonthd=-65
> +initxidx2g=45
> +macaddr=00:90:4c:07:7${maclo12}
> +manfid=0x2d0
> +maxp2ga0=74
> +mcs2gpo0=0x4444
> +mcs2gpo1=0x6444
> +noise_cal_enable_2g=0
> +ofdm2gpo=0x44111111
> +pa0b0=5447
> +pa0b1=-658
> +pa0b2=-175
> +pa0itssit=62
> +pa0maxpwr=80
> +pa1itssit=62
> +prodid=0x492
> +rssisav2g=0x7
> +rssismc2g=0x3
> +rssismf2g=0xa
> +sromrev=3
> +swctrlmap_2g=0x04040404,0x02020202,0x04040404,0x010101,0x1ff
> +temp_add=29767
> +temp_mult=425
> +temp_q=10
> +triso2g=0
> +vendid=0x14e4
> +xtalfreq=26000
> --
> 2.30.2
>
