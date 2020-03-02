Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C460C3F2D2
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Mar 2020 13:04:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1A8FF24673; Mon,  2 Mar 2020 13:04:53 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EC91021D56
	for <linux-firmware@kernel.org>; Mon,  2 Mar 2020 13:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583154293;
	bh=zxQKUp9bAzSWGADPh22WXwRxVBG3FLzKiQC9/v8nEak=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bZwcUXMb21InRP9UVL8eRPxE5n1Js8BO6ta+lUCBOu0CsqBpqBfq3qauf0tbZPcwK
	 SKkKJzOZCFd0EMcq/3qcLifU8OWDllbNv/GIUmxZ9v0+aBXO0a2iLiTBxXByddbMB5
	 2+SyxZB3jfR7xaPgX1ThA2ybBsX3bopsCfakQC/g=
Received: by mail-il1-f173.google.com with SMTP id g6so7973199ilc.7
        for <linux-firmware@kernel.org>; Mon, 02 Mar 2020 05:04:52 -0800 (PST)
X-Gm-Message-State: APjAAAWfZ9JpApCNWfu10v/awG1u+8Ltl3jxhAaQKfx5vAt1utz54Re9
	wjoTIpvnSoOuvTf3kqjO86CDduOpG4lhsFEsBXQ=
X-Google-Smtp-Source: APXvYqxUf04EhGPXWSNbYPcER3uGqrLxhKzfKNS71ZSDn70WiXvBJcYzWGdrRAVHK3bypwJ8YNcJ5vwZPpCaBfKz44w=
X-Received: by 2002:a92:ba06:: with SMTP id o6mr13787330ili.206.1583154292314;
 Mon, 02 Mar 2020 05:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20200226052603.22768-1-gtk_ruiwang@mediatek.com>
In-Reply-To: <20200226052603.22768-1-gtk_ruiwang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 Mar 2020 08:04:37 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5EyWegKGeNhkEb9YQYJqA2bG-_T1LJcPEaaryV7RHOaA@mail.gmail.com>
Message-ID: <CA+5PVA5EyWegKGeNhkEb9YQYJqA2bG-_T1LJcPEaaryV7RHOaA@mail.gmail.com>
Subject: Re: pull request: linux-firmware: move MT8173 VPU FW to subfolder
To: gtk_ruiwang@mediatek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, 
	Alexandre Courbot <acourbot@chromium.org>, Tomasz Figa <tfiga@chromium.org>, PoChun.Lin@mediatek.com, 
	Longfei Wang <longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Maoguang Meng <maoguang.meng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 26, 2020 at 12:26 AM <gtk_ruiwang@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> The following changes since commit efcfa03ae6100dfe523ebf612e03c3a90fc4c794:
>
>   linux-firmware: Update firmware file for Intel Bluetooth AX201 (2020-02-24 07:43:42 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/ruiwang-mtk/linux_fw_vpu.git
>
> for you to fetch changes up to a8a18d1ce5920bc0cfcf320747163cf13806b568:
>
>   mediatek: move MT8173 VPU FW to subfolder (2020-02-26 13:08:15 +0800)
>
> ----------------------------------------------------------------
> gtk_ruiwang (1):
>       mediatek: move MT8173 VPU FW to subfolder
>
>  WHENCE                    |   6 ++++--
>  mediatek/mt8173/vpu_d.bin | Bin 0 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 0 -> 131180 bytes
>  vpu_d.bin                 | Bin 2977184 -> 25 bytes
>  vpu_p.bin                 | Bin 131180 -> 25 bytes
>  5 files changed, 4 insertions(+), 2 deletions(-)
>  create mode 100644 mediatek/mt8173/vpu_d.bin
>  create mode 100644 mediatek/mt8173/vpu_p.bin
>  mode change 100644 => 120000 vpu_d.bin
>  mode change 100644 => 120000 vpu_p.bin

Pulled and pushed out.  I removed the local symlinks as the makefile
will create them on installation now.

josh
