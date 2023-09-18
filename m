Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2243CD37B0
	for <linux-firmware@archiver.kernel.org>; Mon, 18 Sep 2023 11:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3A84C433CB; Mon, 18 Sep 2023 11:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6EAC433CA
	for <linux-firmware@kernel.org>; Mon, 18 Sep 2023 11:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695036501;
	bh=dRHK6+q7w35hkHxF5TLLurO050bYKeUwTQ2BIyvmKB8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VUyyH3LSxVzqjJpEPN5PLFrdqu00seA1zBp2TzwgySNTtRoTTKGDAJKrsvV4dq5Pa
	 Mlyhsv5ZOvMYKbZNsdUff59tTQSiDY7o4laxQaPuBSzAex1NVCl1ezk984/H8eMe4w
	 iKlpW3uDvoUtbHtbr92rqRYxJ1CzdtqTVgKSGnB9xQDIrM+g05FTuhqaPtzlwBGsSl
	 oUuC3iryaG2SpYyM6hiCI2+eZN1hNTORLViO2u8GRjsScn8zrr6dY0rxcvgeA/IP69
	 WCz6DjVauqhO56B8ZI47CMdANOZtRkHZLhg8q/egPVFruYaG9IGiqHm7iuLcd+S0eD
	 MzbtOu/IEqs9Q==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d81afd5273eso3501573276.3
        for <linux-firmware@kernel.org>; Mon, 18 Sep 2023 04:28:21 -0700 (PDT)
X-Gm-Message-State: AOJu0YzD9tobPlNIjcABgaKvW6RWhqDOS1dc8zkdRICeD+zxl0/VJEvT
	4ykcJmzHF9bT1lv7zt9rYmrLOKs7MZ8OcK1ZHWg=
X-Google-Smtp-Source: AGHT+IHONTCz0c8MhJc5zoNaUjEwSpAzWQe+gtv7g+0asZxTGl+tKoRY3TfL11+VHePjRj825ccfJqNvy8rhJ/HeZ6Y=
X-Received: by 2002:a25:6885:0:b0:d7e:b89c:9919 with SMTP id
 d127-20020a256885000000b00d7eb89c9919mr7773602ybc.1.1695036500752; Mon, 18
 Sep 2023 04:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230914144651.272047-1-sandipan.das@amd.com>
In-Reply-To: <20230914144651.272047-1-sandipan.das@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 18 Sep 2023 07:28:10 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6DnzatN69YSV3jZFJ8eKHNZy1HjvxCTD6TG9fAP_ELBA@mail.gmail.com>
Message-ID: <CA+5PVA6DnzatN69YSV3jZFJ8eKHNZy1HjvxCTD6TG9fAP_ELBA@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: amd-ucode: Add note on fam19h warnings
To: Sandipan Das <sandipan.das@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, john.allen@amd.com, bp@alien8.de, 
	suravee.suthikulpanit@amd.com, ananth.narayan@amd.com, ravi.bangoria@amd.com, 
	santosh.shukla@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 10:47=E2=80=AFAM Sandipan Das <sandipan.das@amd.com=
> wrote:
>
> When running 5.19+ kernels on Genoa or Bergamo systems, some microcode
> patches are known to trigger warnings in the PMI handler. Add a note
> to list the required minimum patch levels for addressing this problem.
>
> Signed-off-by: Sandipan Das <sandipan.das@amd.com>

Applied and pushed out.

josh

> ---
>  amd-ucode/README | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/amd-ucode/README b/amd-ucode/README
> index fac11524..f47743c1 100644
> --- a/amd-ucode/README
> +++ b/amd-ucode/README
> @@ -53,3 +53,12 @@ a32b0f0db3f3 ("x86/microcode/AMD: Load late on both th=
reads too")
>  When late loading the patches for Genoa or Bergamo, there may be one spu=
rious
>  NMI observed per physical core. These NMIs are benign and don't cause an=
y
>  functional issue but will result in kernel messages being logged.
> +
> +NOTE: When running 5.19+ kernels on Genoa or Bergamo systems, some micro=
code
> +patches are known to trigger warnings in the PMI handler. The following =
are
> +the required minimum patch levels to address this problem:
> +
> +  Family=3D0x19 Model=3D0x11 Stepping=3D0x01: Patch=3D0x0a10113e
> +  Family=3D0x19 Model=3D0x11 Stepping=3D0x02: Patch=3D0x0a10123e
> +  Family=3D0x19 Model=3D0xa0 Stepping=3D0x01: Patch=3D0x0aa00116
> +  Family=3D0x19 Model=3D0xa0 Stepping=3D0x02: Patch=3D0x0aa00212
> --
> 2.34.1
>
