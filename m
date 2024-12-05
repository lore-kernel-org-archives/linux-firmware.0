Return-Path: <SRS0=rw9f=S6=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA378E7716C
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Dec 2024 11:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E694C4CEE1; Thu,  5 Dec 2024 11:20:10 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A516AC4CED1
	for <linux-firmware@kernel.org>; Thu,  5 Dec 2024 11:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A516AC4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ef4b6719d1so3655797b3.2
        for <linux-firmware@kernel.org>; Thu, 05 Dec 2024 03:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733397607; x=1734002407; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ozs3S+GTlPkN15LU9I/Pf6RBJvugw4x2IA6c6KevrVI=;
        b=PJZ/OPpNusBa7b7VlpYr5KB8BBRvdPmTM6Uia+JO5ZM4m7r7xYW0sKSSgcsu55LQfC
         U2ysqWrO/HBwK+W42V2KR28ZoS1N1QrOpdI5Vbcg/vgf78J0P4OUEwbd8MG+z0yKDEUx
         wh1Uqe5XL+X1v2/T091CMInEtIRTmvCbh/dOrqnwrBImIW2tkJsq/Fj0aykf2SmHy35r
         dCbse5/zNB1l/3GnW0GhaMAhQamNIIyzyt40nvY5imDttZgpsjipnvercYJ90dW1X23q
         tbTH2skq9oCamGWj/0KWcJurQhLwXCMgVo7klJuR2/6Ub/OzjgZRlvP3DdbAvPWzlG+m
         H8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397607; x=1734002407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozs3S+GTlPkN15LU9I/Pf6RBJvugw4x2IA6c6KevrVI=;
        b=mBcHiYerQtnNye4xFGEiph63+at6uvRmsSqTu7+jVPEft7z0WiSSGQ5I51T/6enDU7
         F/k79ytgBl6V8jddOuaG7z2RvPIiuP82QGWW0zxhO+D2kCXof/3vbuKzC1sK3SdJVjHM
         MJUnQZACcmDWzkSnOvTTK/zZkqBOxFiVrQXOU14MYDhJPtbkxyKE3I+XebwTysyoy+x3
         zGQ+byL0acbP66EFpfGM6lt6ihYiBgCQpOWoapuZZ7JQCdTLOxF/BETshimUp/twWhZw
         Z1qiLVUiVxcuL4aL1ZDX5SkC//NTrPCd0y3SCIymkzM/VAM+k+Qo3ukJeSV7EHZ2cyQn
         ld0g==
X-Gm-Message-State: AOJu0YzJtnbVkimEui4EUjO3H6IF4TOWdlkiGdi3EcgG3svIR+6+lUoM
	47Owam4+WbUsPcVw2kWESmyGMpz57Rwm4QyvSEkC/urq3k6ynXveuEa+PX9sZ3nmTrHDP/BuO9L
	jcMi+Rn4/phNidE8uuSRsj+dKgHvaBsgOJpYKFQ==
X-Gm-Gg: ASbGncviXR1RY2eZJEBlStIu1Q5jP/tEiM9d4L3a56KEPjUKYHr/f3Lw0A4f1WVXkek
	63TOT8WLSFVaL+PEtxIzfnjArdd48SLlKdmZgNGM6JCiIGw==
X-Google-Smtp-Source: AGHT+IHDNSa3rl56nZmWEzfgUJpCG0djX0poJRrD4aCF5yRAuqhbJdDyyhHq08gAVrlOniJVDjWlVaf0KCLx55Cs2lM=
X-Received: by 2002:a05:690c:600e:b0:6ef:97a2:49e6 with SMTP id
 00721157ae682-6efad2d91dfmr121699857b3.31.1733397607477; Thu, 05 Dec 2024
 03:20:07 -0800 (PST)
MIME-Version: 1.0
References: <7f156ffe-9629-17c1-47c5-97e0d0f3e1e0@quicinc.com>
 <i4ihcid3ka67rhwziue5tblahs6bwaehazq74bd5y64ybs4ahv@l6ti4xqr3yq6>
 <d169bd29-b756-f027-9f33-02106b702359@quicinc.com> <a3znmntnj3jliy77qffmiukdwccz75mkg5xj72yw3zxkqmjjsb@geavo66vpbpe>
 <63fe4338-43dd-e771-45fb-57a2096a1002@quicinc.com> <cz6nu7fuf23poqahslmnqisuiqakjzkmwvk2znvohmjrnvgfhs@wb4wkugrkgfm>
 <e02e6eb7-9af5-87a2-a7f0-248d9c7543c2@quicinc.com>
In-Reply-To: <e02e6eb7-9af5-87a2-a7f0-248d9c7543c2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Dec 2024 13:19:56 +0200
Message-ID: <CAA8EJpoagdAXE7L7qG9vQCkJbJ-MnB0LaYtqAoa8yLgj91O9ug@mail.gmail.com>
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
To: Sibi Sankar <quic_sibis@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, abickett@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Dec 2024 at 12:07, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
>
>
> On 11/29/24 20:07, Dmitry Baryshkov wrote:
> > On Tue, Oct 22, 2024 at 11:49:37AM +0530, Sibi Sankar wrote:
> >>
> >>
> >> On 10/18/24 21:23, Dmitry Baryshkov wrote:
> >>> On Fri, Oct 18, 2024 at 08:58:06PM +0530, Sibi Sankar wrote:
> >>>>
> >>>>
> >>>> On 10/18/24 16:13, Dmitry Baryshkov wrote:
> >>>>> On Fri, Oct 18, 2024 at 12:43:14PM +0530, Sibi Sankar wrote:
> >>>>>>
> >>>>>> Hello,
> >>>>>>
> >>>>>> The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
> >>>>>>
> >>>>>>      Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04
> >>>>>> +0000)
> >>>>>>
> >>>>>> are available in the Git repository at:
> >>>>>>
> >>>>>>      https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>>>> adsp-fw-x1e80100-crd
> >>>>>
> >>>>> Could you please clarify, why adspr.jsn doesn't declare tms/pdr_enabled?
> >>>>> Windows firmware has it in adspr.jsn.
> >>>>
> >>>> Hey Dmitry,
> >>>>
> >>>> Can you please share what device and META you are comparing this
> >>>> firmware against? This firmware was taken from the build source
> >>>> without any modification.
> >>>
> >>> I have been looking at the Windows driver from WSU for the CRD,
> >>> qsubsys_ext_adsp8380.cab. DriverVer = 08/27/2024,2.0.4114.4600.
> >>>
> >>> For the reference, I checked several last drops, they have the following
> >>> versions of qcadsp8380.mbn:
> >>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00792-HAMOA-1
> >>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00789.1-HAMOA-1
> >>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00787.2-HAMOA-1
> >>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00784-HAMOA-1
> >>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00781-HAMOA-1
> >>>
> >>> All of them list tms/pdr_enabled in adspr.jsn
> >>>
> >>
> >> Thanks for listing them. Already following up internally regarding
> >> this discrepancy, will push out an update once it gets resolved.
> >
> > Sibi, this has been more than a month ago. Could you please update us on
> > the pdr_enabled necessity? I'm asking since it's also a part of the
> > kernel data nowadays.
>
> Hey Dmitry,
>
> Extremely sorry for the delay. I was told this is just a platform
> specific flag that we can decide to turn on if it handles PDR.
> Given that linux does handle PDR we can safely turn it on.

So... is there any reason why it wasn't set previously? Which
platforms should have it in the enabled state?

-- 
With best wishes
Dmitry
