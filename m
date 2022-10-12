Return-Path: <SRS0=nJ29=2N=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C396CC4332F
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Oct 2022 18:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A547C433C1; Wed, 12 Oct 2022 18:30:04 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADAA2C433D6;
	Wed, 12 Oct 2022 18:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ADAA2C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1322d768ba7so20417734fac.5;
        Wed, 12 Oct 2022 11:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aq9ciVNDYzKouVeCmErs4DIqbiK1kD8rDcz/fPG0pXE=;
        b=CKfHYoZ79yVuqsusFrIDue6tlzaqSq0mO2jXktjewTg6sW0sx5Ec3xBRuCI8u7vKNy
         uqgU/GePFXygYqV53MsRPkuMCA+DEyfS686L8qLN3EifjRr3ZYghLQR6Ml0+bbgoSawQ
         7GrsJGV8UClxAllQMKiCcZqa83ESO7JueSBY98RvLvImlzq929OeC4/wz+jOxnvOvI4W
         +Heb6nDK9L0icX667UMjR2j0y/aHFrFcMAQOr7lC0444Ax3Gj23fOg1L236YE0logRmn
         goW53PkXL4hXM4rlp3lVGfpjv9ZbBw6qtGNY4oK9Y4UpMN8zmSeT0zky20gCb5Qj2wBP
         GNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aq9ciVNDYzKouVeCmErs4DIqbiK1kD8rDcz/fPG0pXE=;
        b=CWLiKE2GLGVe+QPebYf0Gc4ZaPjZjP8CBbC+zorMAeW5AnACwqUp+kQFMwXu9DUzwh
         mm0chjYK/BwSRMCGooPuiyUoQeK75+5cHQFzeUdAtGYyIzI+Uy6Sl0G3AP/wPo26uUeb
         xquxltE+tFQ5Ppi0dGwgGsM1EPBQDQsdpLUlXAiWjZnsW6rwm6/lm1jK016Wwuwr144O
         yVj08Q/LkM0yKwwDJEHZ40ukRfy5ek6yoM3MxxQSo/EO02XVLEylutvoCQcGopm26M5c
         3vK0qp+9fKJS7te2ycyIoHbrMrx5dPkvJpmzzz6yxBz2Z9PcHbGq6i09t6TpPZWMywvf
         3Dqg==
X-Gm-Message-State: ACrzQf3ju4XlUqXIWZ8qdqCCMSZIdzNEZSVRV+F5d39J/5mkLph82rGJ
	mQPtrqJ1UyudkZtiaQI0O6IcFbUciGR3qDH1+wZLhO3p
X-Google-Smtp-Source: AMsMyM55e996tXcH1BARTKyfJwnfwYlnVHz3d/eSgpThX7hvICTkflmrGIaN72PRGUps8G8ZvPT9hNMeyRbk00e1J5Y=
X-Received: by 2002:a05:6870:40c8:b0:136:4389:1375 with SMTP id
 l8-20020a05687040c800b0013643891375mr3291198oal.46.1665599402675; Wed, 12 Oct
 2022 11:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PZyNbVCiWMK3t=3qrHNc4jnKvpu_ceJ+MxQ7q-Dx5Obg@mail.gmail.com>
 <CA+5PVA7xZ8QfAg7OKHjVKq+2rkt4eQ-vG_Yh31buAPzUguLGrg@mail.gmail.com>
In-Reply-To: <CA+5PVA7xZ8QfAg7OKHjVKq+2rkt4eQ-vG_Yh31buAPzUguLGrg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 12 Oct 2022 14:29:51 -0400
Message-ID: <CADnq5_ObNYi1zuOyKQ5qSruxACZuus=gvBCEVcGAr5+poH7Ocw@mail.gmail.com>
Subject: Re: Updated amdgpu firmware
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Hawking Zhang <Hawking.Zhang@amd.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

No worries.  Much appreciated.

Thanks!

Alex

On Wed, Oct 12, 2022 at 12:55 PM Josh Boyer <jwboyer@kernel.org> wrote:
>
> Applied and pushed out.  Apologies for the delay.
>
> josh
>
> On Fri, Sep 30, 2022 at 6:51 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Hi Josh,
> >
> > Some updates for amdgpu.  Please apply!
> >
> > Thanks,
> >
> > Alex
