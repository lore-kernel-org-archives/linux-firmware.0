Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD28C369C2
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Apr 2025 12:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 266FEC4CEEF; Mon, 21 Apr 2025 12:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10253C4CEEA
	for <linux-firmware@kernel.org>; Mon, 21 Apr 2025 12:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745238000;
	bh=Q3US0cN/PYJNl3i/2FFyAlA3YPWp47gf6bKmjXm25+k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=hVLrEY0UawrxvtDi2dMS5D8/ByEL/U3s439eenkendNTs1sUa3xa5xGAe3VcYUkTD
	 51Wdag1So+OrmfQi9RsITE/Cou0UE0eRTUMzjFTnd/VPyHzMpWhgOsh7mzxoL3Xz30
	 C4qPKhQ0Jz3rgSwxKffqY6Qv471LYJ0MebEwyN9h6v3hjjgTmeY0z7EiFMh6WD6yoJ
	 kscW+qpzyuT47FDKQV9UadaaJZL4MTnA6PU0lsIB2nAnyaDbMbo1/xOGYK6wriOvaj
	 ktMwqSBNAOKhECR1xLfUsOcw1sPzszB8prC/s2DfVX5hajYg5PHDd0dv00hZqagvTj
	 KiuMmHMZsGg2Q==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e72cc45d99cso405449276.3
        for <linux-firmware@kernel.org>; Mon, 21 Apr 2025 05:19:59 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw05j8oF57IRWv1KjsNVTSJha+Uutv75KrDTIfP+XEjVKnIUeaN
	eWhEEeRl0qCIthJ4COK/eH2lnc7nOlXLAu9zrybgOcvHLkBDWf4uoJxXew7xO+V3x8b4Q9kjNhY
	9571wC2VSUm8/N2SFZRtpOA4seCs=
X-Google-Smtp-Source: AGHT+IElxJYtsIncW6FWEsTGEKuNrgJyt+qaf9GN/ikjx3aQIu4GoG2ul0G0s1xgsHKYBRAVTid1a2olq/RIRJ3R79M=
X-Received: by 2002:a05:6902:6b0e:b0:e72:b82f:a62 with SMTP id
 3f1490d57ef6-e72b82f0b44mr5696262276.11.1745237999209; Mon, 21 Apr 2025
 05:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250421023815.113477-1-justin@justinweiss.com>
In-Reply-To: <20250421023815.113477-1-justin@justinweiss.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 21 Apr 2025 08:19:48 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4YnK9qBzJwkrDnv1P8y2umAo8Vb0uGaXxQYmT+bh36VA@mail.gmail.com>
X-Gm-Features: ATxdqUHNVIoaj7Z3i1K8FHVzCWCa1qAAQk_kFQ4OJLTLcUbJQEHXjeU6sFBD62g
Message-ID: <CA+5PVA4YnK9qBzJwkrDnv1P8y2umAo8Vb0uGaXxQYmT+bh36VA@mail.gmail.com>
Subject: Re: [PATCH v2] bmi260: Add BMI260 IMU initial configuration data file
To: Justin Weiss <justin@justinweiss.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Cryolitia PukNgae <Cryolitia@gmail.com>, 
	=?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>, 
	Derek John Clark <derekjohn.clark@gmail.com>, Antheas Kapenekakis <lkml@antheas.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/521

josh

On Sun, Apr 20, 2025 at 10:39=E2=80=AFPM Justin Weiss <justin@justinweiss.c=
om> wrote:
>
> Add initial configuration binary for the Bosch BMI260 IMU. This file
> is used by the bmi270 driver in the IIO subsystem.
>
> Signed-off-by: Justin Weiss <justin@justinweiss.com>
> Tested-by: Cryolitia PukNgae <Cryolitia@gmail.com>
> ---
>
> Changelog:
>
> V2
> - Move license into LICENSE.bmi260
>
> V1
> https://lore.kernel.org/linux-firmware/20250413211334.61316-1-justin@just=
inweiss.com/
>
>  LICENSE.bmi260      |  30 ++++++++++++++++++++++++++++++
>  WHENCE              |   9 +++++++++
>  bmi260-init-data.fw | Bin 0 -> 8192 bytes
>  3 files changed, 39 insertions(+)
>  create mode 100644 LICENSE.bmi260
>  create mode 100644 bmi260-init-data.fw
>
> diff --git a/LICENSE.bmi260 b/LICENSE.bmi260
> new file mode 100644
> index 00000000..a089b668
> --- /dev/null
> +++ b/LICENSE.bmi260
> @@ -0,0 +1,30 @@
> +Copyright (c) 2020 Bosch Sensortec GmbH. All rights reserved.
> +
> +BSD-3-Clause
> +
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted provided that the following conditions are m=
et:
> +
> +1. Redistributions of source code must retain the above copyright
> +notice, this list of conditions and the following disclaimer.
> +
> +2. Redistributions in binary form must reproduce the above copyright
> +notice, this list of conditions and the following disclaimer in the
> +documentation and/or other materials provided with the distribution.
> +
> +3. Neither the name of the copyright holder nor the names of its
> +contributors may be used to endorse or promote products derived from
> +this software without specific prior written permission.
> +
> +THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> +LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> +FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> +COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> +INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
> +(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
> +SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
> +STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
> +IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
> +POSSIBILITY OF SUCH DAMAGE.
> diff --git a/WHENCE b/WHENCE
> index f2dcf32c..e54fb67e 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -8493,3 +8493,12 @@ Version: ci_tag_ud202512_vpu_rc_20250306_1130
>  Link: intel/vpu/vpu_40xx_v0.0.bin -> vpu_40xx_v1.bin
>
>  License: Redistributable. See LICENSE.intel_vpu for details
> +
> +------------------------------------------------------------------------=
--
> +
> +Driver: bmi260 - Bosch BMI260 IMU configuration data
> +File: bmi260-init-data.fw
> +
> +License: Redistributable. See LICENSE.bmi260 for details
> +
> +Originates from https://source.chromium.org/chromiumos/chromiumos/codese=
arch/+/main:src/platform/ec/third_party/bmi260/accelgyro_bmi260_config_tbin=
.h
> diff --git a/bmi260-init-data.fw b/bmi260-init-data.fw
> new file mode 100644
> index 0000000000000000000000000000000000000000..b09241b79b23a707fc492b328=
3e1c83c342e05a2
> GIT binary patch
> literal 8192
> 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
x
> zwXV_$z+fAZu2Jpew0inX@SH@`dGy!)JkEZ)VYNS#7_JS0F70GPfZk0TwbhW5UyL>C
> z1?x>fmdgrp6R<5n!gXlERc7r5oyjV(5z{qHxh8YSOU!KBA~izHQZvvJ(6#dPuK>C(
> zD87bfK=3D5<vh_@MZQw3SfvhZxcwQrnc!<1%rt|-C$^gNs6%+pR97XZ<>x@agD*p~-N
> z0$_SK8_KFvz2C5VZ)vz-sFRD*rvnT{Ig|NzRR?R#Y^{3u;2CLOYjgaqxmzW7{PLk1
> zM@3sdy8!1AfL|DVTB2Il-_s{4x!RzyQgHy25=3D_rz$jJcPHAVib&F%hAferE4e7~~?
> za$$wul?~kno}8DSjn|+^wtS9ZXkVcmY48yDMJbj5{dS1l2X>Pt=3D76YfbULbE0+}5*
> zv>5slCXXh<<o?7#9WuL}akyVOd<a-X4Q5b&@OUSbSL61|!~O~I8;1vS5l5i@t|PyL
> z`*g^6a)vW@e1Zv+^0d8^9a@<QTv5AJcHDnbpH6q#HEqMBO!B}$PvD#cHlcYY&qlF&
> z2c4|cX%5In^}w!dLJu?H<VB^I9Sgv3vOG(@Zh`YJvJa#&$hfy|s%|ew=3D+Pe`RI?GG
> k-c%}e60XnS`q#6m)YJJ0-S&A34F13RXZ|l@Ip380I{|`ILI3~&
>
> literal 0
> HcmV?d00001
>
>
> base-commit: 5aa42075d00c58da1596c22679879267d2505737
> --
> 2.49.0
>
