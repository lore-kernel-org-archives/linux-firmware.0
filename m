Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65D9C433B4
	for <linux-firmware@archiver.kernel.org>; Fri, 23 Apr 2021 11:04:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9A5F361467; Fri, 23 Apr 2021 11:04:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8495C61352
	for <linux-firmware@kernel.org>; Fri, 23 Apr 2021 11:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619175842;
	bh=r0tZjAM4FxTim5EURPwZpooLs4whuKT/LdaBoey+TBg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XHhMoEn+1+voA3d6A3/lCkj8yx8gPuvIMCZdenz1+7j31HjGIYeHMWkWNklE+kf7F
	 9jC+HXsWniHKzVHTzJT5PCGd9VqMK1DSDTlM+HPRvTnK0btZ0gaOjm2NAL61cCig1x
	 3YHeJ8dX/FU1xY7TC7fnzoO9eeuun07NeQr7lwH3NMxh15+pbnnYByfTHp1hLvBPoZ
	 PjRU/4wGPfGBwO5EgaqwL338xpmqipWm+vj9ClcKn8dBHcH9h4NdGZFUSNRpahNwQ0
	 /A2E8TI+pXn2UVrK/r7w7P5tIul9e95B8/K5TvP7ZxadwVp8aOHQUkYxLLNMjNtA2s
	 kHoIrDUDc4ssA==
Received: by mail-il1-f169.google.com with SMTP id c15so40413382ilj.1
        for <linux-firmware@kernel.org>; Fri, 23 Apr 2021 04:04:02 -0700 (PDT)
X-Gm-Message-State: AOAM5304fawRMNZcYU1Imf6rfy7mR9y/UGpyl4Wgem1qtjjZhEV8MUU+
	I9beTyeeFZlFclRuBBoRohWnmg7Co94deMEH7ek=
X-Google-Smtp-Source: ABdhPJwGKrD0dvOHozpw7XY64ICjI65A2iuFvo705+zDCcJaVjl5cPrlZ5pGrAefh2ijzpF3byWKMl1T+zK5pCUQA0c=
X-Received: by 2002:a92:d582:: with SMTP id a2mr2386662iln.206.1619175841837;
 Fri, 23 Apr 2021 04:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210422082955.GA1864@plvision.eu>
In-Reply-To: <20210422082955.GA1864@plvision.eu>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Apr 2021 07:03:50 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7z-8sUDPoypQBt61qzVmyU4G_wRg94795HsstSH_i=xQ@mail.gmail.com>
Message-ID: <CA+5PVA7z-8sUDPoypQBt61qzVmyU4G_wRg94795HsstSH_i=xQ@mail.gmail.com>
Subject: Re: [GIT PULL] linux-firmware: mrvl: prestera: Add Marvell Prestera
 Switchdev firmware 3.0 version
To: Vadym Kochan <vadym.kochan@plvision.eu>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, netdev <netdev@vger.kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
	Oleksandr Mazur <oleksandr.mazur@plvision.eu>, Serhiy Boiko <serhiy.boiko@plvision.eu>, 
	Serhiy Pshyk <serhiy.pshyk@plvision.eu>, Volodymyr Mytnyk <volodymyr.mytnyk@plvision.eu>, 
	Taras Chornyi <taras.chornyi@plvision.eu>, Mickey Rachamim <mickeyr@marvell.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 4:30 AM Vadym Kochan <vadym.kochan@plvision.eu> wrote:
>
> The following changes since commit cfa004c7d82e1903cc88a918ee9b270fb8f47b28:
>
>   amdgpu: update arcturus firmware from 21.10 (2021-04-21 07:09:48 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/PLVision/linux-firmware.git mrvl-prestera
>
> for you to fetch changes up to 50d16db2e77332e0e89ec0f9604ab0bb2fbc3c02:
>
>   mrvl: prestera: Add Marvell Prestera Switchdev firmware 3.0 version (2021-04-22 11:23:24 +0300)

This adds a new file but doesn't add it to WHENCE.  Can you please fix that up?

josh

>
> ----------------------------------------------------------------
> Vadym Kochan (1):
>       mrvl: prestera: Add Marvell Prestera Switchdev firmware 3.0 version
>
>  mrvl/prestera/mvsw_prestera_fw-v3.0.img | Bin 0 -> 13721584 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100755 mrvl/prestera/mvsw_prestera_fw-v3.0.img
