Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65286C4345F
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Apr 2024 13:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38AC6C113CD; Fri, 12 Apr 2024 13:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221C7C2BD10
	for <linux-firmware@kernel.org>; Fri, 12 Apr 2024 13:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712927113;
	bh=yU/cPr7eBjFbbPQgmHpONNFkrf1UI3XLuOERS/BuAmE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MbEXIRMCm6oFKxLctkEJEO7+lJi3LgQta/IpfVExhfnOrYLAZWshWQWxRtFCsM50V
	 KhjDqzNVQix+y1+7VmMrhyBiHqLGFCyyjPxoAwjoVk0eNT0airc/N7pa0BV/RTjb+u
	 LiD9mTGRZI7jimA1UttoqjcuDQmyBw8ZFY3wtP+twQLYwyol5IPxz3jFR+46D44RJc
	 /nAtwRB8r6CbH58dC4WD2jtx4UomfB1ln/YgnpkgLOGahgPqGGDtd9b/JCa96UfNNE
	 sdv8liySa2+DEvE67IOg4MS2jbob53gE4oEB2Hfo4+a6Cwb1QKl47PZ/dxiklJirEf
	 HRTmhdQnWsupA==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso801695276.2
        for <linux-firmware@kernel.org>; Fri, 12 Apr 2024 06:05:13 -0700 (PDT)
X-Gm-Message-State: AOJu0YyYm+pTk0vBwJIG+7JyGnulUqm75oGPWuKxq7O799W3ZVfwCUHn
	kUl4B8IrfIInLwECV8RTrjfkjcXx52iCPhmqgfm6rgLfSOQxV2VaY1Ut4e2qJ/IfHoJd+z0qyfj
	aTOgqnx9a0EGmSEPotPKmMfCKqvs=
X-Google-Smtp-Source: AGHT+IF2OZByFYJ8wxz1kpUhHzG1J9IPAwSNYI6ZocVwVJnbMG1QDfOqvEz309j9qZhU9W4gD9JLXsx1mwlb1Rw1ONc=
X-Received: by 2002:a25:6607:0:b0:dda:bf8c:f278 with SMTP id
 a7-20020a256607000000b00ddabf8cf278mr2408724ybc.47.1712927112239; Fri, 12 Apr
 2024 06:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240412041233.913754-1-alexander.deucher@amd.com>
In-Reply-To: <20240412041233.913754-1-alexander.deucher@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 12 Apr 2024 09:05:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4MCoWy=GNEF2_afCSFo9DLVEfLenKDeyVQEXXP5r9niQ@mail.gmail.com>
Message-ID: <CA+5PVA4MCoWy=GNEF2_afCSFo9DLVEfLenKDeyVQEXXP5r9niQ@mail.gmail.com>
Subject: Re: [pull] amdgpu firmware amd-2024-04-12
To: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 12:12=E2=80=AFAM Alex Deucher <alexander.deucher@am=
d.com> wrote:
>
> Hi,
>
> Updated AMD GPU firmwares.
>
> The following changes since commit d9876ab4e6943640f497f314679db341821bcf=
e2:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-03-25 22:30:12 +08=
00)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-04-12

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/192

josh

>
> for you to fetch changes up to 08c8fb2e3eee58aaaea6f2417d407aeb6a23d2c4:
>
>   amdgpu: update beige goby firmware (2024-04-12 00:05:22 -0400)
>
> ----------------------------------------------------------------
> amd-2024-04-12:
>
> update firmware from internal git commit:
> 2bccf1a6d5d71a9bfc01d8f746dea73dacddca4e
>
> ----------------------------------------------------------------
> Alex Deucher (48):
>       amdgpu: update gc 10.3.7 firmware
>       amdgpu: update psp 13.0.8 firmware
>       amdgpu: update aldebaran firmware
>       amdgpu: update  firmware
>       amdgpu: update gc 11.0.0 firmware
>       amdgpu: update psp 13.0.0 firmware
>       amdgpu: update sdma 6.0.0 firmware
>       amdgpu: update smu 13.0.0 firmware
>       amdgpu: update vcn 4.0.0 firmware
>       amdgpu: update gc 9.4.3 firmware
>       amdgpu: update psp 13.0.6 firmware
>       amdgpu: update smu 13.0.6 firmware
>       amdgpu: update vcn 4.0.3 firmware
>       amdgpu: update navi10 firmware
>       amdgpu: update vangogh firmware
>       amdgpu: update arcturus firmware
>       amdgpu: update navi12 firmware
>       amdgpu: update gc 10.3.6 firmware
>       amdgpu: update psp 13.0.5 firmware
>       amdgpu: update vcn 3.1.2 firmware
>       amdgpu: update gc 11.0.3 firmware
>       amdgpu: update psp 13.0.10 firmware
>       amdgpu: update sdma 6.0.3 firmware
>       amdgpu: update smu 13.0.10 firmware
>       amdgpu: update navi14 firmware
>       amdgpu: update raven firmware
>       amdgpu: update vega10 firmware
>       amdgpu: update gc 11.0.2 firmware
>       amdgpu: update ipsp 13.0.7 firmware
>       amdgpu: update sdma 6.0.2 firmware
>       amdgpu: update smu 13.0.7 firmware
>       amdgpu: update vcn 4.0.4 firmware
>       amdgpu: update raven2 firmware
>       amdgpu: update vega12 firmware
>       amdgpu: update green sardine firmware
>       amdgpu: update yellow carp firmware
>       amdgpu: update vega20 firmware
>       amdgpu: update sienna cichlid firmware
>       amdgpu: update gc 11.0.1 firmware
>       amdgpu: update psp 13.0.4 firmware
>       amdgpu: update sdma 6.0.1 firmware
>       amdgpu: update vcn 4.0.2 firmware
>       amdgpu: update renoir firmware
>       amdgpu: update navy flounder firmware
>       amdgpu: update gc 11.0.4 firmware
>       amdgpu: update psp 13.0.11 firmware
>       amdgpu: update dimgrey cavefish firmware
>       amdgpu: update beige goby firmware
>
>  amdgpu/aldebaran_mec.bin         | Bin 268576 -> 268576 bytes
>  amdgpu/aldebaran_mec2.bin        | Bin 268576 -> 268576 bytes
>  amdgpu/arcturus_mec.bin          | Bin 268576 -> 268560 bytes
>  amdgpu/arcturus_mec2.bin         | Bin 268576 -> 268560 bytes
>  amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
>  amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/beige_goby_mec.bin        | Bin 268720 -> 268720 bytes
>  amdgpu/beige_goby_mec2.bin       | Bin 268720 -> 268720 bytes
>  amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
>  amdgpu/beige_goby_ta.bin         | Bin 234752 -> 238848 bytes
>  amdgpu/beige_goby_vcn.bin        | Bin 583536 -> 586992 bytes
>  amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
>  amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
>  amdgpu/dimgrey_cavefish_mec.bin  | Bin 268720 -> 268720 bytes
>  amdgpu/dimgrey_cavefish_mec2.bin | Bin 268720 -> 268720 bytes
>  amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
>  amdgpu/dimgrey_cavefish_ta.bin   | Bin 234752 -> 238848 bytes
>  amdgpu/dimgrey_cavefish_vcn.bin  | Bin 583536 -> 586992 bytes
>  amdgpu/gc_10_3_6_ce.bin          | Bin 263296 -> 263296 bytes
>  amdgpu/gc_10_3_6_me.bin          | Bin 263424 -> 263424 bytes
>  amdgpu/gc_10_3_6_mec.bin         | Bin 268592 -> 268720 bytes
>  amdgpu/gc_10_3_6_mec2.bin        | Bin 268592 -> 268720 bytes
>  amdgpu/gc_10_3_6_pfp.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_10_3_7_ce.bin          | Bin 263296 -> 263296 bytes
>  amdgpu/gc_10_3_7_me.bin          | Bin 263424 -> 263424 bytes
>  amdgpu/gc_10_3_7_mec.bin         | Bin 268592 -> 268720 bytes
>  amdgpu/gc_10_3_7_mec2.bin        | Bin 268592 -> 268720 bytes
>  amdgpu/gc_10_3_7_pfp.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_0_imu.bin         | Bin 132352 -> 132352 bytes
>  amdgpu/gc_11_0_0_me.bin          | Bin 379952 -> 310768 bytes
>  amdgpu/gc_11_0_0_mec.bin         | Bin 407072 -> 407072 bytes
>  amdgpu/gc_11_0_0_mes1.bin        | Bin 216032 -> 216928 bytes
>  amdgpu/gc_11_0_0_mes_2.bin       | Bin 242512 -> 249872 bytes
>  amdgpu/gc_11_0_0_pfp.bin         | Bin 229152 -> 229280 bytes
>  amdgpu/gc_11_0_0_rlc.bin         | Bin 185248 -> 185248 bytes
>  amdgpu/gc_11_0_0_rlc_1.bin       | Bin 185248 -> 185248 bytes
>  amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_1_mec.bin         | Bin 268640 -> 268704 bytes
>  amdgpu/gc_11_0_1_mes_2.bin       | Bin 244016 -> 246896 bytes
>  amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_1_rlc.bin         | Bin 160592 -> 160592 bytes
>  amdgpu/gc_11_0_2_imu.bin         | Bin 132352 -> 132352 bytes
>  amdgpu/gc_11_0_2_me.bin          | Bin 379952 -> 310768 bytes
>  amdgpu/gc_11_0_2_mec.bin         | Bin 407072 -> 407072 bytes
>  amdgpu/gc_11_0_2_mes1.bin        | Bin 217184 -> 217408 bytes
>  amdgpu/gc_11_0_2_mes_2.bin       | Bin 244144 -> 249872 bytes
>  amdgpu/gc_11_0_2_pfp.bin         | Bin 229024 -> 229296 bytes
>  amdgpu/gc_11_0_2_rlc.bin         | Bin 178720 -> 178720 bytes
>  amdgpu/gc_11_0_3_imu.bin         | Bin 132352 -> 132352 bytes
>  amdgpu/gc_11_0_3_me.bin          | Bin 379968 -> 310784 bytes
>  amdgpu/gc_11_0_3_mec.bin         | Bin 407072 -> 407072 bytes
>  amdgpu/gc_11_0_3_mes1.bin        | Bin 216928 -> 216992 bytes
>  amdgpu/gc_11_0_3_mes_2.bin       | Bin 244208 -> 249936 bytes
>  amdgpu/gc_11_0_3_pfp.bin         | Bin 229024 -> 229296 bytes
>  amdgpu/gc_11_0_3_rlc.bin         | Bin 178976 -> 178976 bytes
>  amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_4_mec.bin         | Bin 268704 -> 268640 bytes
>  amdgpu/gc_11_0_4_mes_2.bin       | Bin 242384 -> 249472 bytes
>  amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_4_rlc.bin         | Bin 158752 -> 158752 bytes
>  amdgpu/gc_9_4_3_mec.bin          | Bin 269200 -> 269200 bytes
>  amdgpu/gc_9_4_3_rlc.bin          | Bin 48076 -> 48076 bytes
>  amdgpu/green_sardine_asd.bin     | Bin 188928 -> 193024 bytes
>  amdgpu/green_sardine_ce.bin      | Bin 36608 -> 36608 bytes
>  amdgpu/green_sardine_me.bin      | Bin 69376 -> 69376 bytes
>  amdgpu/green_sardine_mec.bin     | Bin 268048 -> 268064 bytes
>  amdgpu/green_sardine_mec2.bin    | Bin 268048 -> 268064 bytes
>  amdgpu/green_sardine_pfp.bin     | Bin 85760 -> 85760 bytes
>  amdgpu/green_sardine_ta.bin      | Bin 33536 -> 33536 bytes
>  amdgpu/green_sardine_vcn.bin     | Bin 403392 -> 403392 bytes
>  amdgpu/navi10_asd.bin            | Bin 188928 -> 193024 bytes
>  amdgpu/navi10_ce.bin             | Bin 263296 -> 263296 bytes
>  amdgpu/navi10_me.bin             | Bin 263424 -> 263424 bytes
>  amdgpu/navi10_mec.bin            | Bin 268592 -> 268720 bytes
>  amdgpu/navi10_mec2.bin           | Bin 268592 -> 268720 bytes
>  amdgpu/navi10_pfp.bin            | Bin 263424 -> 263424 bytes
>  amdgpu/navi10_sos.bin            | Bin 184512 -> 184512 bytes
>  amdgpu/navi10_ta.bin             | Bin 33536 -> 33536 bytes
>  amdgpu/navi12_asd.bin            | Bin 188928 -> 193024 bytes
>  amdgpu/navi12_ce.bin             | Bin 263296 -> 263296 bytes
>  amdgpu/navi12_me.bin             | Bin 263424 -> 263424 bytes
>  amdgpu/navi12_mec.bin            | Bin 268592 -> 268720 bytes
>  amdgpu/navi12_mec2.bin           | Bin 268592 -> 268720 bytes
>  amdgpu/navi12_pfp.bin            | Bin 263424 -> 263424 bytes
>  amdgpu/navi12_ta.bin             | Bin 33536 -> 33536 bytes
>  amdgpu/navi12_vcn.bin            | Bin 403392 -> 403392 bytes
>  amdgpu/navi14_asd.bin            | Bin 188928 -> 193024 bytes
>  amdgpu/navi14_ta.bin             | Bin 33536 -> 33536 bytes
>  amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
>  amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
>  amdgpu/navy_flounder_mec.bin     | Bin 268720 -> 268720 bytes
>  amdgpu/navy_flounder_mec2.bin    | Bin 268720 -> 268720 bytes
>  amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
>  amdgpu/navy_flounder_sos.bin     | Bin 218608 -> 218608 bytes
>  amdgpu/navy_flounder_ta.bin      | Bin 234752 -> 238848 bytes
>  amdgpu/navy_flounder_vcn.bin     | Bin 583536 -> 586992 bytes
>  amdgpu/picasso_asd.bin           | Bin 188928 -> 193024 bytes
>  amdgpu/picasso_ce.bin            | Bin 9344 -> 9344 bytes
>  amdgpu/picasso_me.bin            | Bin 17536 -> 17536 bytes
>  amdgpu/picasso_mec.bin           | Bin 268048 -> 268064 bytes
>  amdgpu/picasso_mec2.bin          | Bin 268048 -> 268064 bytes
>  amdgpu/picasso_pfp.bin           | Bin 21632 -> 21632 bytes
>  amdgpu/picasso_ta.bin            | Bin 41984 -> 41984 bytes
>  amdgpu/psp_13_0_0_sos.bin        | Bin 268304 -> 268304 bytes
>  amdgpu/psp_13_0_0_ta.bin         | Bin 242944 -> 251136 bytes
>  amdgpu/psp_13_0_10_sos.bin       | Bin 360352 -> 360352 bytes
>  amdgpu/psp_13_0_10_ta.bin        | Bin 235392 -> 243136 bytes
>  amdgpu/psp_13_0_11_ta.bin        | Bin 226304 -> 234496 bytes
>  amdgpu/psp_13_0_4_ta.bin         | Bin 230400 -> 234496 bytes
>  amdgpu/psp_13_0_5_asd.bin        | Bin 188928 -> 193024 bytes
>  amdgpu/psp_13_0_5_ta.bin         | Bin 222208 -> 226304 bytes
>  amdgpu/psp_13_0_6_sos.bin        | Bin 385056 -> 385312 bytes
>  amdgpu/psp_13_0_6_ta.bin         | Bin 63808 -> 67904 bytes
>  amdgpu/psp_13_0_7_ta.bin         | Bin 222208 -> 226304 bytes
>  amdgpu/psp_13_0_8_ta.bin         | Bin 222208 -> 226304 bytes
>  amdgpu/raven2_asd.bin            | Bin 184832 -> 193024 bytes
>  amdgpu/raven2_ce.bin             | Bin 9344 -> 9344 bytes
>  amdgpu/raven2_me.bin             | Bin 17536 -> 17536 bytes
>  amdgpu/raven2_mec.bin            | Bin 268048 -> 268064 bytes
>  amdgpu/raven2_mec2.bin           | Bin 268048 -> 268064 bytes
>  amdgpu/raven2_pfp.bin            | Bin 21632 -> 21632 bytes
>  amdgpu/raven2_ta.bin             | Bin 33536 -> 33536 bytes
>  amdgpu/raven_asd.bin             | Bin 188928 -> 193024 bytes
>  amdgpu/raven_ce.bin              | Bin 9344 -> 9344 bytes
>  amdgpu/raven_me.bin              | Bin 17536 -> 17536 bytes
>  amdgpu/raven_mec.bin             | Bin 268048 -> 268064 bytes
>  amdgpu/raven_mec2.bin            | Bin 268048 -> 268064 bytes
>  amdgpu/raven_pfp.bin             | Bin 21632 -> 21632 bytes
>  amdgpu/raven_ta.bin              | Bin 33536 -> 33536 bytes
>  amdgpu/renoir_asd.bin            | Bin 188928 -> 193024 bytes
>  amdgpu/renoir_ce.bin             | Bin 9344 -> 9344 bytes
>  amdgpu/renoir_me.bin             | Bin 17536 -> 17536 bytes
>  amdgpu/renoir_mec.bin            | Bin 268048 -> 268064 bytes
>  amdgpu/renoir_mec2.bin           | Bin 268048 -> 268064 bytes
>  amdgpu/renoir_pfp.bin            | Bin 21632 -> 21632 bytes
>  amdgpu/renoir_ta.bin             | Bin 41984 -> 41984 bytes
>  amdgpu/renoir_vcn.bin            | Bin 403392 -> 403392 bytes
>  amdgpu/sdma_6_0_0.bin            | Bin 34560 -> 34560 bytes
>  amdgpu/sdma_6_0_1.bin            | Bin 34560 -> 34560 bytes
>  amdgpu/sdma_6_0_2.bin            | Bin 34560 -> 34560 bytes
>  amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
>  amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
>  amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
>  amdgpu/sienna_cichlid_mec.bin    | Bin 268720 -> 268720 bytes
>  amdgpu/sienna_cichlid_mec2.bin   | Bin 268720 -> 268720 bytes
>  amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
>  amdgpu/sienna_cichlid_ta.bin     | Bin 362240 -> 366336 bytes
>  amdgpu/sienna_cichlid_vcn.bin    | Bin 583536 -> 586992 bytes
>  amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
>  amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
>  amdgpu/smu_13_0_6.bin            | Bin 2584 -> 2584 bytes
>  amdgpu/smu_13_0_7.bin            | Bin 287080 -> 287080 bytes
>  amdgpu/vangogh_asd.bin           | Bin 188928 -> 193024 bytes
>  amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
>  amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
>  amdgpu/vangogh_mec.bin           | Bin 268720 -> 268720 bytes
>  amdgpu/vangogh_mec2.bin          | Bin 268720 -> 268720 bytes
>  amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
>  amdgpu/vcn_3_1_2.bin             | Bin 575792 -> 579120 bytes
>  amdgpu/vcn_4_0_0.bin             | Bin 387792 -> 389584 bytes
>  amdgpu/vcn_4_0_2.bin             | Bin 387792 -> 389584 bytes
>  amdgpu/vcn_4_0_3.bin             | Bin 384720 -> 389456 bytes
>  amdgpu/vcn_4_0_4.bin             | Bin 387792 -> 389584 bytes
>  amdgpu/vega10_asd.bin            | Bin 184832 -> 193024 bytes
>  amdgpu/vega10_ce.bin             | Bin 9344 -> 9344 bytes
>  amdgpu/vega10_me.bin             | Bin 17536 -> 17536 bytes
>  amdgpu/vega10_mec.bin            | Bin 268048 -> 268064 bytes
>  amdgpu/vega10_mec2.bin           | Bin 268048 -> 268064 bytes
>  amdgpu/vega10_pfp.bin            | Bin 21632 -> 21632 bytes
>  amdgpu/vega12_asd.bin            | Bin 188928 -> 193024 bytes
>  amdgpu/vega12_ce.bin             | Bin 9344 -> 9344 bytes
>  amdgpu/vega12_me.bin             | Bin 17536 -> 17536 bytes
>  amdgpu/vega12_mec.bin            | Bin 268048 -> 268064 bytes
>  amdgpu/vega12_mec2.bin           | Bin 268048 -> 268064 bytes
>  amdgpu/vega12_pfp.bin            | Bin 21632 -> 21632 bytes
>  amdgpu/vega20_asd.bin            | Bin 184832 -> 193024 bytes
>  amdgpu/vega20_ce.bin             | Bin 9344 -> 9344 bytes
>  amdgpu/vega20_me.bin             | Bin 17536 -> 17536 bytes
>  amdgpu/vega20_mec.bin            | Bin 268048 -> 268064 bytes
>  amdgpu/vega20_mec2.bin           | Bin 268048 -> 268064 bytes
>  amdgpu/vega20_pfp.bin            | Bin 21632 -> 21632 bytes
>  amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
>  amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
>  amdgpu/yellow_carp_mec.bin       | Bin 268720 -> 268720 bytes
>  amdgpu/yellow_carp_mec2.bin      | Bin 268720 -> 268720 bytes
>  amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
>  amdgpu/yellow_carp_ta.bin        | Bin 222208 -> 226304 bytes
>  amdgpu/yellow_carp_vcn.bin       | Bin 575792 -> 579248 bytes
>  188 files changed, 0 insertions(+), 0 deletions(-)
