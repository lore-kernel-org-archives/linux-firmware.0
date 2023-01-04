Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B0EC4332F
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Jan 2023 13:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BA67C433F2; Wed,  4 Jan 2023 13:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469DBC433F1
	for <linux-firmware@kernel.org>; Wed,  4 Jan 2023 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672838572;
	bh=b+4M0tEGT0BU3DlJ8aTuFRlCt2fN7J3mrz+rgDoCVrM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=RZEAB4vsdYDpQoZjronNJRk7Fmn7FxxoW4EsA6DoVG52W7gAuu+P+8LQyaP8NBC1t
	 tsdrKCVxqV2iTJqWqXBRZPdPpdvHccZe7h7sf2phlZ0LMQ4WHmtGsKFAVRPFAc8yq8
	 fhnPpiq6vE5GPwEyEAeqfjTcyM/5LkLF31uYxiusHvrWtIdE6Yzkus5FbVZvTCG05h
	 IyZ2eNhFV7k7SLqcUM8LMcPvfgHxhOCDmWywh9yvO/0YLGHLyfjmihXF6Hw88G5ZUi
	 1vcNShQxtkS2v5ttwmf/Aso9vd5uNGltTC8QWlsszgjlyr+TYO8Vqn2e6O2BV5/2JX
	 V6zdTcBGanIhg==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-46d4840b51fso416528537b3.12
        for <linux-firmware@kernel.org>; Wed, 04 Jan 2023 05:22:52 -0800 (PST)
X-Gm-Message-State: AFqh2krfLo04ruwR1Ye3QgX6iQIQHFEL61FxJF6czjm4rDMH+jWd3QVI
	gWIZAlDjtLywH5fPdPNYiOi/QNcm++WPouEERYc=
X-Google-Smtp-Source: AMrXdXuURb5d85w6j01abYXSMWFs6U2eeuE4W/tYFLlQqIInXJ4kzony8C1nSvSejZtXQKnjclMTx8c0VUo8QfRE/1Q=
X-Received: by 2002:a0d:c2c1:0:b0:4ad:5c08:7e67 with SMTP id
 e184-20020a0dc2c1000000b004ad5c087e67mr882028ywd.75.1672838571310; Wed, 04
 Jan 2023 05:22:51 -0800 (PST)
MIME-Version: 1.0
References: <Y7VQTMD97rHTqsBo@chelsio.com>
In-Reply-To: <Y7VQTMD97rHTqsBo@chelsio.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 4 Jan 2023 08:22:40 -0500
X-Gmail-Original-Message-ID: <CA+5PVA48O_Cd3JPntFE0CQfmGiY_juc9NVfoCD7BKGOo5C9z2A@mail.gmail.com>
Message-ID: <CA+5PVA48O_Cd3JPntFE0CQfmGiY_juc9NVfoCD7BKGOo5C9z2A@mail.gmail.com>
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.27.1.0
To: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 5:09 AM Rahul Lakkireddy
<rahul.lakkireddy@chelsio.com> wrote:
>
> Please pull the new Chelsio firmware from the following URL.
>
>   http://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Rahul
>
>
> The following changes since commit 52261d0329b1a2e414ee394aae3c5ca36283730f:
>
>   Merge https://github.com/pkshih/linux-firmware (2022-12-16 07:10:10 -0500)
>
> are available in the Git repository at:
>
>   http://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Pulled and pushed out.

josh

>
> for you to fetch changes up to 52e62d6af5c56b82ef49db415b12c8cfe4faf756:
>
>   cxgb4: Update firmware to revision 1.27.1.0 (2023-01-04 09:14:46 +0000)
>
> ----------------------------------------------------------------
> Rahul Lakkireddy (1):
>       cxgb4: Update firmware to revision 1.27.1.0
>
>  WHENCE                                         |  12 ++++++------
>  cxgb4/{t4fw-1.27.0.0.bin => t4fw-1.27.1.0.bin} | Bin 570880 -> 570880 bytes
>  cxgb4/t5fw-1.27.0.0.bin                        | Bin 677376 -> 0 bytes
>  cxgb4/t5fw-1.27.1.0.bin                        | Bin 0 -> 678400 bytes
>  cxgb4/{t6fw-1.27.0.0.bin => t6fw-1.27.1.0.bin} | Bin 729600 -> 730112 bytes
>  5 files changed, 6 insertions(+), 6 deletions(-)
>  rename cxgb4/{t4fw-1.27.0.0.bin => t4fw-1.27.1.0.bin} (73%)
>  delete mode 100644 cxgb4/t5fw-1.27.0.0.bin
>  create mode 100644 cxgb4/t5fw-1.27.1.0.bin
>  rename cxgb4/{t6fw-1.27.0.0.bin => t6fw-1.27.1.0.bin} (54%)
