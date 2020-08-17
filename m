Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C3AC433E3
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Aug 2020 12:19:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 49FF82076E; Mon, 17 Aug 2020 12:19:57 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 27CC42075B
	for <linux-firmware@kernel.org>; Mon, 17 Aug 2020 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597666797;
	bh=vXYXA+RkN4sota9vT2mZtRK5ey83nqrZ2IPApQ7EbBA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=f1kHkloDgUQXlOif7xdcAMuwTX64CJ9IdoIJiE3SR5wYhTzj5XEn5uF0+Vq9EQ1aW
	 n8Ju+qqFkgjrIRh+dlNq6jfOJ3QSLaWmspcEqJtlUwqHoC/5RJTyfSPJjShMglpjGZ
	 nrxTSUg0vkQuqEqLtsAsTHmUc5D3nYIsoMBBYCGQ=
Received: by mail-il1-f182.google.com with SMTP id j9so14245684ilc.11
        for <linux-firmware@kernel.org>; Mon, 17 Aug 2020 05:19:57 -0700 (PDT)
X-Gm-Message-State: AOAM532DA68ziFou/UMJNDp1GKUYdFvOEDPr7zkzEXzPnBN7mNQ96RDL
	E4OUrBHOWukOpqLQ4sLXUmrV3jDC/F0lqr4wW5Q=
X-Google-Smtp-Source: ABdhPJxe36ro5s8s20c+a8tLF6Hk8p4eOAyJX28oIvBkWNWdT9dHbIvk5D3ZtenfGbuGgXmuq9k+xPIK29hR3kBSjR8=
X-Received: by 2002:a92:4f:: with SMTP id 76mr9394178ila.11.1597666796589;
 Mon, 17 Aug 2020 05:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200812143315.1853427-1-pbrobinson@gmail.com> <b6422746-1ae7-6b7c-4822-42f41c2be88a@suse.com>
In-Reply-To: <b6422746-1ae7-6b7c-4822-42f41c2be88a@suse.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 17 Aug 2020 08:19:45 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7_XgK96X8L_7Kb1bLKZUAMiS+1TE8=e_0uH57-utKxOg@mail.gmail.com>
Message-ID: <CA+5PVA7_XgK96X8L_7Kb1bLKZUAMiS+1TE8=e_0uH57-utKxOg@mail.gmail.com>
Subject: Re: [PATCH] brcm: Add brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt
 symlink
To: Matthias Brugger <mbrugger@suse.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Peter Robinson <pbrobinson@gmail.com>, Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 12, 2020 at 11:10 AM Matthias Brugger <mbrugger@suse.com> wrote:
>
>
>
> On 12/08/2020 16:33, Peter Robinson wrote:
> > The Raspberry Pi 3A+ uses the same WiFi module and NVRAM as the 3B+ and
> > Raspbian uses the same file for both models so we can symlink the 3A+ to
> > the 3B+ to have WiFi work on those devices too.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > Cc: Matthias Brugger <mbrugger@suse.com>
>
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>

Applied and pushed out.

josh

>
> > ---
> >   WHENCE | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/WHENCE b/WHENCE
> > index be8c390..8f74167 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -2624,6 +2624,7 @@ File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
> >   File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
> >   File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
> >   File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
> > +Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
> >   File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> >   File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
> >   File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
> >
