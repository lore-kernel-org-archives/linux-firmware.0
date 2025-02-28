Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E3DC282C6
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Feb 2025 17:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D158CC4CEE5; Fri, 28 Feb 2025 17:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D55C4CEE9
	for <linux-firmware@kernel.org>; Fri, 28 Feb 2025 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740762243;
	bh=/uKNhcAF2x+tq3z2Xjua0l2ZD6+JoZgFEiN39OqoFoY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=QBzBo9c+JsDkaHDkrwA0fQGFh+Gt1fVJhQ98X8/sjspOhg6YI8XHHfsXT9fqGV5wh
	 WPsJC0k7PIQHRcsTBHksUu6CkAQS4qhbx1lfwG9RVHjBN3weAc/Mm+qRNvVUp+ddHh
	 GNfpdxd9pV7TASparNSC9ZnN0PsbrF8ouXbQAfK/KxCD6EWmC8SICBM6Oy5nqcExQH
	 bgr9tsZw2I3ZeYZ5kySZss0sxaZM9YNT4j+JFZPVti/6ddTJO3RF0pPbRb/hc9cqdh
	 9hRpIAZIsjy8z2iN/WHGTqhoyBxv8J4acA11lFreR8dkij/aExYyiT71LvRH63ed42
	 RsyFBV+GeCQzg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6f6ae4846c7so21164217b3.1
        for <linux-firmware@kernel.org>; Fri, 28 Feb 2025 09:04:03 -0800 (PST)
X-Gm-Message-State: AOJu0YzRfbwAy4SPwZ+fOPwc8lu/iGW7Q5BYPjZqlOwbUy4cp9pjSm2P
	M53LruzcN2NPd0xxWGciw1BHn+PF6dRneS76xreCj/T17yZ4DwMD8vrABNfvGGLZ9LfJWRlUL9l
	lmGBEWYwYNNRJWs0iZaop8jMrAKI=
X-Google-Smtp-Source: AGHT+IHotq6Qkl0XgQ2V5I59UPdIwCr4jcDTNG5FOIzWw6K/h05pIK8Z/xx5lC6pWwGAN2L9ekZ7VW5+hK4jWWBZ/L0=
X-Received: by 2002:a05:690c:4d46:b0:6fb:9450:b0d1 with SMTP id
 00721157ae682-6fd4a03a54dmr52029087b3.2.1740762242964; Fri, 28 Feb 2025
 09:04:02 -0800 (PST)
MIME-Version: 1.0
References: <13a0e18f-323f-4f7d-98de-3ee8fc0fda6d@opensource.cirrus.com>
In-Reply-To: <13a0e18f-323f-4f7d-98de-3ee8fc0fda6d@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 28 Feb 2025 12:03:52 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7yuKVoS8gTqL1uq1Cnxi82LTT4Mwwo9-Ka5pk+yRyySA@mail.gmail.com>
X-Gm-Features: AQ5f1JoXSCFmtlNf6cPk0UgsKIFrzZVu5quO8m_lqNOjs67vQ2i9mE1K-vy4crY
Message-ID: <CA+5PVA7yuKVoS8gTqL1uq1Cnxi82LTT4Mwwo9-Ka5pk+yRyySA@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for Stream Deck
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com, 
	andrealmeid@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 9:53=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp CS3=
5L41 for Steam Deck.
>
> Thanks,
>
> Stefan Binding
>
>
> The following changes since commit 30f36b8b90531c5a88ea02fac3f94a1a32145a=
77:
>
>   Merge branch 'robot/pr-0-1740611615' into 'main' (2025-02-27 21:05:07 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250228

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/462

josh

>
> for you to fetch changes up to 90e90cd14622776421294246ed55b1a26b4e9166:
>
>   cirrus: cs35l41: Add firmware and tunings for CS35L41 driver for Steam =
Deck (2025-02-28 14:31:47 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>       cirrus: cs35l41: Add firmware and tunings for CS35L41 driver for St=
eam Deck
>
>  WHENCE                                                  |   5 ++++-
>  cirrus/cs35l41-dsp1-spk-prot-vlv1776.bin                | Bin 0 -> 5104 =
bytes
>  cirrus/cs35l41/v6.51.0/halo_cspl_RAM_revB2_29.53.0.wmfw | Bin 0 -> 34236=
 bytes
>  3 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-vlv1776.bin
>  create mode 100644 cirrus/cs35l41/v6.51.0/halo_cspl_RAM_revB2_29.53.0.wm=
fw
>
