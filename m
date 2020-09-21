Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E77C43465
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Sep 2020 13:08:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7024E21D43; Mon, 21 Sep 2020 13:08:55 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4DD96218AC
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2020 13:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600693735;
	bh=0fDDEZP+L67TVxMjUn66FtYjZmSVR7d8Cw96hv9ol/4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mRX5ndn8/o19UFTmWc2GTwXkYBvx+BbQsSGX1/T+G3onDPdyaUzfDCg9SaXaLkX0I
	 laTSXNLE6/i+KlKVGQevX8sHIggxNvP5I1/T4cHtEmyDUg37RW5NHZ2fXhCY504h2s
	 7FGuTDYg3dHsDOKZl8tsgKTjxDQg1SnE0+Tn3mhQ=
Received: by mail-il1-f179.google.com with SMTP id a19so13602360ilq.10
        for <linux-firmware@kernel.org>; Mon, 21 Sep 2020 06:08:55 -0700 (PDT)
X-Gm-Message-State: AOAM531tN0kVAuD15cb1OteulDEiwe2C4Q52wOVTbg66rCgooSQ8bpda
	HCdRL6EJ9oo1OqDdFMtyIm196tfl6Rb30QXAxRw=
X-Google-Smtp-Source: ABdhPJwj7oyMHYORe5csIgr4sdMzncTevtXRCazgkpPxCd2QhBwln8USLd/v+QFCCE2e+xYU9yz4i8qDmYbZDax40Ic=
X-Received: by 2002:a92:5fd6:: with SMTP id i83mr21484490ill.85.1600693734781;
 Mon, 21 Sep 2020 06:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200918142058.GA15376@plvision.eu>
In-Reply-To: <20200918142058.GA15376@plvision.eu>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 21 Sep 2020 09:08:43 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4UUq=1+_DA2e=sN4WUY=c34obGbZpQPcLfMwYe4K4VHg@mail.gmail.com>
Message-ID: <CA+5PVA4UUq=1+_DA2e=sN4WUY=c34obGbZpQPcLfMwYe4K4VHg@mail.gmail.com>
Subject: Re: [GIT PULL] linux-firmware: Update Marvell Prestera Switchdev
 firmware ABI changes
To: Vadym Kochan <vadym.kochan@plvision.eu>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Mickey Rachamim <mickeyr@marvell.com>, 
	Volodymyr Mytnyk <volodymyr.mytnyk@plvision.eu>, 
	Oleksandr Mazur <oleksandr.mazur@plvision.eu>, Andrii Savka <andrii.savka@plvision.eu>, 
	Serhiy Boiko <serhiy.boiko@plvision.eu>, Serhiy Pshyk <serhiy.pshyk@plvision.eu>, 
	Taras Chornyi <taras.chornyi@plvision.eu>, netdev <netdev@vger.kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 18, 2020 at 10:21 AM Vadym Kochan <vadym.kochan@plvision.eu> wrote:
>
> The following changes since commit 00a84c516078defb76fbd57543b8d5c674a9a2be:
>
>   linux-firmware: Update AMD SEV firmware (2020-09-16 08:01:44 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/PLVision/linux-firmware.git mrvl-prestera
>
> for you to fetch changes up to 7a0221265cda381b5231355965a403ca264392a5:
>
>   linux-firmware: Update Marvell Switchdev firmware with ABI changes (2020-09-18 16:54:29 +0300)
>
> ----------------------------------------------------------------
> Vadym Kochan (1):
>       linux-firmware: Update Marvell Switchdev firmware with ABI changes
>
>  mrvl/prestera/mvsw_prestera_fw-v2.0.img | Bin 13687252 -> 13686596 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

Pulled and pushed out.

josh
