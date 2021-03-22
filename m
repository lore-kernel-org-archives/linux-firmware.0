Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5511CC433DB
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Mar 2021 12:09:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2D4976197F; Mon, 22 Mar 2021 12:09:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C7806198B
	for <linux-firmware@kernel.org>; Mon, 22 Mar 2021 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616414997;
	bh=nw9P1EpK/C3071jIWQhQzu3M4Q2kDXO48QzVJ8bmvWA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=P1kjfD68lzDpsr65l4A2k3ti4ZCl9m8y5ZgsTe2hLl/tufjOexN96gOMPwvhEbqXo
	 yPzvP90ZhNyvhOpSE+PsObv1punxN0TSM8JqbcXViRyiiTIEP714CDehK92XY494MX
	 a4w1s0vUlEBzTd/fJRrEBy6LcByiNuWezqtGKPvpECyFQvYFJeg+CUask/viB1CTyb
	 YQJ5iTZ7o4/+inmX6jsRIFDlca43HVmTniwvpEmi+4orVhe6eD4GpMcQqem+uSGmyA
	 9SesK74EV89gK3kWS+78Y7E+LBbDv+yZQysIAWwmI3QFkaP6Nog7yVtkCxdbyv9E2G
	 x4ipoKJo9uDxw==
Received: by mail-il1-f169.google.com with SMTP id z9so14554837ilb.4
        for <linux-firmware@kernel.org>; Mon, 22 Mar 2021 05:09:57 -0700 (PDT)
X-Gm-Message-State: AOAM530hM4d9gGC3pKWND70nB5FR7yKhZ8tlg2ME+C0YVW/8CyRn4zhD
	GLiW4QfnYSPlz1lV/e8Bos27DNdgsl9TPMJ46tI=
X-Google-Smtp-Source: ABdhPJyOlyR4N2RoyeY37jId4NzPu+xRTeUkC7RUOrEmZ5pMM01r/PwfiaaYIg+hH9sKNRuzNe0Blzq4leBcrhNovuc=
X-Received: by 2002:a05:6e02:144d:: with SMTP id p13mr10730065ilo.206.1616414996572;
 Mon, 22 Mar 2021 05:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_OtQTcrFh_rQgue0yL76zcZPYcPvQJJeZC+6XHr20b_GQ@mail.gmail.com>
In-Reply-To: <CADnq5_OtQTcrFh_rQgue0yL76zcZPYcPvQJJeZC+6XHr20b_GQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 22 Mar 2021 08:09:45 -0400
X-Gmail-Original-Message-ID: <CA+5PVA69MGMs1VQPipx3fV65iMmZ_GnaSUFFCCz7EiJFPS2QOQ@mail.gmail.com>
Message-ID: <CA+5PVA69MGMs1VQPipx3fV65iMmZ_GnaSUFFCCz7EiJFPS2QOQ@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, Mar 18, 2021 at 5:06 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated firmware for AMD GPUs.  Please apply!
>
> Thanks,
>
> Alex
