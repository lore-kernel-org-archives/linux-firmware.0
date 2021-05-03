Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665C1C433B4
	for <linux-firmware@archiver.kernel.org>; Mon,  3 May 2021 13:10:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1DA0861278; Mon,  3 May 2021 13:10:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 069BD611CD
	for <linux-firmware@kernel.org>; Mon,  3 May 2021 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620047442;
	bh=G1hYStvbv92vyGkHSYluj4Cu1HzZf9I9cxaGgwjIQiw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fOD5hQY3oR5XFRhOv9cryq+yMyat73qKolFI8OirBnleDL5NH8CXOKGpQjHnBOuRE
	 OdAtjNTPBys4XpNqczYH89QXDW8jBZj+xkuu9xKWWtZCrECEQBCnWo/1Fq6o3GFgdl
	 FJn89tTdT2fL7cQDxrSFdCsgou8MhxqlwyUp0sQZ5OzsOHMX04C7uQsJqA0wDMT6ng
	 yYzKt0fcDJFoZEcxijiyA6cZHsA/oWUMx+btIf2NW9OFnUm3RhQd0lIFh9mHdLXihN
	 29rNyXo355SLx6foxmR2u33ePwyjVkC3sriFjnR+Dc09xEAB78FsUoaSeHIIgUapd+
	 Wva5NAqd1+fag==
Received: by mail-il1-f175.google.com with SMTP id e14so3605035ils.12
        for <linux-firmware@kernel.org>; Mon, 03 May 2021 06:10:41 -0700 (PDT)
X-Gm-Message-State: AOAM531ST2IA211o0IlSr65KwcMSYXknHKm/ez3fgPCoyhvh1IWEvhtO
	aj9qV7EhbRhHRrY9YPEpxlkpwYg4eRktu8ZnJNM=
X-Google-Smtp-Source: ABdhPJxkmnIDgL4x+gjMeoAUOytkaWri9JcVu14WaLbvq1Bh/K++sZsucPj1QL7rPtUjS5ZjWhLbu5QZbkhcZ3YCIDw=
X-Received: by 2002:a05:6e02:160d:: with SMTP id t13mr16543742ilu.85.1620047441375;
 Mon, 03 May 2021 06:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <c62e9f94-25fc-6791-c328-5454abc403b9@gmail.com> <20210429072502.4350-1-jhp@endlessos.org>
In-Reply-To: <20210429072502.4350-1-jhp@endlessos.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 3 May 2021 09:10:30 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7Jh7qenL1anOpQcZbrFrbCFxudxqArQuXim+uwbYD0Og@mail.gmail.com>
Message-ID: <CA+5PVA7Jh7qenL1anOpQcZbrFrbCFxudxqArQuXim+uwbYD0Og@mail.gmail.com>
Subject: Re: [PATCH v2] brcm: Add a link to enable khadas VIM2's WiFi
To: Jian-Hong Pan <jhp@endlessos.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Linux Firmware <linux-firmware@kernel.org>, Linux Wireless <linux-wireless@vger.kernel.org>, 
	brcm80211-dev-list.pdl@broadcom.com, SHA-cyfmac-dev-list@infineon.com, 
	netdev <netdev@vger.kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, linux@endlessos.org
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, Apr 29, 2021 at 3:27 AM Jian-Hong Pan <jhp@endlessos.org> wrote:
>
> According to kernel message on khadas VIM2 board equipped with BCM4356:
>
> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4356-sdio for chip BCM4356/2
> usbcore: registered new interface driver brcmfmac
> brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac4356-sdio.khadas,vim2.txt failed with error -2
> brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac4356-sdio.txt failed with error -2
>
> System needs the NVRAM file "brcmfmac4356-sdio.khadas,vim2.txt" to
> enable the WiFi chip BCM4356. Found it can share with the same file
> "brcmfmac4356-sdio.vamrs,rock960.txt" with a soft link as
> "brcmfmac4356-sdio.khadas,vim2.txt". Both 2.4GHz and 5GHz WiFi are
> enabled with the linked config.
>
> This patch adds the link to brcmfmac4356-sdio.vamrs,rock960.txt for it.
>
> Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
> ---
> v2: Modified the commit description.
>
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index 3c29304..5773020 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2780,6 +2780,7 @@ Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\
>  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
>  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
>  File: brcm/brcmfmac4356-sdio.vamrs,rock960.txt
> +Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.vamrs,rock960.txt
>
>  Licence: GPLv2. See GPL-2 for details.
>
> --
> 2.31.1
>
