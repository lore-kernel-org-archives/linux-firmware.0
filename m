Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDE9C433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Apr 2022 11:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54C9FC385A8; Tue, 19 Apr 2022 11:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEBBC385AA
	for <linux-firmware@kernel.org>; Tue, 19 Apr 2022 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650368919;
	bh=JCgMiwyD52Mfee1pO8eoHv8GHzhEnFXjizjVzOtSsxA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TqINAChhZ7wi6fBGA+9pDD8w2vbni+85039Pnd3TxFjZSu1q30q+guJ0MT3hIcwZ2
	 pcPguPhrO6WmkL024XmA8T/+SU4yT2aOKVlZtW+/NVucZdezx2waHofWKCNi/Dh1aH
	 ZnPSGGwKNqyVLFGJJq7fE+fQbuD352g8EMafw+IpRsspSWqolLk1RUzQ3rVj7kF2Xd
	 CYHmI0l/+2X8+y8iWQNMAc3+skJdsrPIhcLCfPgJrLsRdGlOPnohGOUZMzyU7sMZgd
	 DofSxA/OpPw/CH4jPd26C8C/S42fPoBFuguy5Knpvz0ltC3dVM7XNMC/FGPoWxPudK
	 uqwFJpKX6wSiQ==
Received: by mail-io1-f44.google.com with SMTP id r12so11426142iod.6
        for <linux-firmware@kernel.org>; Tue, 19 Apr 2022 04:48:39 -0700 (PDT)
X-Gm-Message-State: AOAM530F/HZnfnydFZ39ynAeOmqybPFItGeDpoPWbn7yFN0AlpQPVJkz
	UgYBF0Rv4dE8IllDvFnl/c+kMTDDadtsttFowZ0=
X-Google-Smtp-Source: ABdhPJzuYOxUEZRVrD/jtl+UDqJFtOunqtwPeJ91XckRk2H4XnuZJUi8XlLNq9Ql3EoVGm6A8oyVg3Uz5km3drehUYU=
X-Received: by 2002:a05:6602:15c6:b0:611:591d:1d9a with SMTP id
 f6-20020a05660215c600b00611591d1d9amr6332958iow.177.1650368918339; Tue, 19
 Apr 2022 04:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <b6e1b4b7b5f894cf77a60768e445218805fbb681.camel@mediatek.com>
In-Reply-To: <b6e1b4b7b5f894cf77a60768e445218805fbb681.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Apr 2022 07:48:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA55rfq0pgGXCHgt0AhyS=yRYU_nLoM3kif7qejVnbJRGw@mail.gmail.com>
Message-ID: <CA+5PVA55rfq0pgGXCHgt0AhyS=yRYU_nLoM3kif7qejVnbJRGw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Create Mediatek MT8195 SCP firmware
To: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, rongchang@google.com, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Shawn Ku <shawnku@google.com>, stevecho@google.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 14, 2022 at 2:48 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> Hi,
>
> Add new SCP firmware for MediaTek MT8195.
> Thank you!
>
>
> Regards,
> TingHan
>
> ---
> The following changes since commit 8a2d811764e7fcc9e2862549f91487770b70563b:
>
>   rtl_bt: Add firmware and config files for RTL8852C (2022-04-13 07:10:23 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp v14454.8.0

Pulled and pushed out.

josh

>
> for you to fetch changes up to 10612bd12e4778069aff50caad9431002f92e374:
>
>   mediatek: Add mt8195 SCP firmware (2022-04-14 14:03:33 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Add mt8195 SCP firmware
>
>  WHENCE                  |   2 ++
>  mediatek/mt8195/scp.img | Bin 0 -> 429668 bytes
>  2 files changed, 2 insertions(+)
>  create mode 100644 mediatek/mt8195/scp.img
>
