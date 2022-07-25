Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E6DC43334
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Jul 2022 18:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 402D8C341CE; Mon, 25 Jul 2022 18:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B478C341C8
	for <linux-firmware@kernel.org>; Mon, 25 Jul 2022 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658773382;
	bh=IYcfLEOjyDJScqXEg2qK6DpnGp/z6AVHe/V+hWsq9S8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=e73EN8N5DU/T6kJOZFWtsumhkuLlG+xQHv7B7+YFlentPxb7cWv1AsDLpGvnP2DRh
	 7ALLQa0nBtyDuk20YPlqirwB8wwytXeW6yLgNgAqmEe5z7StG4EcWPf4SPGSVUyEoG
	 MTgmLZamzAr233LL2BpGQ/WBmMzWqRTp2LusICMnXer+G7sOyH9exCcmjwnqffMBs0
	 3i6Jvi5Cm7pHang9LfOC7L2m4zUxbBk3Vy1LSA4vIVncANeoLtCO2xvF4k9G5pQ7ja
	 IQ563152MZr8XU6p9xfS9iqX4bsx1/J5odYqR2+qlxkpJoVQze5aFm+EF/rMnnK4Wl
	 GB9n7CV04NQXg==
Received: by mail-io1-f49.google.com with SMTP id c185so3791179iof.7
        for <linux-firmware@kernel.org>; Mon, 25 Jul 2022 11:23:02 -0700 (PDT)
X-Gm-Message-State: AJIora9c70V6+lG6LLKE7B+mixb+8AIfnvDNMZ6E/PdYNUbQYC8X0wx8
	oQmffekuasGEBUAQL1wpJf7QDzLvVFr9XLIZgKI=
X-Google-Smtp-Source: AGRyM1t7X7sbMh7K5EmMsZR4jYPucnRtHAmhtbF+H0ccWQ/pGbttRsU4oM5yadCNm6ZaKjNPh7e44ug97/q6QXfRvBw=
X-Received: by 2002:a6b:6707:0:b0:67b:d457:39cf with SMTP id
 b7-20020a6b6707000000b0067bd45739cfmr4720729ioc.179.1658773381318; Mon, 25
 Jul 2022 11:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHrc+6k2hy20_3yrTGBsp9n3c2t0wkZymd1e+EiU_R_R3phD4g@mail.gmail.com>
In-Reply-To: <CAHrc+6k2hy20_3yrTGBsp9n3c2t0wkZymd1e+EiU_R_R3phD4g@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 25 Jul 2022 14:22:50 -0400
X-Gmail-Original-Message-ID: <CA+5PVA47kz3y=xCsnsQdj8XeJV+HaKPRVSOnan6BWSwfABQ_dw@mail.gmail.com>
Message-ID: <CA+5PVA47kz3y=xCsnsQdj8XeJV+HaKPRVSOnan6BWSwfABQ_dw@mail.gmail.com>
Subject: Re: New pull request?
To: =?UTF-8?B?TG/Dr2MgQm9pc3N5?= <boissy@digigram.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Eric Debief <debief@digigram.com>, 
	Yoann Lubiato <lubiato@digigram.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 4:23 AM Lo=C3=AFc Boissy <boissy@digigram.com> wrot=
e:
>
> Hello,
> I am Lo=C3=AFc BOISSY. I work for Digigram company in France.
> Digigram is an audio card manufacturer for professional customers.
>
> Our old cards used specific firmware files.
> These files were provided by the alsa-firmware package.
> But it seems that this package is now deprecated and replaced by linux-fi=
rmware package.
> Do you confirm that?

Generally speaking, new firmware that is used by drivers in the Linux
kernel would be added to the linux-firmware project under a license
that permits redistribution.

The alsa-firmware package still exists for some old cards and that
firmware hasn't been migrated to the linux-firmware repo.

> If yes, How can we push our firmwares files? Just by sending them to you?

If they are net new firmware files, you can follow the README file for
the project to send new submissions:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/tree/README

A pull request from a GitHub or Gitlab style git forge is also acceptable.

josh
