Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F061C43460
	for <linux-firmware@archiver.kernel.org>; Fri, 23 Apr 2021 11:05:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5295961483; Fri, 23 Apr 2021 11:05:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CBB86147F
	for <linux-firmware@kernel.org>; Fri, 23 Apr 2021 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619175934;
	bh=Swb51kooA9o11Afris4ngWT837cAiqCLtOJERI6hlvE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=cSqbSyT1bshJTanQOd76kohV/PjXfzIqvJIedz8ts7KyZx00wybT5TF59u50EoFjG
	 Ba76cz5/eYJqZWtKlNIUAqscv2P5ijmgXKheELMIjC+qKIlraAcEnldV9o1H76HA9f
	 JldWai41cquN0e2kWNexyZFWb77xXrYKIXnzs25z8YtHHqT0vFPeQgTQRGeEW4B4vg
	 Zxa16+Z/AemF3Qu1HkA8tvkwqGcectjtR3sxW6sNRr4zIkStpy4OF3d8e6zsCa7Qmg
	 kp46cD+4n7Y3rsFQwOqGWGM3cRY+OVdxGUsOxLHpVLyrP231T9k71HzzHMCNSsQY1n
	 Q8qCBzwrtq7OA==
Received: by mail-il1-f173.google.com with SMTP id l9so4618698ilh.10
        for <linux-firmware@kernel.org>; Fri, 23 Apr 2021 04:05:34 -0700 (PDT)
X-Gm-Message-State: AOAM5323Y71uug6Wqkaw0kUM+0yxiQf6kXcf4m8as3F3+kyEkEapnU3H
	c4aCWnGkzjrrHcadVtLWCqvsp2KL2TDfDfM+c20=
X-Google-Smtp-Source: ABdhPJzgLM90qNKfn7DNpORP++d5ybmEGCE9s+5lezKyk7xr3BsFz0NRKRzOSpauHm0RberPsjAfo/EFModeEHnv+bY=
X-Received: by 2002:a05:6e02:160d:: with SMTP id t13mr2559326ilu.85.1619175933543;
 Fri, 23 Apr 2021 04:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <0c5cfa45-1bc6-3f63-435b-5281529457d4@ipik.org>
 <CA+5PVA5Zs8iX77chTnZfw38OHbV+Y4G0ib3B-2_+O4oGv9ERzg@mail.gmail.com> <5c22e2d0-8397-71d5-0395-e9fac50aeaba@ipik.org>
In-Reply-To: <5c22e2d0-8397-71d5-0395-e9fac50aeaba@ipik.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Apr 2021 07:05:22 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4_KWgNgvHaUtvoMuzP_XUcAh9jg1Gpj1=9QAkuFNVNrg@mail.gmail.com>
Message-ID: <CA+5PVA4_KWgNgvHaUtvoMuzP_XUcAh9jg1Gpj1=9QAkuFNVNrg@mail.gmail.com>
Subject: Re: brcm: add missing symlink for Pi Zero W NVRAM file
To: Michel Piquemal <spam@ipik.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 1:47 PM Michel Piquemal <spam@ipik.org> wrote:
>
>
> On 21/04/2021 13:23, Josh Boyer wrote:
> > On Mon, Apr 19, 2021 at 1:38 PM Michel Piquemal <spam@ipik.org> wrote:
> >>
> >> Raspberry Pi Zero W has no NVRAM files specified and dmesg reports the
> >> following error at boot:
> >> brcmfmac mmc1:0001:1: Direct firmware load for
> >> brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt failed with error -2
> >>
> >> Pi Zero W uses same wifi BCM43430 module than Pi 3 model B:
> >> symlinking to that Pi 3b NVRAM file fixes the issue, and wifi works as
> >> expected.
> >>
> > Your patch is corrupted and doesn't apply.  Please update your local
> > tree to the latest in git and resend.
> >
> > josh
> >
>
> Hi. Apologies it got mangled by mail client; here it is again:

Thanks, applied and pushed out.

josh

>
> Signed-off-by: Michel Piquemal <spam@ipik.org>
> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index 9699246..57f7cbb 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2771,6 +2771,7 @@ Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.t
>  File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
>  File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
> +Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> --
> 2.28.0
>
