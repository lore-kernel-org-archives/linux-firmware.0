Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBCCC433E0
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Jul 2020 12:24:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C03FC20885; Thu,  2 Jul 2020 12:24:36 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9D4F320836
	for <linux-firmware@kernel.org>; Thu,  2 Jul 2020 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593692676;
	bh=8whstkEjA12LDRClJaBZeKJfqll8YMqZQJ/Ac+BDqyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=talBrkOi91YZwTGkrF1c28cm4nwFqGlhFzocE6RmmU1199TpWCv3FZFQFwHFlJ34E
	 4cxpCNeJQEWr7YCtyvEuZgtkpmoxlCDDdlaq8dduLuEajeFCYghjYq3dryfL2RFMOD
	 Iz+of7TQk5dY9xS/RUIdoM7j5jDlph54o3lmjSS0=
Received: by mail-io1-f47.google.com with SMTP id f23so28660812iof.6
        for <linux-firmware@kernel.org>; Thu, 02 Jul 2020 05:24:36 -0700 (PDT)
X-Gm-Message-State: AOAM533c4nkSs3gseh4iBAoPtCG6TddD4Z0oGkPk9at3xYG3VyYY0i2j
	A3PqMNOmkl5VCdlvZf98X45n1wl+7zsZ2Gr0nAU=
X-Google-Smtp-Source: ABdhPJymrUHNXeIFfkQ16XmDFJnQaeUZWoqE+c6ydjGkGg5up7AyA1w01B55WLxZHYr5gUHiOOR4z5dXKbPorpXPmRM=
X-Received: by 2002:a02:a797:: with SMTP id e23mr6650174jaj.81.1593692676131;
 Thu, 02 Jul 2020 05:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <251806a04b162259103050eb11c48bf1@codeaurora.org> <018fa36371d8f679f96abe0af9788da3@codeaurora.org>
In-Reply-To: <018fa36371d8f679f96abe0af9788da3@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 2 Jul 2020 08:24:25 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5Q90Py9OWoP9aWaJFEMB1wjYoznjiEjtZi2EWkivzKjQ@mail.gmail.com>
Message-ID: <CA+5PVA5Q90Py9OWoP9aWaJFEMB1wjYoznjiEjtZi2EWkivzKjQ@mail.gmail.com>
Subject: Re: Update WCN3991 FW with new enhancements
To: Balakrishna Godavarthi <bgodavar@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, mka@chromium.org, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
	BlueZ development <linux-bluetooth@vger.kernel.org>, Hemantg <hemantg@codeaurora.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>, gubbaven@codeaurora.org, 
	abhishekpandit@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 26, 2020 at 7:18 AM <bgodavar@codeaurora.org> wrote:
>
> + Josh Boyer
>
> On 2020-06-22 14:35, bgodavar@codeaurora.org wrote:
> > The following changes since commit
> > 887d2a103c2bdd267dbca5bed39b1b493d6cbe13:
> >
> >   linux-firmware: Update firmware file for Intel Bluetooth AX200
> > (2020-06-10 08:32:52 -0400)
> >
> > are available in the git repository at:
> >
> >   https://github.com/bgodavar/qca_wcn3991
> >
> > for you to fetch changes up to
> > 24cc617d85a466ba58a94e3040690d0a43c83226:
> >
> >   QCA: Update WCN3991 FW files (2020-06-22 14:20:47 +0530)
> >
> > ----------------------------------------------------------------
> > Balakrishna Godavarthi (1):
> >       QCA: Update WCN3991 FW files
> >
> >  qca/crbtfw32.tlv | Bin 95784 -> 125896 bytes
> >  qca/crnv32.bin   | Bin 5388 -> 5299 bytes
> >  2 files changed, 0 insertions(+), 0 deletions(-)

Pulled and pushed out.

josh
