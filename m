Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88258C4363A
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Oct 2020 12:04:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4FD21208A9; Mon,  5 Oct 2020 12:04:35 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2905020776
	for <linux-firmware@kernel.org>; Mon,  5 Oct 2020 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601899475;
	bh=pC8OEwI83ng16SUGhaEqlsgEt4Ob5Ghfez4obdd48B4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Pog4b/OX9/VYsHnEUstX+6tmM6FJehk67xYmFeZyLcwTsxAU1bfD1c0TMVg77PTJj
	 YPk4VO7eZ5ZbpI0oZqyXF25d81xkyxgm50CtrMJLa6k+kGwZcTG7VIgEVgDzydwWeQ
	 DBwFV5zakwojzHqihH+/yeO+FWuk/H4433G87wCs=
Received: by mail-io1-f49.google.com with SMTP id y13so8818206iow.4
        for <linux-firmware@kernel.org>; Mon, 05 Oct 2020 05:04:35 -0700 (PDT)
X-Gm-Message-State: AOAM531A7s6U/kmoU5WhDNrc5nvexdJARrGg+Wo4E2uGZZEhNYJbZtg1
	oNQj2fuudhnUiUNQa6f6WBpe+eMlnlFzoG+RnkY=
X-Google-Smtp-Source: ABdhPJx8WAyQutHtL6dHKyVbXvjWxkp4a8MnP5rn+A6RumfyKwZ+orsvc2O0QsTnQgWGLY4PY8PbsyoHkmSLzfqBNug=
X-Received: by 2002:a6b:4e0a:: with SMTP id c10mr8467970iob.120.1601899474562;
 Mon, 05 Oct 2020 05:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <d4a4a37625f6b562c5096cbe1a6ccb61@codeaurora.org>
In-Reply-To: <d4a4a37625f6b562c5096cbe1a6ccb61@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 5 Oct 2020 08:04:23 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5Z1gDLXQjBqRMRDz-bVw1NVGvBSs+=veGjcAwrrQXycQ@mail.gmail.com>
Message-ID: <CA+5PVA5Z1gDLXQjBqRMRDz-bVw1NVGvBSs+=veGjcAwrrQXycQ@mail.gmail.com>
Subject: Re: Update WCN3991 FW with new enhancement
To: asitshah@codeaurora.org
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

On Thu, Oct 1, 2020 at 2:51 AM <asitshah@codeaurora.org> wrote:
>
>
> Hi Team,
>
> Please include updated firmware bins for WCN3991.
>
> Snapshot of pull request is as below, let me know if anything is
> missing.
>
>
> >>>>>>>>>>>>>>
>
> The following changes since commit
> b78a66c909c7150601e1b2a810b0e7c8f98d920c:
>
>    linux-firmware: Update firmware for Cadence MHDP8546 DP bridge
> (2020-09-28 11:38:27 -0400)
>
> are available in the git repository at:
>
>    https://github.com/shahasit/linux-firmware-bt/tree/master
>
> for you to fetch changes up to ad1da95d52f1a9206da3ef52f3484f3b89ec6615:
>
>    QCA : Updated firmware files for WCN3991 (2020-10-01 12:03:01 +0530)
>
> ----------------------------------------------------------------
> Asit Shah (1):
>        QCA : Updated firmware files for WCN3991
>
>   WHENCE           |   1 +
>   qca/crbtfw32.tlv | Bin 125896 -> 126300 bytes
>   qca/crnv32.bin   | Bin 5299 -> 5407 bytes
>   qca/crnv32u.bin  | Bin 0 -> 5407 bytes
>   4 files changed, 1 insertion(+)
>   create mode 100644 qca/crnv32u.bin
>
>
> Regards,
> Asit
