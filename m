Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3789EC35671
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Feb 2020 12:33:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2B10720866; Mon, 24 Feb 2020 12:33:46 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F010220838
	for <linux-firmware@kernel.org>; Mon, 24 Feb 2020 12:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582547626;
	bh=KMBEMgSSMh0MaZ57i0xN77NXEVCP4DxzkKLNuXRab9o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qZ/dic0Yfs6im9w3ciJsuH3M+3PbYeCPDy8hqSGdb+NCmy0gkqON55ogr9TOYPiun
	 aFTM5QcdjFbYjxPsKNu56qRKHMsdgJdo3dzQZllp4HFN9sjQzavf+gsPdzwLct3arq
	 kKsEtPBBbxCf828PPDwXlwqKY7ahvYcDdknymiHE=
Received: by mail-qk1-f177.google.com with SMTP id h4so8538094qkm.0
        for <linux-firmware@kernel.org>; Mon, 24 Feb 2020 04:33:45 -0800 (PST)
X-Gm-Message-State: APjAAAW73zh21uI0zst3aFuQXOu3bOI0/UPaAO6pTV/f8pp1BE3y04yu
	ENvGe7Gd6E3HrtHMJ4WbhMFN094fOzr+FLse3tw=
X-Google-Smtp-Source: APXvYqzrd0cXD4yqG6r71VbbLrBqynOwSCZxJ1v8U4w3/koKU7YV7zRxBQbO4wuLYhGftRcMYHDEYAFeTbLld6U6/hY=
X-Received: by 2002:a05:620a:15ba:: with SMTP id f26mr51079471qkk.285.1582547625093;
 Mon, 24 Feb 2020 04:33:45 -0800 (PST)
MIME-Version: 1.0
References: <3d3a530f11e6bc9a87573389d72ddd3c@codeaurora.org> <b69f21863b936c2407d2e22dcd258013@codeaurora.org>
In-Reply-To: <b69f21863b936c2407d2e22dcd258013@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Feb 2020 07:33:34 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4rXyvK=77mqxVPdvD4iUuqZHCt6CwwspG4K5FssfLxZA@mail.gmail.com>
Message-ID: <CA+5PVA4rXyvK=77mqxVPdvD4iUuqZHCt6CwwspG4K5FssfLxZA@mail.gmail.com>
Subject: Re: Firmware files for QCA BT chip WCN3991.
To: Balakrishna Godavarthi <bgodavar@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, mka@chromium.org, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
	BlueZ development <linux-bluetooth@vger.kernel.org>, Hemantg <hemantg@codeaurora.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>, gubbaven@codeaurora.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 21, 2020 at 8:15 AM <bgodavar@codeaurora.org> wrote:
>
> + Josh boyer to pick the firmware
>
> On 2020-02-20 16:05, bgodavar@codeaurora.org wrote:
> > Hi,
> >
> > The following changes since commit
> > 54b017d06a44bfd9b4c2757cace6cc349afd5bf2:
> >
> >   qca: Add firmware files for BT chip wcn3991. (2020-02-20 16:01:04
> > +0530)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/bgodavar/qca_bt_wcn3991.git
> >
> > for you to fetch changes up to
> > 54b017d06a44bfd9b4c2757cace6cc349afd5bf2:
> >
> >   qca: Add firmware files for BT chip wcn3991. (2020-02-20 16:01:04
> > +0530)

Pulled and pushed out.

josh
