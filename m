Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358F4C27C4F
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Jun 2024 11:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E526C4AF48; Tue, 18 Jun 2024 11:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065B5C32786
	for <linux-firmware@kernel.org>; Tue, 18 Jun 2024 11:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718709497;
	bh=3zEwlMoeyPGmE6GxIVzJY8WVxZJ4tV4J8/LbR+aCbOM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=egE+fD/aDOis4OWjyJvkjfx7NBpDYgUPu3juplkCQjLHJ78o/TEsC/HANq4n+sMZj
	 9yzJLJblMhyoX54gd1q8o0rNXdlaMzwr5Da8kL1h03+3FfKaKxt4Wep6NbyxUW64FU
	 w1t0YMXoJciOEz5n3FCStA1sMNUjtj5I7nVAleZG62JHH22mdTzWLpOfNNe5I6Q71Y
	 WTb5WZuuSi5MPsE7rDcIEyV4BlPpCr8bGAvvyDJWgJt9XjIjICnToDrn6WddEx+RNC
	 MUrSgsKSKoayjGjY/kt+yeS1Ao5IjmBkOhD1LJj1j+mCAHgiELTJue9KRmdoniVPMk
	 yI51KVWD9jiZw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-627efad69b4so50775687b3.3
        for <linux-firmware@kernel.org>; Tue, 18 Jun 2024 04:18:16 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx+o0qY67fc5KVkLOvlUkmuVTXGlNaAZYq3oz4ysY2ZLIBQc5VC
	1TMwnlKxkZ0ch7h9qH7bftKFjpf5P97YP2Cc06Iav2/d3BkXXg3wYwUGwEiRQ/OsUexjKZz3Mfu
	PzukQEFpz4BsCWN2SEaSmNiE83x4=
X-Google-Smtp-Source: AGHT+IHT4A7yx6A/r9GjprieqHyFRl4M25qbJ+2crcW1d7sIKBYdbw60Y023C4NJgJ8fEo4f3SPJSGcwzmIcyciokQc=
X-Received: by 2002:a0d:de02:0:b0:61a:da7e:1f66 with SMTP id
 00721157ae682-6322255658cmr104648267b3.2.1718709496203; Tue, 18 Jun 2024
 04:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <00e701dabd72$46058820$d2109860$@opensource.cirrus.com>
In-Reply-To: <00e701dabd72$46058820$d2109860$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Jun 2024 07:18:05 -0400
X-Gmail-Original-Message-ID: <CA+5PVA56njjX0fJ_wNR=bwAC_ToaDA9CgLMUnghb4QrENjdsLg@mail.gmail.com>
Message-ID: <CA+5PVA56njjX0fJ_wNR=bwAC_ToaDA9CgLMUnghb4QrENjdsLg@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l56: Update firmware for
 Cirrus CS35L56 for ASUS UM5606 laptop
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 5:15=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to update the firmware for the Cirrus CS35L56 smart amp=
lifiers on another ASUS laptop,
>
> this is for the UM5606.
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit 776320a95269f47ed32369821d7daaffbdbbdb=
ba:
>
>
>
>   Merge branch 'robot/pr-0-1718209490' into 'main' (2024-06-12 16:26:33 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20240613

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/226

josh

>
>
>
> for you to fetch changes up to e857ce35e94f114d049f44b43835bbcd8773ed52:
>
>
>
>   cirrus: cs35l56: Update firmware for Cirrus CS35L56 for ASUS UM5606 lap=
top (2024-06-13 09:12:51 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Update firmware for Cirrus CS35L56 for ASUS UM5606=
 laptop
>
>
>
> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp1.bin | Bin 7812 -> 7896 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp2.bin | Bin 7816 -> 7900 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp3.bin | Bin 7812 -> 7896 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp4.bin | Bin 7808 -> 7896 bytes
>
> 4 files changed, 0 insertions(+), 0 deletions(-)
