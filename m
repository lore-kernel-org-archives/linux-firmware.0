Return-Path: <SRS0=ZWJV=2U=gmail.com=robdclark@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFFBC433FE
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Oct 2022 16:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25D25C433D7; Wed, 19 Oct 2022 16:02:24 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44429C433C1;
	Wed, 19 Oct 2022 16:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44429C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id b25so10981210qkk.7;
        Wed, 19 Oct 2022 09:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cXEg5LXhNr6g4o3GCgJPPoDv0cCzaMCnarb4y16JcsY=;
        b=RAroKaRpfurWTvdxCuUh8np+UlQQDNQ6hBpvoFSPm0fTBhVT/dA5guQBjs7SUBydth
         +3IKvpvLg/wjYbkIR6rexQtdqizcuPcHZDA3kQDEXFs30wzynVs2kDSu9/qKRurQ3M03
         72Yncp8YmtQJnt67CQ23xVaGYKwA3/S2ha4z3RZoH9lXA5Pf9t8TdjbcS/9n2UL7XVE7
         hDnbDot1+25UMESk3RQ68mxmpoktDbGTVLzuXj4tjMjTsX11WiIeBiymhFgofg2Aw/LY
         MJfprLSyTunx+IWVFqOBAT5drMePt+caneSsNcjxC3FYEw2JnUUn3RIRHfxtoTP+BCak
         KWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXEg5LXhNr6g4o3GCgJPPoDv0cCzaMCnarb4y16JcsY=;
        b=orfJaydwth5N0qtybZC3kAAKn7dfE0gpBxW1fRdkDY2+vbO7SVL+Z5pinhA+9EKiDc
         ZrnCC9z0nP3MKryzSO+6jX0zKpbkWVK+YL9RMeDmgV+CXigqPauijUQ0kgNdTjM8wdZS
         xonpg40GEMVAw+sLHT4TpzxfF6AaWMiteax2hhpWo5tlXdzHC47eGifnaMdFkUDZ4VZN
         uzn/2ISuj19Om8/rQuCCahoBRdeyhpGU1268WzjHY2QDP4Ch0JGo9qa9mUUpxGG0XPBa
         tqduwPJ2eOQtdr6YJAyI6R48AhqH3q95V+4Bky6eYGh4F+yBpu30Lx+R0sIeux/mLE+j
         AnlA==
X-Gm-Message-State: ACrzQf3OzZVZk1ilG2lOWvqTNe7Erc0R+tim0/+V3AjJe+pFnFvL4nqA
	JJ0VAnNOmnRw8pyCWppxCBUjroOhfOqJPf/i+XA=
X-Google-Smtp-Source: AMsMyM6TEo4hDub8A4ZbQ/NFeTrObyoOtGeqB0ezEVBW6LzWaQsU9/zwd1KSDsuucdd55cJAlAut2BNOLEXJ57PbZ28=
X-Received: by 2002:ae9:e002:0:b0:6eb:adfb:5e03 with SMTP id
 m2-20020ae9e002000000b006ebadfb5e03mr5941174qkk.243.1666195342071; Wed, 19
 Oct 2022 09:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
 <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
In-Reply-To: <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 19 Oct 2022 09:02:10 -0700
Message-ID: <CAF6AEGtsw5GTB+MzvA7mE8y=m6qDFtQNFnnAVtuFSxnDAT0YuA@mail.gmail.com>
Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
To: Nathan Hebert <nhebert@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_vgarodia@quicinc.com, Fritz Koenig <frkoenig@chromium.org>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Actually, isn't the .mbn the joined fw?  If so all you need to do is
remove the other files?

On Wed, Oct 19, 2022 at 8:52 AM Rob Clark <robdclark@gmail.com> wrote:
>
> Hmm, does venus not support the combined firmware yet?  Elsewhere
> we've moved away from split fw to using a single ELF file..
>
> BR,
> -R
>
> On Tue, Oct 18, 2022 at 2:18 PM Nathan Hebert <nhebert@chromium.org> wrote:
> >
> > The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> >
> >   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/nathan-google/linux-firmware.git
> > update_sc7180_and_sc7280_firmwares
> >
> > for you to fetch changes up to 76e160366a28010fa06ddc965659c38a44d159d9:
> >
> >   qcom: update venus firmware files for VPU-2.0 (2022-10-18 13:42:58 -0700)
> >
> > ----------------------------------------------------------------
> > Nathan Hebert (2):
> >       qcom: update venus firmware files for v5.4
> >       qcom: update venus firmware files for VPU-2.0
> >
> >  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
> >  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
> >  qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
> >  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
> >  qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
> >  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
> >  qcom/vpu-2.0/venus.b00   | Bin 692 -> 692 bytes
> >  qcom/vpu-2.0/venus.b01   | Bin 7376 -> 7376 bytes
> >  qcom/vpu-2.0/venus.b02   | Bin 300 -> 300 bytes
> >  qcom/vpu-2.0/venus.b04   | Bin 20 -> 20 bytes
> >  qcom/vpu-2.0/venus.b09   | Bin 939184 -> 939472 bytes
> >  qcom/vpu-2.0/venus.b10   | Bin 42976 -> 43120 bytes
> >  qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
> >  qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 8068 bytes
> >  14 files changed, 0 insertions(+), 0 deletions(-)
