Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F090C433E0
	for <linux-firmware@archiver.kernel.org>; Sat,  9 Jan 2021 00:34:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1D1BE23AC2; Sat,  9 Jan 2021 00:34:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E919523AAA
	for <linux-firmware@kernel.org>; Sat,  9 Jan 2021 00:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610152441;
	bh=Btkgh6yQ8c/OYnHcPKNNVm9XMfTZv32EWqzKZrBuLOo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PDsXUJjKERM5XrtpcEHNzpMfHzONvauqsYWo+omhw+etgCJgSrJxi3+6KusNHFs8w
	 lUY6cKbZRajDsLJ/dHkdQbKQyr+YkvNHRMeLlIfIXrqx/wyMZ+TgrugE04jEMcjWaQ
	 CPcOsHc72q1JKLT5nwrWAfUBy8afYB4KO93wb38sIMt80rYvHfA3Q5yc3QOJByR0vM
	 6/wjJC4ErsazLrJdUXjf0IBh3pkZV06kK3up4yNOoKjM55w7ufKNiH6sYqozzykElU
	 vNGzSMcH1u4/ZCl3PC6Nsxut7MHzvFw/4vXNVBheNWp3pcq3gCxWqtXcGO5dLOxyU9
	 CN7gwcYZlN8+w==
Received: by mail-io1-f52.google.com with SMTP id t8so11615265iov.8
        for <linux-firmware@kernel.org>; Fri, 08 Jan 2021 16:34:00 -0800 (PST)
X-Gm-Message-State: AOAM532qQ0bxyEtJQ9hJA5OVG+TWMzkVZ+ttC/mCLPtg2LnE7zd/q8Rx
	iYfZeQkRgMGdkwGvnUVWNUUqZaDZXql0ChfftZM=
X-Google-Smtp-Source: ABdhPJzMYR5Ee/XCNChXBKVT9gBul7c/a6N0Ra1SoUkreFFXP9lur5vXMb0+U9YMFLZdaULlTUgzOZSTsUQskBMW4FI=
X-Received: by 2002:a05:6638:83:: with SMTP id v3mr5661527jao.106.1610152440281;
 Fri, 08 Jan 2021 16:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20210108204420.1724179-1-jeremy.linton@arm.com> <136e2055-c307-5097-385c-fb9a741d9672@redhat.com>
In-Reply-To: <136e2055-c307-5097-385c-fb9a741d9672@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 8 Jan 2021 19:33:49 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6qHXe+t23vGUv+8=pqGjG0-=op4QwgUT2-D_+jy73eUw@mail.gmail.com>
Message-ID: <CA+5PVA6qHXe+t23vGUv+8=pqGjG0-=op4QwgUT2-D_+jy73eUw@mail.gmail.com>
Subject: Re: [BUG] cypress: Fix link direction
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Jeremy Linton <jeremy.linton@arm.com>, Linux Firmware <linux-firmware@kernel.org>, 
	Peter Robinson <pbrobinson@gmail.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 5:08 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 1/8/21 9:44 PM, Jeremy Linton wrote:
> > It appears the link direction was incorrect resulting
> > in dangling symlinks. This also causes the brcm devices
> > to be unable to find their firmware
> >
> > Fixes: 060ad8b3d505e ("cypress: Link the new cypress firmware to the old brcm files")
> > Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> > Cc: Peter Robinson <pbrobinson@gmail.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Chi-Hsien Lin <chi-hsien.lin@cypress.com>
> > Cc: Josh Boyer <jwboyer@kernel.org>
>
> <ugh>, thank you for catching this.

Indeed.  I should have caught this as well.  Thank you.

Patch applied and pushed out.  I'll get to the rest tomorrow.

josh

> Patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Regards,
>
> Hans
>
> > ---
> >  WHENCE | 42 +++++++++++++++++++++---------------------
> >  1 file changed, 21 insertions(+), 21 deletions(-)
> >
> > diff --git a/WHENCE b/WHENCE
> > index 676bb18..cbde48d 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -2651,47 +2651,47 @@ Licence: Redistributable. See LICENCE.broadcom_bcm43xx for details.
> >
> >  File: brcm/brcmfmac4373.bin
> >  File: cypress/cyfmac43012-sdio.bin
> > -Link: cypress/cyfmac43012-sdio.bin -> ../brcm/brcmfmac43012-sdio.bin
> > +Link: brcm/brcmfmac43012-sdio.bin -> ../cypress/cyfmac43012-sdio.bin
> >  File: cypress/cyfmac43012-sdio.clm_blob
> > -Link: cypress/cyfmac43012-sdio.clm_blob -> ../brcm/brcmfmac43012-sdio.clm_blob
> > +Link: brcm/brcmfmac43012-sdio.clm_blob -> ../cypress/cyfmac43012-sdio.clm_blob
> >  File: cypress/cyfmac43340-sdio.bin
> > -Link: cypress/cyfmac43340-sdio.bin -> ../brcm/brcmfmac43340-sdio.bin
> > +Link: brcm/brcmfmac43340-sdio.bin -> ../cypress/cyfmac43340-sdio.bin
> >  File: cypress/cyfmac43362-sdio.bin
> > -Link: cypress/cyfmac43362-sdio.bin -> ../brcm/brcmfmac43362-sdio.bin
> > +Link: brcm/brcmfmac43362-sdio.bin -> ../cypress/cyfmac43362-sdio.bin
> >  File: cypress/cyfmac4339-sdio.bin
> > -Link: cypress/cyfmac4339-sdio.bin -> ../brcm/brcmfmac4339-sdio.bin
> > +Link: brcm/brcmfmac4339-sdio.bin -> ../cypress/cyfmac4339-sdio.bin
> >  File: cypress/cyfmac43430-sdio.bin
> > -Link: cypress/cyfmac43430-sdio.bin -> ../brcm/brcmfmac43430-sdio.bin
> > +Link: brcm/brcmfmac43430-sdio.bin -> ../cypress/cyfmac43430-sdio.bin
> >  File: cypress/cyfmac43430-sdio.clm_blob
> > -Link: cypress/cyfmac43430-sdio.clm_blob -> ../brcm/brcmfmac43430-sdio.clm_blob
> > +Link: brcm/brcmfmac43430-sdio.clm_blob -> ../cypress/cyfmac43430-sdio.clm_blob
> >  File: cypress/cyfmac43455-sdio.bin
> > -Link: cypress/cyfmac43455-sdio.bin -> ../brcm/brcmfmac43455-sdio.bin
> > +Link: brcm/brcmfmac43455-sdio.bin -> ../cypress/cyfmac43455-sdio.bin
> >  File: cypress/cyfmac43455-sdio.clm_blob
> > -Link: cypress/cyfmac43455-sdio.clm_blob -> ../brcm/brcmfmac43455-sdio.clm_blob
> > +Link: brcm/brcmfmac43455-sdio.clm_blob -> ../cypress/cyfmac43455-sdio.clm_blob
> >  File: cypress/cyfmac4354-sdio.bin
> > -Link: cypress/cyfmac4354-sdio.bin -> ../brcm/brcmfmac4354-sdio.bin
> > +Link: brcm/brcmfmac4354-sdio.bin -> ../cypress/cyfmac4354-sdio.bin
> >  File: cypress/cyfmac4354-sdio.clm_blob
> > -Link: cypress/cyfmac4354-sdio.clm_blob -> ../brcm/brcmfmac4354-sdio.clm_blob
> > +Link: brcm/brcmfmac4354-sdio.clm_blob -> ../cypress/cyfmac4354-sdio.clm_blob
> >  File: cypress/cyfmac4356-pcie.bin
> > -Link: cypress/cyfmac4356-pcie.bin -> ../brcm/brcmfmac4356-pcie.bin
> > +Link: brcm/brcmfmac4356-pcie.bin -> ../cypress/cyfmac4356-pcie.bin
> >  File: cypress/cyfmac4356-pcie.clm_blob
> > -Link: cypress/cyfmac4356-pcie.clm_blob -> ../brcm/brcmfmac4356-pcie.clm_blob
> > +Link: brcm/brcmfmac4356-pcie.clm_blob -> ../cypress/cyfmac4356-pcie.clm_blob
> >  File: cypress/cyfmac4356-sdio.bin
> > -Link: cypress/cyfmac4356-sdio.bin -> ../brcm/brcmfmac4356-sdio.bin
> > +Link: brcm/brcmfmac4356-sdio.bin -> ../cypress/cyfmac4356-sdio.bin
> >  File: cypress/cyfmac4356-sdio.clm_blob
> > -Link: cypress/cyfmac4356-sdio.clm_blob -> ../brcm/brcmfmac4356-sdio.clm_blob
> > +Link: brcm/brcmfmac4356-sdio.clm_blob -> ../cypress/cyfmac4356-sdio.clm_blob
> >  File: cypress/cyfmac43570-pcie.bin
> > -Link: cypress/cyfmac43570-pcie.bin -> ../brcm/brcmfmac43570-pcie.bin
> > +Link: brcm/brcmfmac43570-pcie.bin -> ../cypress/cyfmac43570-pcie.bin
> >  File: cypress/cyfmac43570-pcie.clm_blob
> > -Link: cypress/cyfmac43570-pcie.clm_blob -> ../brcm/brcmfmac43570-pcie.clm_blob
> > +Link: brcm/brcmfmac43570-pcie.clm_blob -> ../cypress/cyfmac43570-pcie.clm_blob
> >  File: cypress/cyfmac4373-sdio.bin
> > -Link: cypress/cyfmac4373-sdio.bin -> ../brcm/brcmfmac4373-sdio.bin
> > +Link: brcm/brcmfmac4373-sdio.bin -> ../cypress/cyfmac4373-sdio.bin
> >  File: cypress/cyfmac4373-sdio.clm_blob
> > -Link: cypress/cyfmac4373-sdio.clm_blob -> ../brcm/brcmfmac4373-sdio.clm_blob
> > +Link: brcm/brcmfmac4373-sdio.clm_blob -> ../cypress/cyfmac4373-sdio.clm_blob
> >  File: cypress/cyfmac54591-pcie.bin
> > -Link: cypress/cyfmac54591-pcie.bin -> ../brcm/brcmfmac54591-pcie.bin
> > +Link: brcm/brcmfmac54591-pcie.bin -> ../cypress/cyfmac54591-pcie.bin
> >  File: cypress/cyfmac54591-pcie.clm_blob
> > -Link: cypress/cyfmac54591-pcie.clm_blob -> ../brcm/brcmfmac54591-pcie.clm_blob
> > +Link: brcm/brcmfmac54591-pcie.clm_blob -> ../cypress/cyfmac54591-pcie.clm_blob
> >
> >  Licence: Redistributable. See LICENCE.cypress for details.
> >
> >
>
