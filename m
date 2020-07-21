Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A71C433E1
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Jul 2020 11:31:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E272A22BEF; Tue, 21 Jul 2020 11:31:40 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C0E422080D
	for <linux-firmware@kernel.org>; Tue, 21 Jul 2020 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595331100;
	bh=wsuLxtp9YyXF3b4wJGFckashK95XdbgGXvd2IA5tUIk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=e5lr6saJU43ZgenoJPoD4Y21V0OXDCKK55Q4pzR/Plsr1RfROMUlegYSvm+uqZQlO
	 /HQUJFeZ3y+JNiLG30f5j+0LINDkBFHB6VSoMVG9tfPcWGzJhkCMMq9zpNfRke93TV
	 n4e8z8+YSoFunLBDDBETIObDrUVYTlq/oLYl+vm4=
Received: by mail-il1-f182.google.com with SMTP id r12so16091381ilh.4
        for <linux-firmware@kernel.org>; Tue, 21 Jul 2020 04:31:40 -0700 (PDT)
X-Gm-Message-State: AOAM533HulFTX0yxrnnjP7rfUAsohs2V5aiTikqzCfi0VtRwTXpBk0Ks
	O/03Yasinbm0LUFLZBXc+C3rCQs/h++8QJo7sMw=
X-Google-Smtp-Source: ABdhPJz7rrCxISXdM2MegkY4tW17ztjA4CRbLvgYka5MmPrfkWxeBXFGpkR76y2AqXysUlVrxrd9xhB6qN/lE+E6hL4=
X-Received: by 2002:a05:6e02:6cf:: with SMTP id p15mr27735782ils.206.1595331100167;
 Tue, 21 Jul 2020 04:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <6abd991d5d7d5175f5b7c6b168af770b@codeaurora.org>
In-Reply-To: <6abd991d5d7d5175f5b7c6b168af770b@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 21 Jul 2020 07:31:29 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7P6bK12ZEUJEQb2cFntJuNSu99rF3TDCWmeep_XbLMQw@mail.gmail.com>
Message-ID: <CA+5PVA7P6bK12ZEUJEQb2cFntJuNSu99rF3TDCWmeep_XbLMQw@mail.gmail.com>
Subject: Re: QCA: Add correct bin file for WCN3991
To: Balakrishna Godavarthi <bgodavar@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, mka@chromium.org, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
	BlueZ development <linux-bluetooth@vger.kernel.org>, Hemantg <hemantg@codeaurora.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>, gubbaven@codeaurora.org, 
	abhishekpandit@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 16, 2020 at 12:25 PM <bgodavar@codeaurora.org> wrote:
>
> The following changes since commit
> 3d3a06f720856cb897a8541951edd0b8f6f54a98:
>
>    linux-firmware: Update firmware file for Intel Bluetooth AX201
> (2020-07-13 07:51:54 -0400)
>
> are available in the git repository at:
>
>    https://github.com/bgodavar/qca_bt_fw/tree/qca_0714
>
> for you to fetch changes up to 3882702815e4b88bfd2f20b7eb66a3e85cbbb9b9:
>
>    QCA: Add correct bin file for WCN3991 (2020-07-14 11:00:13 +0530)
>
> ----------------------------------------------------------------
> Balakrishna Godavarthi (1):
>        QCA: Add correct bin file for WCN3991
>
>   qca/crnv32.bin | Bin 5299 -> 5299 bytes
>   1 file changed, 0 insertions(+), 0 deletions(-)

Pulled and pushed out.

josh
