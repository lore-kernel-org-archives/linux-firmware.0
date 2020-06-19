Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4EAC433DF
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2020 12:37:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 536C12083B; Fri, 19 Jun 2020 12:37:49 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 36044207E8
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2020 12:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592570269;
	bh=j+YKtoUC8oLpwOsBDYA1sxHV5XlO+cgqi3zBY62Pkc4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=v2Nz++eZhLhWVjn6CG8usZ41+18eZe7Pb221uPnuxdjEeA37TsyG4S+shN0NAiYS1
	 1C86xxs5qIcn1QEeeNcpYozXqrJwDzFwYG6NGWKqiP77yrCH5gON3ABZKZhhC/fouq
	 zdwl2XaDDv75QcihvBbmq896F0dPVVERS7iHK1E4=
Received: by mail-io1-f42.google.com with SMTP id o5so10981169iow.8
        for <linux-firmware@kernel.org>; Fri, 19 Jun 2020 05:37:49 -0700 (PDT)
X-Gm-Message-State: AOAM531cN+Sfmx3bUJf4gx7MV7kammPpqxOSmw3LSf86FMivLSLKUhg0
	n1hliQnynuPKJqA1kxbWE3E/zXwZzFukxSQVGyk=
X-Google-Smtp-Source: ABdhPJz8r9LEXilXyLUbP3ww07pyBnnaXBFtgO+wjdJK6LwUy23OdouDLAedIkR3bk8uyZ/PhH9k7EOmF4UUFz1bUcQ=
X-Received: by 2002:a6b:8b51:: with SMTP id n78mr4056064iod.120.1592570268723;
 Fri, 19 Jun 2020 05:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_NiL9ErKKspDTY+Q3AnrgMxv5jXY79Zjw-vEVAmKQuERQ@mail.gmail.com>
In-Reply-To: <CADnq5_NiL9ErKKspDTY+Q3AnrgMxv5jXY79Zjw-vEVAmKQuERQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 19 Jun 2020 08:37:38 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5=vzsH62YHQ-pUpv3bgB=piMLtxcjdYiRtTTr1o42NcQ@mail.gmail.com>
Message-ID: <CA+5PVA5=vzsH62YHQ-pUpv3bgB=piMLtxcjdYiRtTTr1o42NcQ@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 15, 2020 at 5:48 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated amdgpu firmware for 20.20.  Please apply!

Applied and pushed out.

josh
