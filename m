Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5ABC0044D
	for <linux-firmware@archiver.kernel.org>; Mon, 16 Mar 2020 11:40:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 995832074D; Mon, 16 Mar 2020 11:40:06 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7862E20724
	for <linux-firmware@kernel.org>; Mon, 16 Mar 2020 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584358806;
	bh=Ko27tvjSOxWw2c+7T+N9R5DU0h2C2x51xk/JtN4IhvE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=WeLvgyLamuHAFXdtwDXFSF/6/Piw4dFGq8Pf9LSF5XqllMJnGQJxWw0Wq71qBh7WY
	 orOPf5+N4Y0nJJY4OV0vPtwE5EHnLpjNZhO3THohB65YKk+f+U1vjdTXBphM2ZcOun
	 DhkTOTbhaBW336jmYqOvh/14JCkrgnG07hFl3qqg=
Received: by mail-il1-f171.google.com with SMTP id j69so16110553ila.11
        for <linux-firmware@kernel.org>; Mon, 16 Mar 2020 04:40:06 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2tepshvPaicW74jIGcvFufcZ/MT+2OdA6A4txhAmMQD36Zr/gw
	wOf619EBioNDnMHrOkntFevIn0K7m+oOvuisfQE=
X-Google-Smtp-Source: ADFU+vuFgPhL5LIJn6Q6qWWAt8kgnZ/+G77NUpqLggYXbJzzJCCABWIIMJBEP4g7XAkLWWpU1XlUU9Fkhq+CNT5Cfig=
X-Received: by 2002:a92:5a88:: with SMTP id b8mr27282656ilg.206.1584358805937;
 Mon, 16 Mar 2020 04:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200311033908.31960-1-erin.lo@mediatek.com>
In-Reply-To: <20200311033908.31960-1-erin.lo@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 16 Mar 2020 07:39:55 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5SQWD0DOeDU4kr9CYQhz6u=o5L3OinG_+2VUxsUEpvbw@mail.gmail.com>
Message-ID: <CA+5PVA5SQWD0DOeDU4kr9CYQhz6u=o5L3OinG_+2VUxsUEpvbw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Create Mediatek MT8183 SCP firmware
To: Erin Lo <erin.lo@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, 
	menghui.lin@mediatek.com, sj.huang@mediatek.com, drinkcat@google.com, 
	shawnku@google.com, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 10, 2020 at 11:40 PM Erin Lo <erin.lo@mediatek.com> wrote:
>
> The following changes since commit 0148cfefcbf98898ca65bb26d9d7d638b30e211d:
>
>   Merge https://github.com/rjliao-qca/qca-btfw (2020-03-02 08:08:15 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/erinlo/linux_fw_scp v12573.77
>
> for you to fetch changes up to a52150d8e1fe65994464b15ea162bdc89ba61ce8:
>
>   mediatek: Add mt8183 SCP firmware (2020-03-11 10:36:45 +0800)
>
> ----------------------------------------------------------------
> Erin Lo (1):
>       mediatek: Add mt8183 SCP firmware
>
>  mediatek/mt8183/scp.img | Bin 0 -> 1027104 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 mediatek/mt8183/scp.img

This file needs to be added to WHENCE.  Can you adjust the commit to add it?

josh
