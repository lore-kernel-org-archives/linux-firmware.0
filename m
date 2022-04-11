Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7EFC433F5
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Apr 2022 11:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3ED1C385A6; Mon, 11 Apr 2022 11:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C394C385A4
	for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649675845;
	bh=41EOXuCUlWZ9rfU54chR/Cb1cj4BTjAvEPHrjFip/6k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=C+p6yNgEe2G3RzBtvhakwLqb9as7sso0iY7zigdeJY3PIaiVBUPrnh9tuoRgb6OFT
	 Zy4H8f1WhkK9BPeUbrhdjic1XWnae1K2fC1WF+J5EgKxjV4MRjT1VkrvLtLM/F5c4d
	 jO6+y6XVelIdZroIhbqt1QXIwJ9vRGAhxbwjFjjC/RcvVrtzQbmo2Nd+GxQwFETLhh
	 ZiJWseOll2BFNRoyEThOkH/ci4rBGG5M4yJSgkf4k3U2bikY7zZTVHVjZpcC57H4KS
	 fmCnbmknPmVBOaolCkr5HHx3q8C7rIjXQuZBTqqPRkR4+CARfUps0FgU/UEi8IlgFx
	 gPzjUhxIrLoAQ==
Received: by mail-il1-f178.google.com with SMTP id 8so11170407ilq.4
        for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 04:17:25 -0700 (PDT)
X-Gm-Message-State: AOAM533hPyAJMqTpz/iHvkHdTByjpvtpghgXNg2SsZZLDskv7eog217E
	on95J6sUZYYo1D8ZLMManzKD8q95urRiWKwSJWg=
X-Google-Smtp-Source: ABdhPJzTtS5Y4xZp0z2ZUJ6t7v+AtxMn3vZjZEG2vSBqrnlOjSoBFaAKzkOZIlzvBZj4Up7QpX5C/EQM87PiWvOojJw=
X-Received: by 2002:a05:6e02:b2a:b0:2ca:703:59d2 with SMTP id
 e10-20020a056e020b2a00b002ca070359d2mr13927415ilu.218.1649675844679; Mon, 11
 Apr 2022 04:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220408062722.26813-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220408062722.26813-1-yunfei.dong@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 11 Apr 2022 07:17:14 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5h0NsA5P+AUWrOOQ4gqu6oMqtDUf2HO=rV30iCyiiHTw@mail.gmail.com>
Message-ID: <CA+5PVA5h0NsA5P+AUWrOOQ4gqu6oMqtDUf2HO=rV30iCyiiHTw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Create Mediatek MT8192 SCP firmware
To: Yunfei Dong <yunfei.dong@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, linux-arm-kernel@lists.infradead.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, tinghan.shen@mediatek.com, 
	Irui Wang <irui.wang@mediatek.com>, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 8, 2022 at 2:27 AM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> The following changes since commit 681281e49fb6778831370e5d94e6e1d97f0752d6:
>
>   amdgpu: update PSP 13.0.8 firmware (2022-03-18 07:35:54 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/yunfeidongmediatek/linux_fw_scp_8192 v1
>
> for you to fetch changes up to 3ac2fc85bc7dfcebdb92b5b5808b0268cdfb772d:
>
>   mediatek: Add mt8192 SCP firmware (2022-04-08 10:59:44 +0800)
>
> ----------------------------------------------------------------
> Yunfei Dong (1):
>       mediatek: Add mt8192 SCP firmware
>
>  mediatek/mt8192/scp.img | Bin 0 -> 309436 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 mediatek/mt8192/scp.img

This needs an entry added to the WHENCE file

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: mediatek/mt8192/scp.img not listed in WHENCE

Can you fix this and let me know when it's ready to pull?

josh
