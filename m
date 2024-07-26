Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF04CC3DA7F
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Jul 2024 11:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD55CC4AF0B; Fri, 26 Jul 2024 11:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BC4C4AF09
	for <linux-firmware@kernel.org>; Fri, 26 Jul 2024 11:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721993935;
	bh=wjRy1DwQ/EKAisKs+qDmlHdJZTf5YIBuMiEvzAi6RNA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Qhh0UozQhPMJ7/bXctdHVm8Hutbd/C9mQmM+j0oSY9tDxZ3nGNAyWcHLCBvn8a0z/
	 Og8ptOGlNQ1khps+8hjX1ffqEW2P/Q50BPH2/3Xz3HQkPOMju9fa4Q1hdxOP9jetw8
	 mvM5ZMhsxiX6gA2KPc4+dgFvqigkU9CPUyOeAIBtbCtpq1Bov2LHxUab/ejEECN5wr
	 bklDxqGgwIITbxPY2r0f1KGmK07G8qGD293lk+c0L89WZ+9cjq4ondVYPiFiLeY6vL
	 1iUy4eoNveIuaahtPxIAJGIdkR61PMOSBRBUvFnRbBchPlphtepheIkOaFOQigKI6B
	 O4BTUiKUrsOmA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-66108213e88so18594267b3.1
        for <linux-firmware@kernel.org>; Fri, 26 Jul 2024 04:38:55 -0700 (PDT)
X-Gm-Message-State: AOJu0YyATan/6QnU5MgIX+pg9bjwJ7/5eq46uuA1v0y89JtrhLF8Lc5a
	ZqV0hq42ETy9lF8LRnZ7Q8SLYcl/SEfrzxxIi5/cZWuj46ryLyclU+PqY6l8m74X38LZo55aFEx
	GGhwnQtrJyGQE1URxzt3/q89SQLQ=
X-Google-Smtp-Source: AGHT+IEh9dLtF1pmfKL02xiCQTd9+NCCa/d2yBukpa/DBI0ziMMloMdbhHROIyRt04oWEy5jzXSOr6w2kvPRoZIQr08=
X-Received: by 2002:a05:690c:7208:b0:648:bca0:1e71 with SMTP id
 00721157ae682-67515406767mr70299507b3.35.1721993934803; Fri, 26 Jul 2024
 04:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240725213856.115428-1-pratap.nirujogi@amd.com>
In-Reply-To: <20240725213856.115428-1-pratap.nirujogi@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 26 Jul 2024 07:38:43 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7YT5-DT_ogTk8V=at0yE2SemCwW-t2pz=m1DSYMJ5Wtw@mail.gmail.com>
Message-ID: <CA+5PVA7YT5-DT_ogTk8V=at0yE2SemCwW-t2pz=m1DSYMJ5Wtw@mail.gmail.com>
Subject: Re: pull request: amdgpu: Update ISP FW for isp v4.1.1
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>, 
	Deepak Sharma <deepak.sharma@amd.com>, Benjamin Chan <benjamin.chan@amd.com>, King Li <king.li@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 5:39=E2=80=AFPM Pratap Nirujogi <pratap.nirujogi@am=
d.com> wrote:
>
>   amdgpu: Update ISP FW for isp v4.1.1 (2024-07-24 17:33:17 -0400)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git amd-isp-staging

I don't have a freedesktop git account, so this doesn't work.  I found
the https equivalent, but there are merge conflicts.

[jwboyer@vader linux-firmware]$ git fetch
https://gitlab.freedesktop.org/drm/firmware.git amd-isp-staging
remote: Enumerating objects: 17, done.
remote: Counting objects: 100% (17/17), done.
remote: Compressing objects: 100% (13/13), done.
remote: Total 14 (delta 9), reused 2 (delta 1), pack-reused 0 (from 0)
Unpacking objects: 100% (14/14), 3.15 MiB | 8.52 MiB/s, done.
From https://gitlab.freedesktop.org/drm/firmware
 * branch              amd-isp-staging -> FETCH_HEAD
[jwboyer@vader linux-firmware]$ git merge --no-gpg-sign --signoff FETCH_HEA=
D
Auto-merging WHENCE
CONFLICT (content): Merge conflict in WHENCE
warning: Cannot merge binary files: amdgpu/isp_4_1_1.bin (HEAD vs.
231bc1316da608e95cec919fbbabf7c587b93b47)
Auto-merging amdgpu/isp_4_1_1.bin
CONFLICT (add/add): Merge conflict in amdgpu/isp_4_1_1.bin
Automatic merge failed; fix conflicts and then commit the result.
[jwboyer@vader linux-firmware]$


The last commit from you here was:

[jwboyer@vader linux-firmware]$ git log amdgpu/isp_4_1_1.bin
commit 33a950828c87646c82b6b715ed970bb399afa1b4
Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
Date:   Wed Jun 26 11:36:48 2024 -0400

    amdgpu: Update ISP FW for isp v4.1.1

    From internal git commit:
    ed700d1c929a8d64fe569e901bada95668e21bc3

    Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

josh

>
> for you to fetch changes up to 231bc1316da608e95cec919fbbabf7c587b93b47:
>
>   amdgpu: Update ISP FW for isp v4.1.1 (2024-07-24 17:33:17 -0400)
>
> ----------------------------------------------------------------
