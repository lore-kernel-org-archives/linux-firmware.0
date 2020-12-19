Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31242C4361B
	for <linux-firmware@archiver.kernel.org>; Sat, 19 Dec 2020 12:49:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1441C23ACA; Sat, 19 Dec 2020 12:49:35 +0000 (UTC)
X-Gm-Message-State: AOAM531iPsLqUurMfvhxwjZVbI/vZOO76O33kidL2e3uk3R4CC8WlDVZ
	RBvmd6iwBi3NCkoCTterIQHWyUjJmuHQuUcLWU4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608382175;
	bh=e8djgkxKy3il+Ra6JjHmoWDxbc6/7seBHSYyyEP88Vk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TOPqx2YwBmq0tFEQ3yBFzXM8ECB2ZIq2lqHwGwB3dhZtMAaq2A7kkeFO5EtDYtAls
	 Qczb5Sw/iRCenbechVwOSCxLIF/g6ZAnN+ePVEwMt9Du3024PMlphParFPEcrxM5hz
	 6tjRtxxNFrVANmrU2xLqMMVq9b+nYJL3ZVolsGgE59tqb8ikfO9trtpZDU3yxSmP8p
	 RfEKDglKAsC6al+6GlbjvWDECMFY8VTHWLQbUv+zBhmG4DFkrs8EmSkXUp+O/dTpBr
	 hj+MWyDCrh4ybCK6GwnjOzKlj9tg5U7VANjwUgL5N7kQXJJadob6DU0PYamu17n/PW
	 bTAxMLTjpkE9w==
X-Google-Smtp-Source: ABdhPJzBc0aj+mDgXP2z1XdUG+RQ8vzMwgvtEu7f+lnnq6cDgxJqkNpafWhN5YSJJlfT6KaXkn8N1VQt+OvYizKQiWc=
X-Received: by 2002:a92:9eda:: with SMTP id s87mr9135416ilk.85.1608382174357;
 Sat, 19 Dec 2020 04:49:34 -0800 (PST)
MIME-Version: 1.0
References: <20201208114532.348780-1-srini.raju@purelifi.com>
 <CA+5PVA5O=i6DW-01eziStVe5O=BwAafb20=4RUAOs8Q1m329LQ@mail.gmail.com> <875z4yrmyo.fsf@codeaurora.org>
In-Reply-To: <875z4yrmyo.fsf@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sat, 19 Dec 2020 07:49:23 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6V+LZ5SdW8K1wRMwjaF69n8nQB6oom+71=q_qaNH0OGA@mail.gmail.com>
Message-ID: <CA+5PVA6V+LZ5SdW8K1wRMwjaF69n8nQB6oom+71=q_qaNH0OGA@mail.gmail.com>
Subject: Re: [PATCH] [v4] linux-firmware: New firmware files for pureLiFi USB devices
To: Kalle Valo <kvalo@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Srinivasan Raju <srini.raju@purelifi.com>, Linux Firmware <linux-firmware@kernel.org>, 
	mostafa.afgani@purelifi.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 19, 2020 at 7:37 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Hi,
>
> Josh Boyer <jwboyer@kernel.org> writes:
>
> > The README file says the firmware should be in
> > /lib/firmware/purelifi/li_fi_x/.  Is there a reason you didn't create
> > the directory structure here so that it's automatically placed in the
> > proper directory during installation?
> >
> > Also, the README file is missing from WHENCE.
>
> I think it's better to wait that we first review the driver in
> linux-wireless and only submit the firmware files after that.

OK.  Happy to wait.

josh
