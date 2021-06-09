Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB4BC48BCF
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Jun 2021 12:00:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4AA3E6023B; Wed,  9 Jun 2021 12:00:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31BAB61364;
	Wed,  9 Jun 2021 12:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623240041;
	bh=gbUv6oiKSlzh+VxzCdSkY6nzym2N1j/ZfBYXwYj9RT8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=gnpV9bFvkGjUldptw+HKCmdvBZ5IfrdeZ2izj1vL2SYdv0v5MWL46cEw2r/BLUDV9
	 jzqPbmzvcLSHx+DJiHVciXXYSKKCj+eWHCJ3qlF75PwQp5albqzU6bJI5qyII/K46F
	 VHo6+9x7oBxKicsx5OFl/vv69GxBM8vZm5WyPOeCD+Yeb3S9VROAWFTT7zaoCX2Y3W
	 Oov80Q06b2CNaLrG/tdoEFMc2u98EAEYqqlxnYaygpabN0MBkRaVhmBNwdvQdaTpe4
	 FU2/QJqMddP9ItD11Y+D1bjScsb555oTbS9gykLQXfC2Pb/UxY+FmAToCz0NnwsIwX
	 QAEd85TPp10vA==
Received: by mail-il1-f171.google.com with SMTP id i17so25346402ilj.11;
        Wed, 09 Jun 2021 05:00:41 -0700 (PDT)
X-Gm-Message-State: AOAM531E+d+mViYxSJNK/y8Us5m5vqGCDixu3IHa70hA+Aa63oieGwLW
	g5NptmMgXvvLmRtOphgFDQcg8VLPYQCYTIdwg7g=
X-Google-Smtp-Source: ABdhPJzxbeJ7QWdq/5s9ieZ6ENEnmwe+1lWhwMr4LoAlytGoysmIxXpA6Mr4N0mCyqBTja+mscf1+KwubepJAl5+r0s=
X-Received: by 2002:a92:d48a:: with SMTP id p10mr23011746ilg.206.1623240040611;
 Wed, 09 Jun 2021 05:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210527112159.10089-1-hildawu@realtek.com>
In-Reply-To: <20210527112159.10089-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Jun 2021 08:00:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7R9tc4LD2JpsiFFn6_aKz6f2Skn5wEkQEk_EmDruXroA@mail.gmail.com>
Message-ID: <CA+5PVA7R9tc4LD2JpsiFFn6_aKz6f2Skn5wEkQEk_EmDruXroA@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8822C BT(USB I/F) FW to 0x09A8_A0CB
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>, 
	Larry Finger <Larry.Finger@lwfinger.net>, Max Chou <max.chou@realtek.com>, 
	=?UTF-8?B?6ZmG5pyx5Lyf?= <alex_lu@realsil.com.cn>, 
	KidmanLee <kidman@realtek.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, May 27, 2021 at 7:22 AM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> This firmware patch update for Realtek RTL8822C BT controller.(USB I/F)
>
> Release Version:0x09A8_A0CB
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8822cu_fw.bin | Bin 59388 -> 62656 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8822cu_fw.bin b/rtl_bt/rtl8822cu_fw.bin
> index 96fd2f0691e0b7828f97e2306a592e75aaa1ed3b..2467eef89df6a0b6473cde84a278655ff534e2ae 100644
> GIT binary patch
> delta 13565
> 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
> DEfi5I
>
> delta 10005
> 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
>
> --
> 2.17.1
>
