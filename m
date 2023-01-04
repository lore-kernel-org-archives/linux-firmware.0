Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D2CC46467
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Jan 2023 13:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D6C3C433F2; Wed,  4 Jan 2023 13:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DD4C433EF
	for <linux-firmware@kernel.org>; Wed,  4 Jan 2023 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672838185;
	bh=I1FtKc4VonX4U30bLK9dXdcbLZg5Ecvvj94IY+GQewM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kCv9NUvu9mFpJ1iKuIE580Vl/qz1NIX2X7AU9OQyoZ4sUk27PbLL+TtECZegTihVn
	 GOYICFpNWw2ZRxVFw8cd7kHfRd37YTFWNB3nVywKXSeXQxzghElDIfplSgAtLmoIab
	 0ERWVmMZrtBrYLWS6wqUidyT5KU5hSrlK+3rBbN1/TKP+GtFQFpXyIjpTAb58iTkpY
	 j0vEEjIluSdjqSoEzGk/uO8MNoq8+a4LtKROXTrmyHlT1VZ4gXELQryVaD/2uT8Zxc
	 XnjKSOxIXjAAJt+RgIP86S/fBZhl4UjXvqpl9DabJ3VFXxPlARoMOt/2E9iMD4fDpN
	 hZdVPjtzdRd1g==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-4a2f8ad29d5so134872257b3.8
        for <linux-firmware@kernel.org>; Wed, 04 Jan 2023 05:16:25 -0800 (PST)
X-Gm-Message-State: AFqh2kpZWVsFH8Mz6MI3cBp9P7oKCnIEDKTV3VpmHHL5E3e5i33bcwQz
	3xAHhKKcwlscTtEM7j+YD4dSrdr7wL2ORulSlnU=
X-Google-Smtp-Source: AMrXdXsK3LLe7QuIOlWXkMn0a7spFExA9+YykxUI8JCh5R5Qxci7TQi33XfiQm0RjSGrDnthkwb3W0sO58FSH+hagoc=
X-Received: by 2002:a0d:f344:0:b0:3dd:bcc2:e359 with SMTP id
 c65-20020a0df344000000b003ddbcc2e359mr5115410ywf.341.1672838184188; Wed, 04
 Jan 2023 05:16:24 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR02MB7542C490A862BFB02670E4C3FAE89@PH0PR02MB7542.namprd02.prod.outlook.com>
In-Reply-To: <PH0PR02MB7542C490A862BFB02670E4C3FAE89@PH0PR02MB7542.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 4 Jan 2023 08:16:13 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4hFtUoDv3U-UW6Jk-V02fypNKgEN3WKMRLqSPmhy9ASg@mail.gmail.com>
Message-ID: <CA+5PVA4hFtUoDv3U-UW6Jk-V02fypNKgEN3WKMRLqSPmhy9ASg@mail.gmail.com>
Subject: Re: QCA: Update firmware files for BT chip WCN6750
To: "Sampath Nimmala (Temp) (QUIC)" <quic_sampnimm@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-bluethooth@vger.kernel.org" <linux-bluethooth@vger.kernel.org>, "mka@chromium.org" <mka@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"Balakrishna Godavarthi (QUIC)" <quic_bgodavar@quicinc.com>, 
	"Sai Teja Aluvala (Temp) (QUIC)" <quic_saluvala@quicinc.com>, 
	"Atul Dhudase (QUIC)" <quic_adhudase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 22, 2022 at 4:36 AM Sampath Nimmala (Temp) (QUIC)
<quic_sampnimm@quicinc.com> wrote:
>
> Hi Team,
>
>
>
> Please include firmware bins for WCN6750.
>
>
>
> Changes includes updated firmware files with:
>
>
>
> Read Buffer Size V2 CMD validation fix
> xsco connection race condition fix
> LE SET HOST FEATURE BIT command validation fix
> fix for BLE adv data truncated during coex abort
> Coex NACK status update for QHS
> LE scan priority changes
> Fix related EDR support for esc
> Fix for Race condition during Role Switch
>
>
>
> Snapshot of pull request is as below, let me know if anything is missing.
>
>
>
> ---------------------------------------------------------------------------------------------------------------
>
> The following changes since commit 52261d0329b1a2e414ee394aae3c5ca36283730f:
>
>
>
>   Merge https://github.com/pkshih/linux-firmware (2022-12-16 07:10:10 -0500)
>
>
>
> are available in the Git repository at:
>
>
>
>   git@github.com:sampathnimmmala/bt_soc_FW.git main

Pulled and pushed out.

josh

>
>
>
> for you to fetch changes up to 4704e256ca4e2e7b4fc94b87d944dd211cf4ae01:
>
>
>
>   qca: Update firmware files for BT chip WCN6750 (2022-12-22 14:51:05 +0530)
>
>
>
> ----------------------------------------------------------------
>
> sampnimm (1):
>
>       qca: Update firmware files for BT chip WCN6750
>
>
>
> qca/msbtfw11.mbn | Bin 162224 -> 166836 bytes
>
> qca/msbtfw11.tlv | Bin 150012 -> 154624 bytes
>
> qca/msnv11.bin   | Bin 5827 -> 5847 bytes
>
> 3 files changed, 0 insertions(+), 0 deletions(-)
>
> -----------------------------------------------------------------------------------------------------------------
>
>
>
> Thanks,
>
> Sampath
