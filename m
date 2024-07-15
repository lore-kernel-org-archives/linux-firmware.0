Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296E8C3DA59
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Jul 2024 12:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07349C4AF0E; Mon, 15 Jul 2024 12:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FEEC4AF0B
	for <linux-firmware@kernel.org>; Mon, 15 Jul 2024 12:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721046987;
	bh=1VwYqtqn5iu/fxLV8kvGVIp7bONkXYYHuXrBXfiG+pg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ec3vLadTZtQSTeM4INPLWjvk0ZTvHdKHTwg/a8SWwSXA77uz/fGcDEWVfDfeMgWd/
	 jfy5aV7hxLn4C88MXAcT9GsnwWmkGpYNAjpXiF4age4C8/TcEKfsBDqm7wFQ81t9Wi
	 /SAetdo54rzvNmOfFNg3H4sCRqdfS6ndrvXywRmWKISGcOTyJrXRKjjbThRDOJdrZc
	 CcNYr4L77pR8WqklxnZT+F2dbLpHMVT2aa0oSNAtB2K3t4An5qoBDPixPJ2S0SZ4W7
	 YFkZWOaaqh83dQvcn2XSoKkCUc/DgG587BrCKKduVI9G/f2msr5A3s/VkSzZxmucm2
	 SAgAQUSYCSBjg==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e03db345b0cso4030956276.1
        for <linux-firmware@kernel.org>; Mon, 15 Jul 2024 05:36:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUaF8zrBMpiQjaKomNdHpkfaKx2UHDg6ljNEg5jykOduKJw+P4EQZwD8rkeZfJDRSBckanp6d5C50h5zj5KtdNFSeFkBNMFWIW
X-Gm-Message-State: AOJu0Yw6YU1kRJIuTrBo/gs8orPlGz0Ryi+34EZCd9qrKkSOuM2wyAeC
	5+HMFAdQKJr2rwhRkAHeKv7yUwnqKNCJwcbMCeTkbjzdlZH9bUHvw2L8TKKhk7ge+3mQ/S1ix4P
	lycrKECTgDZSrSzbdMYw8fJNiZxQ=
X-Google-Smtp-Source: AGHT+IHI8jONuBZNvpJ/HyhNj1stGbXhv+6o1E1e6FOoi8XBPTLMNPm0OkbtOBrfkxVyvoofShXaagCZ2+7JZshn4us=
X-Received: by 2002:a0d:f947:0:b0:618:95a3:70b9 with SMTP id
 00721157ae682-658f09d2b5amr196390537b3.36.1721046987140; Mon, 15 Jul 2024
 05:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <8da0d0ec-152d-4663-99ab-579badc6e5b4@intel.com>
In-Reply-To: <8da0d0ec-152d-4663-99ab-579badc6e5b4@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 Jul 2024 08:36:14 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6mREZ2x+vyKrEkHC4zsmy8bxz_553GTR30tJjvRMqGdw@mail.gmail.com>
Message-ID: <CA+5PVA6mREZ2x+vyKrEkHC4zsmy8bxz_553GTR30tJjvRMqGdw@mail.gmail.com>
Subject: Re: [PULL] intel: avs: Add topology files and update AudioDSP firmware
To: Cezary Rojewski <cezary.rojewski@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, 
	linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 7:09=E2=80=AFAM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> The patchset starts off with updating AudioDSP base firmware for
> APL-base platforms.
>
> Follow up is addition of a copy of Apache-2.0 license for descriptions
> in WHENCE to reference.
>
> The rest is composed of the topology files utilized by the Linux kernel
> avs-driver. These are licensed under Apache-2.0 [1], just like the tools
> [2] that are used to translate their source XML version into a
> kernel-friendly binary format. Each patch carries a link and a commit
> identifier to the source given binary has been made from.
>
> [1]: https://github.com/thesofproject/avs-topology-xml
> [2]: https://github.com/thesofproject/avsdk
>
> ---
> The following changes since commit e94a2a3bc8bdfc6a4a7b05eed7803b64a409c9=
f5:
>
>    Merge branch 'add_intel_ish' into 'main' (2024-07-03 05:34:26 +0000)
>
> are available in the Git repository at:
>
>    git@github.com:crojewsk-intel/linux-firmware.git for-upstream

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/250

josh

>
> for you to fetch changes up to 5bdbfe469f340279211d17cb62bfcea47c15a8cd:
>
>    intel: avs: Add topology file for I2S Analog Devices 4567 (2024-07-10
> 12:19:02 +0200)
>
> ----------------------------------------------------------------
> Cezary Rojewski (17):
>        intel: avs: Update AudioDSP base firmware for APL-based platforms
>        Add a copy of Apache-2.0
>        intel: avs: Add topology file for HDAudio codecs
>        intel: avs: Add topology file for HDMI codecs
>        intel: avs: Add topology file for Digital Microphone Array
>        intel: avs: Add topology file for I2S Realtek 274
>        intel: avs: Add topology file for I2S Realtek 286
>        intel: avs: Add topology file for I2S Realtek 298
>        intel: avs: Add topology file for I2S Realtek 5514
>        intel: avs: Add topology file for I2S Realtek 5640
>        intel: avs: Add topology file for I2S Realtek 5663
>        intel: avs: Add topology file for I2S Dialog 7219
>        intel: avs: Add topology file for I2S Maxim 98357a
>        intel: avs: Add topology file for I2S Maxim 98373
>        intel: avs: Add topology file for I2S Maxim 98927
>        intel: avs: Add topology file for I2S Nuvoton 8825
>        intel: avs: Add topology file for I2S Analog Devices 4567
>
>   Apache-2                            | 202
> ++++++++++++++++++++++++++++++++++++
>   WHENCE                              |  22 +++-
>   intel/avs/apl/dsp_basefw.bin        | Bin 505632 -> 505632 bytes
>   intel/avs/da7219-tplg.bin           | Bin 0 -> 4576 bytes
>   intel/avs/dmic-tplg.bin             | Bin 0 -> 9064 bytes
>   intel/avs/hda-808628xx-3ep-tplg.bin | Bin 0 -> 7264 bytes
>   intel/avs/hda-generic-1ep-tplg.bin  | Bin 0 -> 7372 bytes
>   intel/avs/max98357a-tplg.bin        | Bin 0 -> 3228 bytes
>   intel/avs/max98373-tplg.bin         | Bin 0 -> 3748 bytes
>   intel/avs/max98927-tplg.bin         | Bin 0 -> 3748 bytes
>   intel/avs/nau8825-tplg.bin          | Bin 0 -> 4576 bytes
>   intel/avs/rt274-tplg.bin            | Bin 0 -> 4976 bytes
>   intel/avs/rt286-tplg.bin            | Bin 0 -> 4976 bytes
>   intel/avs/rt298-tplg.bin            | Bin 0 -> 4976 bytes
>   intel/avs/rt5514-tplg.bin           | Bin 0 -> 3144 bytes
>   intel/avs/rt5640-tplg.bin           | Bin 0 -> 5652 bytes
>   intel/avs/rt5663-tplg.bin           | Bin 0 -> 4576 bytes
>   intel/avs/ssm4567-tplg.bin          | Bin 0 -> 3740 bytes
>   18 files changed, 223 insertions(+), 1 deletion(-)
>   create mode 100644 Apache-2
>   create mode 100644 intel/avs/da7219-tplg.bin
>   create mode 100644 intel/avs/dmic-tplg.bin
>   create mode 100644 intel/avs/hda-808628xx-3ep-tplg.bin
>   create mode 100644 intel/avs/hda-generic-1ep-tplg.bin
>   create mode 100644 intel/avs/max98357a-tplg.bin
>   create mode 100644 intel/avs/max98373-tplg.bin
>   create mode 100644 intel/avs/max98927-tplg.bin
>   create mode 100644 intel/avs/nau8825-tplg.bin
>   create mode 100644 intel/avs/rt274-tplg.bin
>   create mode 100644 intel/avs/rt286-tplg.bin
>   create mode 100644 intel/avs/rt298-tplg.bin
>   create mode 100644 intel/avs/rt5514-tplg.bin
>   create mode 100644 intel/avs/rt5640-tplg.bin
>   create mode 100644 intel/avs/rt5663-tplg.bin
>   create mode 100644 intel/avs/ssm4567-tplg.bin
