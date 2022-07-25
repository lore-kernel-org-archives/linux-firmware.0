Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9463CC433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Jul 2022 18:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7BF83C341CD; Mon, 25 Jul 2022 18:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B57C341D0
	for <linux-firmware@kernel.org>; Mon, 25 Jul 2022 18:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658772958;
	bh=agwYaHzbPK1VDytUTtodWqQ0MWkJCgfOTTaATnI0EHU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bKJ/6KXy1/PoqQ34/iVJ2Agab81iYX08r1gfm7lXaTHsXqyHbwX25f39jtNDCpdaZ
	 oPdj/czBnuL2lzxefs3jS20t5gsMRKmLtM16fSjOEjTeKOiVottfwz0VAJVxiLjPE4
	 /1Q/IMq0B61pSS5ambMqWgDESDuaOeWkV6Ogr9AXYyZ/StGQAr0AdhRKtdwdGliH0m
	 ZxmVG9XbteMYgZAPOB4EftFQm69Y1FpAUng2BuT+OY9d4Dl+qihVavu/MdkFtroPQZ
	 3wqlv38qi6iKASGQnQEGz+RoP1loWmUTQZPBnqvva9Cyt7bDF8rNBMFYHTmewDiHet
	 w160U7tnThdBA==
Received: by mail-il1-f174.google.com with SMTP id i5so6119445ila.6
        for <linux-firmware@kernel.org>; Mon, 25 Jul 2022 11:15:58 -0700 (PDT)
X-Gm-Message-State: AJIora/id86OKLaKBHnVL2CVZ40OIKeZohUZfIcWbYXBlCvpKslzY/LE
	otCcZh9GQh94ERPviE6SDoQvMmpkWyJVfnkJgmU=
X-Google-Smtp-Source: AGRyM1utbjTU1C9uhbSuRLSz4HE51dpqipV7dPRpR3rKxUCJvmO4NYWEao1eshc6X5HBgkWJLwRwK539LOnwcgWYbfM=
X-Received: by 2002:a05:6e02:1aa5:b0:2dc:8302:5dc3 with SMTP id
 l5-20020a056e021aa500b002dc83025dc3mr5005700ilv.243.1658772957560; Mon, 25
 Jul 2022 11:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <42437b6fc5dac19bf23f9806dfbe6915e055397b.camel@mediatek.com>
In-Reply-To: <42437b6fc5dac19bf23f9806dfbe6915e055397b.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 25 Jul 2022 14:15:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6uJtrzZZ=k0g6u1ycTm-oXSuuUoddSG8rUebGftnKu5g@mail.gmail.com>
Message-ID: <CA+5PVA6uJtrzZZ=k0g6u1ycTm-oXSuuUoddSG8rUebGftnKu5g@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Update Mediatek MT8183/MT8192/MT8195
 SCP firmware
To: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Shawn Ku <shawnku@google.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Justin.Yeh@mediatek.com, "allen-kh.cheng" <Allen-KH.Cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 22, 2022 at 4:29 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> Hi maintainers,
>
> Update SCP firmware for MediaTek MT8183/MT8192/MT8195.
> Thank you!
>
>
> Regards,
> TingHan
>
> ---
>
> The following changes since commit 4421586e8e95ce789cb6b3f1af98962bfef74c7b:
>
>   amdgpu: update renoir to release 22.20 (2022-07-19 06:44:08 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp mtk-scp-20220722
>
> for you to fetch changes up to 56cf6461a82b08facd41154f7c44a19f0a085f66:
>
>   mediatek: Update mt8183/mt8192/mt8195 SCP firmware (2022-07-22 16:16:27 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Update mt8183/mt8192/mt8195 SCP firmware

Pulled and pushed out.  Thanks.

josh

>
>  WHENCE                  |   6 +++---
>  mediatek/mt8183/scp.img | Bin 1032064 -> 1030776 bytes
>  mediatek/mt8192/scp.img | Bin 327968 -> 328096 bytes
>  mediatek/mt8195/scp.img | Bin 429668 -> 429820 bytes
>  4 files changed, 3 insertions(+), 3 deletions(-)
>
