Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD137C3DA4A
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Aug 2024 11:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4152C4AF0F; Mon,  5 Aug 2024 11:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D560C4AF0D
	for <linux-firmware@kernel.org>; Mon,  5 Aug 2024 11:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722858106;
	bh=E3ahWBviCoqFcVG03W9ZYAdrER7JEEzise/0pd6IbIY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bDwdIhSg2Yi5dVI0K0nuVeTu4CcCuBI0xveCvkfIAwoJt7TaAqmR3vJ0GtwjF94fF
	 e55ndhQIdpTDqU7P1zjFVuT+XqhcStQ+/SbHSRmxIvUdWFlVmJaqaK9MSwfBqoxlcY
	 khzrRa7Oyu0pBinmCylZgiy/Nfof1Hwdlh/ANJ8NnynnI17mf96ZosIgdsStEbx4vi
	 ZNGLJNpUjXKJzlB/PdeAYB/xVNDRrgC3p0UqaXEN1MKwcz+/Qzmm6mVBYIJ2CVIKGc
	 1FQqN1TwUG812bRgK8eBpV16ro2PWnPIpbouW7uo2Ds1g+UD8Ug8XKY5/cHdDmtjWi
	 VFx6IyXSR7ZNQ==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-66ca536621cso81956457b3.3
        for <linux-firmware@kernel.org>; Mon, 05 Aug 2024 04:41:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YwNP/9jviwp9S6EdY8Y+iJDRJxYjD94Pyk7SqBN+P0Pg6rChUQo
	c1rRPbAnOe2WOc4cNzQqzRperNw41xfuCWDXRnzPfcmvbXHcN3vTCzeWl9tFW4Lagf0ClgkmG2E
	qBWXI5Yvzu6FlYB45PvKTiqwWNLI=
X-Google-Smtp-Source: AGHT+IFWxmHCberVsakhXtl8rlWFkBZL9CTdFSK1UpCQUhmmPWa91YPj++pgbzTCIe+8ZK9HsXBnmrRCZHkmSPmjsSU=
X-Received: by 2002:a0d:c306:0:b0:64a:6eda:fc60 with SMTP id
 00721157ae682-6895f9e5e2cmr96108717b3.4.1722858105800; Mon, 05 Aug 2024
 04:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240802175932.784781-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240802175932.784781-1-daniele.ceraolospurio@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 5 Aug 2024 07:41:34 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6T-tJziaykh+Ryin9GVeCmFwEqEDNKOSnad09F3PphOg@mail.gmail.com>
Message-ID: <CA+5PVA6T-tJziaykh+Ryin9GVeCmFwEqEDNKOSnad09F3PphOg@mail.gmail.com>
Subject: Re: PR for new i915 and Xe binaries
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, gustavo.sousa@intel.com, 
	John.C.Harrison@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 1:59=E2=80=AFPM Daniele Ceraolo Spurio
<daniele.ceraolospurio@intel.com> wrote:
>
> A bulk update of several binaries in the i915 and Xe folders.
>
> - GuC:
>     - All TGL+ binaries updated to v70.29.2
>     - New binary added for BMG, also v70.29.2
>
> - HuC:
>     - DG2 binary updated to latest rev (v7.10.16)
>     - New binaries added for LNL (v9.4.13) and BMG (v8.2.10)
>
> - GSC:
>     - MTL binary updated to v102.0.10.1878
>     - New binary added for LNL, v104.0.0.1161
>
> - DMC:
>     - MTL binary updated to v2.22
>
> The following changes since commit 65c5d9b1a4808462f5e885447dae1a133c96ab=
ec:
>
>   Merge branch 'amdgpu-20240726' into 'main' (2024-07-28 14:28:08 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/firmware.git tags/intel-2024-08-02

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/266

josh

>
> for you to fetch changes up to 95c414d44c8e60880be787822d5020a010044a49:
>
>   xe: First GuC release v70.29.2 for BMG (2024-08-01 11:11:04 -0700)
>
> ----------------------------------------------------------------
> Daniele Ceraolo Spurio (5):
>       i915: update DG2 HuC to v7.10.16
>       xe: Add LNL HuC 9.4.13
>       xe: Add GSC 104.0.0.1161 for LNL
>       xe: Add BMG HuC 8.2.10
>       i915: update MTL GSC to v102.0.10.1878
>
> Dnyaneshwar Bhadane (1):
>       i915: Update MTL DMC v2.22
>
> Julia Filipchuk (3):
>       i915: Add GuC v70.29.2 for ADL-P, DG1, DG2, MTL, and TGL
>       xe: Add GuC v70.29.2 for LNL
>       xe: First GuC release v70.29.2 for BMG
>
>  WHENCE               |  30 +++++++++++++++++++++---------
>  i915/adlp_guc_70.bin | Bin 347584 -> 328768 bytes
>  i915/dg1_guc_70.bin  | Bin 321472 -> 302656 bytes
>  i915/dg2_guc_70.bin  | Bin 410368 -> 369408 bytes
>  i915/dg2_huc_gsc.bin | Bin 630784 -> 630784 bytes
>  i915/mtl_dmc.bin     | Bin 52476 -> 52700 bytes
>  i915/mtl_gsc_1.bin   | Bin 1142784 -> 1134592 bytes
>  i915/mtl_guc_70.bin  | Bin 332544 -> 303872 bytes
>  i915/tgl_guc_70.bin  | Bin 335168 -> 316352 bytes
>  xe/bmg_guc_70.bin    | Bin 0 -> 406272 bytes
>  xe/bmg_huc.bin       | Bin 0 -> 585728 bytes
>  xe/lnl_gsc_1.bin     | Bin 0 -> 1155072 bytes
>  xe/lnl_guc_70.bin    | Bin 336640 -> 316160 bytes
>  xe/lnl_huc.bin       | Bin 0 -> 643072 bytes
>  14 files changed, 21 insertions(+), 9 deletions(-)
>  create mode 100644 xe/bmg_guc_70.bin
>  create mode 100644 xe/bmg_huc.bin
>  create mode 100644 xe/lnl_gsc_1.bin
>  create mode 100644 xe/lnl_huc.bin
