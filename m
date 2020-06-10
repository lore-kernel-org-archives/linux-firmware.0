Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956FDC433E0
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Jun 2020 12:23:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8369F2074B; Wed, 10 Jun 2020 12:23:03 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6090F20734
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2020 12:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591791783;
	bh=DKWzDiaUK1End6NXw5a37NB0LUpyu2YOzTCghLhj+FI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZeHIPGRJzg1zexJyjhCoTYWCnwY8c0tgzKerhoYlp7TXHJUtbpgHMjpAwHmtlTQ4l
	 DSGGNS7KCgHBMBd3CGKL8ookg4tDLxb2Nl3kxyWem9Iyovdbgz+89+/1ZAM48sTRuk
	 08d/RaTsAO0M6q+K9cI7xzcu8Cm6QbFG7q4Xn1Ys=
Received: by mail-il1-f172.google.com with SMTP id g3so1638341ilq.10
        for <linux-firmware@kernel.org>; Wed, 10 Jun 2020 05:23:03 -0700 (PDT)
X-Gm-Message-State: AOAM533qCRzcLfIrg3g4Jaol2pMJj8vXsBOqtXicUdXc3e0wb242Kdx0
	I1gcEhcbczjC8ZXTkeOQF897B+fPiHXSatAAzrE=
X-Google-Smtp-Source: ABdhPJwsQbZ0KXmJe/+wRlxmoA5ZU4z3golaLZDFDsri/l1xC+oF1ZRdbiDxflHKIxVzYHZVs/tt3+juVBTfBLIvECA=
X-Received: by 2002:a05:6e02:eb0:: with SMTP id u16mr2864886ilj.81.1591791782812;
 Wed, 10 Jun 2020 05:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR12MB4344EBDF8DDE1BBD06DFDA81CB880@MN2PR12MB4344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB4344EBDF8DDE1BBD06DFDA81CB880@MN2PR12MB4344.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 10 Jun 2020 08:22:52 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6i6ANKU2JCFpwj+dQdhjaxRNcb-8jgWygBK5YgCUUPLw@mail.gmail.com>
Message-ID: <CA+5PVA6i6ANKU2JCFpwj+dQdhjaxRNcb-8jgWygBK5YgCUUPLw@mail.gmail.com>
Subject: Re: cxgb4: Update firmware to revision 1.24.17.0
To: Vishal Kulkarni <vishal@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	Nirranjan Kirubaharan <nirranjan@chelsio.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 4, 2020 at 1:15 AM Vishal Kulkarni <vishal@chelsio.com> wrote:
>
>  Hi,
>
> Kindly pull the new firmware from the following URL:
> git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Vishal
>
> The following changes since commit 8ba6fa665c52093ddc0d81137fc3c82cee2c5ef8:
>
>   Merge tag 'iwlwifi-fw-2020-05-19' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware (2020-05-19 07:28:12 -0400)
>
> are available in the git repository at:
>
>
>   git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> for you to fetch changes up to 51a773df9020b053bf35adf16751aea0f1ca0bcf:
>
>   cxgb4: Update firmware to revision 1.24.17.0 (2020-06-03 05:33:43 -0700)
>
> ----------------------------------------------------------------
> Vishal Kulkarni (1):
>       cxgb4: Update firmware to revision 1.24.17.0

Pulled and pushed out.

josh

>
>  WHENCE                              |  12 ++++++------
>  cxgb4/configs/t6-config-default.txt |   4 ++--
>  cxgb4/t4fw-1.24.14.0.bin            | Bin 568832 -> 0 bytes
>  cxgb4/t4fw-1.24.17.0.bin            | Bin 0 -> 568832 bytes
>  cxgb4/t5fw-1.24.14.0.bin            | Bin 672256 -> 0 bytes
>  cxgb4/t5fw-1.24.17.0.bin            | Bin 0 -> 672768 bytes
>  cxgb4/t6fw-1.24.14.0.bin            | Bin 726016 -> 0 bytes
>  cxgb4/t6fw-1.24.17.0.bin            | Bin 0 -> 727040 bytes
>  8 files changed, 8 insertions(+), 8 deletions(-)
>  delete mode 100644 cxgb4/t4fw-1.24.14.0.bin
>  create mode 100644 cxgb4/t4fw-1.24.17.0.bin
>  delete mode 100644 cxgb4/t5fw-1.24.14.0.bin
>  create mode 100644 cxgb4/t5fw-1.24.17.0.bin
>  delete mode 100644 cxgb4/t6fw-1.24.14.0.bin
>  create mode 100644 cxgb4/t6fw-1.24.17.0.bin
>
