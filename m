Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C54FC433F5
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Feb 2022 15:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 198AFC340EF; Fri, 18 Feb 2022 15:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC7CC340F0
	for <linux-firmware@kernel.org>; Fri, 18 Feb 2022 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645199509;
	bh=dzdJu3uBO3gucs9F5fmfFOVy7+OLBs/gxc+ko+5eFXQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Iz5bzyAT2egi6szQiWbKQq5xkGgWTtpew19fV9hUfO4lYmneN3JdsH5fQrMgsv9Ww
	 g8lzYjq4pH6VFtB2JfX37qfb0R24uDD2N0UXstKfcHUb01WOASuGVthpmR3JXNaool
	 /GqzJa1ln2rENKHtHkIUgibuNSOF42WmfPNzyai3nw4zLOzDO1h9+6uSjhnNXhU5aC
	 65A71GTWsVQGxBd1Y6DSlpjFhmhdqMOf9Us08ODjTrA0teOsb/IukCVO6Bdj0iH/ej
	 p3HTx46K3615bZ+sWubcnHHU0N5VsPGUkT/r68XDucLazDJdkSir56HLAYjZ9xbE5H
	 0AjV/UbXoBGYw==
Received: by mail-io1-f54.google.com with SMTP id h16so7994274iol.11
        for <linux-firmware@kernel.org>; Fri, 18 Feb 2022 07:51:48 -0800 (PST)
X-Gm-Message-State: AOAM531O4M5ldqY3D8Xkj0Br9KsGmmPqcwGN19puZd9xezOYsIswuGfG
	5ohceyjJsLT8qR0IodRm4YcxS8zRPbD9KylG6ho=
X-Google-Smtp-Source: ABdhPJz1D2iC52nUnKEYrQr2S+JfCXX3g7z6LSfw958uJJbMmtFBnSLfwHXneGaPmomhjwA7j8cVv56mIxB9tNq7U3E=
X-Received: by 2002:a02:c850:0:b0:30e:54b4:d8de with SMTP id
 r16-20020a02c850000000b0030e54b4d8demr5723854jao.146.1645199507939; Fri, 18
 Feb 2022 07:51:47 -0800 (PST)
MIME-Version: 1.0
References: <20220218111722.2856-1-hildawu@realtek.com>
In-Reply-To: <20220218111722.2856-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 18 Feb 2022 10:51:37 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5SHF5WadubKQAOJOF5rq_T8Gv=87W-e743FuPiubDsmQ@mail.gmail.com>
Message-ID: <CA+5PVA5SHF5WadubKQAOJOF5rq_T8Gv=87W-e743FuPiubDsmQ@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8852A BT USB firmware to 0xDFB7_6D7A
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Max Chou <max.chou@realtek.com>, =?UTF-8?B?6ZmG5pyx5Lyf?= <alex_lu@realsil.com.cn>, 
	Hsin Yu Chang <hsinyu_chang@realtek.com>, KidmanLee <kidman@realtek.com>
Content-Type: text/plain; charset="UTF-8"

All 3 of your patches are applied and pushed out.

josh

On Fri, Feb 18, 2022 at 6:17 AM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> This firmware patch update for Realtek RTL8852A BT USB controller.
>
> Release Version: 0xDFB7_6D7A
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8852au_fw.bin | Bin 51636 -> 47244 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8852au_fw.bin b/rtl_bt/rtl8852au_fw.bin
> index ea6376523106d8a25831d3b0ece32521f5406420..d6e9f8f4d7cd21d1c3ee94822f937665674829e8 100644
> GIT binary patch
> delta 9564
> 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
> GtjP$@Rj!8s
>
> delta 14452
> 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%0A&rb0Bc~v1(yKt17kri0f2M>5`f@A
> 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
> G1pRk}l`!4_
>
> --
> 2.17.1
>
