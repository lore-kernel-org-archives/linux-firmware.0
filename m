Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26948CCA47B
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Jun 2022 11:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0EECDC34114; Fri, 10 Jun 2022 11:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE85C3411F
	for <linux-firmware@kernel.org>; Fri, 10 Jun 2022 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654859429;
	bh=BLKt03vOsLhbBKyGFCmikx9bMQxgcjiUM2sJzRasNPk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AJxh71Hjxr5LsXUeo5prPg17vucMNjkBNtnYNZ+XImsEWs0bbQc72AatUDLTDsvB9
	 emCmtfNLgT3Z53Ehtbs0xbKnUcZHtPgDGEsgCNz93dZQKb1tYK5JaaHm2Bc8au0vQz
	 czkgPiZJG9wjf6Eu11n31m5NCHV19vMkS6xVx5OUunh45fKhdzi5nyusZ7+WwcvaWz
	 TdDGdVEb6UieBWLPHcBD6/Lh28ss49ehryX6290oUOlfGMfi2TZUqtR2NuBbI/bMiE
	 qEXFMZ+r1BLTulYx2V54wIjuuqvErJTVMgwbwcdOcYffENxqZPfWj1Ec+pM1272Srf
	 SvM5T3ePJCxGw==
Received: by mail-io1-f43.google.com with SMTP id p69so6147275iod.0
        for <linux-firmware@kernel.org>; Fri, 10 Jun 2022 04:10:28 -0700 (PDT)
X-Gm-Message-State: AOAM533wu9t0myl5gE390tOZutTGjk8k35pAo8+m7uMW9UNjbP2uarhg
	uzlbzSSvazs+xMfvsXhq9w4zfilnDOxnlkizn1A=
X-Google-Smtp-Source: ABdhPJxduBhT+neOBPs0DUbzVbUz2o/TGKC6tTDZO6O6uPCw7b6hYaiFHkXfCjKC+CkwVsMqQhf1spFrjMg8cZlgb9g=
X-Received: by 2002:a05:6638:14cd:b0:331:d9b3:fa47 with SMTP id
 l13-20020a05663814cd00b00331d9b3fa47mr8886126jak.303.1654859428107; Fri, 10
 Jun 2022 04:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220607142716.1934891-1-strit@manjaro.org> <20220607142716.1934891-2-strit@manjaro.org>
In-Reply-To: <20220607142716.1934891-2-strit@manjaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Jun 2022 07:10:17 -0400
X-Gmail-Original-Message-ID: <CA+5PVA59=B0XC0Nxs+ZMppS-wZNO+0PUz3dfu7A+tdwFZf-MEA@mail.gmail.com>
Message-ID: <CA+5PVA59=B0XC0Nxs+ZMppS-wZNO+0PUz3dfu7A+tdwFZf-MEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] WHENCE: brcm: Add brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
To: Dan Johansen <strit@manjaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 10:28 AM Dan Johansen <strit@manjaro.org> wrote:
>
> Signed-off-by: Dan Johansen <strit@manjaro.org>
> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)

Heh, I see you did this in a separate commit.  I'm going to squash
these two together.

josh

>
> diff --git a/WHENCE b/WHENCE
> index f634c12..6dcb5e9 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2913,6 +2913,7 @@ File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>  Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
>  File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
> +File: "brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> --
> 2.36.1
>
