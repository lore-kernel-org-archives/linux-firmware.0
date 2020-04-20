Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437FBC3815B
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Apr 2020 15:48:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 31C7C20775; Mon, 20 Apr 2020 15:48:27 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 10909206DD
	for <linux-firmware@kernel.org>; Mon, 20 Apr 2020 15:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587397707;
	bh=QauwwiBNAV7DJqW2QQTBSIWbGtuzYXwzJB/XBOD9s9Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=uV970J2pphmX9wygw2wcbMgzWm1bI1JlcnjlLsMZiAg3ShftSgZHghhG/wZKCL5nG
	 BXA+pEMzkvLIPRKmiVTByEupRYSzknS+xA8GXsoWbRoQYyPIpgjJ0pywpet8BoySH6
	 wDOIxma9L1r66IgnMqM5g9kcw44g/J4UgnPqTiLo=
Received: by mail-io1-f49.google.com with SMTP id f3so11533315ioj.1
        for <linux-firmware@kernel.org>; Mon, 20 Apr 2020 08:48:27 -0700 (PDT)
X-Gm-Message-State: AGi0Pub8pDozFWPNw3wMR8P4ctQME25bQk70MqOOvx9NCMgiBDlC7c1D
	OLHtN5LX+EuqrQF7DCis2K4R3m2PpRll/Oe5JBM=
X-Google-Smtp-Source: APiQypJvbM/syS7k7ozXC1sL0Ro1avCUWEEWSOUfWxEERZPyILC0KTrUipeGZSwt1yhSiHF8OD9JHpkxRhGK5cA+LCc=
X-Received: by 2002:a6b:4105:: with SMTP id n5mr16472154ioa.159.1587397706514;
 Mon, 20 Apr 2020 08:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR12MB355881E9A7D373596FDE0B59CBD40@BYAPR12MB3558.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB355881E9A7D373596FDE0B59CBD40@BYAPR12MB3558.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 20 Apr 2020 11:48:15 -0400
X-Gmail-Original-Message-ID: <CA+5PVA59trtgdZ6MNy+7wHh6qspza6DY+3SXfzTTqxwdrS7aRg@mail.gmail.com>
Message-ID: <CA+5PVA59trtgdZ6MNy+7wHh6qspza6DY+3SXfzTTqxwdrS7aRg@mail.gmail.com>
Subject: Re: pull request: Linux-firmware: Update cxgb4 firmware config file
To: Vishal Kulkarni <vishal@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	Nirranjan Kirubaharan <nirranjan@chelsio.com>, dt <dt@chelsio.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 20, 2020 at 6:59 AM Vishal Kulkarni <vishal@chelsio.com> wrote:
>
> Hi,
>
> Kindly pull latest firmware config file from below URL.
> git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Vishal Kulkarni
>
> The following changes since commit 6314fa0cada1b052c973ef3f78c9689305554bd9:
>
>   amdgpu: update vega20 firmware for 20.10 (2020-04-17 11:26:39 -0400)
>
> are available in the git repository at:
>
>   git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> for you to fetch changes up to 8aa36f57ec443f390a17373df40537abf28e1fe6:
>
>   cxgb4: Update T6 config file (2020-04-20 00:27:18 -0700)
>
> ----------------------------------------------------------------
> Vishal Kulkarni (1):
>       cxgb4: Update T6 config file
>
>  cxgb4/configs/t6-config-default.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Pulled and pushed out.

josh
