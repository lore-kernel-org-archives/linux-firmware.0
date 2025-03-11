Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4475DC282EC
	for <linux-firmware@archiver.kernel.org>; Tue, 11 Mar 2025 18:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A466C4CEEC; Tue, 11 Mar 2025 18:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B4AC4CEE9
	for <linux-firmware@kernel.org>; Tue, 11 Mar 2025 18:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741718110;
	bh=TcFn+tENhg6h5QHCJW7qKozkllX7czTsFXpk4axHz+I=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=gdaDUN7McvymZB4qrY9qeSytwFwRuRYqR3+Tr7+oJ/ZnurXfUjW6cG9+aqf4Ep6yU
	 G3kWjSYBmDk1vgBxIIDCW1xUjB1dDL73nnzeCAK+t5A0qfsdIXW8VVuom0+0Rm6ZNl
	 cD4dqPV9Q46GO6qB9Fd25uDYP8NdXrSr/sQQl885ov/PYNj55qq/xd42ncFV7wGtQa
	 3lRrmOIXN9rzEDH1MjnMhm80ZNn+mz1riY45uUXaD5e2Oh0xtDubRAfsLnLfekZLIl
	 Fah7sFfo0uID7ACQTwKE+HylfV3c4KprbIKdNZlQ+CA6cN1SBq4QA9csWYQhwF0c41
	 DkOzOhBrLHJaw==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e60cab0f287so4033229276.0
        for <linux-firmware@kernel.org>; Tue, 11 Mar 2025 11:35:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YywKK0soRdiaozcdw/GPWAjGDf3j5hlK0FmK/LB5x5ITMUCHlhh
	z3P5RrPU+KCtcxedim7z9/yiG4fncBqGhYt+V9BJtC+WIBJ2UbiltExCYlP05o+uOYFWHFzUTIu
	l/Gbd2w5kNWbd03SAjBuiLteLsfs=
X-Google-Smtp-Source: AGHT+IG1m1ZLAOGiK9/TsLq5+SGiRy+3eAD07xnrd3vLh6Mb1Apa2eVoN9a7P2h9FA167p81cCqQofx97tyZt2c9ulQ=
X-Received: by 2002:a05:6902:161e:b0:e63:6f6a:ab03 with SMTP id
 3f1490d57ef6-e63720da68cmr18171769276.22.1741718110055; Tue, 11 Mar 2025
 11:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250311152219.1950725-1-alexander.deucher@amd.com>
In-Reply-To: <20250311152219.1950725-1-alexander.deucher@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 11 Mar 2025 14:34:58 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6907xK5_kzGw36OqdiHrmzS4hPZZOC9uprc+0Z_-As1w@mail.gmail.com>
X-Gm-Features: AQ5f1JpFZISAstP2qdeXpdI6h_YlO44Q4ejQn_euFkbOB6f1WSPkXAoPRR4SdbU
Message-ID: <CA+5PVA6907xK5_kzGw36OqdiHrmzS4hPZZOC9uprc+0Z_-As1w@mail.gmail.com>
Subject: Re: [pull] AMD GPU firmware amd-2025-03-11
To: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Mario.Limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/478

josh

On Tue, Mar 11, 2025 at 11:22=E2=80=AFAM Alex Deucher <alexander.deucher@am=
d.com> wrote:
>
> Hi,
>
> Updated AMD GPU firmware.
>
> The following changes since commit c2c0e64a1b022724dc3b1b10bba9a4ab1b6058=
7d:
>
>   amdgpu: DMCUB updates for various ASICs (2025-03-10 17:23:31 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-03-11
>
> for you to fetch changes up to 1ed4e37c32eee7c6ae6fd8463509922635867cba:
>
>   amdgpu: update psp 14.0.0 firmware (2025-03-11 11:10:37 -0400)
>
> ----------------------------------------------------------------
> amd-2025-03-11:
>
> update GPU firmwares.
>
> ----------------------------------------------------------------
> Alex Deucher (46):
>       amdgpu: update aldebaran firmware
>       amdgpu: update dimgrey cavefish firmware
>       amdgpu: update gc 11.0.4 firmware
>       amdgpu: update gc 11.5.1 firmware
>       amdgpu: update psp 14.0.1 firmware
>       amdgpu: update gc 10.3.7 firmware
>       amdgpu: update beige goby firmware
>       amdgpu: update gc 9.4.3 firmware
>       amdgpu: update psp 13.0.6 firmware
>       amdgpu: update gc 9.4.4 firmware
>       amdgpu: update psp 13.0.14 firmware
>       amdgpu: update gc 11.0.0 firmware
>       amdgpu: update psp 13.0.0 firmware
>       amdgpu: update vcn 4.0.0 firmware
>       amdgpu: update picasso firmware
>       amdgpu: update vangogh firmware
>       amdgpu: update gc 11.0.3 firmware
>       amdgpu: update psp 13.0.10 firmware
>       amdgpu: update navi12 firmware
>       amdgpu: update navi10 firmware
>       amdgpu: update gc 10.3.6 firmware
>       amdgpu: update vcn 3.1.2 firmware
>       amdgpu: update vega10 firmware
>       amdgpu: update gc 11.0.2 firmware
>       amdgpu: update psp 13.0.7 firmware
>       amdgpu: update vcn 4.0.4 firmware
>       amdgpu: update vega12 firmware
>       amdgpu: update navi14 firmware
>       amdgpu: update vega20 firmware
>       amdgpu: update gc 12.0.0 firmware
>       amdgpu: update psp 14.0.2 firmware
>       amdgpu: update smu 14.0.2 firmware
>       amdgpu: update yellow carp firmware
>       amdgpu: update sienna cichlid firmware
>       amdgpu: update gc 12.0.1 firmware
>       amdgpu: update gc 14.0.3 firmware
>       amdgpu: update sdma 7.0.1 firmware
>       amdgpu: update smu 14.0.3 firmware
>       amdgpu: update vcn 5.0.0 firmware
>       amdgpu: update gc 11.5.2 firmware
>       amdgpu: update navy flounder firmware
>       amdgpu: update gc 11.0.1 firmware
>       amdgpu: update psp 13.0.4 firmware
>       amdgpu: update vcn 4.0.2 firmware
>       amdgpu: update gc 11.5.0 firmware
>       amdgpu: update psp 14.0.0 firmware
>
>  amdgpu/aldebaran_mec.bin         | Bin 268736 -> 268736 bytes
>  amdgpu/aldebaran_mec2.bin        | Bin 268736 -> 268736 bytes
>  amdgpu/aldebaran_sjt_mec.bin     | Bin 268736 -> 268736 bytes
>  amdgpu/aldebaran_sjt_mec2.bin    | Bin 268736 -> 268736 bytes
>  amdgpu/aldebaran_smc.bin         | Bin 242688 -> 242688 bytes
>  amdgpu/aldebaran_sos.bin         | Bin 442080 -> 446176 bytes
>  amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
>  amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/beige_goby_mec.bin        | Bin 268160 -> 268160 bytes
>  amdgpu/beige_goby_mec2.bin       | Bin 268160 -> 268160 bytes
>  amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
>  amdgpu/beige_goby_ta.bin         | Bin 247040 -> 247040 bytes
>  amdgpu/beige_goby_vcn.bin        | Bin 579440 -> 579696 bytes
>  amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
>  amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
>  amdgpu/dimgrey_cavefish_mec.bin  | Bin 268160 -> 268160 bytes
>  amdgpu/dimgrey_cavefish_mec2.bin | Bin 268160 -> 268160 bytes
>  amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
>  amdgpu/dimgrey_cavefish_ta.bin   | Bin 247040 -> 247040 bytes
>  amdgpu/dimgrey_cavefish_vcn.bin  | Bin 587376 -> 579696 bytes
>  amdgpu/gc_10_3_6_ce.bin          | Bin 263296 -> 263296 bytes
>  amdgpu/gc_10_3_6_me.bin          | Bin 263424 -> 263424 bytes
>  amdgpu/gc_10_3_6_mec.bin         | Bin 268720 -> 268160 bytes
>  amdgpu/gc_10_3_6_mec2.bin        | Bin 268720 -> 268160 bytes
>  amdgpu/gc_10_3_6_pfp.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_10_3_7_ce.bin          | Bin 263296 -> 263296 bytes
>  amdgpu/gc_10_3_7_me.bin          | Bin 263424 -> 263424 bytes
>  amdgpu/gc_10_3_7_mec.bin         | Bin 268720 -> 268160 bytes
>  amdgpu/gc_10_3_7_mec2.bin        | Bin 268720 -> 268160 bytes
>  amdgpu/gc_10_3_7_pfp.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_0_me.bin          | Bin 314528 -> 314528 bytes
>  amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
>  amdgpu/gc_11_0_0_mes1.bin        | Bin 218080 -> 218080 bytes
>  amdgpu/gc_11_0_0_mes_2.bin       | Bin 256000 -> 256288 bytes
>  amdgpu/gc_11_0_0_pfp.bin         | Bin 230480 -> 230496 bytes
>  amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_1_mec.bin         | Bin 268704 -> 268640 bytes
>  amdgpu/gc_11_0_1_mes_2.bin       | Bin 256064 -> 255824 bytes
>  amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_2_me.bin          | Bin 314512 -> 314512 bytes
>  amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
>  amdgpu/gc_11_0_2_mes1.bin        | Bin 218400 -> 218400 bytes
>  amdgpu/gc_11_0_2_mes_2.bin       | Bin 256000 -> 256288 bytes
>  amdgpu/gc_11_0_2_pfp.bin         | Bin 230480 -> 230496 bytes
>  amdgpu/gc_11_0_2_rlc.bin         | Bin 178720 -> 178848 bytes
>  amdgpu/gc_11_0_3_me.bin          | Bin 314528 -> 314528 bytes
>  amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
>  amdgpu/gc_11_0_3_mes1.bin        | Bin 218144 -> 218144 bytes
>  amdgpu/gc_11_0_3_mes_2.bin       | Bin 256064 -> 256352 bytes
>  amdgpu/gc_11_0_3_pfp.bin         | Bin 230480 -> 230496 bytes
>  amdgpu/gc_11_0_4_mes_2.bin       | Bin 256064 -> 256080 bytes
>  amdgpu/gc_11_5_0_me.bin          | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_5_0_mec.bin         | Bin 268704 -> 268160 bytes
>  amdgpu/gc_11_5_0_mes_2.bin       | Bin 256160 -> 256144 bytes
>  amdgpu/gc_11_5_0_pfp.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_5_0_rlc.bin         | Bin 166528 -> 166528 bytes
>  amdgpu/gc_11_5_1_me.bin          | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_5_1_mec.bin         | Bin 268704 -> 268160 bytes
>  amdgpu/gc_11_5_1_pfp.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_5_1_rlc.bin         | Bin 161040 -> 161040 bytes
>  amdgpu/gc_11_5_2_imu.bin         | Bin 132352 -> 132352 bytes
>  amdgpu/gc_11_5_2_me.bin          | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_5_2_mec.bin         | Bin 268640 -> 268640 bytes
>  amdgpu/gc_11_5_2_mes_2.bin       | Bin 255200 -> 256080 bytes
>  amdgpu/gc_11_5_2_pfp.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_12_0_0_imu.bin         | Bin 132352 -> 132352 bytes
>  amdgpu/gc_12_0_0_me.bin          | Bin 410688 -> 422656 bytes
>  amdgpu/gc_12_0_0_mec.bin         | Bin 447456 -> 447456 bytes
>  amdgpu/gc_12_0_0_pfp.bin         | Bin 350992 -> 351696 bytes
>  amdgpu/gc_12_0_0_rlc.bin         | Bin 150704 -> 150704 bytes
>  amdgpu/gc_12_0_0_uni_mes.bin     | Bin 709520 -> 711488 bytes
>  amdgpu/gc_12_0_1_imu.bin         | Bin 132352 -> 132352 bytes
>  amdgpu/gc_12_0_1_me.bin          | Bin 410784 -> 422656 bytes
>  amdgpu/gc_12_0_1_mec.bin         | Bin 447456 -> 447456 bytes
>  amdgpu/gc_12_0_1_pfp.bin         | Bin 351024 -> 351696 bytes
>  amdgpu/gc_12_0_1_rlc.bin         | Bin 150848 -> 150848 bytes
>  amdgpu/gc_12_0_1_uni_mes.bin     | Bin 709520 -> 711488 bytes
>  amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
>  amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>  amdgpu/gc_9_4_4_mec.bin          | Bin 268736 -> 268736 bytes
>  amdgpu/gc_9_4_4_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>  amdgpu/navi10_asd.bin            | Bin 197120 -> 197120 bytes
>  amdgpu/navi10_ce.bin             | Bin 263296 -> 263296 bytes
>  amdgpu/navi10_me.bin             | Bin 263424 -> 263424 bytes
>  amdgpu/navi10_mec.bin            | Bin 268592 -> 268160 bytes
>  amdgpu/navi10_mec2.bin           | Bin 268592 -> 268160 bytes
>  amdgpu/navi10_pfp.bin            | Bin 263424 -> 263424 bytes
>  amdgpu/navi12_asd.bin            | Bin 197120 -> 197120 bytes
>  amdgpu/navi12_ce.bin             | Bin 263296 -> 263296 bytes
>  amdgpu/navi12_me.bin             | Bin 263424 -> 263424 bytes
>  amdgpu/navi12_mec.bin            | Bin 268592 -> 268160 bytes
>  amdgpu/navi12_mec2.bin           | Bin 268592 -> 268160 bytes
>  amdgpu/navi12_pfp.bin            | Bin 263424 -> 263424 bytes
>  amdgpu/navi14_asd.bin            | Bin 197120 -> 197120 bytes
>  amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
>  amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
>  amdgpu/navy_flounder_mec.bin     | Bin 268160 -> 268160 bytes
>  amdgpu/navy_flounder_mec2.bin    | Bin 268160 -> 268160 bytes
>  amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
>  amdgpu/navy_flounder_ta.bin      | Bin 247040 -> 247040 bytes
>  amdgpu/navy_flounder_vcn.bin     | Bin 587376 -> 579696 bytes
>  amdgpu/picasso_ta.bin            | Bin 41984 -> 46080 bytes
>  amdgpu/psp_13_0_0_ta.bin         | Bin 259328 -> 259328 bytes
>  amdgpu/psp_13_0_10_ta.bin        | Bin 251328 -> 251328 bytes
>  amdgpu/psp_13_0_14_sos.bin       | Bin 389408 -> 389408 bytes
>  amdgpu/psp_13_0_4_ta.bin         | Bin 238592 -> 238592 bytes
>  amdgpu/psp_13_0_6_sos.bin        | Bin 782912 -> 782944 bytes
>  amdgpu/psp_13_0_6_ta.bin         | Bin 88960 -> 88960 bytes
>  amdgpu/psp_13_0_7_ta.bin         | Bin 234496 -> 234496 bytes
>  amdgpu/psp_14_0_0_ta.bin         | Bin 234496 -> 238592 bytes
>  amdgpu/psp_14_0_1_toc.bin        | Bin 2560 -> 2560 bytes
>  amdgpu/psp_14_0_2_sos.bin        | Bin 417120 -> 421216 bytes
>  amdgpu/psp_14_0_2_ta.bin         | Bin 258016 -> 258016 bytes
>  amdgpu/psp_14_0_3_sos.bin        | Bin 435632 -> 435632 bytes
>  amdgpu/psp_14_0_3_ta.bin         | Bin 270624 -> 270624 bytes
>  amdgpu/sdma_7_0_1.bin            | Bin 45824 -> 46336 bytes
>  amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
>  amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
>  amdgpu/sienna_cichlid_mec.bin    | Bin 268160 -> 268160 bytes
>  amdgpu/sienna_cichlid_mec2.bin   | Bin 268160 -> 268160 bytes
>  amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
>  amdgpu/sienna_cichlid_ta.bin     | Bin 374528 -> 374528 bytes
>  amdgpu/sienna_cichlid_vcn.bin    | Bin 587376 -> 579696 bytes
>  amdgpu/smu_14_0_2.bin            | Bin 333236 -> 333236 bytes
>  amdgpu/smu_14_0_3.bin            | Bin 333236 -> 333236 bytes
>  amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
>  amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
>  amdgpu/vangogh_mec.bin           | Bin 268160 -> 267920 bytes
>  amdgpu/vangogh_mec2.bin          | Bin 268160 -> 267920 bytes
>  amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
>  amdgpu/vcn_3_1_2.bin             | Bin 579376 -> 571952 bytes
>  amdgpu/vcn_4_0_0.bin             | Bin 395632 -> 395632 bytes
>  amdgpu/vcn_4_0_2.bin             | Bin 395632 -> 395632 bytes
>  amdgpu/vcn_4_0_4.bin             | Bin 395632 -> 395632 bytes
>  amdgpu/vcn_5_0_0.bin             | Bin 438288 -> 440848 bytes
>  amdgpu/vega10_asd.bin            | Bin 197120 -> 197120 bytes
>  amdgpu/vega12_asd.bin            | Bin 197120 -> 197120 bytes
>  amdgpu/vega20_asd.bin            | Bin 197120 -> 197120 bytes
>  amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
>  amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
>  amdgpu/yellow_carp_mec.bin       | Bin 268160 -> 268160 bytes
>  amdgpu/yellow_carp_mec2.bin      | Bin 268160 -> 268160 bytes
>  amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
>  amdgpu/yellow_carp_vcn.bin       | Bin 579504 -> 571440 bytes
>  144 files changed, 0 insertions(+), 0 deletions(-)
