Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BD4C433B4
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Apr 2021 11:23:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1FF4161439; Wed, 21 Apr 2021 11:23:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05DB561424
	for <linux-firmware@kernel.org>; Wed, 21 Apr 2021 11:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619004196;
	bh=3U7KNnXxOEWJvg1NzGfpmqJgYyUp9FkEVw2JCfbVjnA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=BvauIfnDmlpPlyOotJ/vMsgv1FDALHSWJNKfQG49QQM+r21c6zL4UFEiPNLqS9l92
	 7VuXWIUmL6Usaz2Is6aUYnBtr+JEK1z84XRU3RYqRMRtBUvrmJh2Y4VywKK952gXsY
	 0VCz4H73z+Z9lthNfFs4OtXPEO9HQkMF2des6h7kdk1Prp38VUgaVhKwnpZgqd8sN/
	 jne3BnN6LEiIzl7nNlYOmu7nxwDERYHjAX2vPsdJSzROCB3fUPTHhk3x9drAYt9cgV
	 E7FhoF0GC5C7VqihjLucxrD1qaH94CNnuC00f/OO5YoN1UbXT5GA9bVqPt8TlNxNI5
	 Ao9VIpbh5L0mA==
Received: by mail-il1-f171.google.com with SMTP id p15so23707247iln.3
        for <linux-firmware@kernel.org>; Wed, 21 Apr 2021 04:23:15 -0700 (PDT)
X-Gm-Message-State: AOAM530lKONe2FHLwK1l/jsslA6x2TzKGnoG9WVjJscRLMjcw4ksHbtK
	aTVDETPHFMrNILTzF9CKEpxrzctQbQ7b3/w+i7E=
X-Google-Smtp-Source: ABdhPJyrzku9HiDge2lbkR/IRDk2mvIKRqNslmRaXH22yU1HEHSIfD8fNbIOFdBBcmsyt0Maxqbra7wibU4Ao5smUT0=
X-Received: by 2002:a92:cd43:: with SMTP id v3mr26166246ilq.11.1619004195292;
 Wed, 21 Apr 2021 04:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <0c5cfa45-1bc6-3f63-435b-5281529457d4@ipik.org>
In-Reply-To: <0c5cfa45-1bc6-3f63-435b-5281529457d4@ipik.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 21 Apr 2021 07:23:04 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5Zs8iX77chTnZfw38OHbV+Y4G0ib3B-2_+O4oGv9ERzg@mail.gmail.com>
Message-ID: <CA+5PVA5Zs8iX77chTnZfw38OHbV+Y4G0ib3B-2_+O4oGv9ERzg@mail.gmail.com>
Subject: Re: brcm: add missing symlink for Pi Zero W NVRAM file
To: Michel Piquemal <spam@ipik.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 19, 2021 at 1:38 PM Michel Piquemal <spam@ipik.org> wrote:
>
> Raspberry Pi Zero W has no NVRAM files specified and dmesg reports the
> following error at boot:
> brcmfmac mmc1:0001:1: Direct firmware load for
> brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt failed with error -2
>
> Pi Zero W uses same wifi BCM43430 module than Pi 3 model B:
> symlinking to that Pi 3b NVRAM file fixes the issue, and wifi works as
> expected.
>
> Signed-off-by: Michel Piquemal <spam@ipik.org>
>
>
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2771,6 +2771,7 @@ Link: brcm/brcmfmac43430-sdio.sinovoip,b
>   File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
>   File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>   File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
> +Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt ->
> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
>   File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>   Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt ->
> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>   File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"

Your patch is corrupted and doesn't apply.  Please update your local
tree to the latest in git and resend.

josh
