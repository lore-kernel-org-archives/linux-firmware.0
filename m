Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F67C2D0EF
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Apr 2020 15:16:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9473F22240; Fri, 17 Apr 2020 15:16:49 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6F1F42223D
	for <linux-firmware@kernel.org>; Fri, 17 Apr 2020 15:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587136609;
	bh=YeWisW+9CVu0uxTp2bgOFT+ElL6GlJRzju6yjrtyuzk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VFwtSEXbtzQKUIJXcMUCZ8kfDk9Fz976pQlY91c2qcshl7aJdrMyzCZM6MFfDNAn6
	 a7meIhFU9yn8QK0/OldAqO8OOTo5oseazSr2GgO2Su/I5MK06klq/m2qACh0wiY5b2
	 S9WDx0b0Z7KZncAGjdFVSNfuCkI1lGgXrvQadg3Q=
Received: by mail-io1-f41.google.com with SMTP id f3so2689479ioj.1
        for <linux-firmware@kernel.org>; Fri, 17 Apr 2020 08:16:49 -0700 (PDT)
X-Gm-Message-State: AGi0PuYsVpaUvBadw4IA3tC0a7CIFL0Y+w1rDaSL3K+MdjsbPjGtlQYq
	Nheun309bxHMFiNVN7KcyYZ/GaqmDmu0LVhFH24=
X-Google-Smtp-Source: APiQypKLYkqtdOuu4kn63COtAD0IbCSS00tVK6gAChGvWzA+GiwbJ3eLupPyxz0mshFKGK9QUMYrkuuOWN3QJk73jSg=
X-Received: by 2002:a02:cc19:: with SMTP id n25mr3637440jap.107.1587136608726;
 Fri, 17 Apr 2020 08:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR12MB3558BCAE7FC75EE3173002A6CBD80@BYAPR12MB3558.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB3558BCAE7FC75EE3173002A6CBD80@BYAPR12MB3558.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 17 Apr 2020 11:16:37 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4pf7XeZkEi2whgjbY-d4b_x+AJvVmHUWm0ZHHpnGeO8g@mail.gmail.com>
Message-ID: <CA+5PVA4pf7XeZkEi2whgjbY-d4b_x+AJvVmHUWm0ZHHpnGeO8g@mail.gmail.com>
Subject: Re: pull request: Linux-firmware: Update cxgb4 firmware
To: Vishal Kulkarni <vishal@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	Nirranjan Kirubaharan <nirranjan@chelsio.com>, dt <dt@chelsio.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 16, 2020 at 7:36 AM Vishal Kulkarni <vishal@chelsio.com> wrote:
>
> Hi,
>
> Kindly pull the new firmware from the following URL:
> git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Vishal
>
> The following changes since commit 64dba0fedb22eae32f76dcd4534b3f416db178de:
>
>   Merge branch 'a630-zap' of https://github.com/andersson/linux-firmware (2020-04-13 08:17:58 -0400)
>
> are available in the git repository at:
>
>
>   git://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Pulled and pushed out.

josh

>
> for you to fetch changes up to 3afe520b4493c8a562cc9ee91842f252b1004c1b:
>
>   cxgb4: Update firmware to revision 1.24.14.0 (2020-04-16 04:03:18 -0700)
>
> ----------------------------------------------------------------
> Vishal Kulkarni (1):
>       cxgb4: Update firmware to revision 1.24.14.0
>
>  WHENCE                   |  12 ++++++------
>  cxgb4/t4fw-1.24.11.0.bin | Bin 568832 -> 0 bytes
>  cxgb4/t4fw-1.24.14.0.bin | Bin 0 -> 568832 bytes
>  cxgb4/t5fw-1.24.11.0.bin | Bin 673280 -> 0 bytes
>  cxgb4/t5fw-1.24.14.0.bin | Bin 0 -> 672256 bytes
>  cxgb4/t6fw-1.24.11.0.bin | Bin 727552 -> 0 bytes
>  cxgb4/t6fw-1.24.14.0.bin | Bin 0 -> 726016 bytes
>  7 files changed, 6 insertions(+), 6 deletions(-)
>  delete mode 100644 cxgb4/t4fw-1.24.11.0.bin
>  create mode 100644 cxgb4/t4fw-1.24.14.0.bin
>  delete mode 100644 cxgb4/t5fw-1.24.11.0.bin
>  create mode 100644 cxgb4/t5fw-1.24.14.0.bin
>  delete mode 100644 cxgb4/t6fw-1.24.11.0.bin
>  create mode 100644 cxgb4/t6fw-1.24.14.0.bin
>
