Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07222C388F7
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Nov 2020 15:16:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D300C22275; Fri, 13 Nov 2020 15:16:55 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ADBB92225E
	for <linux-firmware@kernel.org>; Fri, 13 Nov 2020 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605280615;
	bh=5WiPeLzm/uSDAHw0vlqYg2+YSjaea4EC6PDHufG9FkU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dFg1pEQjofo3QY/e6dAhyMHXuwQlvixBts52s6NMb1/ua4Xxd3KmSTMI0GAARZiMU
	 y67oXu2RykXkZPki2HhG9bPzWKViQf3UICEHXBqxqoZ5Jq0FxaEpnLSoDGiExFVpqC
	 Zt3SFjsLwYlssWWCIg6yFzQ28Uw8PLDkG8cogw3E=
Received: by mail-io1-f48.google.com with SMTP id t8so10068247iov.8
        for <linux-firmware@kernel.org>; Fri, 13 Nov 2020 07:16:55 -0800 (PST)
X-Gm-Message-State: AOAM533Fv98l4VfS2JnzCQsEOLlJYHzfxpZ6Eg2bU7Kp24jgPIHVtzgv
	0tGpX5OPyEoP+xG+0GbWa0peHn1Dmbgag3EQh3U=
X-Google-Smtp-Source: ABdhPJx02/EMdlF600LgtBJIPLkytltrzfT6fXPkV6t8OZ1cdVu0+gJxTJqVpPdUYy983/qlHWFq/VtDEDZsmOZn/CA=
X-Received: by 2002:a02:c8c3:: with SMTP id q3mr2258248jao.81.1605280613413;
 Fri, 13 Nov 2020 07:16:53 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_MA1VM-+cp0iY3qYDbFjqX-+au7xeFu5=R3W_tFvoiA3w@mail.gmail.com>
In-Reply-To: <CADnq5_MA1VM-+cp0iY3qYDbFjqX-+au7xeFu5=R3W_tFvoiA3w@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 13 Nov 2020 10:16:42 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6=PQeAOsH_Kf3y6o=ADU-5vjBy0d_2Juk8VDtX-Cuu0w@mail.gmail.com>
Message-ID: <CA+5PVA6=PQeAOsH_Kf3y6o=ADU-5vjBy0d_2Juk8VDtX-Cuu0w@mail.gmail.com>
Subject: Re: Updated firmware for amdgpu
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Fri, Oct 30, 2020 at 10:29 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated VCN firmware for amdgpu.  Please apply.  Thanks!
>
> Alex
