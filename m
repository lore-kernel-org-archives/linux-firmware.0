Return-Path: <SRS0=kPfE=UN=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48D8C02182
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Jan 2025 08:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F2ABC4CEDF; Tue, 21 Jan 2025 08:07:29 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6A99C4CEE1
	for <linux-firmware@kernel.org>; Tue, 21 Jan 2025 08:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6A99C4CEE1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e573136107bso8773191276.3
        for <linux-firmware@kernel.org>; Tue, 21 Jan 2025 00:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737446847; x=1738051647; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk/uCyZIN3phFKHGJ4BeL3AU+lf/HalF2zS0n/jnIpo=;
        b=JyPFNf/KnC7dWK2abGiK99nl8tkhNGROIZuwezCsx6dul3EqPLkJZtCADC8y4D9ufK
         VlAebxO68h+8Yruzw8AYom+BuuRDjuZh4EVtinPIX8X3Z6234ErDQH88gL62eUoYt+Tt
         UiqLFZEate45B0isA5FepUeznJHzhoPnyM9EQGclnIVDrt3aeeT/Qc64dBgyEC5o79n1
         on/MIHUoi1AgyctuKNdsmnYya6biMGQiYzAka2TMq69/fl4BQxUHRptfSo7sLkoGrhUV
         CJkyGztPPYSUcjsBKrVzNRUpbcvoXgVwtTI9uMrg/2ihEX1KyyAjoapKdDCIxrlKAEtt
         TFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737446847; x=1738051647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yk/uCyZIN3phFKHGJ4BeL3AU+lf/HalF2zS0n/jnIpo=;
        b=MwiUY2vnAHOoKwT5SCGWINqNhxY96MZ73dU+t1eLrnnBBi+dtWo0/JFwoW18Lp75VA
         GU7k0r6lPDSszhzHYNH7OgPdJyyegFXIi/q1q6DSWhtfrh9kcQ+h13srNxvkok+JHD3X
         lTEXuHhHHkwLpXzS5L9LyXLxrDX00jb8YTZP27zPO297UY8Pp8KAC/Hk8gWJ7hRYnByP
         folHoRCFivxOLMaAdSH06+UMfxPiLbt4E2op5VwSCnnx7e7tpqoCAVz/352ZtU8piMHk
         CadzykcBC7MvoDGLu+bA3KcbL1Vq3xVKjk/cRo69rG+UZSB6SvVWiPNGSgRlmcq//ALa
         Fmcw==
X-Gm-Message-State: AOJu0YwAo09yFtAVVd7zK9y2EzpbLk3/KMIqpQ6+GlSaDYjGxViVBWoc
	vtK11Ji4ydYUuSlguOzGxlkLQPWc4f1UxNxxko6y+Kb5TzJicsNMRV9TQwN9HpUrxROt1JXovFf
	QW/WRhcwi0O3xDkdI3dyXargfI05DKNKIoQhsRg==
X-Gm-Gg: ASbGnctVXP8d1EWMpzGAMs/se0EhAnAJFupkm/FVNjCkQ+8LNz38KxHbB0jXkD+iFTD
	ySnac5toiDi1AcuUgi8w6ystHzEMC//x8boZyifBH6lOzvaxZkfhByp91HQ5aJnNKsg==
X-Google-Smtp-Source: AGHT+IFGHBltoTFvPyVwY+ufgYVViOweclJ+jTvhBP2VfwlZXugQCD0xF/PRNojoGtWAs1MaQUfjrGZXaryYSq5VQio=
X-Received: by 2002:a05:690c:660a:b0:6ef:4ed2:7dda with SMTP id
 00721157ae682-6f6eb521494mr136268677b3.0.1737446846652; Tue, 21 Jan 2025
 00:07:26 -0800 (PST)
MIME-Version: 1.0
References: <f8324c4c-985b-4283-922d-1f0de766fde3@quicinc.com>
 <4zg574wtssuevuhqgaul4jsseyfycbvjyeau4h23uv5x66s7xc@2axqtbzvphub> <d954eb99-cdb7-4308-a677-aaf5a14feed4@quicinc.com>
In-Reply-To: <d954eb99-cdb7-4308-a677-aaf5a14feed4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jan 2025 10:07:15 +0200
X-Gm-Features: AbW1kvZjh9fG7QSc6Xe_opI-CiXrFr4Ynp4y2MAt115202027xf8xygEx23MFuo
Message-ID: <CAA8EJppnBK7oqsnV8evEBpBmUbSwX3itjWjFpUYfg7_gX642cw@mail.gmail.com>
Subject: Re: QCA: Add Bluetooth firmware for QCA6698 request-pull
To: Cheng Jiang <quic_chejiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jan 2025 at 04:39, Cheng Jiang <quic_chejiang@quicinc.com> wrote:
>
> Hi Dmitry,
>
> On 1/20/2025 5:34 PM, Dmitry Baryshkov wrote:
> > On Mon, Jan 20, 2025 at 05:13:17PM +0800, Cheng Jiang (IOE) wrote:
> >> Hi linux-firmware maintainers,
> >>
> >> Here's a pull request for btqca bluetooth firmware. Please let me know if you have any problems.
> >>
> >> The following changes since commit a28a9226ccb8bf393b8e7dd8970a4d967c1a1d92:
> >>
> >>   Merge branch 'robot/pr-0-1736646402' into 'main' (Mon Jan 13 14:30:09 2025 +0000)
> >>
> >> are available in the git repository at:
> >>
> >>   https://github.com/che-jiang/qca_btfw
> >>
> >> for you to fetch changes up to c07a64c0f9348b1da997c944467857d73a6fa8cb:
> >>
> >>   QCA: Add Bluetooth firmware for QCA6698 (Mon Jan 20 16:58:47 2025 +0800)
> >>
> >> ----------------------------------------------------------------
> >>  Cheng Jiang (1):
> >>
> >>     QCA: Add Bluetooth firmware for QCA6698
> >>
> >>     This commit will add required Bluetooth firmware files for QCA6698
> >>     The image version is 2.1.2-00035.
> >
> > Please confirm whether these files should be using LICENSE.qcom or
> > LICENSE.QualcommAtheros_ath10k?
> Thank you for review this, it should be LICENSE.qcom.
> >
> > Also please include into the commit message an explanation that was
> > shared together with the kernel patches so that nobody is surprised by
> > the subdir and the firmware names.
> Ack.
> >
> >
> >>
> >>     hpbtfw21.tlv : RAM FW dump
> >>     hpnv21.b206  : NVM dump
> >>     hpnv21.b207  : NVM dump
> >
> > Which platforms are these two files for?
> Currently there are two connectivity boards using QCA6698, the board id
> are 206 and 207 respectively. So add two board specific nvm files here.

Connectivity boards for ... ?

> >
> >>     hpnv21.bin   : NVM dump
> >>
> >
>


-- 
With best wishes
Dmitry
