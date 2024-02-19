Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0995C48BF8
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Feb 2024 12:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8F32C43394; Mon, 19 Feb 2024 12:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3190C43399
	for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 12:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347021;
	bh=wiitRUpEfi6wkcEYZ3w7fn9GolEDShmIbZWQlTiSdzA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=SqrGdPxryRcox0xiiLzCsfYJxck0tUd/T0X3iYtrcMpMJ88XsBAst4foMjjPVuwt9
	 jSuT5Z/O55PAhSNNzWBocQKUJP/SliDB4qIj1M6kQf/vjCw1svjh+zfiDVSdfui8fp
	 jxQvkBcLeQLDBbJjne+8N7AgVNtbRNedco8tZEAbyagn+P3RoVimUVAq9QjPxFUYjE
	 PKF21K5MW+F3Ary/RgvOHJ75W5Y2+/FUfesAnlrudWE55n/NMc2dQfD10eQ38kw0WL
	 i2AYv93vDzk50epNkqwr4FyBej9RsHKxQOwXqYV2yOdbe59h3MrF4GzBholBCh2VJG
	 dSWjU0QSZ78Eg==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-607c5679842so42216497b3.2
        for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 04:50:21 -0800 (PST)
X-Gm-Message-State: AOJu0Yx6etDaPt29SFaRdwQPWE785btMXBLJbZu8M1d4sPUGVYvP9K5S
	2SzpBKWKCnChMZp9/Nn9bbdaqq0+6JeBpeaZAmVTblA/HgBkhcOfLZttnSbtVJb3k1xHQcEoiR8
	ctMdJPa3XVBs2xIMROBVwByF/gEs=
X-Google-Smtp-Source: AGHT+IFpAEMEjl3pV4iQ6ZlK0YsrFalN9DbiC9jhQ4jAml5ijD71J4ZuxmevhKpol8q/lgwK3RoSLG+idClnb4fBj+o=
X-Received: by 2002:a0d:d947:0:b0:604:9cad:8c23 with SMTP id
 b68-20020a0dd947000000b006049cad8c23mr11838669ywe.11.1708347020793; Mon, 19
 Feb 2024 04:50:20 -0800 (PST)
MIME-Version: 1.0
References: <Zcx8i978Bx7QRSNJ@kekkonen.localdomain>
In-Reply-To: <Zcx8i978Bx7QRSNJ@kekkonen.localdomain>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Feb 2024 07:50:10 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5aYOO5acdfjgcXfqTgBh-ZWwyQuYEE+9oORvVjZhVR+A@mail.gmail.com>
Message-ID: <CA+5PVA5aYOO5acdfjgcXfqTgBh-ZWwyQuYEE+9oORvVjZhVR+A@mail.gmail.com>
Subject: Re: [GIT PULL v2] Intel Image Processing Unit 6 firmware
To: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bingbu Cao <bingbu.cao@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 3:40=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi folks,
>
> This PR moves Intel IPU firmware files under ipu subdirectory for easier
> packaging. WHENCE is updated for IPU3 ImgU firmware links.
>
> since v1:
>
> - Rebase on the Gitlab repository main branch. The one in git.kernel.org
>   was not up to date. :-(

There was an issue with the machine doing syncing.  It's been
resolved.  Apologies for the inconvenience.

> Please pull.
>
>
> The following changes since commit 8acf0a98dbe1606cf696b0ee61bcce7eed5db8=
0f:
>
>   Merge branch 'robot/patch-10-1707787255' into 'main' (2024-02-13 01:31:=
56 +0000)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.g=
it tags/ipu6-2024-02-14-2

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/152

josh

>
> for you to fetch changes up to 08ab13d5d079c90dc21145710a2cc42326562aee:
>
>   Intel IPU3 ImgU: Move firmware file under intel/ipu (2024-02-14 10:37:5=
7 +0200)
>
> ----------------------------------------------------------------
> Move IPU firmware under ipu
>
> ----------------------------------------------------------------
> Sakari Ailus (2):
>       Intel IPU6: Move firmware binaries under ipu/
>       Intel IPU3 ImgU: Move firmware file under intel/ipu
>
>  WHENCE                                                   |  15 ++++++++-=
------
>  intel/{ =3D> ipu}/ipu6_fw.bin                              | Bin
>  intel/{ =3D> ipu}/ipu6ep_fw.bin                            | Bin
>  intel/{ =3D> ipu}/ipu6epadln_fw.bin                        | Bin
>  intel/{ =3D> ipu}/ipu6epmtl_fw.bin                         | Bin
>  intel/{ =3D> ipu}/ipu6se_fw.bin                            | Bin
>  .../irci_irci_ecr-master_20161208_0213_20170112_1500.bin | Bin
>  7 files changed, 8 insertions(+), 7 deletions(-)
>  rename intel/{ =3D> ipu}/ipu6_fw.bin (100%)
>  rename intel/{ =3D> ipu}/ipu6ep_fw.bin (100%)
>  rename intel/{ =3D> ipu}/ipu6epadln_fw.bin (100%)
>  rename intel/{ =3D> ipu}/ipu6epmtl_fw.bin (100%)
>  rename intel/{ =3D> ipu}/ipu6se_fw.bin (100%)
>  rename intel/{ =3D> ipu}/irci_irci_ecr-master_20161208_0213_20170112_150=
0.bin (100%)
>
> --
> Sakari Ailus
