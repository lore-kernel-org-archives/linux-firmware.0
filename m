Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95CBC433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Nov 2021 17:29:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B0CB960F58; Tue, 23 Nov 2021 17:29:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98678604E9
	for <linux-firmware@kernel.org>; Tue, 23 Nov 2021 17:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637688543;
	bh=XKhBo6TLFbQGv6MFsJ6MI5HmK1N6RdQp2Np/P/wrPUQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jYRFfMgNmWxSMb0sy/i3kBwyvCl/WTTbBQvho9Qieyn3AQsigb79odE9Rr8B8oT17
	 K45WTc2pflNZuD/c4tRXFfkKXal7dAsJNtoWmUV8Dl1iJJ8WE4yKxW7dwk6b0oqLGr
	 URQs7ovsqaVVwNDOlzuKwltMsnFNeArRI1AmForoDkmYO1c3UTruw9j+R0/9wrm6mO
	 xvTP834PBRducoU44hSAFr5Y9KJbvQCLr9d0mk0VIchj/W68Rd8eRC2DkZgTWmgakd
	 sd395dYe75i5Zf/nTSlibsuUKpEgkK1xLaTi6paD/xzp6j1w4Zp9marO/WygHLuGHg
	 lTektC51s7WeA==
Received: by mail-io1-f41.google.com with SMTP id k21so28944542ioh.4
        for <linux-firmware@kernel.org>; Tue, 23 Nov 2021 09:29:03 -0800 (PST)
X-Gm-Message-State: AOAM530YgidRS2D7DfrqDBC3AwiE0izdoZcy2Vs0fblisq79yYSm3eNA
	WTyJGK4c1Dtmk6yKrX0g1+S04UxoVVa1chy9oAk=
X-Google-Smtp-Source: ABdhPJxQTjzx+ej2wX4HaMlE2WpdK1K9kenlxNF58O604Mm9HV50IyzLLvT41UezGxQJlBNOd5c+2oYmcnzEYe2E0O4=
X-Received: by 2002:a02:a11d:: with SMTP id f29mr8051693jag.78.1637688542992;
 Tue, 23 Nov 2021 09:29:02 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_O0t5aZtJ+twmw5_ujm+rTiH6cRnyukUPE2dL-=ZvxTrQ@mail.gmail.com>
In-Reply-To: <CADnq5_O0t5aZtJ+twmw5_ujm+rTiH6cRnyukUPE2dL-=ZvxTrQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 23 Nov 2021 12:28:52 -0500
X-Gmail-Original-Message-ID: <CA+5PVA47EP33EXVZGuPRhg8sWqfEgkhc0vJ4JBqxcnnJWsO1og@mail.gmail.com>
Message-ID: <CA+5PVA47EP33EXVZGuPRhg8sWqfEgkhc0vJ4JBqxcnnJWsO1og@mail.gmail.com>
Subject: Re: amdgpu firmware update for yellow carp
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, richard.gong@amd.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 18, 2021 at 4:32 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Updated amdgpu firmware for yellow carp.  Please apply!

Applied and pushed out.  Thanks.

josh
