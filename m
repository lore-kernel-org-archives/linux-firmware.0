Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681E1C433ED
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Apr 2021 14:41:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 333A9613B2; Mon,  5 Apr 2021 14:41:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15B7A613B1
	for <linux-firmware@kernel.org>; Mon,  5 Apr 2021 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617633672;
	bh=nPoGwxVhVQLQLIh1suWt06t1EHioakFgJEo/BxC6CIc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=WO6v8z1I20wu4E4vFKxC/aZX1gluyeM2hrhhpIXTlGg2ZbbkxCMQ9/7+hxM5YUOTE
	 98YuKd1BvLxv/3TPwPFBL8Lk29TqSyOA5WuKczr3/PRsUh/WE1XO3GCdq2IrxPoRUt
	 k7OvI5/xFAlNhR/R58hvVVVEQi5Kd+0D6nsNYOIPfz42Yv6j9VIqeFTWz/iK+0HwKG
	 5k8qS06FBXF2KDprov7EXLgUK+HMjSUtxRg/bukElfXeU3vbyJXk++OAxS0rGe5CzP
	 /YNGnVPGCVE/XJzq+XP7z63NjtuL83YNtFRNUYs4vDCiHxdd9UvTpRsqTmpU/5f3LO
	 gtc3ei7Jn7V9g==
Received: by mail-io1-f41.google.com with SMTP id e186so12172626iof.7
        for <linux-firmware@kernel.org>; Mon, 05 Apr 2021 07:41:12 -0700 (PDT)
X-Gm-Message-State: AOAM532j9/16rzGhggWGMMg2nOuDcgCFQRmXJXmRZx3LM+mh4h6zP9X8
	gkK2AS++x8BJbwKpbq59X4DPKne2IUyEJ/wX84Q=
X-Google-Smtp-Source: ABdhPJzIfWiza9v3iuy1+Q2irhgmvzGUsYVWh8i8ohsFKBpVMmNrs24t85uHkgAF5WF5dLPAFGMDg2hZczBexY/GqCM=
X-Received: by 2002:a02:5184:: with SMTP id s126mr23955292jaa.107.1617633671566;
 Mon, 05 Apr 2021 07:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PFqB_WayJ-+JX++fMatGWjnV5LMWgk5P3kvwgQrikkZA@mail.gmail.com>
In-Reply-To: <CADnq5_PFqB_WayJ-+JX++fMatGWjnV5LMWgk5P3kvwgQrikkZA@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 5 Apr 2021 10:41:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4FKK9hfSdv9XrFDTpy+0vnM9TTay3FoFaa3WD8BoevgQ@mail.gmail.com>
Message-ID: <CA+5PVA4FKK9hfSdv9XrFDTpy+0vnM9TTay3FoFaa3WD8BoevgQ@mail.gmail.com>
Subject: Re: New amdgpu firmware for Arcturus GPU
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Mon, Apr 5, 2021 at 9:56 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi, new firmware for the Arcturus GPU.  Please apply!
>
> Thanks,
>
> Alex
