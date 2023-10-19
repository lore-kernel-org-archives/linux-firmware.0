Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CC7CDB465
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Oct 2023 11:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D32D4C433CD; Thu, 19 Oct 2023 11:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB78AC433CB;
	Thu, 19 Oct 2023 11:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697715597;
	bh=3NPR4tsWiOseLUdVXRHH3VkNRoj1EbEcxNKLOJC3RVw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tUjY2kBiOkj3JNpv21AufPyw53G/iQtGOvSl2eVhWpyi9oHuQTOhH/SeE1N+oStCB
	 aPaAlcNbFiKnClOjXpp3VwHxl5GE7IdZeTacEOA6FJXfAz4ihdgMMmOzyrjAQncTsf
	 4egfg3gPLri626yGnQNeIDTcgiF0rQTTB0WbNisitJsUSEe4lyJjaKueaxI2qHqHtQ
	 FQv4RB36PbrlI2PhcZdvifkVu0S4P8U3Al2Zg0idDKvKcjUGeAj/JMIbLJS865UUnZ
	 zWcaU6APWd7/6zRRNDCEq15pdvBWhgbjXjiTfY458jRW0CSL7wq0FmiqQsUzhyD3ql
	 iOq7s7FJvuUuw==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d9ac9573274so8726406276.0;
        Thu, 19 Oct 2023 04:39:57 -0700 (PDT)
X-Gm-Message-State: AOJu0YzmmERrV2rFX4DqxP8znPXFARvcP4DDvKU3GzbDy6VV9d+kaB4P
	eZgoZreZKVyizVNXrnctTvGXRg1C99XK7DhhbkA=
X-Google-Smtp-Source: AGHT+IFkSSuqS3qxQRKctlKyrgkIhF/Jf1MxWXy7lClwDKwwTCUA4uEhxY9zbZTB/tlazZO00jo8d41zpqs1fxJKw8w=
X-Received: by 2002:a5b:a02:0:b0:d9b:4f28:f6ce with SMTP id
 k2-20020a5b0a02000000b00d9b4f28f6cemr2101059ybq.1.1697715596904; Thu, 19 Oct
 2023 04:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231018190701.2388817-1-John.C.Harrison@Intel.com> <c5a4f07e-1383-446c-8eb5-e473733e3b7a@intel.com>
In-Reply-To: <c5a4f07e-1383-446c-8eb5-e473733e3b7a@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 19 Oct 2023 07:39:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5A-XKTwAcnjraQe=CMa+MHCfpi68a1wFZ=F1_hHoyojg@mail.gmail.com>
Message-ID: <CA+5PVA5A-XKTwAcnjraQe=CMa+MHCfpi68a1wFZ=F1_hHoyojg@mail.gmail.com>
Subject: Re: [Intel-gfx] [CI] PR for new GuC v70.13.1
To: John Harrison <john.c.harrison@intel.com>, Mario Limonciello <superm1@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org, 
	intel-gfx@lists.freedesktop.org, kyle@kernel.org, ben@decadent.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Already merged.

josh

On Wed, Oct 18, 2023 at 3:11=E2=80=AFPM John Harrison <john.c.harrison@inte=
l.com> wrote:
>
> Apologies, I sent this with the wrong subject. Please ignore. Will
> resend with the correct subject.
>
> John.
>
>
> On 10/18/2023 12:07, John.C.Harrison@Intel.com wrote:
> > The following changes since commit 7727f7e3b3358713c7c91c64a835e80c331a=
6b8b:
> >
> >    Merge branch 'patch-1696561325' into 'main' (2023-10-06 03:04:57 +00=
00)
> >
> > are available in the Git repository at:
> >
> >    git://anongit.freedesktop.org/drm/drm-firmware guc_70.13.1
> >
> > for you to fetch changes up to 44a9510c94ac0334931b6c89dd240ffe5bf1e5fa=
:
> >
> >    i915: Add GuC v70.13.1 for DG2, TGL, ADL-P and MTL (2023-10-13 11:34=
:26 -0700)
> >
> > ----------------------------------------------------------------
> > John Harrison (1):
> >        i915: Add GuC v70.13.1 for DG2, TGL, ADL-P and MTL
> >
> >   WHENCE               |   8 ++++----
> >   i915/adlp_guc_70.bin | Bin 297984 -> 342848 bytes
> >   i915/dg2_guc_70.bin  | Bin 385856 -> 443200 bytes
> >   i915/mtl_guc_70.bin  | Bin 308032 -> 365376 bytes
> >   i915/tgl_guc_70.bin  | Bin 285888 -> 330304 bytes
> >   5 files changed, 4 insertions(+), 4 deletions(-)
>
