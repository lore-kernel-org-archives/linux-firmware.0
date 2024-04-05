Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C124DC67861
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Apr 2024 16:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A90FC433C7; Fri,  5 Apr 2024 16:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75145C43390
	for <linux-firmware@kernel.org>; Fri,  5 Apr 2024 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712333856;
	bh=DdqN1+75+M1zDGqGhcEWpBeqFamQsjC0GLCJ5dl5Vi4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Fc7nDKnuupTJGery08+0qj9Um45twnAafD3j2ufouL0Q7FhqkTKgSMmmtuP/BGSoL
	 HGz7iOg6yZ7PCthmreCxykBO1GCi9uKqOzAmNNNgLnb2r5Nw+S6e4EiYsfVF0C1JIP
	 /+0WaGDWLL3I7+IcL5XV9bYkYs7yuHRwWy06RQK7Gi1gi0opyowfGLAz61o1p5S2Qp
	 TH64WfOWRHf9/MEzxqXJ3LS8dgfeT9+BONhyu/95mN1ktswNcU+fwc1A4ZLre9ZLZQ
	 dUgzOEl7ROmnFvHFwVD//O9o8budJ/GXau/NOdA+0VbvE1CoTytKh1RQHEomD4+w34
	 ZseYUcabDmBwg==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so2539370276.1
        for <linux-firmware@kernel.org>; Fri, 05 Apr 2024 09:17:36 -0700 (PDT)
X-Gm-Message-State: AOJu0YztrXPpLVmhcblgWgCWuOPpweNv3gjzN3UKgs80Z+Cv54B5a+M+
	z+5HH1yWBiRWL9d+24AMmejKtgsOf/j+Of/wEzzm64ut+meQJwJiRotR0tTuq2ZiPmzmOxsQL9w
	caL9T5aRFvw4yH66h7hGgMun9lCk=
X-Google-Smtp-Source: AGHT+IEkVyTUVtr6OFCqWCmhArGL18PStJD0ASTAlHbghyWThmxZX1vdIgH4fspB748nKR14Qto+TYN/3Em+NkfFmPo=
X-Received: by 2002:a25:900b:0:b0:dcc:d196:a573 with SMTP id
 s11-20020a25900b000000b00dccd196a573mr1816048ybl.36.1712333855709; Fri, 05
 Apr 2024 09:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240401185015.624402-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240401185015.624402-1-daniele.ceraolospurio@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 5 Apr 2024 12:17:25 -0400
X-Gmail-Original-Message-ID: <CA+5PVA76cR43jPCZmewp-sHtwufxMchM_TWoLJQXLE8HPQQeLw@mail.gmail.com>
Message-ID: <CA+5PVA76cR43jPCZmewp-sHtwufxMchM_TWoLJQXLE8HPQQeLw@mail.gmail.com>
Subject: Re: [PR] i915: Add DG2 HuC to 7.10.15
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2024 at 2:50=E2=80=AFPM Daniele Ceraolo Spurio
<daniele.ceraolospurio@intel.com> wrote:
>
> The following changes since commit 93f329774542b9b7d57abb18ea8b6542f2d8fe=
ac:
>
>   Merge branch 'robot/pr-0-1709214990' into 'main' (2024-02-29 14:10:53 +=
0000)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/intel-2024-04-01

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/188

josh

>
> for you to fetch changes up to ab144168469a77f54ad539ac98dede7ce4c6a75d:
>
>   i915: Add DG2 HuC 7.10.15 (2024-03-28 13:45:41 -0700)
>
> ----------------------------------------------------------------
> Daniele Ceraolo Spurio (1):
>       i915: Add DG2 HuC 7.10.15
>
>  WHENCE               |   2 +-
>  i915/dg2_huc_gsc.bin | Bin 622592 -> 630784 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  mode change 100755 =3D> 100644 i915/dg2_huc_gsc.bin
