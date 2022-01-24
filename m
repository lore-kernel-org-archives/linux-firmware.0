Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAA2C433F5
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Jan 2022 11:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2659CC340E4; Mon, 24 Jan 2022 11:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11509C340E7
	for <linux-firmware@kernel.org>; Mon, 24 Jan 2022 11:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643025052;
	bh=dtna8m+btPB2/Jq72ySCwE7Yi66Sc7kVeNMwNy+Egrg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jKY8/GAHECsqYAYI39O+f8gTiy8VEBiD4okolXR44nXfNTz2N7FVYy1wnjWkb1nkd
	 Ova3clyr3tc7WzDfNv2azpXfgrOnNHM5gYKZ26fg7xugV/7iS5nKs4PknIdK+kRAC7
	 m9PCjZM1cannpHtkvZraNMa7xg9jVMAqQPZGp5iXthQAb4KYRuYjrE5F2pK8A/TiON
	 mhWXTj/RO2q6/+MFb74vexNR3HiC1+u5Y3ANkZTJskUVAydQ2XUIMGib2LO3IO7QcJ
	 coKcSXkPuNR/RHrvgwcvwp6ZWKe4pggfXQcHwso7zLQfkGVcFv8JQ70YxUDec8+DEa
	 vwSf1qalUPeZA==
Received: by mail-io1-f44.google.com with SMTP id d188so4792158iof.7
        for <linux-firmware@kernel.org>; Mon, 24 Jan 2022 03:50:52 -0800 (PST)
X-Gm-Message-State: AOAM5301gc7gdWU/EvepFgYMkABMJ9EqsL06WWrxyq1YNwAVvkcPkfjh
	xQdZSjjRckFhfWUhblJXcrwbMXE0ZirHLHrbhkM=
X-Google-Smtp-Source: ABdhPJzlxUFdNDdF8/iZYYps4UG0ix/9h+43CKjvbNVLb1BLBA17f3nms3JKQVpkih8EFFgZXL/G+Df2V+zNfsjrZcQ=
X-Received: by 2002:a02:9991:: with SMTP id a17mr3274565jal.144.1643025051236;
 Mon, 24 Jan 2022 03:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20220122125029.22195-1-irui.wang@mediatek.com>
In-Reply-To: <20220122125029.22195-1-irui.wang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jan 2022 06:50:40 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5Vg9h2kK6_xO2Nz2nw=u29i0=C1WOkbQjXDA0-DZhjOw@mail.gmail.com>
Message-ID: <CA+5PVA5Vg9h2kK6_xO2Nz2nw=u29i0=C1WOkbQjXDA0-DZhjOw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: mediatek: Update MT8173 VPU
To: Irui Wang <irui.wang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, linux-arm-kernel@lists.infradead.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Maoguang Meng <Maoguang.Meng@mediatek.com>, Longfei Wang <Longfei.Wang@mediatek.com>, 
	Yunfei Dong <Yunfei.Dong@mediatek.com>, Andrew-CT.Chen@mediatek.com, 
	Erin Lo <erin.lo@mediatek.com>, PoChun.Lin@mediatek.com, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 22, 2022 at 7:50 AM Irui Wang <irui.wang@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> The following changes since commit 0c6a7b3bf728b95c8b7b95328f94335e2bb2c967:
>
>   linux-firmware: Update firmware file for Intel Bluetooth 9260 (2022-01-19 11:16:28 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/irui-wang/linux_fw_vpu_v1.1.7.git v1.1.7
>
> for you to fetch changes up to 70390331db03113fd7fe1dff195b135a7f2ad840:
>
>   linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.7 (2022-01-22 20:30:38 +0800)
>
> ----------------------------------------------------------------
> Irui Wang (1):
>       linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.7
>
>  mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)

Pulled and pushed out.

josh
