Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344D2C433DB
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Jan 2021 12:23:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 11C702311D; Wed,  6 Jan 2021 12:23:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4DBC22ADF
	for <linux-firmware@kernel.org>; Wed,  6 Jan 2021 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609935783;
	bh=xLH/mUU36UHXpIo+6DjAlz8RcVZ8KpY+lDBj8Hr9ySw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KrdSbvM9nItOLKgq2SHLgS2ncL3MOIA+Uf5WmZosFfBbgWZwDcrfP2F+xsZR0hRIF
	 rc41ljNoyEf0V/Q1eUZ8TT/8fmKqOAYdi1RywaV1bOl1CMTT6hxEUXzTLOv/Hx++LV
	 u5OgQs7XzesfYf/Ow99cqkbpNfgfR7S3CPykJDyf3ho3vLyrQTKjLePXanwTIgCG2W
	 +aIYLyCU0OP9XRWs6Qv2TLIb96yi3XqM4hcuHRLmwQ6dS/8BJMOAY9p0H+dfKUtS6s
	 Fdy93pRK4TfS3x5vJa2ldy7ijGdBe4kp6upA+yZ6BnXOoGE8ec+L95u0iTZJG9XzPm
	 MF0I6DNairLFA==
Received: by mail-io1-f43.google.com with SMTP id d9so2523680iob.6
        for <linux-firmware@kernel.org>; Wed, 06 Jan 2021 04:23:02 -0800 (PST)
X-Gm-Message-State: AOAM530kPuLAGvgEurwj8DhCbcHEakWWfgdAvSAl0A6/wFsbgSmpD6Cd
	pI1DF9inFEMrJl9jbhx9IVrNG1MwhUxge/kzMvk=
X-Google-Smtp-Source: ABdhPJxrek+5Y/95rDW6+XKqjrvTnPCRsyXx0RRlouQhI1UU6NpNO0EJgB7FmaB8QCK9+LYHwVu6ccrgFT/4mSIfPjg=
X-Received: by 2002:a02:b607:: with SMTP id h7mr3507120jam.120.1609935782412;
 Wed, 06 Jan 2021 04:23:02 -0800 (PST)
MIME-Version: 1.0
References: <20210105160443.156995-1-pbrobinson@gmail.com> <1fe934f8-9cd3-7c95-3e8e-19639d7d9b2a@infineon.com>
 <CALeDE9P6jEgOdZKCTb0MzuGARExzAUR=MddekrnBEY7H=4NR4A@mail.gmail.com> <31780fde-530e-b6c7-0774-df22baae762f@redhat.com>
In-Reply-To: <31780fde-530e-b6c7-0774-df22baae762f@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 6 Jan 2021 07:22:51 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5+o5Pkui81C_vY+fj0HGwxieDQ4=feoV=nVTk_i-BBCw@mail.gmail.com>
Message-ID: <CA+5PVA5+o5Pkui81C_vY+fj0HGwxieDQ4=feoV=nVTk_i-BBCw@mail.gmail.com>
Subject: Re: [PATCH 2/2] cyprus: Link the new cyprus firmware to the old brcm files
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Peter Robinson <pbrobinson@gmail.com>, Chi-Hsien Lin <Chi-Hsien.Lin@infineon.com>, 
	Linux Firmware <linux-firmware@kernel.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	SHA-cyfmac-dev-list@infineon.com, brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 6, 2021 at 4:19 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 1/6/21 10:17 AM, Peter Robinson wrote:
> > On Wed, Jan 6, 2021 at 3:50 AM Chi-Hsien Lin <Chi-Hsien.Lin@infineon.co=
m> wrote:
> >>
> >>
> >> Peter Robinson =E6=96=BC 2021/1/6 =E4=B8=8A=E5=8D=88 12:04 =E5=AF=AB=
=E9=81=93:
> >>> By linking the new firmware to the old file it allows exisiting
> >>> kernels to make use of the new firmware and make use of the
> >>> newer firmware with all the associated fixes.
> >>>
> >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >>> Cc: Hans de Goede <hdegoede@redhat.com>
> >>> Cc: Chi-Hsien Lin <chi-hsien.lin@cypress.com>
> >>
> >> (+Arend and lists)
> >>
> >> Hi Peter,
> >>
> >> The folder name is Cypress instead of cyprus. Could you please fix thi=
s
> >> in v2 commit messages?
> >
> > Yes, of course. I'll wait a little for some other feedback.
>
> I thought I already send this yesterday, but I think I did the review and
> then forgot to reply...
>
> The entire series looks good to me, so for v2 you can add my:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> To both patches.

I'll just edit the commit messages locally when I apply the patches.
No need for a full v2 submission unless there are other changes to be
made.  I'll wait for a bit before committing to allow for any other
feedback.

josh

> >>> ---
> >>>   WHENCE | 21 +++++++++++++++++++++
> >>>   1 file changed, 21 insertions(+)
> >>>
> >>> diff --git a/WHENCE b/WHENCE
> >>> index 1bd5085..354d52a 100644
> >>> --- a/WHENCE
> >>> +++ b/WHENCE
> >>> @@ -2651,26 +2651,47 @@ Licence: Redistributable. See LICENCE.broadco=
m_bcm43xx for details.
> >>>
> >>>   File: brcm/brcmfmac4373.bin
> >>>   File: cypress/cyfmac43012-sdio.bin
> >>> +Link: cypress/cyfmac43012-sdio.bin -> ../brcm/brcmfmac43012-sdio.bin
> >>>   File: cypress/cyfmac43012-sdio.clm_blob
> >>> +Link: cypress/cyfmac43012-sdio.clm_blob -> ../brcm/brcmfmac43012-sdi=
o.clm_blob
> >>>   File: cypress/cyfmac43340-sdio.bin
> >>> +Link: cypress/cyfmac43340-sdio.bin -> ../brcm/brcmfmac43340-sdio.bin
> >>>   File: cypress/cyfmac43362-sdio.bin
> >>> +Link: cypress/cyfmac43362-sdio.bin -> ../brcm/brcmfmac43362-sdio.bin
> >>>   File: cypress/cyfmac4339-sdio.bin
> >>> +Link: cypress/cyfmac4339-sdio.bin -> ../brcm/brcmfmac4339-sdio.bin
> >>>   File: cypress/cyfmac43430-sdio.bin
> >>> +Link: cypress/cyfmac43430-sdio.bin -> ../brcm/brcmfmac43430-sdio.bin
> >>>   File: cypress/cyfmac43430-sdio.clm_blob
> >>> +Link: cypress/cyfmac43430-sdio.clm_blob -> ../brcm/brcmfmac43430-sdi=
o.clm_blob
> >>>   File: cypress/cyfmac43455-sdio.bin
> >>> +Link: cypress/cyfmac43455-sdio.bin -> ../brcm/brcmfmac43455-sdio.bin
> >>>   File: cypress/cyfmac43455-sdio.clm_blob
> >>> +Link: cypress/cyfmac43455-sdio.clm_blob -> ../brcm/brcmfmac43455-sdi=
o.clm_blob
> >>>   File: cypress/cyfmac4354-sdio.bin
> >>> +Link: cypress/cyfmac4354-sdio.bin -> ../brcm/brcmfmac4354-sdio.bin
> >>>   File: cypress/cyfmac4354-sdio.clm_blob
> >>> +Link: cypress/cyfmac4354-sdio.clm_blob -> ../brcm/brcmfmac4354-sdio.=
clm_blob
> >>>   File: cypress/cyfmac4356-pcie.bin
> >>> +Link: cypress/cyfmac4356-pcie.bin -> ../brcm/brcmfmac4356-pcie.bin
> >>>   File: cypress/cyfmac4356-pcie.clm_blob
> >>> +Link: cypress/cyfmac4356-pcie.clm_blob -> ../brcm/brcmfmac4356-pcie.=
clm_blob
> >>>   File: cypress/cyfmac4356-sdio.bin
> >>> +Link: cypress/cyfmac4356-sdio.bin -> ../brcm/brcmfmac4356-sdio.bin
> >>>   File: cypress/cyfmac4356-sdio.clm_blob
> >>> +Link: cypress/cyfmac4356-sdio.clm_blob -> ../brcm/brcmfmac4356-sdio.=
clm_blob
> >>>   File: cypress/cyfmac43570-pcie.bin
> >>> +Link: cypress/cyfmac43570-pcie.bin -> ../brcm/brcmfmac43570-pcie.bin
> >>>   File: cypress/cyfmac43570-pcie.clm_blob
> >>> +Link: cypress/cyfmac43570-pcie.clm_blob -> ../brcm/brcmfmac43570-pci=
e.clm_blob
> >>>   File: cypress/cyfmac4373-sdio.bin
> >>> +Link: cypress/cyfmac4373-sdio.bin -> ../brcm/brcmfmac4373-sdio.bin
> >>>   File: cypress/cyfmac4373-sdio.clm_blob
> >>> +Link: cypress/cyfmac4373-sdio.clm_blob -> ../brcm/brcmfmac4373-sdio.=
clm_blob
> >>>   File: cypress/cyfmac54591-pcie.bin
> >>> +Link: cypress/cyfmac54591-pcie.bin -> ../brcm/brcmfmac54591-pcie.bin
> >>>   File: cypress/cyfmac54591-pcie.clm_blob
> >>> +Link: cypress/cyfmac54591-pcie.clm_blob -> ../brcm/brcmfmac54591-pci=
e.clm_blob
> >>>
> >>>   Licence: Redistributable. See LICENCE.cypress for details.
> >>>
> >
>
