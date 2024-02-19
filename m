Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C086C48BF8
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Feb 2024 12:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85F58C433B2; Mon, 19 Feb 2024 12:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701CCC433F1
	for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 12:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347152;
	bh=rMHHr6NenLL5kbjZ49qFA0fcSK3oKwzc2pf72tvo7MY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mCZML2RFOlMNd498QDuOD0n4yKlp9fl3ZVaHZ1vh/tXd/SHEy+TuAiDt9LpfCBXaK
	 TH+cIRj3O79PYoqFtp+0WhyYJh0GzsrjVBXbeDfwXMy+JIjBfBoo5881xoW8N1isZM
	 KIlQJJTs8MhFLgdWGlDhjMLLczx4AV0WVz5W5w8ZI4aL3oGx+KO3ETe8paoYUxWNQB
	 ezEENBP1Tsr3SNGFPsrFlv93uwWJYTU/nrVOQkee8sM8hX1yR2Clhx8poYMKbJpGJF
	 8jEzW/Ybm5b1D+DsYJ1OJUecSXRyY6fX/V79SMWeh9Wlx8qa+m0OIsY7XrI1rFHG0i
	 hZ08KKj78kOMg==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-607eefeea90so28993387b3.1
        for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 04:52:32 -0800 (PST)
X-Gm-Message-State: AOJu0Ywh5UzlIMzzoeIiDLUSkQ2QTIawpAoFcjTwjgZpeMbQdT/76czK
	PgQiyrN6MLfzMON4HQtLAGgNUDy8SdIQ/jXSMPHl948ilVe2Ta9ihUX98BfvPoWGB33sV3FuZBw
	ytQBDpPSZHp8TYr+am6GjYZ0gcZs=
X-Google-Smtp-Source: AGHT+IFLKQqfKRsmLAQnCAdxTgFU/0G9SEfsPFubbUmg8DWMY6kAD26sr6EEb3B3GgKxn4jBzfQKqp9VDf8UhoeFRxQ=
X-Received: by 2002:a81:b641:0:b0:607:7dcf:7a83 with SMTP id
 h1-20020a81b641000000b006077dcf7a83mr8267056ywk.22.1708347151604; Mon, 19 Feb
 2024 04:52:31 -0800 (PST)
MIME-Version: 1.0
References: <20240202153911.1256524-1-juerg.haefliger@canonical.com>
In-Reply-To: <20240202153911.1256524-1-juerg.haefliger@canonical.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Feb 2024 07:52:20 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5eXNNawnvR3_zJEkZs_zqd6OHqMsUgVU9-qCwsB6xtbQ@mail.gmail.com>
Message-ID: <CA+5PVA5eXNNawnvR3_zJEkZs_zqd6OHqMsUgVU9-qCwsB6xtbQ@mail.gmail.com>
Subject: Re: [PATCH] WHENCE: Clean up section separators
To: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 10:39=E2=80=AFAM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
>
> Remove an erroneous extra separator and make them all the same length.
>
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

Applied and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/148

josh

> ---
>  WHENCE | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 5e736230d496..6742cf675dfe 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -1541,7 +1541,7 @@ Licence: Redistributable. See LICENCE.ralink-firmwa=
re.txt for details
>
>  Downloaded from http://www.ralinktech.com/ralink/Home/Support/Linux.html
>
> -------------------------------------------------------------------------=
---
> +------------------------------------------------------------------------=
--
>
>  Driver: mt7601u - MediaTek MT7601U Wireless MACs
>
> @@ -2580,8 +2580,6 @@ Licence: Redistributable. See LICENSE.amdgpu for de=
tails.
>
>  ------------------------------------------------------------------------=
--
>
> -------------------------------------------------------------------------=
--
> -
>  Driver: amd_pmf - AMD Platform Management Framework TA
>
>  File: amdtee/773bd96f-b83f-4d52-b12dc529b13d8543.bin
> @@ -5497,7 +5495,7 @@ Version: 1.0.07-b370
>
>  Licence: Redistributable. See LICENCE.mediatek for details.
>
> -------------------------------------------------------------------------=
---
> +------------------------------------------------------------------------=
--
>
>  Driver: mt76x2e - MediaTek MT76x2 Wireless MACs
>
> @@ -5511,7 +5509,7 @@ Link: mt7662_rom_patch.bin -> mediatek/mt7662_rom_p=
atch.bin
>
>  Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware=
 for details
>
> -------------------------------------------------------------------------=
---
> +------------------------------------------------------------------------=
--
>
>  Driver: mt76x2u - MediaTek MT76x2u Wireless MACs
>
> @@ -6180,7 +6178,7 @@ Permission is hereby granted for the distribution o=
f this firmware
>  as part of Linux or other Open Source operating system kernel,
>  provided this copyright notice is accompanying it.
>
> -------------------------------------------------
> +------------------------------------------------------------------------=
--
>
>  Driver: prestera - Marvell driver for Prestera family ASIC devices
>
> @@ -6192,7 +6190,7 @@ File: mrvl/prestera/mvsw_prestera_fw_arm64-v4.1.img
>
>  Licence: Redistributable. See LICENCE.Marvell for details.
>
> -------------------------------------------------
> +------------------------------------------------------------------------=
--
>
>  Driver: lt9611uxc - Lontium DSI to HDMI bridge
>
> @@ -6228,7 +6226,7 @@ File: cnm/wave521c_k3_codec_fw.bin
>
>  Licence: Redistributable. See LICENCE.cnm for details.
>
> -------------------------------------------------------------------------=
---
> +------------------------------------------------------------------------=
--
>
>  Driver: rvu_cptpf - Marvell CPT driver
>
> @@ -6248,7 +6246,7 @@ Version: v1.21
>
>  Licence: Redistributable. See LICENCE.Marvell for details.
>
> -------------------------------------------------------------------------=
---
> +------------------------------------------------------------------------=
--
>
>  Driver: amphion - Amphion VPU(Video Processing Unit) Codec IP driver
>
> @@ -6259,7 +6257,7 @@ Version: 1.3.4
>
>  Licence: Redistributable. See LICENSE.amphion_vpu for details
>
> -------------------------------------------------------------------------=
---
> +------------------------------------------------------------------------=
--
>
>  Driver: cs35l41_hda - CS35l41 ALSA HDA audio driver
>
> @@ -7469,7 +7467,7 @@ only in connection with Cirrus Logic hardware produ=
cts.
>  Copyright =C2=A9 2022 Cirrus Logic, Inc. and Cirrus Logic International
>  Semiconductor Ltd. All Rights Reserved.
>
> -------------------------------------------------------------------------=
---
> +------------------------------------------------------------------------=
--
>
>  Driver: cs42l43 - CS42L43 ALSA audio driver
>
> @@ -7483,7 +7481,7 @@ only in connection with Cirrus Logic hardware produ=
cts.
>  Copyright =C2=A9 2023 Cirrus Logic, Inc. and Cirrus Logic International
>  Semiconductor Ltd. All Rights Reserved.
>
> -------------------------------------------------------------------------=
---
> +------------------------------------------------------------------------=
--
>
>  Driver: mtk-sof - MediaTek Sound Open Firmware driver
>
> --
> 2.40.1
>
