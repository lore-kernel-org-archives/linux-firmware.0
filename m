Return-Path: <SRS0=hjx2=GJ=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7756C433E0
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Jan 2021 09:17:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8B63622CB9; Wed,  6 Jan 2021 09:17:58 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 014AB2255F;
	Wed,  6 Jan 2021 09:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 014AB2255F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-ej1-f43.google.com with SMTP id w1so4032430ejf.11;
        Wed, 06 Jan 2021 01:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OJeSkgQriDNTfoaQEk/V1lb+z95+Hx9JRYgQKugFBBc=;
        b=XijSV6PzV1k9qyFIfDrGqZNP4IVSf7mljJeqZ1lQHTifjdt0RIAAWxOSsxpWPPQZzM
         wJTwGpKFWCazXNpYojqH5La/uik5YB8aHGYdpRrKbDvqH0REL9qHdKyc3EB62or1R/By
         EyMulenxwkQ8aJyr0TsSLoewy8WSdjOxYMQZn3KhZA2DCKgcdm+Ah81hTSzyTTEgvGDz
         IspJtnBZHVH1ZAoqx3t/cdD+++69gWQvYpn+2t2dYTYyk1mC0k23byZIxXEDkCJ0VYCu
         UDsVHeDRoXl6JKs0zxquZcBOwqnPMpWBAuoVipiJcKhm89vyB2EJlVmEvrWFTsjJHocy
         PHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OJeSkgQriDNTfoaQEk/V1lb+z95+Hx9JRYgQKugFBBc=;
        b=j9SME/hmTrMFVDcRjWTGW6NwEpHd06U0QsT9TKN/HmgskJP7QLVRIITxDXsWT+6ExC
         Z73b37yYg2z+cPz3UPhvGgwmhaMVt1DZR6nxyeW2RFiuDjPoQfAievLu/CMwap6S+2kd
         lUwu0oyzX0g7sXdEmB/VfKYQMTo14Psx4mGyVUfKIkqQlxJyWjgD6Tq/r4odidhZ2XTr
         6Qljvs8lvOVwHk3At3omTy+hknBaUQGW2ZdPgRhQn49GYBneFuBxgvLZOT5D8ruDPEk0
         DXXdxNmqKnvaSTZ37//1AeAkyeL5PNuisDZY++JwUh/I2F1Y2+Jp4jdywyrVdlKpXq2W
         xnaw==
X-Gm-Message-State: AOAM532RcV+C8R4vcklmUnWOEKGUjKmKeEWsLApj6bkMjE4BW1r8YmvA
	j2Qvvm0i8TK+x7YyP+1IZkl/tLeJsb6rAS6q211RYAgT
X-Google-Smtp-Source: ABdhPJyD8VSYbBnPwZBtrlksTf1v39/QpNkr5RlP7UyJlyJcv/7CNYNpgK2FmIdVsK1JjJdHUJrwApbjhwvOTyoK46M=
X-Received: by 2002:a17:907:1629:: with SMTP id hb41mr949660ejc.197.1609924676347;
 Wed, 06 Jan 2021 01:17:56 -0800 (PST)
MIME-Version: 1.0
References: <20210105160443.156995-1-pbrobinson@gmail.com> <1fe934f8-9cd3-7c95-3e8e-19639d7d9b2a@infineon.com>
In-Reply-To: <1fe934f8-9cd3-7c95-3e8e-19639d7d9b2a@infineon.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 6 Jan 2021 09:17:44 +0000
Message-ID: <CALeDE9P6jEgOdZKCTb0MzuGARExzAUR=MddekrnBEY7H=4NR4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] cyprus: Link the new cyprus firmware to the old brcm files
To: Chi-Hsien Lin <Chi-Hsien.Lin@infineon.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	SHA-cyfmac-dev-list@infineon.com, brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 6, 2021 at 3:50 AM Chi-Hsien Lin <Chi-Hsien.Lin@infineon.com> w=
rote:
>
>
> Peter Robinson =E6=96=BC 2021/1/6 =E4=B8=8A=E5=8D=88 12:04 =E5=AF=AB=E9=
=81=93:
> > By linking the new firmware to the old file it allows exisiting
> > kernels to make use of the new firmware and make use of the
> > newer firmware with all the associated fixes.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Chi-Hsien Lin <chi-hsien.lin@cypress.com>
>
> (+Arend and lists)
>
> Hi Peter,
>
> The folder name is Cypress instead of cyprus. Could you please fix this
> in v2 commit messages?

Yes, of course. I'll wait a little for some other feedback.

Peter

>
> Regards,
>
> Chi-hsien Lin
>
>
> > ---
> >   WHENCE | 21 +++++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> >
> > diff --git a/WHENCE b/WHENCE
> > index 1bd5085..354d52a 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -2651,26 +2651,47 @@ Licence: Redistributable. See LICENCE.broadcom_=
bcm43xx for details.
> >
> >   File: brcm/brcmfmac4373.bin
> >   File: cypress/cyfmac43012-sdio.bin
> > +Link: cypress/cyfmac43012-sdio.bin -> ../brcm/brcmfmac43012-sdio.bin
> >   File: cypress/cyfmac43012-sdio.clm_blob
> > +Link: cypress/cyfmac43012-sdio.clm_blob -> ../brcm/brcmfmac43012-sdio.=
clm_blob
> >   File: cypress/cyfmac43340-sdio.bin
> > +Link: cypress/cyfmac43340-sdio.bin -> ../brcm/brcmfmac43340-sdio.bin
> >   File: cypress/cyfmac43362-sdio.bin
> > +Link: cypress/cyfmac43362-sdio.bin -> ../brcm/brcmfmac43362-sdio.bin
> >   File: cypress/cyfmac4339-sdio.bin
> > +Link: cypress/cyfmac4339-sdio.bin -> ../brcm/brcmfmac4339-sdio.bin
> >   File: cypress/cyfmac43430-sdio.bin
> > +Link: cypress/cyfmac43430-sdio.bin -> ../brcm/brcmfmac43430-sdio.bin
> >   File: cypress/cyfmac43430-sdio.clm_blob
> > +Link: cypress/cyfmac43430-sdio.clm_blob -> ../brcm/brcmfmac43430-sdio.=
clm_blob
> >   File: cypress/cyfmac43455-sdio.bin
> > +Link: cypress/cyfmac43455-sdio.bin -> ../brcm/brcmfmac43455-sdio.bin
> >   File: cypress/cyfmac43455-sdio.clm_blob
> > +Link: cypress/cyfmac43455-sdio.clm_blob -> ../brcm/brcmfmac43455-sdio.=
clm_blob
> >   File: cypress/cyfmac4354-sdio.bin
> > +Link: cypress/cyfmac4354-sdio.bin -> ../brcm/brcmfmac4354-sdio.bin
> >   File: cypress/cyfmac4354-sdio.clm_blob
> > +Link: cypress/cyfmac4354-sdio.clm_blob -> ../brcm/brcmfmac4354-sdio.cl=
m_blob
> >   File: cypress/cyfmac4356-pcie.bin
> > +Link: cypress/cyfmac4356-pcie.bin -> ../brcm/brcmfmac4356-pcie.bin
> >   File: cypress/cyfmac4356-pcie.clm_blob
> > +Link: cypress/cyfmac4356-pcie.clm_blob -> ../brcm/brcmfmac4356-pcie.cl=
m_blob
> >   File: cypress/cyfmac4356-sdio.bin
> > +Link: cypress/cyfmac4356-sdio.bin -> ../brcm/brcmfmac4356-sdio.bin
> >   File: cypress/cyfmac4356-sdio.clm_blob
> > +Link: cypress/cyfmac4356-sdio.clm_blob -> ../brcm/brcmfmac4356-sdio.cl=
m_blob
> >   File: cypress/cyfmac43570-pcie.bin
> > +Link: cypress/cyfmac43570-pcie.bin -> ../brcm/brcmfmac43570-pcie.bin
> >   File: cypress/cyfmac43570-pcie.clm_blob
> > +Link: cypress/cyfmac43570-pcie.clm_blob -> ../brcm/brcmfmac43570-pcie.=
clm_blob
> >   File: cypress/cyfmac4373-sdio.bin
> > +Link: cypress/cyfmac4373-sdio.bin -> ../brcm/brcmfmac4373-sdio.bin
> >   File: cypress/cyfmac4373-sdio.clm_blob
> > +Link: cypress/cyfmac4373-sdio.clm_blob -> ../brcm/brcmfmac4373-sdio.cl=
m_blob
> >   File: cypress/cyfmac54591-pcie.bin
> > +Link: cypress/cyfmac54591-pcie.bin -> ../brcm/brcmfmac54591-pcie.bin
> >   File: cypress/cyfmac54591-pcie.clm_blob
> > +Link: cypress/cyfmac54591-pcie.clm_blob -> ../brcm/brcmfmac54591-pcie.=
clm_blob
> >
> >   Licence: Redistributable. See LICENCE.cypress for details.
> >
