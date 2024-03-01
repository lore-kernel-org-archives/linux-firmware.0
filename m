Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9808DC5478C
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Mar 2024 19:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63636C43394; Fri,  1 Mar 2024 19:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFA4C433F1
	for <linux-firmware@kernel.org>; Fri,  1 Mar 2024 19:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709320624;
	bh=QsLbGcceeFZ2oT2XBRlNz4J6NekpRIM5/VgLAtGw2So=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mpzxi69o3n+G74sqkRuRMjwjlbtatie6IPJ6IlllYw0bcYoHSeWad9bsgh06GKOmp
	 4h1obhobkqgCY5YmbfmdDDdRlDfxKHG3MpTtdADWVEx3ObLbUGz6k7Sp+a0vZ1+5pw
	 /MySRzkjB0w+aGBrFFLmSZO6Xyu8SFIOn1wQLXDM5StfeSF9Vi7/dPf2fHt1lXKXAi
	 nZG3olH4JVd1xjZtGghIMbrm+f6EupUn8d6dbmHZTX2KFYjTvBagf+IH3TMYEX7bWw
	 UDQ9XNUuvNhDh+t2AufzowuO+FZrqwgB9N6sY57al2Si19L4e2U7826nBdcIk+MoQD
	 ZTYusi6trRxTA==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so2588223276.1
        for <linux-firmware@kernel.org>; Fri, 01 Mar 2024 11:17:04 -0800 (PST)
X-Gm-Message-State: AOJu0Yz9clcJs4aNhAlA2dinic+q9NW1Y+GwWL41zt+px51f4PKHeNKI
	FHg1x+FhiEbfzGwXftcn+qdk5XldtL+il/i3UmZVwzDPE6CDLr3D8SqGjRzZjYjIM7Xe/XgG/gZ
	wPBvdKh/RFApgXhg2mVKLsYyjHas=
X-Google-Smtp-Source: AGHT+IFTtZQUtuu1R4Rss0RkmfI96V3bne3ZHfUVK9PhijlXVrn3Lcl2tx04HI3F5D8TmW3aFb2lktxyPl2SbEQg5N8=
X-Received: by 2002:a25:aa33:0:b0:dcd:36c1:ecb7 with SMTP id
 s48-20020a25aa33000000b00dcd36c1ecb7mr2384949ybi.54.1709320623371; Fri, 01
 Mar 2024 11:17:03 -0800 (PST)
MIME-Version: 1.0
References: <20240222135834.75378-1-gustavo.sousa@intel.com>
In-Reply-To: <20240222135834.75378-1-gustavo.sousa@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 1 Mar 2024 14:16:52 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4HcOJu6O1=a9tjURfe4SOgb5bd1ZcrtB2R4Bdihp8Adg@mail.gmail.com>
Message-ID: <CA+5PVA4HcOJu6O1=a9tjURfe4SOgb5bd1ZcrtB2R4Bdihp8Adg@mail.gmail.com>
Subject: Re: PR for MTL DMC v2.21
To: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 8:58=E2=80=AFAM Gustavo Sousa <gustavo.sousa@intel.=
com> wrote:
>
> The following changes since commit 97b693d243f0bb464819fa3f8326edd4091032=
e4:
>
>   Merge branch 'mediatek' into 'main' (2024-02-20 15:13:01 +0000)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware mtl_dmc_2.21

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/159

josh

>
> for you to fetch changes up to 98502ba83a6db0e4dc99aa1fa292e48b1dc8d0ce:
>
>   i915: Update MTL DMC v2.21 (2024-02-22 10:51:16 -0300)
>
> ----------------------------------------------------------------
> Gustavo Sousa (1):
>       i915: Update MTL DMC v2.21
>
>  WHENCE           |   2 +-
>  i915/mtl_dmc.bin | Bin 52476 -> 52476 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
