Return-Path: <superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CB5CD3436
	for <linux-firmware@archiver.kernel.org>; Thu,  7 May 2026 01:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 250BAC2BCB2; Thu,  7 May 2026 01:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3163C2BCB0;
	Thu,  7 May 2026 01:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778117292;
	bh=Jp3GeS07IZBdJecpKTfOrdg0y1aoCiHgzvq9E7E+6C8=;
	h=Date:Subject:List-Id:To:References:From:In-Reply-To:From;
	b=ASrxOk8MM2yZLS1vUGuXVujAAjOUgS9Yz+QxNNNMj4Cwy7HkYqofGDSHvV+zt/nGU
	 SIrd2gYEeV3g2Fju18yDTYyc1dfVExOMvWk4EsiBaiIXEK+EIP+M4GmJgjUjkLdSRH
	 DKihwLxm3D5iK8bZZt/6Z2tmzL/XpUjZ5xgLsrvQv0F30LtIO5niKCgF3N70V4ufiE
	 Q/DoBaRraG7LFtYpQRoooN7IwlbYJNoNGJXnqIif2YsZkY2tITjKAhH/egLPQ4F661
	 t/j3upd3kx5/hum/ZWPwKZ2Zb/ziFNCceKCdUynlNWMWwnKOj6WH8E9t718j52q35L
	 k0oWOIGH/wJCA==
Message-ID: <8de49ed8-0d52-4dfa-8928-d375ef35a63b@kernel.org>
Date: Wed, 6 May 2026 20:28:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu amd-2026-05-06
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org
References: <20260506232627.2210758-1-alexander.deucher@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260506232627.2210758-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/26 18:26, Alex Deucher wrote:
> Hi,
> 
> Updated amdgpu firmware.  Please apply.
> 
> The following changes since commit b9a35af9f69b4222664bb9d1b629dd25323017cc:
> 
>    amdgpu: DMCUB updates for various ASICs (2026-05-05 07:23:04 +0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-05-06
> 
> for you to fetch changes up to 85a26eb6f3ef0c0acef3d615dddb766bc7a3542e:
> 
>    amdgpu: update SMU 14.0.3 kicker firmware (2026-05-06 19:17:52 -0400)
> 
> ----------------------------------------------------------------
> amdgpu firmware updates
> 
> ----------------------------------------------------------------
> Alex Deucher (66):
>        amdgpu: update aldebaran firmware
>        amdgpu: update renoir firmware
>        amdgpu: update dimgrey cavefish firmware
>        amdgpu: update GC 11.0.1 firmware
>        amdgpu: update PSP 13.0.4 firmware
>        amdgpu: update SDMA 6.0.1 firmware
>        amdgpu: update VCN 4.0.2 firmware
>        amdgpu: update GC 11.5.0 firmware
>        amdgpu: update PSP 14.0.0 firmware
>        amdgpu: update SDMA 6.1.0 firmware
>        amdgpu: update VCN 4.0.5 firmware
>        amdgpu: update VPE 6.1.0 firmware
>        amdgpu: update GC 9.4.3 firmware
>        amdgpu: update PSP 13.0.6 firmware
>        amdgpu: update SDMA 4.4.2 firmware
>        amdgpu: update VCN 4.0.3 firmware
>        amdgpu: update beige goby firmware
>        amdgpu: update GC 11.0.4 firmware
>        amdgpu: update PSP 13.0.11 firmware
>        amdgpu: update GC 11.5.1 firmware
>        amdgpu: update PSP 14.0.1 firmware
>        amdgpu: update SDMA 6.1.1 firmware
>        amdgpu: update VCN 4.0.6 firmware
>        amdgpu: update VPE 6.1.1 firmware
>        amdgpu: update PSP 13.0.14 firmware
>        amdgpu: update SDMA 4.4.5 firmware
>        amdgpu: update GC 9.5.0 firmware
>        amdgpu: update PSP 13.0.12 firmware
>        amdgpu: update VCN 5.0.1 firmware
>        amdgpu: update SDMA 4.4.4 firmware
>        amdgpu: update GC 11.0.0 firmware
>        amdgpu: update PSP 13.0.0 firmware
>        amdgpu: update SDMA 6.0.0 firmware
>        amdgpu: update VCN 4.0.0 firmware
>        amdgpu: update PSP 13.0.0 kicker firmware
>        amdgpu: update green sardine firmware
>        amdgpu: update navi10 firmware
>        amdgpu: update vangogh firmware
>        amdgpu: update navi12 firmware
>        amdgpu: update GC 11.0.3 firmware
>        amdgpu: update PSP 13.0.10 firmware
>        amdgpu: update SDMA 6.0.3 firmware
>        amdgpu: update navi14 firmware
>        amdgpu: update GC 11.0.2 firmware
>        amdgpu: update PSP 13.0.7 firmware
>        amdgpu: update SDMA 6.0.2 firmware
>        amdgpu: update VCN 4.0.4 firmware
>        amdgpu: update GC 10.3.6 firmware
>        amdgpu: update PSP 13.0.5 firmware
>        amdgpu: update VCN 3.1.2 firmware
>        amdgpu: update sienna cichlid firmware
>        amdgpu: update GC 12.0.0 firmware
>        amdgpu: update PSP 14.0.2 firmware
>        amdgpu: update GC 11.5.2 firmware
>        amdgpu: update PSP 14.0.4 firmware
>        amdgpu: update SDMA 6.1.2 firmware
>        amdgpu: update VPE 6.1.3 firmware
>        amdgpu: update GC 12.0.1 firmware
>        amdgpu: update PSP 14.0.3 firmware
>        amdgpu: update VCN 5.0.0 firmware
>        amdgpu: update yellow carp firmware
>        amdgpu: update GC 11.5.3 firmware
>        amdgpu: update PSP 14.0.5 firmware
>        amdgpu: update SDMA 6.1.3 firmware
>        amdgpu: update navy flounder firmware
>        amdgpu: update SMU 14.0.3 kicker firmware
> 
>   amdgpu/aldebaran_mec.bin         | Bin 268736 -> 268736 bytes
>   amdgpu/aldebaran_mec2.bin        | Bin 268736 -> 268736 bytes
>   amdgpu/aldebaran_sjt_mec.bin     | Bin 268736 -> 268736 bytes
>   amdgpu/aldebaran_sjt_mec2.bin    | Bin 268736 -> 268736 bytes
>   amdgpu/aldebaran_smc.bin         | Bin 242688 -> 242688 bytes
>   amdgpu/aldebaran_sos.bin         | Bin 446208 -> 446208 bytes
>   amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
>   amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/beige_goby_mec.bin        | Bin 268160 -> 268160 bytes
>   amdgpu/beige_goby_mec2.bin       | Bin 268160 -> 268160 bytes
>   amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/beige_goby_ta.bin         | Bin 255232 -> 259328 bytes
>   amdgpu/beige_goby_vcn.bin        | Bin 580112 -> 580240 bytes
>   amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
>   amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
>   amdgpu/dimgrey_cavefish_mec.bin  | Bin 268160 -> 268160 bytes
>   amdgpu/dimgrey_cavefish_mec2.bin | Bin 268160 -> 268160 bytes
>   amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
>   amdgpu/dimgrey_cavefish_ta.bin   | Bin 255232 -> 259328 bytes
>   amdgpu/dimgrey_cavefish_vcn.bin  | Bin 580112 -> 580240 bytes
>   amdgpu/gc_10_3_6_ce.bin          | Bin 263296 -> 263296 bytes
>   amdgpu/gc_10_3_6_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_10_3_6_mec.bin         | Bin 268592 -> 268592 bytes
>   amdgpu/gc_10_3_6_mec2.bin        | Bin 268592 -> 268592 bytes
>   amdgpu/gc_10_3_6_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_0_mes1.bin        | Bin 218240 -> 220480 bytes
>   amdgpu/gc_11_0_0_mes_2.bin       | Bin 259568 -> 260624 bytes
>   amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_1_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_0_1_mes_2.bin       | Bin 257312 -> 258368 bytes
>   amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_2_mes_2.bin       | Bin 259568 -> 260624 bytes
>   amdgpu/gc_11_0_3_mes_2.bin       | Bin 259632 -> 260688 bytes
>   amdgpu/gc_11_0_3_rlc.bin         | Bin 179104 -> 179104 bytes
>   amdgpu/gc_11_0_4_mes_2.bin       | Bin 256704 -> 257760 bytes
>   amdgpu/gc_11_5_0_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_0_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_0_mes_2.bin       | Bin 257184 -> 258208 bytes
>   amdgpu/gc_11_5_0_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_1_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_1_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_1_mes_2.bin       | Bin 257440 -> 258496 bytes
>   amdgpu/gc_11_5_1_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_2_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_2_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_2_mes_2.bin       | Bin 259504 -> 260560 bytes
>   amdgpu/gc_11_5_2_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_3_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_3_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_3_mes_2.bin       | Bin 259504 -> 260560 bytes
>   amdgpu/gc_11_5_3_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_12_0_0_me.bin          | Bin 467424 -> 459840 bytes
>   amdgpu/gc_12_0_0_mec.bin         | Bin 451552 -> 455648 bytes
>   amdgpu/gc_12_0_0_pfp.bin         | Bin 352336 -> 353536 bytes
>   amdgpu/gc_12_0_0_uni_mes.bin     | Bin 725216 -> 727680 bytes
>   amdgpu/gc_12_0_1_me.bin          | Bin 463712 -> 459840 bytes
>   amdgpu/gc_12_0_1_mec.bin         | Bin 451552 -> 455648 bytes
>   amdgpu/gc_12_0_1_pfp.bin         | Bin 353712 -> 353536 bytes
>   amdgpu/gc_12_0_1_uni_mes.bin     | Bin 725216 -> 727680 bytes
>   amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_3_rlc.bin          | Bin 38708 -> 38708 bytes
>   amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_5_0_mec.bin          | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_5_0_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>   amdgpu/green_sardine_asd.bin     | Bin 205312 -> 209408 bytes
>   amdgpu/green_sardine_ce.bin      | Bin 36608 -> 36608 bytes
>   amdgpu/green_sardine_me.bin      | Bin 69376 -> 69376 bytes
>   amdgpu/green_sardine_mec.bin     | Bin 268224 -> 268224 bytes
>   amdgpu/green_sardine_mec2.bin    | Bin 268224 -> 268224 bytes
>   amdgpu/green_sardine_pfp.bin     | Bin 85760 -> 85760 bytes
>   amdgpu/green_sardine_ta.bin      | Bin 37632 -> 37632 bytes
>   amdgpu/navi10_asd.bin            | Bin 205312 -> 209408 bytes
>   amdgpu/navi10_ce.bin             | Bin 263296 -> 263296 bytes
>   amdgpu/navi10_me.bin             | Bin 263424 -> 263424 bytes
>   amdgpu/navi10_mec.bin            | Bin 268160 -> 268160 bytes
>   amdgpu/navi10_mec2.bin           | Bin 268160 -> 268160 bytes
>   amdgpu/navi10_pfp.bin            | Bin 263424 -> 263424 bytes
>   amdgpu/navi10_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi12_asd.bin            | Bin 205312 -> 209408 bytes
>   amdgpu/navi12_ce.bin             | Bin 263296 -> 263296 bytes
>   amdgpu/navi12_me.bin             | Bin 263424 -> 263424 bytes
>   amdgpu/navi12_mec.bin            | Bin 268160 -> 268160 bytes
>   amdgpu/navi12_mec2.bin           | Bin 268160 -> 268160 bytes
>   amdgpu/navi12_pfp.bin            | Bin 263424 -> 263424 bytes
>   amdgpu/navi12_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi14_asd.bin            | Bin 205312 -> 209408 bytes
>   amdgpu/navi14_ce.bin             | Bin 263296 -> 263296 bytes
>   amdgpu/navi14_me.bin             | Bin 263424 -> 263424 bytes
>   amdgpu/navi14_mec.bin            | Bin 268160 -> 268160 bytes
>   amdgpu/navi14_mec2.bin           | Bin 268160 -> 268160 bytes
>   amdgpu/navi14_pfp.bin            | Bin 263424 -> 263424 bytes
>   amdgpu/navi14_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
>   amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
>   amdgpu/navy_flounder_mec.bin     | Bin 268160 -> 268160 bytes
>   amdgpu/navy_flounder_mec2.bin    | Bin 268160 -> 268160 bytes
>   amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
>   amdgpu/navy_flounder_ta.bin      | Bin 255232 -> 259328 bytes
>   amdgpu/navy_flounder_vcn.bin     | Bin 580112 -> 580240 bytes
>   amdgpu/psp_13_0_0_ta.bin         | Bin 267520 -> 271616 bytes
>   amdgpu/psp_13_0_0_ta_kicker.bin  | Bin 259328 -> 259328 bytes
>   amdgpu/psp_13_0_10_ta.bin        | Bin 263616 -> 267712 bytes
>   amdgpu/psp_13_0_11_ta.bin        | Bin 250880 -> 254976 bytes
>   amdgpu/psp_13_0_12_sos.bin       | Bin 439088 -> 455472 bytes
>   amdgpu/psp_13_0_14_sos.bin       | Bin 405824 -> 405824 bytes
>   amdgpu/psp_13_0_4_ta.bin         | Bin 250880 -> 254976 bytes
>   amdgpu/psp_13_0_5_asd.bin        | Bin 205312 -> 209408 bytes
>   amdgpu/psp_13_0_5_ta.bin         | Bin 242688 -> 246784 bytes
>   amdgpu/psp_13_0_6_sos.bin        | Bin 787040 -> 787040 bytes
>   amdgpu/psp_13_0_7_ta.bin         | Bin 242688 -> 246784 bytes
>   amdgpu/psp_14_0_0_ta.bin         | Bin 250880 -> 254976 bytes
>   amdgpu/psp_14_0_1_ta.bin         | Bin 250880 -> 254976 bytes
>   amdgpu/psp_14_0_2_ta.bin         | Bin 270304 -> 274432 bytes
>   amdgpu/psp_14_0_3_ta.bin         | Bin 282912 -> 287040 bytes
>   amdgpu/psp_14_0_4_ta.bin         | Bin 250880 -> 254976 bytes
>   amdgpu/psp_14_0_5_ta.bin         | Bin 250880 -> 254976 bytes
>   amdgpu/renoir_asd.bin            | Bin 205312 -> 209408 bytes
>   amdgpu/renoir_ce.bin             | Bin 9344 -> 9344 bytes
>   amdgpu/renoir_me.bin             | Bin 17536 -> 17536 bytes
>   amdgpu/renoir_mec.bin            | Bin 268224 -> 268224 bytes
>   amdgpu/renoir_mec2.bin           | Bin 268224 -> 268224 bytes
>   amdgpu/renoir_pfp.bin            | Bin 21632 -> 21632 bytes
>   amdgpu/renoir_ta.bin             | Bin 46080 -> 46080 bytes
>   amdgpu/sdma_4_4_2.bin            | Bin 34304 -> 34304 bytes
>   amdgpu/sdma_4_4_4.bin            | Bin 34304 -> 34304 bytes
>   amdgpu/sdma_4_4_5.bin            | Bin 34304 -> 34304 bytes
>   amdgpu/sdma_6_0_0.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_0_1.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_0_2.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_1_0.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_1_1.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_1_2.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_1_3.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
>   amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
>   amdgpu/sienna_cichlid_mec.bin    | Bin 268160 -> 268160 bytes
>   amdgpu/sienna_cichlid_mec2.bin   | Bin 268160 -> 268160 bytes
>   amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
>   amdgpu/sienna_cichlid_ta.bin     | Bin 382720 -> 386816 bytes
>   amdgpu/sienna_cichlid_vcn.bin    | Bin 580112 -> 580240 bytes
>   amdgpu/smu_14_0_3_kicker.bin     | Bin 327424 -> 327424 bytes
>   amdgpu/vangogh_asd.bin           | Bin 205312 -> 209408 bytes
>   amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
>   amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
>   amdgpu/vangogh_mec.bin           | Bin 268160 -> 268160 bytes
>   amdgpu/vangogh_mec2.bin          | Bin 268160 -> 268160 bytes
>   amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
>   amdgpu/vangogh_vcn.bin           | Bin 572368 -> 572368 bytes
>   amdgpu/vcn_3_1_2.bin             | Bin 572368 -> 572496 bytes
>   amdgpu/vcn_4_0_0.bin             | Bin 395664 -> 395664 bytes
>   amdgpu/vcn_4_0_2.bin             | Bin 395664 -> 395664 bytes
>   amdgpu/vcn_4_0_3.bin             | Bin 359696 -> 359696 bytes
>   amdgpu/vcn_4_0_4.bin             | Bin 395664 -> 395664 bytes
>   amdgpu/vcn_4_0_5.bin             | Bin 395664 -> 395664 bytes
>   amdgpu/vcn_4_0_6.bin             | Bin 395664 -> 395664 bytes
>   amdgpu/vcn_4_0_6_1.bin           | Bin 395664 -> 395664 bytes
>   amdgpu/vcn_5_0_0.bin             | Bin 437712 -> 438288 bytes
>   amdgpu/vcn_5_0_1.bin             | Bin 219472 -> 217680 bytes
>   amdgpu/vpe_6_1_0.bin             | Bin 25984 -> 25984 bytes
>   amdgpu/vpe_6_1_1.bin             | Bin 25984 -> 25984 bytes
>   amdgpu/vpe_6_1_3.bin             | Bin 25984 -> 25984 bytes
>   amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
>   amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/yellow_carp_mec.bin       | Bin 268160 -> 268160 bytes
>   amdgpu/yellow_carp_mec2.bin      | Bin 268160 -> 268160 bytes
>   amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
>   amdgpu/yellow_carp_ta.bin        | Bin 242688 -> 246784 bytes
>   amdgpu/yellow_carp_vcn.bin       | Bin 572368 -> 572496 bytes
>   169 files changed, 0 insertions(+), 0 deletions(-)
updated, thanks
