Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124C8C4345F
	for <linux-firmware@archiver.kernel.org>; Thu, 25 Apr 2024 11:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1118C113CE; Thu, 25 Apr 2024 11:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6FDC2BD10
	for <linux-firmware@kernel.org>; Thu, 25 Apr 2024 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714043626;
	bh=UdE/4VvWguswfPLwhPsX/2X0F7/oUgqui2wg2DgneZQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kwzsYtdd0hAovJSOhImyMm/eguj4w9HNQIO9PqY5Nd4EaZWUK+kPf4L53jPNCOxPU
	 LVguMyn6n1X5KWbxMqrDEi9gQMpE/KEH9MJ80Wx4/d2uc1vlcYl7hO0k+QmjXvJ0k6
	 sfj7TiQauOmI7VPi6PtD7O/uHcLZGU8wreLiRQU0+uqHio7PKV00NKghqOVJI/AmFk
	 LSAJKRUx4F8a9fbzd1TLC3e7r3BuhZkxODjaC6FBSrlbQe5rGHQ3MyuU+fwX7PEcY8
	 CEbyRswR9ZJCUe4yiOvg1Rr7UnPqtYWMipFTpF0Hdi4AsGKTtW4VYYYZC47AfLNqGu
	 L1CiVG6ZcaszA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61ae4743d36so8788467b3.2
        for <linux-firmware@kernel.org>; Thu, 25 Apr 2024 04:13:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YzQRQeuapZfEigKAuRf67rnEmkECXJ+vp0KyGXEUv4Dc2GlKgBV
	7XhEWeBhgS8t/VOB2J2FJ8GQWnd1xpC1YCRDHOI1KjJaAppaX0C1ndL4Ln7HMXl+wZdPTKXuTOa
	KnQPgwxgtdW7wSXft+Ar6Joe9qcw=
X-Google-Smtp-Source: AGHT+IH0r0HuuhH+CjENzxURKfg+8noQ+AdC4Rc8qgNcIBcwuEPoIMh4zgRJAUHb92NoaQfxuR+SLS3UnPmrzJbGe8A=
X-Received: by 2002:a05:690c:7084:b0:619:da17:87be with SMTP id
 jg4-20020a05690c708400b00619da1787bemr5670833ywb.42.1714043625975; Thu, 25
 Apr 2024 04:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240424200515.281478-2-gustavo.sousa@intel.com>
In-Reply-To: <20240424200515.281478-2-gustavo.sousa@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 25 Apr 2024 07:13:34 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4MeV56Zj_Xr2JuRUS7KWWOw0fd6-9mTow1i64ADkPpkw@mail.gmail.com>
Message-ID: <CA+5PVA4MeV56Zj_Xr2JuRUS7KWWOw0fd6-9mTow1i64ADkPpkw@mail.gmail.com>
Subject: Re: PR for Xe2LPD DMC v2.20
To: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 4:05=E2=80=AFPM Gustavo Sousa <gustavo.sousa@intel.=
com> wrote:
>
> The following changes since commit 93f329774542b9b7d57abb18ea8b6542f2d8fe=
ac:
>
>   Merge branch 'robot/pr-0-1709214990' into 'main' (2024-02-29 14:10:53 +=
0000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/firmware.git tags/intel-2024-04-24

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/201

josh

>
> for you to fetch changes up to 8a52a94db5502d797864f5209c28739d2d9449d0:
>
>   i915: Update Xe2LPD DMC to v2.20 (2024-04-22 23:31:42 +0530)
>
> ----------------------------------------------------------------
> Intel DRM firmware intel-2024-04-24
>
> ----------------------------------------------------------------
> Daniele Ceraolo Spurio (1):
>       i915: Add DG2 HuC 7.10.15
>
> Dnyaneshwar Bhadane (1):
>       i915: Update Xe2LPD DMC to v2.20
>
>  WHENCE               |   4 ++--
>  i915/dg2_huc_gsc.bin | Bin 622592 -> 630784 bytes
>  i915/xe2lpd_dmc.bin  | Bin 61208 -> 59284 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  mode change 100755 =3D> 100644 i915/dg2_huc_gsc.bin
