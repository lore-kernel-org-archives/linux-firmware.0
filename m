Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66036C10F16
	for <linux-firmware@archiver.kernel.org>; Mon,  6 May 2024 12:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23983C4AF63; Mon,  6 May 2024 12:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B549C4AF18
	for <linux-firmware@kernel.org>; Mon,  6 May 2024 12:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714999009;
	bh=eWU8iopHDrqo++vHpT/0j2dtZIIcx+IxYcwEFPBEpng=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YuZXUQGYhDnqn9yBEoLBZ5f93r/q0qlu8vzLopVrUzcFju2Ne24pgxEakWrU3DBq3
	 Z0wmT2CqyyDXM/VGHqjFDb/rK1YhQ7lSofSPEuUDIsW/RnO9l77cR9U7woUPVh9Gn1
	 Q/SGkuph3sB5zz5IzwtVmGMCFy/pIhDLMGdiiOSYZC0qiWOjXelq2zzTxmyYk1ksT1
	 QkbSceRW4oISq4iPH8pATgI+FT6AZzXtD7+RIvX6EfbPv9ywqHm1kXjGUVRSwIzDTj
	 K/zUbSE6tpLJcIBYJJtSMAzKK95adh4Kj/EHOR4r+eAJMMInDi1MWqWloQfjoYs1Fh
	 n4S6GmsSwCcNg==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de60380c04aso2222824276.2
        for <linux-firmware@kernel.org>; Mon, 06 May 2024 05:36:48 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy/RM4m/wmED3Nu7fhc82J0twRPQXdPsKe+TtXYaKrCZIXsLsj4
	NTcpi945Rj9rjV0UXQyiKOldIjRQr4yJDlYvT/klswJGMFT2fB8QRT5s50dzbgKF2jKmWZTXlao
	hD638F9nwOkOLMtIFpx1WPYRPrfo=
X-Google-Smtp-Source: AGHT+IEesZ06iytnatbIkX0VvI4ifN2kFz7xvynNMU8aJuK6k6tU3QCsvmsqHLKZzYBLmDo2Ldx8Q1ZWNvtycIoC3WY=
X-Received: by 2002:a25:8246:0:b0:dc7:4067:9f85 with SMTP id
 d6-20020a258246000000b00dc740679f85mr9673757ybn.58.1714999008259; Mon, 06 May
 2024 05:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240506071040.3759396-1-chiahsuan.chung@amd.com>
In-Reply-To: <20240506071040.3759396-1-chiahsuan.chung@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 6 May 2024 06:36:36 -0600
X-Gmail-Original-Message-ID: <CA+5PVA58qQ8zpE=L67AkkCFoikfnCVxxCKF80M0BmAY8np-Bdg@mail.gmail.com>
Message-ID: <CA+5PVA58qQ8zpE=L67AkkCFoikfnCVxxCKF80M0BmAY8np-Bdg@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.216.0
To: Tom Chung <chiahsuan.chung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 1:10=E2=80=AFAM Tom Chung <chiahsuan.chung@amd.com> =
wrote:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-05-06 15:03:45 +08=
00)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-05-03

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/208

josh

>
> for you to fetch changes up to b011b09f9f6e74cc941241349276a22a512c7c46:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-05-06 15:03:45 +08=
00)
>
> ----------------------------------------------------------------
