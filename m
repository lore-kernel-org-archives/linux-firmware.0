Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C76C0015E
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Jul 2023 18:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E239EC433CD; Fri, 28 Jul 2023 18:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB65C433CB
	for <linux-firmware@kernel.org>; Fri, 28 Jul 2023 18:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690568220;
	bh=8cNajFNnrMcDrsyQerTlPGu/Z6ZOR7ewk82PxPidIIg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iDqS50nT4ZdkRR7Ttmj8zTm07kh0I1hymwrhAE0J7pHN54+u9zRhyq/8gvP93+le5
	 Gnsq28gt6DG5M0kf2DvFQKEEiDwYkMwI+lct8wErH5z7WXgEGqX4YAJ6JBZAhQj4lt
	 rA8zA4uMNmmgZ/pmHBJQo74Vfps8tsdrhcb28X39KfhBUjhQEWwRtZAuXfKIrXbtRJ
	 k52v1caw2eV/wUo+efIvriagTc/e+EcTK/xzJP9W6Dy625YFuRxjE2acV8evHHKhkv
	 RY+bn6w/EF8htkJUIUJqDywsX2GHoeFhrDGMDgWNW/UEx6hsfwTcpZejTwNcPMsd9L
	 LYGMMxbmoQZYw==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-bff89873d34so2191926276.2
        for <linux-firmware@kernel.org>; Fri, 28 Jul 2023 11:17:00 -0700 (PDT)
X-Gm-Message-State: ABy/qLZFbqCEJ8R+w13uG3VMB9WjjRTtv0CULwGVR/S2fGR4zayeYWnr
	t/cyVrSqxCDF9kKio93az1FoTvsv0KJ40cqRK1w=
X-Google-Smtp-Source: APBJJlHpaiegF/yybLuXqdYy9B5BqHTjhxL1Er5olNBPYLJgXybjhldtw/0i18AW1PH30i/oLNpUAnHEOHnuPYQSXbs=
X-Received: by 2002:a25:9c44:0:b0:cc6:26f7:f0ea with SMTP id
 x4-20020a259c44000000b00cc626f7f0eamr2060380ybo.27.1690568219806; Fri, 28 Jul
 2023 11:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <xkl4onzpf4xwybliz7qiyi5a63ahm3ifobrzadosfz6v3qtqqr@dibuivsbafpk>
In-Reply-To: <xkl4onzpf4xwybliz7qiyi5a63ahm3ifobrzadosfz6v3qtqqr@dibuivsbafpk>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 28 Jul 2023 14:16:49 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5i5FaHzzcMtQE+OW0fy2U0-GWtR8nPqogLAhZ4DsYyOw@mail.gmail.com>
Message-ID: <CA+5PVA5i5FaHzzcMtQE+OW0fy2U0-GWtR8nPqogLAhZ4DsYyOw@mail.gmail.com>
Subject: Re: PR for ADLP DMC v2.20 and MTL DMC v2.13
To: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kyle@mcmartin.ca, ben@decadent.org.uk, 
	intel-gfx@lists.freedesktop.org, Anusha Srivatsa <anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 4:50=E2=80=AFPM Gustavo Sousa <gustavo.sousa@intel.=
com> wrote:
>
> The following changes since commit b6ea35ff6b9869470a0c68813f1668acb3d356=
a8:
>
>   copy-firmware: Fix linking directories when using compression (2023-07-=
25 06:53:30 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware dmc-adlp_2.20-mtl_2.13

Pulled and pushed out.

josh

>
> for you to fetch changes up to fd6e13ca2a1141aeede3666f72d2a006a3903fc0:
>
>   i915: Update MTL DMC to v2.13 (2023-07-26 13:59:54 -0300)
>
> ----------------------------------------------------------------
> Gustavo Sousa (2):
>       i915: Update ADLP DMC to v2.20
>       i915: Update MTL DMC to v2.13
>
>  WHENCE            |   4 ++--
>  i915/adlp_dmc.bin | Bin 79044 -> 79088 bytes
>  i915/mtl_dmc.bin  | Bin 49104 -> 52164 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
