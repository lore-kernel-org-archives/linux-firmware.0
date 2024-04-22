Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D64FC4345F
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Apr 2024 13:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E662C2BD11; Mon, 22 Apr 2024 13:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290C4C3277B
	for <linux-firmware@kernel.org>; Mon, 22 Apr 2024 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713792127;
	bh=Y/P6+vNu5nyPCxI1xy0P/+CsvP3M/GL3sRuaBRAZZok=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=EudpHUsxngzxHvsktSAlQIlT+NSRlV7k4JrMDEB86DBh9BH8P1W3dLRFOogO9+v88
	 p3Nyqyqxiq5S9JzdVKpLUOJeiYRa1uFr4qmGEuYYSakUpync5XYFEOedw9bMpJ/Z+X
	 GZmhZ4Q0PNxIyrc7kwjmMd7mddttGIJUNkOxloo63aS4k3y+q0OJ13bzMX4Tl9UQ+p
	 h3ZS5taybHPUjFFLburM2Tgjlug04A1C5tP3e4q59AXDyoJ8l5JIEdkLBBrldBgj/D
	 UPfYYG8HA1Lmt/+FmRjVerXDKxkzhqp+GaAj7BgQDfV/7Carn0Oo6tlZRW6RJPI4wP
	 AFcZk4ZgSMpWg==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de45d4ca525so4347106276.0
        for <linux-firmware@kernel.org>; Mon, 22 Apr 2024 06:22:07 -0700 (PDT)
X-Gm-Message-State: AOJu0YxdFeyOKBkDu/0CLzw9/7bMvqlz3GPv0eG7z7UrQA7C2RFV4jtw
	aCMEb6LyQ0FCzdPgG4CfIIEwbktVQsa+njs4JXicGshUzECC4xyNY1w6F/jY/jx5Lz4JAdwTVm4
	o69SmUTxqe+s0M/2dOhYxixFDGaE=
X-Google-Smtp-Source: AGHT+IFmG49GWFmo+emEJPL5eD6nJNhB5s6jgliL4CHHuyxw2Ezza+cZbsxIJT5SIZoUxMJZyiyxBowvyxAStija/f8=
X-Received: by 2002:a5b:60c:0:b0:dcf:6122:ccec with SMTP id
 d12-20020a5b060c000000b00dcf6122ccecmr10828003ybq.36.1713792126395; Mon, 22
 Apr 2024 06:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240420193852.3145666-1-alexander.deucher@amd.com>
In-Reply-To: <20240420193852.3145666-1-alexander.deucher@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 22 Apr 2024 09:21:55 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5tBE6Ls40ttovvWBGN4GKhKi-E0yeJuzWiRHq5t1cgaw@mail.gmail.com>
Message-ID: <CA+5PVA5tBE6Ls40ttovvWBGN4GKhKi-E0yeJuzWiRHq5t1cgaw@mail.gmail.com>
Subject: Re: [pull] amdgpu amd-2024-04-20
To: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 20, 2024 at 3:39=E2=80=AFPM Alex Deucher <alexander.deucher@amd=
.com> wrote:
>
> Hi,
>
> Updated amdgpu firmware and update license date.
>
> The following changes since commit 08c8fb2e3eee58aaaea6f2417d407aeb6a23d2=
c4:
>
>   amdgpu: update beige goby firmware (2024-04-12 00:05:22 -0400)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-04-20

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/199

josh

>
> for you to fetch changes up to 8871667128fbe11d5eca636f09bab1db89521702:
>
>   amdgpu: add DMCUB 3.5 firmware (2024-04-20 15:31:10 -0400)
>
> ----------------------------------------------------------------
> amd-2024-04-20:
>
> Update firmware from internal git commit:
> bcb1a6a525d92c69eee29c734b0d9c050214e7ce
>
> ----------------------------------------------------------------
> Alex Deucher (8):
>       amdgpu: update license date
>       amdgpu: add GC 11.5.0 firmware
>       amdgpu: add PSP 14.0.0  firmware
>       amdgpu: add SDMA 6.1.0 firmware
>       amdgpu: add UMSCH 4.0.0 firmware
>       amdgpu: add VCN 4.0.5 firmware
>       amdgpu: add VPE 6.1.0 firmware
>       amdgpu: add DMCUB 3.5 firmware
>
>  LICENSE.amdgpu             |   2 +-
>  WHENCE                     |  14 ++++++++++++++
>  amdgpu/dcn_3_5_dmcub.bin   | Bin 0 -> 391072 bytes
>  amdgpu/gc_11_5_0_imu.bin   | Bin 0 -> 132352 bytes
>  amdgpu/gc_11_5_0_me.bin    | Bin 0 -> 263424 bytes
>  amdgpu/gc_11_5_0_mec.bin   | Bin 0 -> 268704 bytes
>  amdgpu/gc_11_5_0_mes1.bin  | Bin 0 -> 233616 bytes
>  amdgpu/gc_11_5_0_mes_2.bin | Bin 0 -> 249536 bytes
>  amdgpu/gc_11_5_0_pfp.bin   | Bin 0 -> 263424 bytes
>  amdgpu/gc_11_5_0_rlc.bin   | Bin 0 -> 166528 bytes
>  amdgpu/psp_14_0_0_ta.bin   | Bin 0 -> 230400 bytes
>  amdgpu/psp_14_0_0_toc.bin  | Bin 0 -> 2560 bytes
>  amdgpu/sdma_6_1_0.bin      | Bin 0 -> 34560 bytes
>  amdgpu/umsch_mm_4_0_0.bin  | Bin 0 -> 386656 bytes
>  amdgpu/vcn_4_0_5.bin       | Bin 0 -> 388816 bytes
>  amdgpu/vpe_6_1_0.bin       | Bin 0 -> 25984 bytes
>  16 files changed, 15 insertions(+), 1 deletion(-)
>  create mode 100644 amdgpu/dcn_3_5_dmcub.bin
>  create mode 100644 amdgpu/gc_11_5_0_imu.bin
>  create mode 100644 amdgpu/gc_11_5_0_me.bin
>  create mode 100644 amdgpu/gc_11_5_0_mec.bin
>  create mode 100644 amdgpu/gc_11_5_0_mes1.bin
>  create mode 100644 amdgpu/gc_11_5_0_mes_2.bin
>  create mode 100644 amdgpu/gc_11_5_0_pfp.bin
>  create mode 100644 amdgpu/gc_11_5_0_rlc.bin
>  create mode 100644 amdgpu/psp_14_0_0_ta.bin
>  create mode 100644 amdgpu/psp_14_0_0_toc.bin
>  create mode 100644 amdgpu/sdma_6_1_0.bin
>  create mode 100644 amdgpu/umsch_mm_4_0_0.bin
>  create mode 100644 amdgpu/vcn_4_0_5.bin
>  create mode 100644 amdgpu/vpe_6_1_0.bin
