Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AF4C433F5
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Sep 2021 13:04:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 20BBC6135E; Wed, 15 Sep 2021 13:04:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B3B361268
	for <linux-firmware@kernel.org>; Wed, 15 Sep 2021 13:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631711089;
	bh=LVHXwZpxsWGAdcFN62IO8y87e0CRV6FjYuHB3vd8oN4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NuuiJtbeTqJCXj1hSZzCeFRpmho23VAVDot049fPQAraFY6qV2JIzLxIPLkfMrta7
	 XQ7HIBm4q57xPo5jxZC0xyhV2HJLSyo7DIVIsjXkCKfOovLi3WDK1YGWRhwUviW32A
	 8Zhm1yLxtFsnBQBoNRfEOaakv2SzzQgVRXWM9Ci1R+i+b2C4wFhI+/IFEYDz4GmN4K
	 7+iLAUm/L8Yw3sJkQEvm5bnttHUh089rAa0Sey9Dfg4uL1apLPfFAxzxFuLl25iQtM
	 gdL+BeyCBmttGK5iyC5q/06H0IkpLu2HyKGG3Ihh/K/O4+jWV7iORTayIRPD+che2b
	 epOJIkOZHf3ew==
Received: by mail-io1-f44.google.com with SMTP id g9so3277419ioq.11
        for <linux-firmware@kernel.org>; Wed, 15 Sep 2021 06:04:49 -0700 (PDT)
X-Gm-Message-State: AOAM530jQZAM7EJJt7VheY0ZOSSqtj5M7iAddhQgiEj4peaum2MUmmco
	VGQppJhe0BXQFco3zzzmwf+7eg0pIsxRzU+adM0=
X-Google-Smtp-Source: ABdhPJxDhoC3HSKS744WGKoOTI5gh18oimcAIbnFJxl3C7UuVR8Fl7rhfR53T7MnwFx0H8VsqjVltUujvuPlSvbQTrs=
X-Received: by 2002:a6b:905:: with SMTP id t5mr18227939ioi.209.1631711088432;
 Wed, 15 Sep 2021 06:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_MtP_RFD7iZL-YaHqnnj-YMSAVrLF8UWN=XA_0HqC+R-w@mail.gmail.com>
In-Reply-To: <CADnq5_MtP_RFD7iZL-YaHqnnj-YMSAVrLF8UWN=XA_0HqC+R-w@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 15 Sep 2021 09:04:37 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6f3e20RZU6WpMtp1w_bXjtCHy4poJtuKTfbwjMCOGj6g@mail.gmail.com>
Message-ID: <CA+5PVA6f3e20RZU6WpMtp1w_bXjtCHy4poJtuKTfbwjMCOGj6g@mail.gmail.com>
Subject: Re: amdgpu firmware update for yellow carp
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 3:19 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Initial firmware for a new GPU from AMD.  Please apply!

Applied and pushed out.  Thanks!

josh
