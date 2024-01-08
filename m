Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43304C3DA6E
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Jan 2024 16:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06DEEC433C7; Mon,  8 Jan 2024 16:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E536EC433C9
	for <linux-firmware@kernel.org>; Mon,  8 Jan 2024 16:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704730642;
	bh=jjz/R9Iq5KBgTbRGSEjlvDdnAB+w1jWtBYDeGjmrglk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=R8H7EK3tVXe0IpIoRIa1IRVojzxXjf/Z/S5McFHGH1F3gYCr6ki7dbzhMUghNeTaS
	 aeMR/a09ZziMWKJkeklAFMegkdvECOWLL7SaHIT2BYgHwVigenAQlpZrcOBkpvaexS
	 6BkgUWGyZJt4+ZHAXPui4o2IZpIK7CABjJv+7G4D6PJ1CO6mwXI9geBCpHxFXsyKon
	 NaDAFjd6Xj1xG67M0vxvaeEkZoIfWRqNha9vWzYj5MloA8eZRh5cgtCE/rDP3Yv19r
	 FpGO9LQVe1LPm/8tVXVLl+6pX+o9FSivT/o0BwU5hTvh+shlrtBa1qh7HPgQ05V8QO
	 pUclK0HmpgApA==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dafe04717baso1286438276.1
        for <linux-firmware@kernel.org>; Mon, 08 Jan 2024 08:17:22 -0800 (PST)
X-Gm-Message-State: AOJu0YyIuU2gcauNebNEIriR9MuxidUty+sXe/4hxES7z1KFXMJU1RTT
	HJluzXJFkbaKvDAqDBmSZwXGtje0OdpJBOAPwX8=
X-Google-Smtp-Source: AGHT+IF0OtGyonzri0n27PyecnLsXeOrrjviwgSxZwuEU5z3X5blxMRGSwKmrut/K8qvNyf+1W2kR+5fU15ABv3n34w=
X-Received: by 2002:a05:6902:2189:b0:dbe:a3b0:6e37 with SMTP id
 dl9-20020a056902218900b00dbea3b06e37mr1689110ybb.117.1704730642061; Mon, 08
 Jan 2024 08:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20240108154035.23859-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20240108154035.23859-1-Rodrigo.Siqueira@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 Jan 2024 11:17:10 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5DtzX=noyBfDSYVeXGvU9Qxu_8k1aobk+Cr+Ytc1Sdtw@mail.gmail.com>
Message-ID: <CA+5PVA5DtzX=noyBfDSYVeXGvU9Qxu_8k1aobk+Cr+Ytc1Sdtw@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware for DCN312 to v0.0.199.0
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>, 
	Hamza Mahfooz <hamza.mahfooz@amd.com>, Anson Tsao <anson.tsao@amd.com>, 
	Amit Bhutani <Amit.Bhutani@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 8, 2024 at 10:41=E2=80=AFAM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> The following changes since commit 87be457c2e50d35caeefc00cd590af21c29a8b=
83:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2023-12-15 14:54:01 +08=
00)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-01-08

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/119

josh

>
> for you to fetch changes up to 2909bf41a051601e86129a9c2fcebf31c15eebc8:
>
>   amdgpu: DMCUB updates for DCN314 (2024-01-08 07:26:59 -0700)
>
> ----------------------------------------------------------------
> Rodrigo Siqueira (1):
>       amdgpu: DMCUB updates for DCN314
>
>  amdgpu/yellow_carp_dmcub.bin | Bin 234768 -> 234768 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/amdgpu/yellow_carp_dmcub.bin b/amdgpu/yellow_carp_dmcub.bin
> index cc1c5c75..a72743bc 100644
> Binary files a/amdgpu/yellow_carp_dmcub.bin and b/amdgpu/yellow_carp_dmcu=
b.bin differ
