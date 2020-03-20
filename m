Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C2EC4332B
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Mar 2020 11:46:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DE60720784; Fri, 20 Mar 2020 11:46:04 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C0EC020776
	for <linux-firmware@kernel.org>; Fri, 20 Mar 2020 11:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584704764;
	bh=o3Mr0+6vOT0HMquBVK0W8//CA3BlyAOd1cckAfLtMmY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Ijottreq5gSdcRUA6bpXlhYJEFL1RoAhcnYHKxocfcPU0h81AurAYQ8ZicPjizuI3
	 puybFGMeZRpM8ZHuv5CdO1wxGy0lMoAAsojltX4wIBaK4liMIONt+LQvX6Fqy8diqU
	 +U2pTLGXQCLLUq8qNrBluTs4xU16HZw80FK9UYzg=
Received: by mail-io1-f43.google.com with SMTP id o127so5650556iof.0
        for <linux-firmware@kernel.org>; Fri, 20 Mar 2020 04:46:04 -0700 (PDT)
X-Gm-Message-State: ANhLgQ32tcOwpnklak5mHCHeLiuBQ32NeQQLnODYPemNBBnLvX7zrV3r
	XZkNCN/9+flY0D0eAKKe+MxRB/kcWGD8BJfxLsY=
X-Google-Smtp-Source: ADFU+vuybqosV9UUKyHgPXKKIRA10VNnjBjLsX3ujhmein6A0rTxNXu08zzWNY2HvqZUtYVOWqutEDR7JKn+vblMV/o=
X-Received: by 2002:a02:880e:: with SMTP id r14mr7389246jai.107.1584704764196;
 Fri, 20 Mar 2020 04:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <fa54aed317ea92ad306dcaa338b925a5c7a9ef51.camel@suse.de>
In-Reply-To: <fa54aed317ea92ad306dcaa338b925a5c7a9ef51.camel@suse.de>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 20 Mar 2020 07:45:52 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7qKqEsWBCUXUVXZwezt0xG_GLyeB8Mh4k8mebcRDvqEA@mail.gmail.com>
Message-ID: <CA+5PVA7qKqEsWBCUXUVXZwezt0xG_GLyeB8Mh4k8mebcRDvqEA@mail.gmail.com>
Subject: Re: [PATCH] brcm: Update brcmfmac434xx firmware binaries
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, mbrugger <mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 20, 2020 at 7:15 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Both devices were affected by the Kr00k vulnerability, CVE-2019-15126.
>
> The Raspberry Pi family of devices being one of the main users for these
> chips, the firmware files were taken from their downstream
> linux-firmware repository.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>
> I'd really like to get some confirmation/comments from Broadcom if possible.
> This was taken from:
> https://github.com/RPi-Distro/firmware-nonfree/commit/ce751a84617715ca0189e55c3cf07f12d87e16e5

Yeah.  I'm not comfortable taking this if they aren't pushing it here.
Someone from Broadcom should comment.  Also, I don't think these are
the only devices impacted.  It would be better to get them all at once
if possible.

josh

>
>  brcm/brcmfmac43430-sdio.bin | Bin 388739 -> 400447 bytes
>  brcm/brcmfmac43455-sdio.bin | Bin 488193 -> 624943 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
