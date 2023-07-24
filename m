Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0788C001DE
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Jul 2023 12:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8AC42C433CB; Mon, 24 Jul 2023 12:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A98C433C7;
	Mon, 24 Jul 2023 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690201825;
	bh=weIjI0SAgkc/iMUDX/KGV/0ks/OYcQFro3DU4didyLY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=rW/a9ehhwx4/p5141KzBzGyT9W7uK7HmG3hX4eKkgj5CJnfR5NsiphNaSvqa24vL/
	 s/y92UOVm5I6F08U71Aw/t4WTk9++ZI/et6jGFZxI+mL904a7nS1VR5qctGJb8VHMA
	 kFX9pFgG3x26q9dLUWIdr11I6s4MaA9hCQU/Iekv5UDXUnDrfp+3LO9ILwojqVpw35
	 vUcS6anauyw7et0y5E/iIidI4vDmL0vBbWIlQgF+G3TOovmfAGcf4PxNu3YehGzH+t
	 xXDAmxtf6dWjihMLfyNZxkcQhnDhPY+VBMDxDYc0l6y5B0VAIUTJb338pnpfCyGUXU
	 pC+cgIr2RVlAg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-583f837054eso11669847b3.3;
        Mon, 24 Jul 2023 05:30:25 -0700 (PDT)
X-Gm-Message-State: ABy/qLb6fQmdUcUml4phj3gmedjEsyWfpCdtW1f083Y1fmchF7KwpO0v
	dIC2yUnLQ2sIsTKH9d5PKqJ0pBCKNCKxVQ9kMjU=
X-Google-Smtp-Source: APBJJlF53p6ksCkjslzubT5IufMKYQDCgBd8q9luNcr0Cw6FDDcAiSso1n+iKAQeawYlBHuDV70wsB7Ig9WG7uRI/wk=
X-Received: by 2002:a25:d3cf:0:b0:d10:e6a2:1531 with SMTP id
 e198-20020a25d3cf000000b00d10e6a21531mr2081201ybf.2.1690201824450; Mon, 24
 Jul 2023 05:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230720173522.194818-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230720173522.194818-1-daniele.ceraolospurio@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jul 2023 08:30:13 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7EgPxqc2YR+dsB+HrzcMJRa3-ijmr2rbwkQj75SuhDaw@mail.gmail.com>
Message-ID: <CA+5PVA7EgPxqc2YR+dsB+HrzcMJRa3-ijmr2rbwkQj75SuhDaw@mail.gmail.com>
Subject: Re: [PR] GuC 70.8 for MTL and DG2 + HuC 8.5.1 for MTL
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kyle@kernel.org, ben@decadent.org.uk, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pulled and pushed out.

josh

On Thu, Jul 20, 2023 at 1:35=E2=80=AFPM Daniele Ceraolo Spurio
<daniele.ceraolospurio@intel.com> wrote:
>
> The following changes since commit d3f66064cf43bd7338a79174bd0ff60c4ecbdf=
6d:
>
>   Partially revert "amdgpu: DMCUB updates for DCN 3.1.4 and 3.1.5" (2023-=
07-07 15:24:32 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware dg2_mtl_guc_70.8
>
> for you to fetch changes up to 6f3a37f47d68d5e2108b98a900e4be910e8c7106:
>
>   i915: update DG2 GuC to v70.8.0 (2023-07-20 10:14:57 -0700)
>
> ----------------------------------------------------------------
> Daniele Ceraolo Spurio (2):
>       i915: update to GuC 70.8.0 and HuC 8.5.1 for MTL
>       i915: update DG2 GuC to v70.8.0
>
>  WHENCE               |   6 +++---
>  i915/dg2_guc_70.bin  | Bin 369600 -> 385856 bytes
>  i915/mtl_guc_70.bin  | Bin 303936 -> 308032 bytes
>  i915/mtl_huc_gsc.bin | Bin 565248 -> 569344 bytes
>  4 files changed, 3 insertions(+), 3 deletions(-)
