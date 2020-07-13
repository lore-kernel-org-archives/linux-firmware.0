Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2852C433DF
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Jul 2020 11:48:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E1AFB2077D; Mon, 13 Jul 2020 11:48:17 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C39E420773
	for <linux-firmware@kernel.org>; Mon, 13 Jul 2020 11:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594640897;
	bh=ikgPSPzjEyJVbSY9NYMFfwQBioZ9KMbKXdD2mM0t4J0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sXPHfa1TV2qs4Y/Ccv/pcX9lzalT9eFw1BcQ/Xx6l74hoHRCzkvZvIkR2qxkKf54q
	 NhaLOM9o8gOUAdScPOjcUsFObdYi1+e6WkIHkg6VNBLsTc3mTF+NIlzg5o8n4BHTlt
	 36f9HQM1AuSABrEfE6aPuXEYM1dLsgRtxlmZNaxQ=
Received: by mail-io1-f46.google.com with SMTP id l1so13073981ioh.5
        for <linux-firmware@kernel.org>; Mon, 13 Jul 2020 04:48:17 -0700 (PDT)
X-Gm-Message-State: AOAM5318c5MGJwnHoP6k8AUJTY03rdaKf2VxrkgcGqrYKZS7rWM0/0p9
	sdov93AySWnMwsjyzgRGZwsjaHXrjUfmzPlOTzE=
X-Google-Smtp-Source: ABdhPJxsQpaUjdzsihue+l637tRZDA3ijEgG3cQZe5otNhx7ysFDGZ9u1QUBfrUvX8pPqAGdvjtMaaXlSMmnIawpUKY=
X-Received: by 2002:a05:6638:2195:: with SMTP id s21mr77066146jaj.73.1594640897272;
 Mon, 13 Jul 2020 04:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <ff2e158ad88a7bf1ce5e42de86342f35@codeaurora.org>
In-Reply-To: <ff2e158ad88a7bf1ce5e42de86342f35@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 13 Jul 2020 07:48:06 -0400
X-Gmail-Original-Message-ID: <CA+5PVA47xdLTJR7SqfB8azRZic05kGGfuEgYuZEM3bD7oL4Uww@mail.gmail.com>
Message-ID: <CA+5PVA47xdLTJR7SqfB8azRZic05kGGfuEgYuZEM3bD7oL4Uww@mail.gmail.com>
Subject: Re: [PULL] btqca firmware 20200401
To: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	BlueZ development <linux-bluetooth@vger.kernel.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 7, 2020 at 12:58 AM Rocky Liao <rjliao@codeaurora.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit
> 74ac3b5a7e7962cd1135ef691c72d48cb5210251:
>
>     Merge https://github.com/bgodavar/qca_wcn3991 into main (2020-07-02
> 08:23:09 -0400)
>
> are available in the Git repository at:
>
>     https://github.com/rjliao-qca/qca-btfw.git
>
> for you to fetch changes up to c4e04b49b46a3e3e4c0bf4a3007f352d09c7ae0c:
> ----------------------------------------------------------------
> Rocky Liao (1):
>          QCA: Update Bluetooth firmware for QCA6390 (2020-07-07 12:45:15
> +0800)

Pulled and pushed out.

josh
