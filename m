Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E997C433DF
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Aug 2020 12:17:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8F30D22C9F; Fri,  7 Aug 2020 12:17:44 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6C2C3221E2
	for <linux-firmware@kernel.org>; Fri,  7 Aug 2020 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596802664;
	bh=/nKIk2rlUcm3rHCKpSjs6yGPpL3Wud6hsAfmANBnbhY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=py2oWAC0Gh8WaLqc/WTe9eS39DqC4g0T+tVJJ8B/sdum0ew9QpZgAD0cjfBB5Ig2W
	 nRRCFawVY2AKTrkhu4EzitE6S3f1DYzPIpHydpQKFDd/y4y3J+QmAUM4GSjSuWfaGF
	 ShU+jP5GafJM3WqAG5vqRG0ky693wUnBtBljcu/Q=
Received: by mail-il1-f169.google.com with SMTP id z17so1576394ill.6
        for <linux-firmware@kernel.org>; Fri, 07 Aug 2020 05:17:44 -0700 (PDT)
X-Gm-Message-State: AOAM533fBITSQUnF77W6vqFOoKjZ5b5oqpHyGF2Nmd4BoIDIVE/gP8Vk
	DkLb8Qp4W1V2q7S2OHK+vHvxwiDrdbKXza01hW4=
X-Google-Smtp-Source: ABdhPJxEXN6sT6G5gizGaPlHDo/+Y5lQwhembheLvTth4IIA98KwWvEbnhgcZEoQdXCbQ6YvE+n+tjr4vMTJ05ROTi0=
X-Received: by 2002:a92:d10:: with SMTP id 16mr4185037iln.206.1596802663921;
 Fri, 07 Aug 2020 05:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_N0VEXXmsypacGsCqo9J2ZhXjX0wkUaMCiJqps9NbguJg@mail.gmail.com>
In-Reply-To: <CADnq5_N0VEXXmsypacGsCqo9J2ZhXjX0wkUaMCiJqps9NbguJg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 7 Aug 2020 08:17:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5ZDapF_yGf_BjzUgsmM8C_xtXvU7aRKunGGoq9Vp5LPA@mail.gmail.com>
Message-ID: <CA+5PVA5ZDapF_yGf_BjzUgsmM8C_xtXvU7aRKunGGoq9Vp5LPA@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Tue, Aug 4, 2020 at 1:24 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated amdgpu firmware for radeon GPUs.  Please apply!
>
> Thanks,
>
> Alex
