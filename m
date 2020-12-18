Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82BFC4361B
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Dec 2020 19:04:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7844023B88; Fri, 18 Dec 2020 19:04:07 +0000 (UTC)
X-Gm-Message-State: AOAM533kgP6qahTY91EykYcDdiNLfU3y1xMlytmD9S3y8G/8/S4/lVju
	CKh5GkpX5B7sE+5AiQvCsCGike62lTF3S8ZFJAw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608318247;
	bh=qce2geZYfX9Ge1PLcEjbSKrnUS2rqG5Q4A3vUSfGmMg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=H8PARJim63HYXQvY/KF3aF0/zydPPvWIFD6sI3tZDdteckYpHXRrZRc7K12JKv1He
	 EgztqTgt0q4sSauQb9Ccc42Ch+btVbp3PLBOexM/3HpbD89gGZOYWlG+ftn/Tz26tl
	 ZVfoXOWgZxkXG88td1CNufxQr0syzSFIi+JrUoLwETNTssGTbu/gWoc7FTkKCxh/Nh
	 33brZlsmO6o6ZZavyl3UHibE7nGas35XaFMkkT577YWTRl1N4Q8CMDlyPwEETf0OKK
	 yQq/DFlpq24PORw08bjs/9wRTOyd8SlNes+ZrDpuGJFCJg1j8wHYPoJyeAa5H4LOW2
	 tycmfoVrkI11Q==
X-Google-Smtp-Source: ABdhPJyV/Zi6C+tAlUxctzIS9W1FoBt9ObpD39nMhunU5T44cHsiZmXD0IGlrh9eCaMO6fEiaaXXqVnnvDP9gOjhJs4=
X-Received: by 2002:a92:155b:: with SMTP id v88mr5547015ilk.303.1608318246827;
 Fri, 18 Dec 2020 11:04:06 -0800 (PST)
MIME-Version: 1.0
References: <d83f762bf0b5e27f624a57c17c9dc3db@codeaurora.org>
In-Reply-To: <d83f762bf0b5e27f624a57c17c9dc3db@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 18 Dec 2020 14:03:55 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7rnjqytydyhk1ASh32tTyow=d3sheGCmntn4YujYS+uA@mail.gmail.com>
Message-ID: <CA+5PVA7rnjqytydyhk1ASh32tTyow=d3sheGCmntn4YujYS+uA@mail.gmail.com>
Subject: Re: Request to Update WCN3991 FW files
To: sampnimm@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, mka@chromium.org, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
	BlueZ development <linux-bluetooth@vger.kernel.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>, Hemantg <hemantg@codeaurora.org>, 
	gubbaven@codeaurora.org, abhishekpandit@chromium.org, 
	Balakrishna Godavarthi <bgodavar@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Tue, Dec 8, 2020 at 7:25 AM <sampnimm@codeaurora.org> wrote:
>
> Hello Team,
>
>        Please include updated firmware bins for WCN3991.
>        Snapshot of pull request is as below, let me know if anything is
> missing.
>
> >>>>>
>
> The following changes since commit
> 7455a36066741a6e52fba65e04f6451b4cdfd9c4:
>
>    Merge branch 'guc_v49' of
> git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30
> 09:26:11 -0500)
>
> are available in the git repository at:
>
>    https://github.com/sampnimm/linux-firmware-BT.git master
>
> for you to fetch changes up to 1a08ec9262e943c1e50b1223e3feb5845936b5a6:
>
>    QCA : Updated firmware files for WCN3991 (2020-12-08 17:38:49 +0530)
>
> ----------------------------------------------------------------
> sampnimm (1):
>        QCA : Updated firmware files for WCN3991
>
>   qca/crbtfw32.tlv | Bin 126892 -> 126772 bytes
>   qca/crnv32.bin   | Bin 5407 -> 5407 bytes
>   qca/crnv32u.bin  | Bin 5407 -> 5407 bytes
>   3 files changed, 0 insertions(+), 0 deletions(-)
>
> <<<<<
>
>
> Thanks,
> Sampath
