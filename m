Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E11AC433F5
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Jan 2022 12:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C58DDC36AEF; Fri,  7 Jan 2022 12:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B036FC36AE0
	for <linux-firmware@kernel.org>; Fri,  7 Jan 2022 12:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641557769;
	bh=dH4dVxIOuzZuGJQ/hHkaKsIFhOZq77K2EBZs/oCCHGc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=oWHhn5TvBKLsFXP/yLbThV1dxDt7mRwIMk+6YlgHJ6tEKJzVD3AA6pmCXW/sf5lke
	 JD5B4oXlU+bp1SSgtHS/Kd+SKTt33TVwdqUPiuDb6/b1+XEXDqbK/PiebQItxIsWKW
	 QoiZSaeHcCdBRF3CzJng9PIsju/KrGgtYg02chaxMPK2Sj1MnU6ZnTIRTKFMu18r2y
	 RJzgex6tYEdIueO8JAL9ffNNVDTtLpLNGK9O8LuoJ3zk38wY646deq7n0jUitA8L0s
	 SHszPmjtjMj1Sdad06mGeSzLRbsNIiSyOn5kqqWa8WKrvD/VsqQ9e0h/c6haeBJhLt
	 0YCgWeUx1D4gQ==
Received: by mail-il1-f170.google.com with SMTP id x15so4460122ilc.5
        for <linux-firmware@kernel.org>; Fri, 07 Jan 2022 04:16:09 -0800 (PST)
X-Gm-Message-State: AOAM530ndFoRNRcRgOEg78eOFZQKvSKpgQMhr58aetMGyWDq9Tx/tQIz
	IA3cxFzxs78l3s/QPORLETZQ/sel+KaRt3dWPmk=
X-Google-Smtp-Source: ABdhPJwqm4AsiuaCR163ZoNWs+S+aEYTd+DtmnQldhhzd8+UAtau7UNyFa2z+BtObchqdVLxqk3k5CJTe7eVWDV6hlc=
X-Received: by 2002:a05:6e02:15c5:: with SMTP id q5mr31917216ilu.218.1641557768907;
 Fri, 07 Jan 2022 04:16:08 -0800 (PST)
MIME-Version: 1.0
References: <20220102181025.95291-1-vijaikumar.kanagarajan@gmail.com>
In-Reply-To: <20220102181025.95291-1-vijaikumar.kanagarajan@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 7 Jan 2022 07:15:58 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4rGK8vDOXJyjxasmgu+_sUd2diux0Aa6Z91ut1Q-mCNQ@mail.gmail.com>
Message-ID: <CA+5PVA4rGK8vDOXJyjxasmgu+_sUd2diux0Aa6Z91ut1Q-mCNQ@mail.gmail.com>
Subject: Re: [PATCH] WHENCE: add missing symlink for NanoPi R1
To: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Sun, Jan 2, 2022 at 1:10 PM Vijai Kumar K
<vijaikumar.kanagarajan@gmail.com> wrote:
>
> NanoPi R1 uses the AP6212 Wi-Fi module.
>
> Fixes the below error.
>
> [   20.462895] brcmfmac mmc0:0001:1: firmware: direct-loading firmware
> brcm/brcmfmac43430-sdio.bin
> [   20.491441] brcmfmac mmc0:0001:1: firmware: failed to load
> brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt (-2)
> [   20.511459] brcmfmac mmc0:0001:1: Direct firmware load for
> brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt failed with error -2
> [   20.650227] brcmfmac mmc0:0001:1: firmware: failed to load
> brcm/brcmfmac43430-sdio.txt (-2)
> [   20.658804] brcmfmac mmc0:0001:1: Direct firmware load for
> brcm/brcmfmac43430-sdio.txt failed with error -2
>
> Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index 8657d80..93f388a 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2883,6 +2883,7 @@ Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-plus.txt -> brcmfmac43430-sdio.AP6
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.txt
> +Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt -> brcmfmac43430-sdio.AP6212.txt
>  File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
>  File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
> --
> 2.30.2
>
