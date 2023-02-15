Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59DFC636D4
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Feb 2023 14:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86E90C4339B; Wed, 15 Feb 2023 14:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7134CC4339E
	for <linux-firmware@kernel.org>; Wed, 15 Feb 2023 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676469894;
	bh=0xYDCfI05WNiroqU0fLBbEwv2BL2spTmdF+3DlKsyN4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YQtgLmbwiTJIFr4M2wAGxop/4FLI3f8GFZcJxDt3BYIOLOCfFdv9GcAvCIDmlnMNj
	 af0Giy9G4WU8eNJBCdoNlVoh06+6PDk6QsvgoEG4zh2JBF8xDVVJgHhDhR6M6KIkRm
	 e+kDf7AmafsZc6YLi7ssucPk/WmTylN1kZP5iAJVjCfOsKqQDRVBQePFmuLoCsU98q
	 eU2JQHcrzPgDZdEQxEswhPkJe9LPgxS/8PSv42iMLDDv5So3IqDGHYoH+HA1uj9mmi
	 0A0RIzNx2FhbYd6OJ+b1AUi7HkLY126N01hwaQCp+sd35cDVSS5/p3zcFQBfc6QoCe
	 3CU0ytHg5ByFQ==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-52ebee9a848so255758497b3.3
        for <linux-firmware@kernel.org>; Wed, 15 Feb 2023 06:04:54 -0800 (PST)
X-Gm-Message-State: AO0yUKUWwNcsW4/Ebq4CGID26q+FAfrM5NXGZrC2vPcteyQwGm27arMQ
	kRwfSPC2LXmyAXriie4N/unMAZUBBiBwMAvKdPM=
X-Google-Smtp-Source: AK7set8OVuLma27zWRUmC4Y37XLM+ZdQbrvW6Xp88bz2Jw9vJkO1j6ZaA4VJQVaq8siHV0/3U4+TSu++ts+DdOvMUoU=
X-Received: by 2002:a5b:94b:0:b0:939:2fb5:36b4 with SMTP id
 x11-20020a5b094b000000b009392fb536b4mr271903ybq.270.1676469893465; Wed, 15
 Feb 2023 06:04:53 -0800 (PST)
MIME-Version: 1.0
References: <38913aba-3717-fa26-bac8-96f8e9cf112a@intel.com>
In-Reply-To: <38913aba-3717-fa26-bac8-96f8e9cf112a@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 15 Feb 2023 09:04:42 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7Hhgbp--CMhLBJDueDq177=4fDoK7r85c-uWamuy5=Ag@mail.gmail.com>
Message-ID: <CA+5PVA7Hhgbp--CMhLBJDueDq177=4fDoK7r85c-uWamuy5=Ag@mail.gmail.com>
Subject: Re: [PULL v2] intel: Update AudioDSP firmware for BDW/SKL/APL/CNL platforms
To: Cezary Rojewski <cezary.rojewski@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023 at 4:08 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> Provide the base firmware files for the skylake- and avs- drivers to
> utilize. Leave links for backward compatibility but put the binaries
> into a dedicated folder so it is clear which driver makes use of them.
>
> Changes in v2:
> - added missing file to WHENCE
>
> ---
> The following changes since commit bf4115c1aa2bee686ec675595271da50611684b5:
>
>    Merge https://github.com/pkshih/linux-firmware (2023-02-10 14:35:21
> -0500)
>
> are available in the Git repository at:
>
>    https://github.com/crojewsk-intel/linux-firmware for-upstream

Pulled and pushed out.  Thanks!

josh

>
> for you to fetch changes up to 23afbfe8a2e817079edc4f7eb0290951cab028c3:
>
>    intel: avs: Add AudioDSP base firmware for CNL-based platforms
> (2023-02-15 10:16:46 +0100)
>
> ----------------------------------------------------------------
> Cezary Rojewski (4):
>        intel: catpt: Add AudioDSP base firmware for BDW platforms
>        intel: avs: Add AudioDSP base firmware for SKL-based platforms
>        intel: avs: Add AudioDSP base firmware for APL-based platforms
>        intel: avs: Add AudioDSP base firmware for CNL-based platforms
>
>   WHENCE                                             |  31
> +++++++++++++++------
>   intel/avs/apl/dsp_basefw.bin                       | Bin 0 -> 505632 bytes
>   intel/avs/cnl/dsp_basefw.bin                       | Bin 0 -> 588040 bytes
>   intel/avs/skl/dsp_basefw.bin                       | Bin 0 -> 243016 bytes
>   ...sp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin | Bin 0 -> 12288 bytes
>   intel/{IntcSST2.bin => catpt/bdw/dsp_basefw.bin}   | Bin 260320 ->
> 260936 bytes
>   6 files changed, 23 insertions(+), 8 deletions(-)
>   create mode 100644 intel/avs/apl/dsp_basefw.bin
>   create mode 100644 intel/avs/cnl/dsp_basefw.bin
>   create mode 100644 intel/avs/skl/dsp_basefw.bin
>   create mode 100644
> intel/avs/skl/dsp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin
>   rename intel/{IntcSST2.bin => catpt/bdw/dsp_basefw.bin} (54%)
