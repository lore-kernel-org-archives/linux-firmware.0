Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CAAC4332D
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Mar 2020 11:40:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CB78920781; Fri, 20 Mar 2020 11:40:05 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A6D3820776
	for <linux-firmware@kernel.org>; Fri, 20 Mar 2020 11:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584704405;
	bh=iy0DPkUN8K/G9bJpje5gyRzlt0Krjnhy7Jq9VXkD4Zg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ypLJA4KmidGx0Lf3/OGyq8WwqXPUqQp02gA6ofsognYX/c3pZCkXozDQg9kSEyy4m
	 FTHhPfGrroszbknTTIk/a/3GG67Tpfh78D5axGbPHvFom+NjNGz7sSvNbxIWhWNDNR
	 jrNTNt87SUb1Df+wR/UwtslkR7Tiolj4oXkXOp18=
Received: by mail-il1-f182.google.com with SMTP id l14so5241060ilj.8
        for <linux-firmware@kernel.org>; Fri, 20 Mar 2020 04:40:05 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1hQyuW1HZRjjAX1QpkSOoX7hwIX0wQbwXLArJ7V13Gi5KJ/X7J
	XPRi5VSvYBZUpERLAD9H64npj2q4/vnwxD8TFOI=
X-Google-Smtp-Source: ADFU+vuX46aMx1NbY1leqNBC7N7arF+J98DWHRgaTnF95AlB1R3flMuvkmnEcc2Li7GUFMMjhUk/R1ctAydOwUTuUh8=
X-Received: by 2002:a92:1a53:: with SMTP id z19mr7767334ill.85.1584704405029;
 Fri, 20 Mar 2020 04:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200320071143.4225-1-erin.lo@mediatek.com>
In-Reply-To: <20200320071143.4225-1-erin.lo@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 20 Mar 2020 07:39:54 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5pjvbJvMeKEARCAyztNAspqksfmCnV+ubO4OJnaQo5EA@mail.gmail.com>
Message-ID: <CA+5PVA5pjvbJvMeKEARCAyztNAspqksfmCnV+ubO4OJnaQo5EA@mail.gmail.com>
Subject: Re: pull request v2: linux-firmware: Create Mediatek MT8183 SCP firmware
To: Erin Lo <erin.lo@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, 
	menghui.lin@mediatek.com, sj.huang@mediatek.com, 
	Nicolas Boichat <drinkcat@google.com>, Shawn Ku <shawnku@google.com>, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 20, 2020 at 3:13 AM Erin Lo <erin.lo@mediatek.com> wrote:
>
> Hi, maintainers,
> Changes since v1:
>  - Add information to WHENCE
>
> The following changes since commit 0148cfefcbf98898ca65bb26d9d7d638b30e211d:
>
>   Merge https://github.com/rjliao-qca/qca-btfw (2020-03-02 08:08:15 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/erinlo/linux_fw_scp v12573.77
>
> for you to fetch changes up to 3c213aa59661c4641f0c2166a315140ac0445230:
>
>   mediatek: Add mt8183 SCP firmware (2020-03-20 14:37:49 +0800)
>
> ----------------------------------------------------------------
> Erin Lo (1):
>       mediatek: Add mt8183 SCP firmware
>
>  WHENCE                  |  18 ++++++++++++++++++
>  mediatek/mt8183/scp.img | Bin 0 -> 1027104 bytes
>  2 files changed, 18 insertions(+)
>  create mode 100644 mediatek/mt8183/scp.img

Pulled and pushed out.

josh
