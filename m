Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E200AC27C53
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Jun 2024 15:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0C57C4AF07; Fri,  7 Jun 2024 15:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B577C3277B
	for <linux-firmware@kernel.org>; Fri,  7 Jun 2024 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717775971;
	bh=XAehCDjePr6vzsHhJZ3tr0y7mBsg2QLTgOgysdj2o2k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=f/w8KNu33HZdFG5uEs9J1kBd5wgu5VgUPHUHnxE8Zhxb68O25aidguKekUSwr1erM
	 cqcaO+guB3KFCqNB27ASqsr6wdHpTBHg0I4t7l4mTV+isr2D5NPAI6pq6YI7ye9Fx8
	 XRssDVXGIstRgnQAS8ho1aULyUgzp26WwPJMeiofmxY4TwC6egATjPyrSvCY+rIYWO
	 MLUW+t2PSxo/Z3fxLN5T83Mm8T5sTY0eMMLGFxPqC1cJIes8C84Q1EHMIu/CwWnvEr
	 Z8RPFQBphajKIMLusUG1rLrh3ULNFGyaDHiOmc3Zg9AUK/U4nWBJl4AjHvRz2FQmgV
	 syKcwVfqzJC5g==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfa59c35e44so2653165276.3
        for <linux-firmware@kernel.org>; Fri, 07 Jun 2024 08:59:31 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw3yR4UUckTBtxdaZCSSs9TN1iKbeV4oHfdzuGRvfGpMGg2PrVA
	0qCs1c2St5oi08/WmvY8Rs8pcB7mHEwKXRlwdkbuQZoxuL9gIwPGNR9IZd2pu/E2Cir2fGB5oGG
	u+9twDj1y9gv0xH5u6VnqkrkVLsU=
X-Google-Smtp-Source: AGHT+IEPi3Gw0BAu9o4D0CdgVEC9KhWzQD2mbFfEzth2WnOaJJJ71DivcfmMnMHB8ED2F0b+B607k5vE9lFaC0RrI/0=
X-Received: by 2002:a25:ac48:0:b0:de6:141c:3430 with SMTP id
 3f1490d57ef6-dfaf65e7332mr2973959276.17.1717775970757; Fri, 07 Jun 2024
 08:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240604174916.591045-1-alexander.deucher@amd.com>
In-Reply-To: <20240604174916.591045-1-alexander.deucher@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 7 Jun 2024 11:59:19 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4Qy8bT25hrw4zUPzEjndvvFk3dDd1NG_7V-JNQZ_cWmQ@mail.gmail.com>
Message-ID: <CA+5PVA4Qy8bT25hrw4zUPzEjndvvFk3dDd1NG_7V-JNQZ_cWmQ@mail.gmail.com>
Subject: Re: [pull] amdgpu amd-2024-06-04
To: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 1:49=E2=80=AFPM Alex Deucher <alexander.deucher@amd.=
com> wrote:
>
> Hi,
>
> Updated AMD GPU firmwares.  Please apply.
>
> Thanks,
>
> The following changes since commit 904d39f11f26dc7124a6184cff3e5fb62d3d21=
c1:
>
>   amdgpu: add support for PSP 14.0.1 (2024-05-30 11:32:55 -0500)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-06-04

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/221

josh

>
> for you to fetch changes up to 0fbdea28bb52cdbc85af18138baf8a4bb9970bf9:
>
>   amdgpu: update yellow carp firmware (2024-06-04 13:31:50 -0400)
>
> ----------------------------------------------------------------
> amd-2024-06-04:
>
> amdgpu: update firmware
>
> From internal git commit:
> 501adf8bb60cd0a75c4a3e3ed0f608697caa3b77
>
> ----------------------------------------------------------------
> Alex Deucher (46):
>       amdgpu: update aldebaran firmware
>       amdgpu: update navi12 firmware
>       amdgpu: update renoir firmware
>       amdgpu: update GC 9.4.3 firmware
>       amdgpu: update PSP 13.0.6 firmware
>       amdgpu: update SMU 13.0.6 firmware
>       amdgpu: update navi14 firmware
>       amdgpu: update GC 11.5.0 firmware
>       amdgpu: update PSP 14.0.0 firmware
>       amdgpu: update VCN 4.0.5 firmware
>       amdgpu: update sienna cichlid firmware
>       amdgpu: update GC 11.0.1 firmware
>       amdgpu: update PSP 13.0.4 firmware
>       amdgpu: update SDMA 6.0.1 firmware
>       amdgpu: update VCN 4.0.2 firmware
>       amdgpu: update GC 11.0.4 firmware
>       amdgpu: update PSP 13.0.11 firmware
>       amdgpu: update navy flounder firmware
>       amdgpu: update green sardine firmware
>       amdgpu: update dimgrey cavefish firmware
>       amdgpu: update vangogh firmware
>       amdgpu: update beige goby firmware
>       amdgpu: update picasso firmware
>       amdgpu: update GC 11.0.0 firmware
>       amdgpu: update PSP 13.0.0 firmware
>       amdgpu: update SDMA 6.0.0 firmware
>       amdgpu: update smu 13.0.0 firmware
>       amdgpu: update VCN 4.0.0 firmware
>       amdgpu: update vega10 firmware
>       amdgpu: update vega12 firmware
>       amdgpu: update vega20 firmware
>       amdgpu: update psp 13.0.8 firmware
>       amdgpu: update PSP 13.0.5 firmware
>       amdgpu: update VCN 3.1.2 firmware
>       amdgpu: update GC 11.0.3 firmware
>       amdgpu: update PSP 13.0.10 firmware
>       amdgpu: update SDMA 6.0.3 firmware
>       amdgpu: update SMU 13.0.10 firmware
>       amdgpu: update raven firmware
>       amdgpu: update raven2 firmware
>       amdgpu: update navi10 firmware
>       amdgpu: update GC 11.0.2 firmware
>       amdgpu: update PSP 13.0.7 firmware
>       amdgpu: update SDMA 6.0.2 firmware
>       amdgpu: update VCN 4.0.4 firmware
>       amdgpu: update yellow carp firmware
>
>  amdgpu/aldebaran_mec.bin        | Bin 268576 -> 268576 bytes
>  amdgpu/aldebaran_mec2.bin       | Bin 268576 -> 268576 bytes
>  amdgpu/aldebaran_vcn.bin        | Bin 422400 -> 422656 bytes
>  amdgpu/beige_goby_smc.bin       | Bin 244934 -> 244934 bytes
>  amdgpu/beige_goby_ta.bin        | Bin 238848 -> 238848 bytes
>  amdgpu/beige_goby_vcn.bin       | Bin 586992 -> 587120 bytes
>  amdgpu/dimgrey_cavefish_ta.bin  | Bin 238848 -> 238848 bytes
>  amdgpu/dimgrey_cavefish_vcn.bin | Bin 586992 -> 587120 bytes
>  amdgpu/gc_11_0_0_me.bin         | Bin 310768 -> 310768 bytes
>  amdgpu/gc_11_0_0_mec.bin        | Bin 407072 -> 407072 bytes
>  amdgpu/gc_11_0_0_mes1.bin       | Bin 216928 -> 217088 bytes
>  amdgpu/gc_11_0_0_mes_2.bin      | Bin 249872 -> 251552 bytes
>  amdgpu/gc_11_0_0_pfp.bin        | Bin 229280 -> 229296 bytes
>  amdgpu/gc_11_0_0_rlc.bin        | Bin 185248 -> 185248 bytes
>  amdgpu/gc_11_0_0_rlc_1.bin      | Bin 185248 -> 185248 bytes
>  amdgpu/gc_11_0_1_mes_2.bin      | Bin 246896 -> 251200 bytes
>  amdgpu/gc_11_0_1_rlc.bin        | Bin 160592 -> 160368 bytes
>  amdgpu/gc_11_0_2_me.bin         | Bin 310768 -> 310768 bytes
>  amdgpu/gc_11_0_2_mec.bin        | Bin 407072 -> 407072 bytes
>  amdgpu/gc_11_0_2_mes1.bin       | Bin 217408 -> 217440 bytes
>  amdgpu/gc_11_0_2_mes_2.bin      | Bin 249872 -> 251648 bytes
>  amdgpu/gc_11_0_2_pfp.bin        | Bin 229296 -> 229296 bytes
>  amdgpu/gc_11_0_2_rlc.bin        | Bin 178720 -> 178720 bytes
>  amdgpu/gc_11_0_3_imu.bin        | Bin 132352 -> 132352 bytes
>  amdgpu/gc_11_0_3_me.bin         | Bin 310784 -> 310784 bytes
>  amdgpu/gc_11_0_3_mec.bin        | Bin 407072 -> 406528 bytes
>  amdgpu/gc_11_0_3_mes1.bin       | Bin 216992 -> 217152 bytes
>  amdgpu/gc_11_0_3_mes_2.bin      | Bin 249936 -> 251616 bytes
>  amdgpu/gc_11_0_3_pfp.bin        | Bin 229296 -> 229280 bytes
>  amdgpu/gc_11_0_3_rlc.bin        | Bin 178976 -> 178976 bytes
>  amdgpu/gc_11_0_4_mes_2.bin      | Bin 249472 -> 250528 bytes
>  amdgpu/gc_11_0_4_rlc.bin        | Bin 158752 -> 158752 bytes
>  amdgpu/gc_11_5_0_imu.bin        | Bin 132352 -> 132352 bytes
>  amdgpu/gc_11_5_0_me.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_5_0_mec.bin        | Bin 268704 -> 268704 bytes
>  amdgpu/gc_11_5_0_mes1.bin       | Bin 233616 -> 233744 bytes
>  amdgpu/gc_11_5_0_mes_2.bin      | Bin 249536 -> 251104 bytes
>  amdgpu/gc_11_5_0_pfp.bin        | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_5_0_rlc.bin        | Bin 166528 -> 166528 bytes
>  amdgpu/gc_9_4_3_mec.bin         | Bin 269200 -> 269200 bytes
>  amdgpu/green_sardine_asd.bin    | Bin 193024 -> 193024 bytes
>  amdgpu/green_sardine_ta.bin     | Bin 33536 -> 33536 bytes
>  amdgpu/navi10_asd.bin           | Bin 193024 -> 193024 bytes
>  amdgpu/navi10_ce.bin            | Bin 263296 -> 263296 bytes
>  amdgpu/navi10_me.bin            | Bin 263424 -> 263424 bytes
>  amdgpu/navi10_mec.bin           | Bin 268720 -> 268720 bytes
>  amdgpu/navi10_mec2.bin          | Bin 268720 -> 268720 bytes
>  amdgpu/navi10_pfp.bin           | Bin 263424 -> 263424 bytes
>  amdgpu/navi10_ta.bin            | Bin 33536 -> 33536 bytes
>  amdgpu/navi10_vcn.bin           | Bin 403392 -> 403776 bytes
>  amdgpu/navi12_asd.bin           | Bin 193024 -> 193024 bytes
>  amdgpu/navi12_vcn.bin           | Bin 403392 -> 403776 bytes
>  amdgpu/navi14_asd.bin           | Bin 193024 -> 193024 bytes
>  amdgpu/navi14_ta.bin            | Bin 33536 -> 33536 bytes
>  amdgpu/navi14_vcn.bin           | Bin 403392 -> 403776 bytes
>  amdgpu/navy_flounder_ta.bin     | Bin 238848 -> 238848 bytes
>  amdgpu/navy_flounder_vcn.bin    | Bin 586992 -> 587120 bytes
>  amdgpu/picasso_asd.bin          | Bin 193024 -> 193024 bytes
>  amdgpu/picasso_ta.bin           | Bin 41984 -> 41984 bytes
>  amdgpu/psp_13_0_0_ta.bin        | Bin 251136 -> 251136 bytes
>  amdgpu/psp_13_0_10_sos.bin      | Bin 360352 -> 360352 bytes
>  amdgpu/psp_13_0_10_ta.bin       | Bin 243136 -> 247232 bytes
>  amdgpu/psp_13_0_11_ta.bin       | Bin 234496 -> 234496 bytes
>  amdgpu/psp_13_0_4_ta.bin        | Bin 234496 -> 234496 bytes
>  amdgpu/psp_13_0_5_asd.bin       | Bin 193024 -> 193024 bytes
>  amdgpu/psp_13_0_5_ta.bin        | Bin 226304 -> 226304 bytes
>  amdgpu/psp_13_0_6_sos.bin       | Bin 385312 -> 385312 bytes
>  amdgpu/psp_13_0_7_sos.bin       | Bin 248496 -> 248496 bytes
>  amdgpu/psp_13_0_7_ta.bin        | Bin 226304 -> 226304 bytes
>  amdgpu/psp_13_0_8_ta.bin        | Bin 226304 -> 226304 bytes
>  amdgpu/psp_14_0_0_ta.bin        | Bin 230400 -> 234496 bytes
>  amdgpu/raven2_asd.bin           | Bin 193024 -> 193024 bytes
>  amdgpu/raven2_ta.bin            | Bin 33536 -> 33536 bytes
>  amdgpu/raven_asd.bin            | Bin 193024 -> 193024 bytes
>  amdgpu/raven_ta.bin             | Bin 33536 -> 33536 bytes
>  amdgpu/renoir_asd.bin           | Bin 193024 -> 193024 bytes
>  amdgpu/renoir_vcn.bin           | Bin 403392 -> 403776 bytes
>  amdgpu/sdma_6_0_0.bin           | Bin 34560 -> 34560 bytes
>  amdgpu/sdma_6_0_1.bin           | Bin 34560 -> 34560 bytes
>  amdgpu/sdma_6_0_2.bin           | Bin 34560 -> 34560 bytes
>  amdgpu/sdma_6_0_3.bin           | Bin 34560 -> 34560 bytes
>  amdgpu/sienna_cichlid_smc.bin   | Bin 247396 -> 247396 bytes
>  amdgpu/sienna_cichlid_ta.bin    | Bin 366336 -> 366336 bytes
>  amdgpu/sienna_cichlid_vcn.bin   | Bin 586992 -> 587120 bytes
>  amdgpu/smu_13_0_0.bin           | Bin 292452 -> 292452 bytes
>  amdgpu/smu_13_0_10.bin          | Bin 271520 -> 271520 bytes
>  amdgpu/smu_13_0_6.bin           | Bin 2584 -> 2584 bytes
>  amdgpu/vangogh_asd.bin          | Bin 193024 -> 193024 bytes
>  amdgpu/vcn_3_1_2.bin            | Bin 579120 -> 579248 bytes
>  amdgpu/vcn_4_0_0.bin            | Bin 389584 -> 390352 bytes
>  amdgpu/vcn_4_0_2.bin            | Bin 389584 -> 391504 bytes
>  amdgpu/vcn_4_0_4.bin            | Bin 389584 -> 391376 bytes
>  amdgpu/vcn_4_0_5.bin            | Bin 388816 -> 389712 bytes
>  amdgpu/vega10_asd.bin           | Bin 193024 -> 193024 bytes
>  amdgpu/vega12_asd.bin           | Bin 193024 -> 193024 bytes
>  amdgpu/vega20_asd.bin           | Bin 193024 -> 193024 bytes
>  amdgpu/yellow_carp_ta.bin       | Bin 226304 -> 226304 bytes
>  amdgpu/yellow_carp_vcn.bin      | Bin 579248 -> 579248 bytes
>  98 files changed, 0 insertions(+), 0 deletions(-)
