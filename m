Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10802C433B4
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Apr 2021 13:54:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CD49C61077; Mon, 19 Apr 2021 13:54:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6CA16101E
	for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 13:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618840497;
	bh=x0E01jGo2s6Ukvyf23U6If/IZDOlmzexWhRhJcE/gHw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=rbQyZ1n2p6Cj7jVyIxmvuJ+Snt3EccbE+2Km6KmLPUAedU7Xgdxw+IdAlpGe22xv9
	 u6Hc4QPBAsSPEmi8Fk6c/zT/w7OFvwSX+Sre6ErJ9WlM8oDzASNHNv/3NWEOpMoJGz
	 Ncb3E4zliqldw+PFqSLO9tKGxGMzTp2BtBr2Ry/402hE9hy2yTXSFYnyKjpt0VjFzJ
	 GLwRqhgU/RFZXmpfuJR72eKxnmsl6uDZSkqATc9iD7tNdaY7xmybnKSHpnxZwkhxT7
	 gfoWThkWXcef3BEmFwKVAJWPwi8FjUqKwapQXhRSHioUR6eGQptC0ZhLgTTln9YMt2
	 pdp6xitB1t1fg==
Received: by mail-io1-f42.google.com with SMTP id v123so28069377ioe.10
        for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 06:54:57 -0700 (PDT)
X-Gm-Message-State: AOAM533AdbI0kfboj32WAWFk85MEioNLHzGt4pdNZ9kTxwhf+MOU+Y5u
	1osiH+S9A9Jlsi001HzdFpTChT0osI03n5N9d1A=
X-Google-Smtp-Source: ABdhPJyxI61IBrxfocv2Ksrs4IQSi2wUcYUvglyOd2dgK7FK55LpJfXS+aKGXgOV81Pom+3LD1SyD1856GKKAjEt2as=
X-Received: by 2002:a02:cc:: with SMTP id 195mr17092792jaa.73.1618840496975;
 Mon, 19 Apr 2021 06:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAK0s0=kjP_30nSH2-qa959HNSSX_sGDubyWOe0sYz1RAUJMLtQ@mail.gmail.com>
In-Reply-To: <CAK0s0=kjP_30nSH2-qa959HNSSX_sGDubyWOe0sYz1RAUJMLtQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Apr 2021 09:54:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7d3dq5T6BebRXAQbTnZeUcfMfApmOrjuVrOD5wFt_RnQ@mail.gmail.com>
Message-ID: <CA+5PVA7d3dq5T6BebRXAQbTnZeUcfMfApmOrjuVrOD5wFt_RnQ@mail.gmail.com>
Subject: Re: [pull request] Netronome flower firmware update
To: Louis Peens <louis.peens@netronome.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, oss-drivers@netronome.com
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Thu, Apr 8, 2021 at 8:56 AM Louis Peens <louis.peens@netronome.com> wrote:
>
> The following changes since commit af1ca28f03287b0c60682ab37cc684c773de853f:
>
>   amdgpu: add arcturus firmware (2021-04-05 10:40:08 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/Netronome/linux-firmware
>
> for you to fetch changes up to 6c419aea3689472787a02d19f62815e08856336d:
>
>   nfp: update Agilio SmartNIC flower firmware to rev AOTC-2.14.A.6 (2021-04-08 14:44:28 +0200)
>
> ----------------------------------------------------------------
> Louis Peens (1):
>       nfp: update Agilio SmartNIC flower firmware to rev AOTC-2.14.A.6
>
>  WHENCE                             |   2 +-
>  netronome/flower/nic_AMDA0058.nffw | Bin 6683216 -> 6857912 bytes
>  netronome/flower/nic_AMDA0096.nffw | Bin 4312000 -> 4417672 bytes
>  netronome/flower/nic_AMDA0097.nffw | Bin 4312000 -> 4417672 bytes
>  netronome/flower/nic_AMDA0099.nffw | Bin 4314368 -> 4420040 bytes
>  5 files changed, 1 insertion(+), 1 deletion(-)
