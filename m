Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE822C433B4
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Apr 2021 11:14:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C9A9C6143C; Wed, 21 Apr 2021 11:14:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B29B561439
	for <linux-firmware@kernel.org>; Wed, 21 Apr 2021 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619003691;
	bh=KSDSU8hV1ZBU9BCqIDzOaaY5h5uP/q62HpJm1NASTe4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fMqk5hOf56VcdKq0FXJE1KkfHePPBMQi4dVdyCs7m9NDkBHKcif2KtYHHI5c1+YD/
	 sjugwlO9n4ShWjoNCBsXUN1qLY7+ytMj2OxL8wknenMzPll60HwexjTGS5cq2Cjwlu
	 /b0Sr8vNk/gAIFizOthxVqQjthV+JlFuZmf69b8q6EX+i3G7KzvBgN7okprwzvF2ll
	 HYoEYf45IEo1hKj3qvjiEC5KOwvhy748SVASSUJ6KgVWLZG+7Ez8b+xbYVuRYA3PsV
	 d+q0qpzvIJ2WD+0bXgEptsy5vGy0aN5ONGdo22FbjXKdyMTM4IixgepYYISXaS9evB
	 AkXmQyahateMg==
Received: by mail-il1-f178.google.com with SMTP id c4so8048987ilq.9
        for <linux-firmware@kernel.org>; Wed, 21 Apr 2021 04:14:51 -0700 (PDT)
X-Gm-Message-State: AOAM533rOnr6abCCwA2k5D7iL2ehvdMZYty2/36cgOvTriw556EFb2Xo
	T8C1BKJx1YKfcA9XOrjMoaAfuu9uhxCKhQA2jw0=
X-Google-Smtp-Source: ABdhPJzkjAjnsJ81VSZc9GXDJh1pXuAVbxcVlOF0Gq1fzww6grZ0A8RXSLQAwq9V08boWDvKyJ40yCzfTfh7bhHcjzo=
X-Received: by 2002:a05:6e02:de6:: with SMTP id m6mr26133625ilj.81.1619003691154;
 Wed, 21 Apr 2021 04:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Oru5_LB3cnO_P=VCd_ZwqvwHi=7wWH7ruAc7RKAjmSeg@mail.gmail.com>
In-Reply-To: <CADnq5_Oru5_LB3cnO_P=VCd_ZwqvwHi=7wWH7ruAc7RKAjmSeg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 21 Apr 2021 07:14:40 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5_GYo-SF9xTUQNjoqDjUqbO5tcguUrWB012M2j27Frog@mail.gmail.com>
Message-ID: <CA+5PVA5_GYo-SF9xTUQNjoqDjUqbO5tcguUrWB012M2j27Frog@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Tue, Apr 20, 2021 at 8:52 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated amdgpu firmwares.  Please apply!
>
> Thanks!
>
> Alex
