Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E797C43334
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Jun 2022 13:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 083EEC341C4; Tue, 21 Jun 2022 13:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61D9C341C6;
	Tue, 21 Jun 2022 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655817247;
	bh=zZFY45CeIPVPyk7umjxKmtVWXxh1H212cr0YmUX1f+s=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=DwasXiBWecHfjase/7HsV7uqpxWbDsML3SLaEj0u1KFd3irk2H+wGEKQrikq5E02+
	 t/Ne6yCXTJ5gCgkzgGGGZueZAjoIhnVng/FkydLF4UTjXibHfvF6TZY17ISqtWnOzC
	 yBAhFmlKodYxTuKVq3UlT6gaFcxXoHxJQCpKgzlFhJbmPkEadyPmODAp9JwjxLSAwS
	 TD7jXOMVZ+W+AEqf975e1mWXJQQXfXHntf5mmbvOf3ZhpAx+XZwXDmlaK4jxOnex2q
	 KIdEHhEGri7a5YQszq1BbGiCQgi7WaU2d/vRvusLmZJgDgdobzrfMv55D6tcKWbWAs
	 yZJx2ZrtqB4ng==
Received: by mail-io1-f51.google.com with SMTP id p128so14169407iof.1;
        Tue, 21 Jun 2022 06:14:07 -0700 (PDT)
X-Gm-Message-State: AJIora9SItkdp5pWPbTzw+7Q70Puk2+C3GcalM2/HCJWGAPFmFB9w0He
	zWiA8J2AiVpJIH3nFwt53juERgLyV+8oJLe7aUE=
X-Google-Smtp-Source: AGRyM1uyBWSy5eHa2aknxGSR4O+lynEAiDOE4DeApEQ7w9afgZeE2zc1VRAjW4tJKth0zLwblqd+7AZfYh9LK1+YtEs=
X-Received: by 2002:a05:6638:d01:b0:331:d29a:8e60 with SMTP id
 q1-20020a0566380d0100b00331d29a8e60mr16568380jaj.254.1655817247099; Tue, 21
 Jun 2022 06:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220614141249.3975556-1-pbrobinson@gmail.com> <20220614141249.3975556-2-pbrobinson@gmail.com>
In-Reply-To: <20220614141249.3975556-2-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 21 Jun 2022 09:13:56 -0400
X-Gmail-Original-Message-ID: <CA+5PVA58t4EQCoJFO37ZgCF8MAM7DHuXcT0TzfSkmdgyuB6rDg@mail.gmail.com>
Message-ID: <CA+5PVA58t4EQCoJFO37ZgCF8MAM7DHuXcT0TzfSkmdgyuB6rDg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Link some devices that ship with the AW-CM256SM
To: Peter Robinson <pbrobinson@gmail.com>, Dan Johansen <strit@manjaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 14, 2022 at 10:12 AM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> We know the BeagleBoneAI, Pine64 Pinebook Pro, Pinephone Pro and
> Pine64 Quartz64 Model B all ship with a AW-CM256SM so link their
> known names so the WiFi NVRAM is available to those devices.
> This is the refresh of the Pinebook Pro, the first rev has a
> Synaptics brcmfmac part which the vendor doesn't provide firmware.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>
> In v1 I mentioned the Pinephone Pro, but linked the Pinebook Pro, where
> I meant to add both. Mention the rev of the Pinebook

Both patches applied and pushed out.

josh

>
>  WHENCE | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index 084af41..ae13c5d 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2964,6 +2964,10 @@ Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6
>  Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
>  Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
>  File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt
> +Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinebook-pro.txt
> +Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinephone-pro.txt
> +Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,quartz64-b.txt
>
>  Licence: GPLv2. See GPL-2 for details.
>
> --
> 2.36.1
>
