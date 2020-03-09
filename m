Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6267CC10F27
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Mar 2020 17:53:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 56404215A4; Mon,  9 Mar 2020 17:53:45 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 33785208C3
	for <linux-firmware@kernel.org>; Mon,  9 Mar 2020 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583776425;
	bh=kSunxzPhMSbueuJ7frjQVep5qnncsezSytZN9j+bsPU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZZQklzaxZy0BmUDoV/6mJPvHkx1wh7VJlktj+QsBM7GbJmrGdUagJ3nRXo1oF+ahO
	 jKtJ/qnisr3tugKVsEPRcJqOXOox/1VDuJ6hpC0twE5uAchqKoEngphR6W59i8LqVu
	 rv4OnNFzwbP/Axg1JZUF720YtJP7I9o1kVg21mlI=
Received: by mail-io1-f50.google.com with SMTP id k4so10054663ior.4
        for <linux-firmware@kernel.org>; Mon, 09 Mar 2020 10:53:45 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0UPdnqyH5vL7ULwYpOceLkreFuF/04JNbP/SfS7SQtUZwsz2BX
	MCbZKPGokXjtSpJP+M7NsvLffWa2y2dN1H3lTrM=
X-Google-Smtp-Source: ADFU+vvsHImqtq993zzOx8Ea572AY1GuTZjdZ0I2fY4tudHhLdlB4ARrTZ9v3QE2Vec8EDmxYURnXJ30PbtN5DLxg/g=
X-Received: by 2002:a05:6602:120e:: with SMTP id y14mr5848305iot.159.1583776424645;
 Mon, 09 Mar 2020 10:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PdQmM=_SzXENt8w4J6_uQYun7eoyUsEa7_NzgMtywv=Q@mail.gmail.com>
In-Reply-To: <CADnq5_PdQmM=_SzXENt8w4J6_uQYun7eoyUsEa7_NzgMtywv=Q@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 9 Mar 2020 13:53:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA757Zb1Tym11QrawO9x1L+oOWpZ6-gyGyHexF0twpCLUg@mail.gmail.com>
Message-ID: <CA+5PVA757Zb1Tym11QrawO9x1L+oOWpZ6-gyGyHexF0twpCLUg@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 6, 2020 at 1:49 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated amdgpu firmware for multi-media engines.  Please apply!

Applied and pushed out.

josh
