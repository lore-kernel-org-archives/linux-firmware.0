Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72788C4338F
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Aug 2021 13:22:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4C445610A3; Thu, 12 Aug 2021 13:22:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3609E610A8
	for <linux-firmware@kernel.org>; Thu, 12 Aug 2021 13:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628774573;
	bh=tynl5AYKWJaUu0TrPV5+W4YypknPcQS59y8a0irFQJg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=uE4RPn//8NWZYPLLGu5o+xoZBVMvTHjIlv9/OPo2pxek0p9rozeAXejXEBRdYq9jj
	 6eM84saWNiskEE96mBgIWye0sZaSKz4DVUUluZCzgsAgDuBjZeziUwreFi4kiFd0De
	 2GB4xxyY4cfDtSsZTjQ6yyaMkTu+KAu3dKeEFtO2c66MnifSY0yCEYnqU5+luXe2xJ
	 Q6AheerhO37MhYWVB0d9TBsy3TzgGMxi6ZmhGkrwFjEJODJcyrKPmfOBrFRY+bKVPC
	 XtELzqnO/4nYEMdTMH7FZ/+qAwCmUWxmXEfDMpIa1ipqrMeasc8dfn3vna5jSCZLOy
	 VAt3mcKnWTKWg==
Received: by mail-il1-f180.google.com with SMTP id k3so6876268ilu.2
        for <linux-firmware@kernel.org>; Thu, 12 Aug 2021 06:22:53 -0700 (PDT)
X-Gm-Message-State: AOAM532o2ArJZmu49FO07QD/9WwpwrWNDlPlTqco8E0Lwg0KaAD5qKdE
	JuFVEUdn6qPL4J1/TOqLcOuTo6YzKaRuUFtfTLs=
X-Google-Smtp-Source: ABdhPJzZNKqtWLPCSGMEgVEOhJEop998MHEY3yHynYbmOH4STn4zwEaSHpppSRBJqMzgv4hnicPh2AN1WJZ3oV78eGI=
X-Received: by 2002:a05:6e02:1947:: with SMTP id x7mr2987345ilu.85.1628774572619;
 Thu, 12 Aug 2021 06:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <0a05c2062052704d788511cf7edd874d@codeaurora.org>
In-Reply-To: <0a05c2062052704d788511cf7edd874d@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 12 Aug 2021 09:22:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6q9ph=3nC4oDyHvuutqzMAqDjtTWahLN1xaZy=0sXJmQ@mail.gmail.com>
Message-ID: <CA+5PVA6q9ph=3nC4oDyHvuutqzMAqDjtTWahLN1xaZy=0sXJmQ@mail.gmail.com>
Subject: Re: Request to update WCN3991 FW file
To: smagar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, mka@chromium.org, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, linux-bluethoth@vger.kernel.org, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>, Hemantg <hemantg@codeaurora.org>, 
	abhishekpandit@chromium.org, Balakrishna Godavarthi <bgodavar@codeaurora.org>, 
	adhudase@codeaurora.org, sampnimm@codeaurora.org
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Thu, Aug 12, 2021 at 4:05 AM <smagar@codeaurora.org> wrote:
>
> Hi Team,
>
>
> Please include updated firmware bins for WCN3991. Change includes
> updated TLV file.
>
> Snapshot of pull request is as below, let me know if anything is
> missing.
>
>
>
> The following changes since commit
> 168452ee695b5edb9deb641059bc110b9c5e8fc7:
>
>    Merge tag 'iwlwifi-fw-2021-07-19' of
> git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
> into main (2021-07-19 14:35:47 -0400)
>
> are available in the git repository at:
>
>    https://github.com/suraj714/linux-firmware-BT master
>
> for you to fetch changes up to 6a3a985022e1194045fc46a249ca29f8bf2fb427:
>
>    QCA : Updated firmware files for WCN3991 (2021-08-12 10:03:49 +0530)
>
> ----------------------------------------------------------------
> smagar (1):
>        QCA : Updated firmware files for WCN3991
>
>   qca/crbtfw32.tlv | Bin 126772 -> 126036 bytes
>   1 file changed, 0 insertions(+), 0 deletions(-)
>
>
> Regards,
> Suraj Magar
