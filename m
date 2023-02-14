Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00429C05027
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Feb 2023 18:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9B5FC4339E; Tue, 14 Feb 2023 18:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B3EC4339C
	for <linux-firmware@kernel.org>; Tue, 14 Feb 2023 18:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676397697;
	bh=Xi4Sfr2WN5ONsrTTChemX2K9rn5UutvlK40vSbX+tgA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=BINRR286sDmYIG3u3hULjRizfukmu/km55VlNeaOyxQnibdOdTvPLpyNYIwgQ5Z0c
	 6UvOJpLBGcFsleVOLTpBoWKQIfRKT43zTzioKkpVha3TNzzvTysuxhmcgBaMjX2QIZ
	 O+t/odeDNaGdmj+q01fnfxeXyUjcb5Oy2/ale78LVUCWQDzG8aOrilb7eMRRHilaJL
	 oXbi1MnF4se/zjyDZHkqh5RTIDcr3hdKmcYUwHox5N7nDVxkl9ByZFJzzNC9raT+uf
	 hHFloagCLggI6RIYQVp6swaEycds8E1PjOluYXdeyv4wT0wOd3WiFlUDZ2GvQT1NmK
	 Virmhoma/okSg==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-52bfa3dfd95so217525507b3.9
        for <linux-firmware@kernel.org>; Tue, 14 Feb 2023 10:01:37 -0800 (PST)
X-Gm-Message-State: AO0yUKXpu4N2QF9Wmt1CofGDXD14i9r0gEiWFPNTGf/5a4AzRNSInBdJ
	yP/hTL3FdTS+Z0/Cq1YSekcuWV3KTemDnABIlj4=
X-Google-Smtp-Source: AK7set90/sdrvlyIGbBRwKH8A3XM6xbQexCgwJde9xE4AiKbkc83ejqawp7+Jjs7IsIHYz08pzUic7GMc7TB4k4MLoA=
X-Received: by 2002:a81:728a:0:b0:52e:e972:ca5d with SMTP id
 n132-20020a81728a000000b0052ee972ca5dmr352100ywc.7.1676397696610; Tue, 14 Feb
 2023 10:01:36 -0800 (PST)
MIME-Version: 1.0
References: <dd9e09e4-f7fb-d6ff-60eb-d34c942f2f2d@intel.com>
In-Reply-To: <dd9e09e4-f7fb-d6ff-60eb-d34c942f2f2d@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 14 Feb 2023 13:01:25 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7sQi7JX=xQAV7MXLTKJvVQc67PVKr-Z-HhRtv08NvyRg@mail.gmail.com>
Message-ID: <CA+5PVA7sQi7JX=xQAV7MXLTKJvVQc67PVKr-Z-HhRtv08NvyRg@mail.gmail.com>
Subject: Re: [PULL] intel: Update AudioDSP firmware for BDW/SKL/APL/CNL platforms
To: Cezary Rojewski <cezary.rojewski@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 8:38 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> Provide the base firmware files for the skylake- and avs- drivers to
> utilize. Leave links for backward compatibility but put the binaries
> into a dedicated folder so it is clear which driver makes use of them.
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
>
> for you to fetch changes up to 88bd1e152b9265e76bc0ba3cf2eab5f2a389a2fb:
>
>    intel: avs: Add AudioDSP base firmware for CNL-based platforms
> (2023-02-14 14:18:40 +0100)
>
> ----------------------------------------------------------------
> Cezary Rojewski (4):
>        intel: catpt: Add AudioDSP base firmware for BDW platforms
>        intel: avs: Add AudioDSP base firmware for SKL-based platforms
>        intel: avs: Add AudioDSP base firmware for APL-based platforms
>        intel: avs: Add AudioDSP base firmware for CNL-based platforms
>
>   WHENCE                                             |  30
> +++++++++++++++------
>   intel/avs/apl/dsp_basefw.bin                       | Bin 0 -> 505632 bytes
>   intel/avs/cnl/dsp_basefw.bin                       | Bin 0 -> 588040 bytes
>   intel/avs/skl/dsp_basefw.bin                       | Bin 0 -> 243016 bytes
>   ...sp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin | Bin 0 -> 12288 bytes

This fails check_whence.py

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: intel/avs/skl/dsp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin not
listed in WHENCE
[jwboyer@vader linux-firmware]$

Can you update it please?

josh

>   intel/{IntcSST2.bin => catpt/bdw/dsp_basefw.bin}   | Bin 260320 ->
> 260936 bytes
>   6 files changed, 22 insertions(+), 8 deletions(-)
>   create mode 100644 intel/avs/apl/dsp_basefw.bin
>   create mode 100644 intel/avs/cnl/dsp_basefw.bin
>   create mode 100644 intel/avs/skl/dsp_basefw.bin
>   create mode 100644
> intel/avs/skl/dsp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin
>   rename intel/{IntcSST2.bin => catpt/bdw/dsp_basefw.bin} (54%)
