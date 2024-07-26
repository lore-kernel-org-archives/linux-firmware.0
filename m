Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CA0C3DA49
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Jul 2024 11:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 066FCC4AF09; Fri, 26 Jul 2024 11:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFABC32782
	for <linux-firmware@kernel.org>; Fri, 26 Jul 2024 11:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721994129;
	bh=doExzJ2ZWf9E3QCqdbKMU91IxRLSlFznr+mcxRtjxgI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=rhQWsrdKhLifX3fKZoV0pJ76Rhjnfr0LuYpzSjnxk3CSXV1kQ108hn7t7QfiggB4n
	 CfSroK5gspUbHpkCK3rAzM5Qgd0wVWYUMHDktqLyPqabv2xRa7JcqhUQ2kmVXJIpZq
	 1UEJvYdSEu3OebS7xayTsBR4p8xCW+RajK/dx0MVKK7NMPvCr3rc163qYKOcv2M20l
	 6bQC/jZOOealvnQuiuQZ/Ow8Y6vRTyHBcSWigjKTWhpSgFA3RwghvyjH0uKvL3qBtl
	 komfUHdUtJIwNkDYiG1XSJAfmuf5v6X6grJUBn4hGDEL/HFGlP1YqhiykOPNXkD5el
	 Gn/i+ptVjAtXA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7a8a4f21aeso204615266b.2
        for <linux-firmware@kernel.org>; Fri, 26 Jul 2024 04:42:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YznZ1Z5sxS+R/OZS7qhH8lHyDYTm1SRjnmqdui8dYJKHYLD9FP2
	bY8+1s7E4E4P3u0Glz+/1RQnC9GQppg565XqLp58LE1i5lEFDf0uHqKxBwuBbyo3n6akqWpJll2
	SfIDUqhU4nXOF1sbYkWmZ6MT9Q6Q=
X-Google-Smtp-Source: AGHT+IE0PcFDgbiC9IoV2ZdXLMs3FrM3LKq8VjOdgUXos40oRUlOjrroKHrpcxaMk+RM0niE0+SYIOoRHwXJRwB93dk=
X-Received: by 2002:a17:907:3ea8:b0:a7a:ab1a:2d65 with SMTP id
 a640c23a62f3a-a7acb9adb36mr388343766b.67.1721994128473; Fri, 26 Jul 2024
 04:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240725231548.145196-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20240725231548.145196-1-Rodrigo.Siqueira@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 26 Jul 2024 07:41:35 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4nh=ry2srNz0eWdi+xnOmARx-FL43iK4hZM74igZ1b4w@mail.gmail.com>
Message-ID: <CA+5PVA4nh=ry2srNz0eWdi+xnOmARx-FL43iK4hZM74igZ1b4w@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.227.0
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 7:16=E2=80=AFPM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> The following changes since commit b29f570a9b03d30e33966d653a214597f8132b=
4b:
>
>   amdgpu: update DMCUB to v0.0.227.0 for DCN35 and DCN351 (2024-07-25 15:=
21:21 -0600)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-07-25

This tree produces merge conflicts.

[jwboyer@vader linux-firmware]$ git fetch
https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-07-25
remote: Enumerating objects: 603, done.
remote: Counting objects: 100% (596/596), done.
remote: Compressing objects: 100% (91/91), done.
remote: Total 503 (delta 484), reused 425 (delta 412), pack-reused 0 (from =
0)
Receiving objects: 100% (503/503), 4.55 MiB | 17.76 MiB/s, done.
Resolving deltas: 100% (484/484), completed with 66 local objects.
From https://gitlab.freedesktop.org/drm/firmware
 * tag                 amd-2024-07-25 -> FETCH_HEAD
[jwboyer@vader linux-firmware]$ git merge --no-gpg-sign --signoff FETCH_HEA=
D
Auto-merging WHENCE
warning: Cannot merge binary files: amdgpu/dcn_3_5_1_dmcub.bin (HEAD
vs. b29f570a9b03d30e33966d653a214597f8132b4b)
Auto-merging amdgpu/dcn_3_5_1_dmcub.bin
CONFLICT (add/add): Merge conflict in amdgpu/dcn_3_5_1_dmcub.bin
warning: Cannot merge binary files: amdgpu/dcn_3_5_dmcub.bin (HEAD vs.
b29f570a9b03d30e33966d653a214597f8132b4b)
Auto-merging amdgpu/dcn_3_5_dmcub.bin
CONFLICT (add/add): Merge conflict in amdgpu/dcn_3_5_dmcub.bin
Automatic merge failed; fix conflicts and then commit the result.
[jwboyer@vader linux-firmware]$

josh

> for you to fetch changes up to b29f570a9b03d30e33966d653a214597f8132b4b:
>
>   amdgpu: update DMCUB to v0.0.227.0 for DCN35 and DCN351 (2024-07-25 15:=
21:21 -0600)
>
> ----------------------------------------------------------------
