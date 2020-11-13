Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD85C55ABD
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Nov 2020 15:28:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2EBA022276; Fri, 13 Nov 2020 15:28:51 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0C33420691
	for <linux-firmware@kernel.org>; Fri, 13 Nov 2020 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605281331;
	bh=/zO1XynczmWvFXMLw/eyBPA1USoWr3MLhcCS1hhpENc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HHOfbeakPFISUsA0AbxysmHcCbpmst92YUj6DGqmIY7UAbZdFEalFnfJK67klq0Og
	 ork836wBCI05l0quY7v2FN/WDWGMZvybwLb2WWg4c9jryh2duBi8fh4+ds70bbDprb
	 v6Vqq1yZsygS/JJtC7/kl+3aD9MN1XbRQmUEh2PY=
Received: by mail-io1-f49.google.com with SMTP id o11so10116803ioo.11
        for <linux-firmware@kernel.org>; Fri, 13 Nov 2020 07:28:51 -0800 (PST)
X-Gm-Message-State: AOAM531RKOyvPerFA7OXHmI+WTNASgg1yt3chUHr5sUKThBOpwQAcFsM
	KF1fLeIlwbTH+/02aoG+VoE7JcwXI3E1WyzcCYo=
X-Google-Smtp-Source: ABdhPJz+i9dJBC6mSjD5os7dYnwohhGHal42PH5fvCfwiSgyM9Y0g5Y0QumEgMlTsD+rnAN5p/GrrQkcUcmlQmEWr0U=
X-Received: by 2002:a5d:9602:: with SMTP id w2mr255721iol.120.1605281325597;
 Fri, 13 Nov 2020 07:28:45 -0800 (PST)
MIME-Version: 1.0
References: <434716095a78523311708196d57be797@codeaurora.org>
In-Reply-To: <434716095a78523311708196d57be797@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 13 Nov 2020 10:28:34 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7q3sYVcVV8Y3YoQj_k-EJfByjr171C0JY6GoVUJnHpyA@mail.gmail.com>
Message-ID: <CA+5PVA7q3sYVcVV8Y3YoQj_k-EJfByjr171C0JY6GoVUJnHpyA@mail.gmail.com>
Subject: Re: [PULL] btqca firmware 20201112
To: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Thu, Nov 12, 2020 at 12:15 AM Rocky Liao <rjliao@codeaurora.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit
> dae4b4cd084102cd49c37aa8b579b208028ab025:
>
>     Merge branch 'v1.1.5' of
> https://github.com/irui-wang/linux_fw_vpu_v1.1.5 into main (2020-10-23
> 08:10:37 -0400)
>
> are available in the Git repository at:
>
>     https://github.com/rjliao-qca/qca-btfw.git
>
> for you to fetch changes up to 463fdea3d3f33bbbc62a97cbe1ca72329dd42b95:
> ----------------------------------------------------------------
> Rocky Liao (1):
>          QCA: Update Bluetooth firmware for QCA6390 (2020-11-13 13:05:56
> +0800)
