Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353EBC4363A
	for <linux-firmware@archiver.kernel.org>; Fri, 23 Oct 2020 12:11:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E7F3124248; Fri, 23 Oct 2020 12:11:15 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BA447208E4
	for <linux-firmware@kernel.org>; Fri, 23 Oct 2020 12:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603455075;
	bh=zTz0bRSApTPYOppSNodzB/6/jw7ty/VjpWmXL7j4xj4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=x3wTaTK2gKQ8pt/nzzVj31XKrFPk6eE+7C4MOXEHsNFU+Gpg4AYNKBkRpB7AsBMXz
	 stb5nnEnfIxpkOvgy9vH583Ys9zUOh5DropTwKhR3B8BlyBGoa3YANfJNxnvci7U/V
	 6KvaE3YwDNcNATs+eZ7TxyehMfKQIILpeazoh3fs=
Received: by mail-io1-f52.google.com with SMTP id p15so1492810ioh.0
        for <linux-firmware@kernel.org>; Fri, 23 Oct 2020 05:11:15 -0700 (PDT)
X-Gm-Message-State: AOAM532MMpb4KgiDzAMFdFKezkg8cm8O1h4yUTWqc0iqh7QUqybS3BrD
	bu1YqBUhwO8yq/6qtuzEC/FTR673K3Y+7ObjVL4=
X-Google-Smtp-Source: ABdhPJyHkVe08MTTutYFTIB7Sx75pqDLpP4/v0y3HuYeQjSqJcuL0d5HzFpepTPbbFffr/L1b8lt8LMrvzjfhes5oRM=
X-Received: by 2002:a02:b052:: with SMTP id q18mr1610741jah.81.1603455075082;
 Fri, 23 Oct 2020 05:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201023091026.32066-1-irui.wang@mediatek.com>
In-Reply-To: <20201023091026.32066-1-irui.wang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Oct 2020 08:11:04 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6XZ_GZ4SCKiCCX-e3xR9eV7hJqfXgwo33zk7BvibsHpw@mail.gmail.com>
Message-ID: <CA+5PVA6XZ_GZ4SCKiCCX-e3xR9eV7hJqfXgwo33zk7BvibsHpw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: mediatek: separate venc service thread
To: Irui Wang <irui.wang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, linux-arm-kernel@lists.infradead.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Maoguang Meng <Maoguang.Meng@mediatek.com>, Longfei Wang <Longfei.Wang@mediatek.com>, 
	Yunfei Dong <Yunfei.Dong@mediatek.com>, Andrew-CT.Chen@mediatek.com, 
	Erin Lo <erin.lo@mediatek.com>, PoChun.Lin@mediatek.com, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Fri, Oct 23, 2020 at 5:10 AM Irui Wang <irui.wang@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> The following changes since commit 58d41d0facca2478d3e45f6321224361519aee96:
>
>   ice: Add comms package file for Intel E800 series driver (2020-10-05 08:09:03 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/irui-wang/linux_fw_vpu_v1.1.5.git v1.1.5
>
> for you to fetch changes up to 76ceac823c3f5e867e8a22d6505993fe49f602d9:
>
>   mediatek: separate venc service thread (2020-10-23 16:43:57 +0800)
>
> ----------------------------------------------------------------
> Irui Wang (1):
>       mediatek: separate venc service thread
>
>  mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
>
