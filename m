Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD64C433EF
	for <linux-firmware@archiver.kernel.org>; Sun, 10 Jul 2022 13:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23BAAC341CB; Sun, 10 Jul 2022 13:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E73EC341CD
	for <linux-firmware@kernel.org>; Sun, 10 Jul 2022 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657459364;
	bh=4Z/rg8vPfD40VWTe2PdSrQciAabYkep+/EpNDanm6rI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=aLbLfQ9urlSr/gLRvGC925121ht34BF2eSbo/u0BvEOUeJ6zskZJvvUGVfIL2KjLj
	 yK4fDk2DjfMPDQIeetkLGNUTzaxohhbOJWhS7Hka4Y/rC2z14PBAZpUs2IFOmhZT46
	 z2lrKhRV8ENz9msmKjUE446UYuvquOPLQMRFZvcf0wuVYUVleKItpTE2dgCND8sQZE
	 +oLPH4cSzKl53YBULmKo5PgWqV6K06t8+Mz7vsCpL5m59VaonPLlbUZIel4S9B+njP
	 1F0DCTOKiQhUPpGf2Oa9YEuT3NTSVQUBqU956laDIq77Q2milGnSmbVXwC9BD2vD0s
	 V+sEbSlwhVZ0A==
Received: by mail-io1-f50.google.com with SMTP id v185so2831544ioe.11
        for <linux-firmware@kernel.org>; Sun, 10 Jul 2022 06:22:43 -0700 (PDT)
X-Gm-Message-State: AJIora87D4P5RDnAPOHiQfR6sDcIfn9JvkaPaZAeXWjXYP4fdcXPNzuK
	I2ecjTpQiWSdUuaV8xRY80I22a6O6XCniTituOk=
X-Google-Smtp-Source: AGRyM1s9jK7GNxXJP+Mw64ctb7WbO9Ls4ftO6cNWqL+nYHXXm5rbPOqeATBqr1+pMIn1LsPrG8Q0H3yt8xSZ3eD0mNc=
X-Received: by 2002:a05:6638:d96:b0:33c:d6f8:4a8c with SMTP id
 l22-20020a0566380d9600b0033cd6f84a8cmr7715714jaj.146.1657459363127; Sun, 10
 Jul 2022 06:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220708160951.132-1-mario.limonciello@amd.com> <CALeDE9Nfi9zhbS9ZnAAg5o9EU6OS0FNchBfLUpiMgV33cCUGRg@mail.gmail.com>
In-Reply-To: <CALeDE9Nfi9zhbS9ZnAAg5o9EU6OS0FNchBfLUpiMgV33cCUGRg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sun, 10 Jul 2022 09:22:32 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5-P3zNq=V05R1z8Qy2TSJMMbp7RMHfRRSs-bNk3y86Cw@mail.gmail.com>
Message-ID: <CA+5PVA5-P3zNq=V05R1z8Qy2TSJMMbp7RMHfRRSs-bNk3y86Cw@mail.gmail.com>
Subject: Re: [PATCH] WHENCE: Correct dangling symlinks
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 12:31 PM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> On Fri, Jul 8, 2022 at 5:10 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
> >
> > The symlink direction was wrong for some brcm firmware.
> >
> > Fixes: f8a2651a ("Link some devices that ship with the AW-CM256SM")
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
>
> Face palm, good catch, thanks!

Applied and pushed out.

josh

> > ---
> >  WHENCE | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/WHENCE b/WHENCE
> > index 14f3472e..14d0a877 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -2820,10 +2820,10 @@ Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6
> >  Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
> >  Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
> >  File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> > -Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt
> > -Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinebook-pro.txt
> > -Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinephone-pro.txt
> > -Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,quartz64-b.txt
> > +Link: brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> > +Link: brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> > +Link: brcmfmac43455-sdio.pine64,pinephone-pro.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> > +Link: brcmfmac43455-sdio.pine64,quartz64-b.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> >
> >  Licence: GPLv2. See GPL-2 for details.
> >
> > --
> > 2.34.1
> >
