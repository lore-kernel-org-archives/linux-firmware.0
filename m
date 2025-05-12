Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7B5C3ABC3
	for <linux-firmware@archiver.kernel.org>; Mon, 12 May 2025 19:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 933ECC4CEF2; Mon, 12 May 2025 19:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DAA2C4CEF0
	for <linux-firmware@kernel.org>; Mon, 12 May 2025 19:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747077076;
	bh=fORdsG6Sa+4PqFYfY15RQWakay+r0TJ2KKsxrxJ/PD8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=oSw6WYAc1uViboJIE8TOClXhE3sKvgCVn62k1jhWXwBDGWRkR/PAqnjAWGbqIX0Yb
	 opTloB+eyIpJj2hjceA5PTZd0vG262O0K9TKTqXebmBp5OogQUCoL9JTaitBsT8Ov6
	 topHg7OXaQ4PCcKkjdXi3LeIyEjGgH5Kllea1Hkf7bjCds5qV17AnVE0M0S486DzdU
	 uSOaBKUn2yfw2lImAgpjkIhyYiljsNIlXFj2aWijAcg3wN7PE5fLB1Zal2J5Ki1mmQ
	 GZew9rWep7t1Cm/++SaO80V8KOT6QGvi7ewLy+8SEOIx7++si+PcXZ7y8sdZKamicf
	 7B4xKsJeo48Vg==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-708d90aa8f9so44829587b3.3
        for <linux-firmware@kernel.org>; Mon, 12 May 2025 12:11:16 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy7CTI7GpCxYP8izHQhGYeomleAMg9YZ2FwrzPFqhSN9OFy0xCM
	SOjYnrkL4pwKAW48m9n0FeMHOBi41niaSXpuM9LSgASUqcyOxRlZ8PiVugWeoQsnIJPj05zyRnT
	xfuGS5beGFtyuwgnoLdCTZjPT4/U=
X-Google-Smtp-Source: AGHT+IE/sR7cFRF5r8c/LjNHVQ8fh5szGb34tiLQZy4J1s2qudMCJ9gA0Z0R83tFNE2cL+f07SKc1kaKqJEj5SuQnDI=
X-Received: by 2002:a05:690c:6e01:b0:70a:36b2:8f94 with SMTP id
 00721157ae682-70a3fa3602bmr204676547b3.18.1747077075735; Mon, 12 May 2025
 12:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <f8876a08-c0e4-4ced-bc63-7939df61f6a3@linux.intel.com>
In-Reply-To: <f8876a08-c0e4-4ced-bc63-7939df61f6a3@linux.intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 12 May 2025 15:11:04 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5Wqv=Gw-Ar7cTx3rVfBg81=b3OqOOMrtjNTc-Bv11WyA@mail.gmail.com>
X-Gm-Features: AX0GCFuU_fHwy-hdVzcUSM9gmSya19_HNCSestpub-Jp1C8B2aLzV8RdC4M-JXs
Message-ID: <CA+5PVA5Wqv=Gw-Ar7cTx3rVfBg81=b3OqOOMrtjNTc-Bv11WyA@mail.gmail.com>
Subject: Re: intel: avs: Update DMIC topology file
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 9:13=E2=80=AFAM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> The following changes since commit a1d732703915a35a4c726a82e18fe436e26b74=
a7:
>
>    Merge branch 'amd-staging' into 'main' (2025-05-09 14:49:08 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/amadeuszslawinski-intel/linux-firmware.git
> 2025.05.12_topology_update

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/543

josh

>
> for you to fetch changes up to a32d5cc1a182b83f26a63adfae78853db2e0d151:
>
>    intel: avs: Update topology file for Digital Microphone Array
> (2025-05-12 15:12:13 +0200)
>
> ----------------------------------------------------------------
> Amadeusz S=C5=82awi=C5=84ski (1):
>        intel: avs: Update topology file for Digital Microphone Array
>
>   intel/avs/dmic-tplg.bin | Bin 9064 -> 9064 bytes
>   1 file changed, 0 insertions(+), 0 deletions(-)
