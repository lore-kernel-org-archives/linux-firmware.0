Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B66CC48BCF
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Jun 2021 12:01:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 04731613C1; Wed,  9 Jun 2021 12:01:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF0A1613C0
	for <linux-firmware@kernel.org>; Wed,  9 Jun 2021 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623240079;
	bh=20qnIbbJ6Wm3sdWxaZiC7ML5Xfj5XzsnLTgLvqdXdYY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fP9t0d8e8LaGvvHcp5Mr9NJ86RYXZe7Qal9w2WLVvuMmVb86A4bSoG2MpNFhoAQaV
	 PXyYa6OaQlel4YQXJJ1AAqij03vJndqEw72LjZ4Lbj6+Xv92NCZqHrTiWNxmWgsoS1
	 JeTCA31nDr7DdIPFwDLQ+cDnNF5Dz6XPrXx2kxemEDJUkKi+NK4diybsGENNmBo9LW
	 yBrk93FT2Bzpo1xxPpyZJ7qQUQ9ZtAY8leBO/RUPNg6y/B8/FiLdyrWN+uFnULwh77
	 jyYqeafkDCPqY0N6zgAFiL3TYZapmt/uRBphOf5VFMAE5db1+F+2VTH4TEy7UgpSWT
	 JRhoDo6DDqgCQ==
Received: by mail-il1-f172.google.com with SMTP id x18so25369955ila.10
        for <linux-firmware@kernel.org>; Wed, 09 Jun 2021 05:01:19 -0700 (PDT)
X-Gm-Message-State: AOAM532W6S/7/sP02+W9LggRXuA/157szz4N/Aw8QijrKVtmNiNRj3nJ
	tVCSUq8EP5tZceG/l09+YTtQRWHhX9OPIqZRi20=
X-Google-Smtp-Source: ABdhPJx3SK1HsMi88xtEQlT922WlV59QLz75bPqeSQ6jPD0az9hypdcOqSrWmaoPNwkm1o5GqHDLSRri/jxu6Po583s=
X-Received: by 2002:a6b:7b0a:: with SMTP id l10mr22601413iop.120.1623240079186;
 Wed, 09 Jun 2021 05:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210527113740.10549-1-hildawu@realtek.com>
In-Reply-To: <20210527113740.10549-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Jun 2021 08:00:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7PbOrz6z7ueScBkc46x4NCWH3zstq4kjL-CXd1Bse1DQ@mail.gmail.com>
Message-ID: <CA+5PVA7PbOrz6z7ueScBkc46x4NCWH3zstq4kjL-CXd1Bse1DQ@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x05A8_A0CB
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Max Chou <max.chou@realtek.com>, =?UTF-8?B?6ZmG5pyx5Lyf?= <alex_lu@realsil.com.cn>, 
	KidmanLee <kidman@realtek.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, May 27, 2021 at 7:37 AM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> This firmware patch update for Realtek RTL8822C BT controller.(UART I/F)
>
> Release Version:0x05A8_A0CB
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8822cs_fw.bin | Bin 62132 -> 65404 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8822cs_fw.bin b/rtl_bt/rtl8822cs_fw.bin
> index 635cec593ba0e5d823b8b64fec366ee4048c6f6e..f87d9401c3a28eba4aed9a753683e372c41a4807 100644
> GIT binary patch
> delta 13649
> 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
>
> delta 10088
> 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%0A&rbK<WTx4YdujK<X!K
> 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
> K4FLdA1pRlSxv3HW
>
> --
> 2.17.1
>
