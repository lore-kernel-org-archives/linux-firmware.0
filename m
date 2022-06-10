Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB86C433EF
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Jun 2022 11:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 576B0C3411D; Fri, 10 Jun 2022 11:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423B9C3411E
	for <linux-firmware@kernel.org>; Fri, 10 Jun 2022 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654859832;
	bh=5so02OdgWAf5uWCLXS2XEzGs7W07STBdXiC9MT16p7c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=p/gQv/gVlA5fMh4J6PrpxKp9LfGwH0kKs3c/QugUlCuaLuKMxEPYl1nRvDnkJFUNY
	 rrJZmD9fmHitA4XtJ7yVHSrrDxPG3zvy7i0cXLvCEsBLnUq6B00spnWZrGeMHQ5Lq1
	 zPO3ElptMLC2h9GICquNoY5KeBBvVkMiiBkCwsPMuaEbdcNKrP96KjDszYPuv99lEf
	 B92F2T4YhkaZyCpZt6IEpEeD/hZFm2Rr5JB9JoxablR3DHyNwIFvAKMqigHFtpeuFd
	 S//HR6DCNLEnL+1oFLYSPkkiQ+ZLZKpcsXCoaxKv5kcpFS276SZl64ZfZp45Yo+6Np
	 EW79N7UpdHinA==
Received: by mail-io1-f52.google.com with SMTP id r5so3906978iod.5
        for <linux-firmware@kernel.org>; Fri, 10 Jun 2022 04:17:12 -0700 (PDT)
X-Gm-Message-State: AOAM531fZcvHBCYF6BRxlA2rCLJ7NTLMGkb3AhGUtt3LhhMfN8KK2ZSx
	0Is8WOnuMDcUQiwR+M2TAOtDgCeTaoyw9zibcEw=
X-Google-Smtp-Source: ABdhPJygkyXX6goxszTOXXQ+eYEyec/HyonmcZla5IwA3E73CrTdsHbM0yXkYY2w2wHvGoi5qml6uWrotBQuMupuiIM=
X-Received: by 2002:a05:6638:14cd:b0:331:d9b3:fa47 with SMTP id
 l13-20020a05663814cd00b00331d9b3fa47mr8903116jak.303.1654859831402; Fri, 10
 Jun 2022 04:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220608132316.178115-1-dimitri.ledkov@canonical.com>
In-Reply-To: <20220608132316.178115-1-dimitri.ledkov@canonical.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Jun 2022 07:17:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5tVAaJbOd080Y4GQCtG6dcTW=2VSGs21m6y3GuRw7hcw@mail.gmail.com>
Message-ID: <CA+5PVA5tVAaJbOd080Y4GQCtG6dcTW=2VSGs21m6y3GuRw7hcw@mail.gmail.com>
Subject: Re: [PATCH v2] WHENCE: add symlinks for StarFive based boards
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, emil.renner.berthing@canonical.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 9:35 AM Dimitri John Ledkov
<dimitri.ledkov@canonical.com> wrote:
>
> StarFive VisionFive v1, BeagleV Starlight a1 & r0 boards use AP6212
> Wi-Fi module.
>
> BugLink: https://bugs.launchpad.net/bugs/1977872
>
> Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>

Applied and pushed out.

josh

> ---
>
>  Changes since v1:
>  - correct the name of the a1 board
>
>  WHENCE | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index f634c12a2f..828eeeef2c 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2908,6 +2908,9 @@ Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt -> brcmfmac43430-sdio.AP6212.txt
> +Link: brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt -> brcmfmac43430-sdio.AP6212.txt
> +Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt -> brcmfmac43430-sdio.AP6212.txt
> +Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-r0.txt -> brcmfmac43430-sdio.AP6212.txt
>  File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
>  File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
> --
> 2.32.0
>
