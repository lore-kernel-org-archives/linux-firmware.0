Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F22AC47073
	for <linux-firmware@archiver.kernel.org>; Tue, 26 Dec 2023 19:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 357D8C433CB; Tue, 26 Dec 2023 19:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC7CC433C8
	for <linux-firmware@kernel.org>; Tue, 26 Dec 2023 19:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703619650;
	bh=nE9zuTIWqccxxZlWxqUOUBD5E6h6eziPCGRHHch28v0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ktbia0cpaHUf1wq7wxwxAv/X2aleq9HXYiz/e6WWQ814+xErSnOxtYwr6gxnv8iEQ
	 I2zAlTGm1rsuIUM6XLnjPau9/F2powlKqcu3ZHA5NP1SKLh1nk+sHasgjj6rcH0mr0
	 7d+zdldPC/iW7r8qNBXlSV4kMWEApxrr9YUu5aUNe0KSdGvCKLHQL+AVdznocW3cmN
	 NJcfC06s8KkTECkbvczQZhEVhDwD+47Tkhx6Zkl2fjcPtuo+1A5bQgpu5p105w6sMJ
	 b4NW65WoqLHoyph/37+kAj3NL5rm4svLujTSRbuA6Ag3gykGIf9YgTfLkGHjIjMvZG
	 NJjGDImVu0JTA==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5d05ff42db0so38118117b3.2
        for <linux-firmware@kernel.org>; Tue, 26 Dec 2023 11:40:50 -0800 (PST)
X-Gm-Message-State: AOJu0Yzx48iE8pnXjrtGS9JNwZfsd7UNl5qdelXAqw7O7B8FyjRZNuR7
	ntdZxiXeRUcWrLKdTjOsd4fdl7Tw8eRHeeCZeKM=
X-Google-Smtp-Source: AGHT+IFG0ZivwMd4kgGcr5pPhALwnDbJJw23xXLWvrgSmeq20aTkl9e6OgX5y6WoJm1jiinPL4wWZD4m8s3FNXyRuQo=
X-Received: by 2002:a0d:d605:0:b0:5e7:b045:a229 with SMTP id
 y5-20020a0dd605000000b005e7b045a229mr3491154ywd.40.1703619649210; Tue, 26 Dec
 2023 11:40:49 -0800 (PST)
MIME-Version: 1.0
References: <ZYC2sqDmHb3jiI9I@kekkonen.localdomain>
In-Reply-To: <ZYC2sqDmHb3jiI9I@kekkonen.localdomain>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 26 Dec 2023 14:40:38 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6S5XG+DwLdDHX00W3VjAx_kvAPLx6HKJBxjCgh250Lkg@mail.gmail.com>
Message-ID: <CA+5PVA6S5XG+DwLdDHX00W3VjAx_kvAPLx6HKJBxjCgh250Lkg@mail.gmail.com>
Subject: Re: [GIT PULL] Intel Visual Sensing Controller firmware
To: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Wentong Wu <wentong.wu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 4:16=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi folks,
>
> This PR adds firmware binaries for Intel Visual Sensing Controller (VSC).
> The driver for the device has been recently merged to the char-misc tree
> and is expected to make it to Linux 6.8.
>
> Please pull.
>
>
> The following changes since commit c156e6be6d4a0a2290e7059bc74fb0612aa196=
93:
>
>   Merge branch 'robot/pr-0-1702625169' into 'main' (2023-12-15 12:16:57 +=
0000)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.g=
it tags/ivsc-2023-12-18

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/101

josh

>
> for you to fetch changes up to cfc997c664f076c6800b749ed7ef315b1e8e76fd:
>
>   intel: vsc: Add firmware for Visual Sensing Controller (2023-12-18 22:5=
9:39 +0200)
>
> ----------------------------------------------------------------
> Add Intel Visual Sensing Controller firmware
>
> ----------------------------------------------------------------
> Sakari Ailus (1):
>       intel: vsc: Add firmware for Visual Sensing Controller
>
>  LICENSE.ivsc                           |  38 +++++++++++++++++++++++++++=
++++++
>  WHENCE                                 |  36 +++++++++++++++++++++++++++=
++++
>  intel/vsc/ivsc_fw.bin                  | Bin 0 -> 966560 bytes
>  intel/vsc/ivsc_pkg_hi556_0.bin         | Bin 0 -> 767068 bytes
>  intel/vsc/ivsc_pkg_himx11b1_0.bin      | Bin 0 -> 730204 bytes
>  intel/vsc/ivsc_pkg_himx2170_0.bin      | Bin 0 -> 771164 bytes
>  intel/vsc/ivsc_pkg_himx2172_0.bin      | Bin 0 -> 799836 bytes
>  intel/vsc/ivsc_pkg_int3537_0.bin       | Bin 0 -> 767068 bytes
>  intel/vsc/ivsc_pkg_ovti01a0_0.bin      | Bin 0 -> 726108 bytes
>  intel/vsc/ivsc_pkg_ovti01af_0.bin      | Bin 0 -> 726108 bytes
>  intel/vsc/ivsc_pkg_ovti01as_0.bin      | Bin 0 -> 726108 bytes
>  intel/vsc/ivsc_pkg_ovti02c1_0.bin      | Bin 0 -> 762972 bytes
>  intel/vsc/ivsc_pkg_ovti02e1_0.bin      | Bin 0 -> 791644 bytes
>  intel/vsc/ivsc_pkg_ovti2740_0.bin      | Bin 0 -> 726108 bytes
>  intel/vsc/ivsc_pkg_ovti5678_0.bin      | Bin 0 -> 726108 bytes
>  intel/vsc/ivsc_pkg_ovti9734_0.bin      | Bin 0 -> 730204 bytes
>  intel/vsc/ivsc_pkg_ovti9738_0.bin      | Bin 0 -> 730204 bytes
>  intel/vsc/ivsc_skucfg_hi556_0_1.bin    | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_himx11b1_0_1.bin | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_himx2170_0_1.bin | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_himx2172_0_1.bin | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_int3537_0_1.bin  | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_ovti01a0_0_1.bin | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_ovti01af_0_1.bin | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_ovti01as_0_1.bin | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_ovti02c1_0_1.bin | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_ovti02e1_0_1.bin | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_ovti2740_0_1.bin | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_ovti5678_0_1.bin | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_ovti9734_0_1.bin | Bin 0 -> 4100 bytes
>  intel/vsc/ivsc_skucfg_ovti9738_0_1.bin | Bin 0 -> 4100 bytes
>  31 files changed, 74 insertions(+)
>  create mode 100644 LICENSE.ivsc
>  create mode 100644 intel/vsc/ivsc_fw.bin
>  create mode 100644 intel/vsc/ivsc_pkg_hi556_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_himx11b1_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_himx2170_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_himx2172_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_int3537_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_ovti01a0_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_ovti01af_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_ovti01as_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_ovti02c1_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_ovti02e1_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_ovti2740_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_ovti5678_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_ovti9734_0.bin
>  create mode 100644 intel/vsc/ivsc_pkg_ovti9738_0.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_hi556_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_himx11b1_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_himx2170_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_himx2172_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_int3537_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_ovti01a0_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_ovti01af_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_ovti01as_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_ovti02c1_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_ovti02e1_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_ovti2740_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_ovti5678_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_ovti9734_0_1.bin
>  create mode 100644 intel/vsc/ivsc_skucfg_ovti9738_0_1.bin
>
> --
> Kind regards,
>
> Sakari Ailus
