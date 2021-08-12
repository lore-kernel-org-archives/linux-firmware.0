Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FC4C4338F
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Aug 2021 13:19:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 11E4360F11; Thu, 12 Aug 2021 13:19:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F006A60C41
	for <linux-firmware@kernel.org>; Thu, 12 Aug 2021 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628774378;
	bh=aFT/rllFyAbv4n+TsFO4ayWJbcvr1MAuiIHGk/nttW4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=SKFPw/HJbUSifsiUsR3pHCYyWapCw/LlAp8xbB0iNz3y/m3V9ckqUs123MuQrel7Y
	 4d/4shs9eBhzl/H9ve055ecwhCXLhQjHn/eU5YuLdZo0wToITdKAljILPRskjIAHQj
	 m5DdYBo6Dii6GSiuTIvu1BXANJGOqgLVHxMT3jJU7MPrEG7RAFB2hnji+UnGtfeT+G
	 86B1hoBCV3/csILJx2iB9F4iE43vkTol/BHMAsVJpVCwf2bpG+sRSYbAl/ya9URDmj
	 3nnow9S1bJX2pUJO6dcbgiaddHIfB2EH+xUpQyVePUWZE/aIGJ797aF4546wTz5QUy
	 vchWPFDZSZj1A==
Received: by mail-il1-f169.google.com with SMTP id u7so6847787ilk.7
        for <linux-firmware@kernel.org>; Thu, 12 Aug 2021 06:19:37 -0700 (PDT)
X-Gm-Message-State: AOAM531h0YnBobWgnjsmyfrAtVSJjp7iV4eEvIl2U7ijdBhhNAHMMeB0
	EYRAozfTr4OuY7nFTnIRJlYQFwLm8GT4FHV5xsc=
X-Google-Smtp-Source: ABdhPJyUfPOnPgWMMqBD3KEaJ/482ZAv7BnZVY6uQq6fW/Gb20OULRAcUV2wh1Xe7Jq8lZbMgsdKxpiiDHJcAE120n8=
X-Received: by 2002:a92:c5a7:: with SMTP id r7mr2929034ilt.11.1628774377477;
 Thu, 12 Aug 2021 06:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_MtfxOyoEOn-v8Gwr70FXinTtgaVsHf3hVXWxStOhSBSw@mail.gmail.com>
In-Reply-To: <CADnq5_MtfxOyoEOn-v8Gwr70FXinTtgaVsHf3hVXWxStOhSBSw@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 12 Aug 2021 09:19:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7i6HYpfC5U69gE-hyJBbQ3kmXyDc7xLNwZG8cQPjPj9A@mail.gmail.com>
Message-ID: <CA+5PVA7i6HYpfC5U69gE-hyJBbQ3kmXyDc7xLNwZG8cQPjPj9A@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, Aug 5, 2021 at 11:38 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated firmware for AMD GPUS.  Please apply!
>
> Thanks,
>
> Alex
