Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31816C6FD1D
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Apr 2023 11:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B056C4339C; Tue,  4 Apr 2023 11:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C94C433EF
	for <linux-firmware@kernel.org>; Tue,  4 Apr 2023 11:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680609534;
	bh=G6k5l/YrrFyiGS0Yp68EmhKiWVKE4kIU7sbJyxssDEA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=hA5X3bhYPgWz5OlY0z5eA3C4lF15wnElAY3lPsfrTndX0f18xq3cBgBCspRBMQNUl
	 v8/h3ZLK1SmR+RFBMIP+0XushR/V5oQDacJbrlv8MB2+zmVs4opLkj2UYGPpo2KP01
	 OU3r7D+f3Nya+UF+8Lp19MORHjPcel2DgIbnao932W33YGwUqLE4+S6EWUg5D6J5aP
	 0TERmVGJZX6l9BOtS5Srb6pz9aU5nepe5VZiaNqr+BwPKosBZmjGdXStqgizxU2ebY
	 5YT4qsXxQUshxQbzLRzGJWjxtsr+7Ms7qV8H8VQRcNGALxjQdSenRo8Bbsh9gpYWvk
	 VEPp7V/stDxKg==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5463fa0c2bfso278356367b3.1
        for <linux-firmware@kernel.org>; Tue, 04 Apr 2023 04:58:53 -0700 (PDT)
X-Gm-Message-State: AAQBX9eJ+qXAMCHUudqWpPmmplZqiMr2Vd2pS21jdllk33s8nE7NOtSC
	nGm5BsGLmBnP6FGNccx8teJITAAHSigTt8NsSTg=
X-Google-Smtp-Source: AKy350bcUKHk8kNPx32lfH7L5/VtArNcNlxl+qI1Y1vwbClm0QF/o2F/UHA8fr6lMwUsEwdQIU82K+B9osHMAsrx8Ck=
X-Received: by 2002:a81:a9c7:0:b0:541:8ce6:b9ad with SMTP id
 g190-20020a81a9c7000000b005418ce6b9admr1401594ywh.2.1680609532897; Tue, 04
 Apr 2023 04:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <176e1296-5b37-4177-8602-12b28b2115a4@amd.com>
In-Reply-To: <176e1296-5b37-4177-8602-12b28b2115a4@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 4 Apr 2023 07:58:42 -0400
X-Gmail-Original-Message-ID: <CA+5PVA54E7juyXVQUGm3RSX=2CY-P6UfFNr4yfmTXHcCkusz+w@mail.gmail.com>
Message-ID: <CA+5PVA54E7juyXVQUGm3RSX=2CY-P6UfFNr4yfmTXHcCkusz+w@mail.gmail.com>
Subject: Re: Updated firmware for DCN 3.1.4
To: "Limonciello, Mario" <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Alexander Deucher <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 10:31=E2=80=AFAM Limonciello, Mario
<mario.limonciello@amd.com> wrote:
>
> Hi,
>
> I've updated the firmware binaries for some DCN 3.1.4 based products.
>
> Thanks,
>
> The following changes since commit bcdcfbcf0a8f24a914b8c163906e6ce93d7f88=
97:
>
>    linux-firmware: Update firmware file for Intel Bluetooth AX101
> (2023-03-20 08:34:27 -0400)
>
> are available in the Git repository at:
>
>    https://gitlab.freedesktop.org/superm1/linux-firmware
> mlimonci/update-dcn-3-1-4

Pulled and pushed out.

josh

>
> for you to fetch changes up to 9ee24ce0e164ba9620ecc33295b183fc135bac7b:
>
>    amdgpu: Update SDMA 6.0.1 firmware (2023-03-30 09:03:34 -0500)
>
> ----------------------------------------------------------------
> Mario Limonciello (6):
>        amdgpu: Add GC 11.0.4 firmware
>        amdgpu: Update DCN 3.1.4 firmware
>        amdgpu: Update GC 11.0.1 firmware
>        amdgpu: Update PSP 13.0.4 firmware
>        amdgpu: Add PSP 13.0.11 firmware
>        amdgpu: Update SDMA 6.0.1 firmware
>
>   WHENCE                     |   9 +++++++++
>   amdgpu/dcn_3_1_4_dmcub.bin | Bin 296864 -> 298016 bytes
>   amdgpu/gc_11_0_1_imu.bin   | Bin 132352 -> 132352 bytes
>   amdgpu/gc_11_0_1_me.bin    | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_1_mec.bin   | Bin 268640 -> 268640 bytes
>   amdgpu/gc_11_0_1_mes1.bin  | Bin 230528 -> 230368 bytes
>   amdgpu/gc_11_0_1_pfp.bin   | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_1_rlc.bin   | Bin 157440 -> 160592 bytes
>   amdgpu/gc_11_0_4_imu.bin   | Bin 0 -> 132352 bytes
>   amdgpu/gc_11_0_4_me.bin    | Bin 0 -> 263424 bytes
>   amdgpu/gc_11_0_4_mec.bin   | Bin 0 -> 268704 bytes
>   amdgpu/gc_11_0_4_mes.bin   | Bin 0 -> 288288 bytes
>   amdgpu/gc_11_0_4_mes1.bin  | Bin 0 -> 229856 bytes
>   amdgpu/gc_11_0_4_pfp.bin   | Bin 0 -> 263424 bytes
>   amdgpu/gc_11_0_4_rlc.bin   | Bin 0 -> 159472 bytes
>   amdgpu/psp_13_0_11_ta.bin  | Bin 0 -> 206272 bytes
>   amdgpu/psp_13_0_11_toc.bin | Bin 0 -> 2560 bytes
>   amdgpu/psp_13_0_4_ta.bin   | Bin 271808 -> 206272 bytes
>   amdgpu/sdma_6_0_1.bin      | Bin 34560 -> 34560 bytes
>   19 files changed, 9 insertions(+)
>   create mode 100644 amdgpu/gc_11_0_4_imu.bin
>   create mode 100644 amdgpu/gc_11_0_4_me.bin
>   create mode 100644 amdgpu/gc_11_0_4_mec.bin
>   create mode 100644 amdgpu/gc_11_0_4_mes.bin
>   create mode 100644 amdgpu/gc_11_0_4_mes1.bin
>   create mode 100644 amdgpu/gc_11_0_4_pfp.bin
>   create mode 100644 amdgpu/gc_11_0_4_rlc.bin
>   create mode 100644 amdgpu/psp_13_0_11_ta.bin
>   create mode 100644 amdgpu/psp_13_0_11_toc.bin
