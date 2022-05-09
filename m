Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727F8C433F5
	for <linux-firmware@archiver.kernel.org>; Mon,  9 May 2022 18:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40E40C385B7; Mon,  9 May 2022 18:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE42C385B6
	for <linux-firmware@kernel.org>; Mon,  9 May 2022 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652119221;
	bh=cZuHMZkRe/rKUZyjjIE0peHawxxhnDN3YLyAGVjsIxY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=izTetdhA0d91JTkvFAb34Yl3+4MY1GbbHt1HjgE5st2+Lk+vA0V9iIJ8TjWAn/fdf
	 a2pRCQPCDcjb1WNnUbVfGVDdG37iUhfycTaX2KgyWcbWVyG64sh6STOIDC+REPYe7w
	 bmKQu6OuiZLHfE8fx6EqYZS/v5W+x5FR2j+m9b6r+vkBgDBMj9V8gTutjWBRgXIh4e
	 5OEGysFzkVn/0VG8ZtLeJaOPTkCptEMiDv8Q/xyWppb0UDTB90tdKyEYpjMtVtevtv
	 mLdvaTbCea12Hq3oRU5Aa/C2HIv6QGxfUHimlPx3xCy4/0tFSKpaHW0FCpUq7LpALQ
	 RnMnQlY7g8dQQ==
Received: by mail-io1-f52.google.com with SMTP id e194so16165989iof.11
        for <linux-firmware@kernel.org>; Mon, 09 May 2022 11:00:21 -0700 (PDT)
X-Gm-Message-State: AOAM530qpAnFJzjzOhJPWX6AIdR5O0YaHlSpCgPwwlDmv7U8IdG2SNy4
	eSixYad+BBkd7lXIGLgjg4ytjrjBHzcAizAlvAM=
X-Google-Smtp-Source: ABdhPJzbtkmlimFVD5p86As7rTvM8yguVhRJ+JqiScVfM3LhTW8V4sPgPuzuwp0WuSediSFDEeDcSCgNlbh7PAxRK9g=
X-Received: by 2002:a5e:821a:0:b0:657:c59f:898c with SMTP id
 l26-20020a5e821a000000b00657c59f898cmr6945799iom.209.1652119220296; Mon, 09
 May 2022 11:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <4a46f800702c33bd9c2b0c2069179572a3eb1044.camel@mediatek.com>
In-Reply-To: <4a46f800702c33bd9c2b0c2069179572a3eb1044.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 9 May 2022 14:00:09 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6yF8_MPEqN5tyxGnHkQU4E0QK3X_JSEVvcVCmnUa6-7A@mail.gmail.com>
Message-ID: <CA+5PVA6yF8_MPEqN5tyxGnHkQU4E0QK3X_JSEVvcVCmnUa6-7A@mail.gmail.com>
Subject: Re: [PULL] mediatek: Update mt8183 firmware
To: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, Rong Chang <rongchang@google.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Shawn Ku <shawnku@google.com>, hsinyi@google.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"

On Mon, May 9, 2022 at 4:04 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> Update the MediaTek mt8183 firmware is to v2.0.2745.
>
>
> Thanks,
> TingHan
>
> ---
>
> The following changes since commit d4b75516c46b22d17b8654c65f2ea2730875bf14:
>
>   Merge branch 'dg2_dmc_v2.06_rebase' of git://anongit.freedesktop.org/drm/drm-firmware into main
> (2022-05-03 08:20:28 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp 8183-v2.0.2745

Pulled and pushed out.

josh

>
> for you to fetch changes up to bdc8ff9f974d541c296212f208ac23bdbdd076d1:
>
>   mediatek: Update mt8183 SCP firmware (2022-05-09 14:54:43 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Update mt8183 SCP firmware
>
>  WHENCE                  |   2 +-
>  mediatek/mt8183/scp.img | Bin 1027104 -> 1032064 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
>
