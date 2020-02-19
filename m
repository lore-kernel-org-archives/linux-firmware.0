Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48175C34047
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Feb 2020 12:32:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 393E824671; Wed, 19 Feb 2020 12:32:24 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 092B720679
	for <linux-firmware@kernel.org>; Wed, 19 Feb 2020 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582115544;
	bh=rQLJgipmlA/J0x8qYVNwChZfoUkcJu+Lgm8+HW4iZzM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=v2JIwPKZh9fkwtMSlz8fGZMHPM5CoZ/WyPJCCAlbGZowpvhB3wn80T8159JQ8Q0VB
	 jhveTQs9a+KKktG0sefaUC2IT+AUV2CoFxKnyalLPSMSM3rfyJejlv+hE3SQ/7jqv2
	 17BQTYraZe79zh2uP2VOTTyJxqrKuUtyHgrlF9/4=
Received: by mail-qk1-f180.google.com with SMTP id c20so22812287qkm.1
        for <linux-firmware@kernel.org>; Wed, 19 Feb 2020 04:32:23 -0800 (PST)
X-Gm-Message-State: APjAAAXQIp6lxPaSnEyCublFEBuvpemEoz6YQDhhuFwhM60Jue8ZqdO3
	5flu5L1W5MGnG97yPjQ48gz3CM3Px8sRi6iNVyk=
X-Google-Smtp-Source: APXvYqyYbSlrgoOVMio4VbdRpfZqdoVp+jaZdX4Gx4S9LVzr/bZxAZhbKRq9gJWfd2ujLmWJLj4uwHnSONCco6EONkQ=
X-Received: by 2002:ae9:ed10:: with SMTP id c16mr22229007qkg.95.1582115543191;
 Wed, 19 Feb 2020 04:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20200218100358.2015-1-gtk_ruiwang@mediatek.com>
In-Reply-To: <20200218100358.2015-1-gtk_ruiwang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 19 Feb 2020 07:32:12 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4K1jtuvQWBOMuORJC-VRMUs7t+T4_SpX08xw7SuQn+AA@mail.gmail.com>
Message-ID: <CA+5PVA4K1jtuvQWBOMuORJC-VRMUs7t+T4_SpX08xw7SuQn+AA@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Update Mediatek MT8173 VPU firmware
To: gtk_ruiwang@mediatek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, 
	Alexandre Courbot <acourbot@chromium.org>, Tomasz Figa <tfiga@chromium.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, PoChun.Lin@mediatek.com, 
	Longfei Wang <longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Maoguang Meng <maoguang.meng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 18, 2020 at 5:04 AM <gtk_ruiwang@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> The following changes since commit 6f89735800fe3af761104defdb81b50b6d6402f0:
>
>   rtl_nic: update firmware for RTL8153A (2020-02-07 08:30:37 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/ruiwang-mtk/linux_fw_vpu_v1.1.4.git
>
> for you to fetch changes up to 0bd965d5e4b0d24e2fc054a933fea3a8c22af92b:
>
>   mediatek: update MT8173 VPU firmware to v1.1.4 (2020-02-18 17:27:30 +0800)
>
> ----------------------------------------------------------------
> gtk_ruiwang (1):
>       mediatek: update MT8173 VPU firmware to v1.1.4
>
>  vpu_d.bin | Bin 2977136 -> 2977184 bytes
>  vpu_p.bin | Bin 131180 -> 131180 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)

Pulled and pushed out.

josh
