Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC3EC2BA19
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Apr 2020 11:55:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2BBCE2075E; Mon, 13 Apr 2020 11:55:34 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0D7B720753
	for <linux-firmware@kernel.org>; Mon, 13 Apr 2020 11:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586778934;
	bh=k8ns5P6Ha3DY/S2t9LNQKVRDjWIQO4RYkJhvId36CW4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=vh1uCBgHC8781EvnfuIDuQfbOkrhn1EBy7A+YLhf+JPrh1tD6Nre7kptfPcc6aICD
	 LJExp8RIrKLQRcb+REKZi9XIhMxfP+4yFLViuNW6uoCu6RYp6wHu21q3KR/5LlJuv9
	 7NvZdmZlqXoHzVGaj6MoqHNBCBVeTDl3dNIFiMus=
Received: by mail-io1-f48.google.com with SMTP id i19so8989314ioh.12
        for <linux-firmware@kernel.org>; Mon, 13 Apr 2020 04:55:33 -0700 (PDT)
X-Gm-Message-State: AGi0PuZU0hJ/cbjR5WG9cbGBe9guI4kTTtCUESsqs3EaUwfRrcqpy48Z
	TNKx63z2gwe/ZULk2ar6WDUZMtOQebf7tMnd7rI=
X-Google-Smtp-Source: APiQypKGNIJWQ+FR99RV/Ih/TWm+7zmdMR9+TXMqYLx0ySUu0oDdhow995R5crF2W+LRmtGOGQVLL18Sob+hmgUQT2w=
X-Received: by 2002:a6b:4105:: with SMTP id n5mr15779523ioa.159.1586778933433;
 Mon, 13 Apr 2020 04:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <1fce439e32d6b77970e01a797cdb70ca@codeaurora.org>
In-Reply-To: <1fce439e32d6b77970e01a797cdb70ca@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 13 Apr 2020 07:55:22 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7CCo=U9GVGwL9X23_96gnT-4W5Dp2_BLAEQHZ3-Uy-VQ@mail.gmail.com>
Message-ID: <CA+5PVA7CCo=U9GVGwL9X23_96gnT-4W5Dp2_BLAEQHZ3-Uy-VQ@mail.gmail.com>
Subject: Re: [PULL] btqca firmware 20200401
To: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	BlueZ development <linux-bluetooth@vger.kernel.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 1, 2020 at 8:38 AM Rocky Liao <rjliao@codeaurora.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit
> edf390c23a4e185ff36daded36575f669f5059f7:
>
>     Merge branch 'v12573.77' of https://github.com/erinlo/linux_fw_scp
> (2020-03-20 07:39:19 -0400)
>
> are available in the Git repository at:
>
>     https://github.com/rjliao-qca/qca-btfw.git
>
> for you to fetch changes up to 4921f73bc8fdd81cf54200f67bf44a071df50e78:
> ----------------------------------------------------------------
> Rocky Liao (1):
>         QCA: Add Bluetooth firmware for QCA6390 (2020-04-01 18:12:51
> +0800)

Pulled and pushed out.

josh
