Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28ABC11F66
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Jun 2021 11:27:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C9F9C61DC2; Tue, 29 Jun 2021 11:27:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3E7961D3B
	for <linux-firmware@kernel.org>; Tue, 29 Jun 2021 11:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624966028;
	bh=VUJeEOrK0qyJzpOyaghlUCHOBAO4FCiKxSs11YWB5AE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=hBKQVn/CkY75SvaMtCEgdOUA3/lAheLILR4q/AX6Aj0d5b1ae1aXfl62wgLQLh7Xx
	 2f8pMvfpsZeIreCo7qoKvtAQQt9oQIg5VMfepN5dpLogeIdjqYEZmD3KsM61W17rWl
	 z1M9qnNJk1idlLxInrX5bi9WesWEn3nZntVFYaFIw3wMHE8m3Ug4bSXE7iH2Eb41xw
	 zsLEIf/je7s5gY2EnF17V29Ol1hFMgxDt1iN0X5FYFGcUL2YB0S5Ie0aYKw5EcZAky
	 uQZmmr7e0UIk6rLy2pjpX9rGx637HHhsIr9Y9YTuwSazZTYcmM/idgIdAIsdDSn9Qf
	 uHXBWS2zK86OQ==
Received: by mail-io1-f49.google.com with SMTP id d9so26058079ioo.2
        for <linux-firmware@kernel.org>; Tue, 29 Jun 2021 04:27:08 -0700 (PDT)
X-Gm-Message-State: AOAM5321pV/vbGINq3W6Ddo2t55sWQLaxA4JfcEbMbFKHNQcUC8K9kx0
	cC4QFrFROzR25qkV59e0/ugOCs9hWzRG5orDIh8=
X-Google-Smtp-Source: ABdhPJxnwJvs5KfwNtpbgVzxgRtd+dBEIPA6v7lL+VY3a3vZUqdp2Mgzn6+Zvpyk7R2pyC/GuHBItSrQap+NPGRTcYw=
X-Received: by 2002:a5d:80c8:: with SMTP id h8mr3543415ior.120.1624966028284;
 Tue, 29 Jun 2021 04:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PAZsPEX1-DWBdW+y8=skmcpkbwBOJJy=Bw5pBD_rXCjg@mail.gmail.com>
 <CADnq5_NVvdStmcm65U88s8-FE=4uU5t1d5DXEYTHzCYQxriRDA@mail.gmail.com>
In-Reply-To: <CADnq5_NVvdStmcm65U88s8-FE=4uU5t1d5DXEYTHzCYQxriRDA@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 29 Jun 2021 07:26:56 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6JsnSMUts6JW28aTGtjvBim7=7ansXjZYhws972EcLFw@mail.gmail.com>
Message-ID: <CA+5PVA6JsnSMUts6JW28aTGtjvBim7=7ansXjZYhws972EcLFw@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Both sets applied and pushed out.

josh

On Mon, Jun 28, 2021 at 3:25 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> A few more updates on top of the ones I just sent.  Please apply.
>
> Thanks,
>
> Alex
>
> On Mon, Jun 28, 2021 at 1:50 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Updated firmware for amdgpu.  Please apply!
> >
> > Thanks,
> >
> > Alex
