Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1BDC433FE
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Oct 2022 13:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1212C433D6; Mon, 17 Oct 2022 13:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA7EC433C1
	for <linux-firmware@kernel.org>; Mon, 17 Oct 2022 13:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666013898;
	bh=a0XxiVXQ1/RyI/U++GHr/XHhkAduEqEwaetN17e/PZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZXVPsyzt5qZJL+6RdlAtR4VmgWX8a/qcm2lpzzt2JTwoInmkoPhCrITXpKiwVzORO
	 cL7l8qKgnA2JLakbAI5z955IpGUyuNM4JKhFgt8mn6wdFNGKUAfb4+w10BjVaab6QM
	 lcCGPJTH+G3PKOmklMzBqyDz9GACK7swyrqYES4zacMJLAWmqGX3zJ+NkskwjtG132
	 0dsuHH/mWdD9LiRm949Ld0CSKBmib0J2RvSMixJqrkNONHFQOJDXoKXUYPMexTXkok
	 BIa0yR9JEbxOk+Xq8tKxzFJLWsSZZyW21Utoq9KJudITCGBNwjHFno3+rmz4ZeKzvR
	 gnuii3sD0KkFQ==
Received: by mail-oi1-f170.google.com with SMTP id l5so12102790oif.7
        for <linux-firmware@kernel.org>; Mon, 17 Oct 2022 06:38:18 -0700 (PDT)
X-Gm-Message-State: ACrzQf38XUhtk9iQlzx7BN/tza7bQObOeqex0kFCfmvV1ttaEeVYwfcL
	lOE1uwsxbz4t/O+t3ZCBwyFAkX7ucKtX3Xf9FSs=
X-Google-Smtp-Source: AMsMyM4AZd3ItMn/PjGRwtMXbGwiJO8Mw9eu73opbWRKgku6/cN7yrdYWPwqCZ9fFmfMBM2cMA5QnqKqAvXRNDDF/iU=
X-Received: by 2002:a05:6808:1446:b0:354:f46b:8802 with SMTP id
 x6-20020a056808144600b00354f46b8802mr5009647oiv.267.1666013897888; Mon, 17
 Oct 2022 06:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221016125044.1464459-1-pbrobinson@gmail.com>
In-Reply-To: <20221016125044.1464459-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 17 Oct 2022 09:38:07 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6zOd6Gj8NOZOPhXx8VO_YT4jtoam2LYQzBGWVo_Sw2EQ@mail.gmail.com>
Message-ID: <CA+5PVA6zOd6Gj8NOZOPhXx8VO_YT4jtoam2LYQzBGWVo_Sw2EQ@mail.gmail.com>
Subject: Re: [PATCH] brcm: add symlink for Pi Zero 2 W NVRAM file
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 16, 2022 at 8:50 AM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The Raspberry Pi Zero 2 W comes with two possible WiFi modules.
> One of them is the same module as shipped in the original
> Raspberry Pi 3B and Zero W so lets link them so the devices
> with that module will work out of the box.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Applied and pushed out.

josh

> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index 816cf7c..0c6dd8e 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2857,6 +2857,7 @@ File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
>  File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>  Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
> +Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-2-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
>  File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
> --
> 2.37.3
>
