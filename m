Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_05,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38A0C433ED
	for <linux-firmware@archiver.kernel.org>; Mon,  3 May 2021 13:27:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9213F61283; Mon,  3 May 2021 13:27:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BD9861208
	for <linux-firmware@kernel.org>; Mon,  3 May 2021 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620048443;
	bh=gbQ4BrwhYGsP4swPTVsXolS5EMHCC6ewiQ4asFbeNnw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tloqwtTXUb40THF2G3WXyD1MOWDb272rGI29drkFGHza8N43d4lYhy3sPgJ4HkhBX
	 UpAPc/v/IeJEr0XLoV4P5Yvv15SdSvj8iT1KNwQZ8Hsr2Me76N66kyanjFGao4lya4
	 I6qZIgHu1HZ2qL779cSoR4l4m7axpyVJhm41kboxJ898Lr6dAYJ7EVKAuXQxHUB852
	 k+2HVra/qBB5zQ9O0pYhiH8naxGxyS+817tRbOW4RuGO1FHKtxHFPVe66BlI3tt4Zr
	 wPfDKyhOiye+SF3FhCdjHV97SwRhk8BmuggjEWMmK9ssvWuyMtuommbE3uYAHkNURk
	 MFicyf+ojHa7g==
Received: by mail-io1-f44.google.com with SMTP id q25so4058237iog.5
        for <linux-firmware@kernel.org>; Mon, 03 May 2021 06:27:23 -0700 (PDT)
X-Gm-Message-State: AOAM532RtHIdnvumOf6B/TVyqp2EsNBbJMq64IryO31GYc/w6WchjAjS
	W97mGUt4/bS8idVF8oQz1tdfA/oKsd6/wVDaOG8=
X-Google-Smtp-Source: ABdhPJwz2frMys+6azMqNgaGohZFjKCeLsCkHCos/g3nhDMC10LI5WOswVuQpwAI4olSdwbn2JtkiUadPpD0BXKWkMo=
X-Received: by 2002:a05:6638:37a6:: with SMTP id w38mr15041836jal.106.1620048442879;
 Mon, 03 May 2021 06:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_OqwuvwVNkbpqs49CpMGdL_zxQ5WKcs1CzC9F9bAFWLug@mail.gmail.com>
In-Reply-To: <CADnq5_OqwuvwVNkbpqs49CpMGdL_zxQ5WKcs1CzC9F9bAFWLug@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 3 May 2021 09:27:12 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7HYKBJa0t5iOLhXkZ_3tH2devvof-bmPY1NfJg7013GA@mail.gmail.com>
Message-ID: <CA+5PVA7HYKBJa0t5iOLhXkZ_3tH2devvof-bmPY1NfJg7013GA@mail.gmail.com>
Subject: Re: New polaris 12 MC firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 30, 2021 at 10:39 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> New firmware for a new polaris 12 board config.  Please apply!

Applied and pushed out.

josh
