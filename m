Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD414C433B4
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Apr 2021 13:49:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 94CD761078; Mon, 19 Apr 2021 13:49:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DEB96101E
	for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 13:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618840150;
	bh=xChvnDaeZLODBFr1+eWlgmUf1MB0Pt11+mwRDV8R8Ec=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Alf6+lQ+I8AnRYiTj7OWp9CJ/X0/3SzHSo+VmJNDNyu/GkR+Mg6Mp5T33chVX41ez
	 nP488W2SeGP8/pOsW/HXivdT8ikLQVPKEpwSppNNPFrk/A9oC9lSw7sNtx+hRYh0iT
	 OdJT6SQNz7xgnWZJ6U1rENOx85qwIu2f1DJombhhe9AHfpCsDW9Hmt8QyZ7XY0xzxR
	 mLBPdJJUOcRjjzQv4UGZol4YlYu4v8sAlq2yLcYcbMAhZGlPMaZvIBWM/JLzQiPxUG
	 cwFOcvq8jrUOR9VN1Lbs8JDYz9XDeyfu+6+ptnMXL9HzBVHY7wBWjFdjWWHEulI2/0
	 /4uF3ObiSMN2g==
Received: by mail-il1-f174.google.com with SMTP id c3so22995479ils.5
        for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 06:49:10 -0700 (PDT)
X-Gm-Message-State: AOAM532abgFF7rZ4mm1ZmCwT4i5E6uoJzC1D7qWJfFbxBxLBn0S3TUMq
	AXy9oehUmLqdD0czAx6b4LMREcXROUPg/eqQzH0=
X-Google-Smtp-Source: ABdhPJxwBHB8SHO8Aq4Du6YqDX/U+FqLdT6DpNRxfxHgiFjiOIH+ew541KsOfqjyFYxl3ZCopx+qw4mnVNMB1PBFrVE=
X-Received: by 2002:a92:cd43:: with SMTP id v3mr18277449ilq.11.1618840149816;
 Mon, 19 Apr 2021 06:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Pd5kfpiPa3T7d5XFqkFZJYzHHbVPBmE_kCqG2dK8wQcg@mail.gmail.com>
 <CADnq5_MiQzPbtL4z7kTUV37-nJ-FoJYdDq8K23c33m3Rpg643w@mail.gmail.com>
In-Reply-To: <CADnq5_MiQzPbtL4z7kTUV37-nJ-FoJYdDq8K23c33m3Rpg643w@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Apr 2021 09:48:58 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5F7jaypkz+4f4ao0g=t7gJfDPYST3=Emsid47O=zvv0g@mail.gmail.com>
Message-ID: <CA+5PVA5F7jaypkz+4f4ao0g=t7gJfDPYST3=Emsid47O=zvv0g@mail.gmail.com>
Subject: Re: updated amdgpu firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, Apr 15, 2021 at 12:28 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Just wanted to make sure this didn't fall through the cracks.
>
> Thanks!
>
> Alex
>
> On Tue, Apr 6, 2021 at 9:15 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > New SMC firmware for navi10 and 14.  Please apply.
> >
> > Thanks,
> >
> > Alex
