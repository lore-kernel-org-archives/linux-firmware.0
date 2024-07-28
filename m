Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BD1C3DA64
	for <linux-firmware@archiver.kernel.org>; Sun, 28 Jul 2024 14:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65C41C4AF0B; Sun, 28 Jul 2024 14:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43639C32782
	for <linux-firmware@kernel.org>; Sun, 28 Jul 2024 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722176904;
	bh=162H5q/uGJnqIh0KpF3RFVyN8gFxBLIEtz0wPnynlmc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OxEUfCgEYdcnY3l2tgXip3O+d9XwzX/V4UtPr7EcB7SR2/upFPJB+eWYsA9Np5Upz
	 KGiI5z+1xiCUWu627lkSfBDrmFTEiFSDP8zNp71EXzBC1AzZIMMAb4pgr6nx84cfP5
	 nsjjUW64QuNcX6ibGtii+nqiCHQ7Evt1QItErRcmZdALoUkIKzOuq8ozah1WAlMVUL
	 DDgkd5Niy+XAN8ZjOHHLa2dqqh/3/H0qEzWiwOUEAwmVmbjiO7fu3VxsJJXRx5z71u
	 xvhjmpY0Yjd/01nAAoPYYPrKnmF+VUCp5rF93uxudri/R8C5kL65+74lH6vUoBMYBR
	 z3ROYsaSn0o5A==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-65cd720cee2so11653407b3.1
        for <linux-firmware@kernel.org>; Sun, 28 Jul 2024 07:28:24 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx4gok2cozZsd0wKtsdcdy007V/jWHZbKCOjBj7QeEldEQnN6NJ
	SGwOtgRoXCyjP2p4wN6MsTh+2MjKCjduY5LjOsgu28ZkShPQopgRorFVCgZfnJ6edemIpdng9p+
	C1NT9Wn67f8s2Rgz8q89wOCtqtDI=
X-Google-Smtp-Source: AGHT+IFwL0MMprmcI3Aw2RAGUSKx4I1YY6m1MC6aKg+KLR8qypTlI7O/UAaFKsm4GUUyg5JEq8eojdhUJFJZQqaWY38=
X-Received: by 2002:a05:690c:610a:b0:615:1a0:78ea with SMTP id
 00721157ae682-67a0a13a588mr67298297b3.34.1722176903469; Sun, 28 Jul 2024
 07:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240725231548.145196-1-Rodrigo.Siqueira@amd.com>
 <CA+5PVA4nh=ry2srNz0eWdi+xnOmARx-FL43iK4hZM74igZ1b4w@mail.gmail.com> <54688e5e-331b-4f5d-b3eb-95119a0f6e69@amd.com>
In-Reply-To: <54688e5e-331b-4f5d-b3eb-95119a0f6e69@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sun, 28 Jul 2024 10:28:12 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4SvBBTKRQtjftmL0ZPKtapYro-nC2=xU7np9n5C8Ua2g@mail.gmail.com>
Message-ID: <CA+5PVA4SvBBTKRQtjftmL0ZPKtapYro-nC2=xU7np9n5C8Ua2g@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.227.0
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 7:37=E2=80=AFPM Rodrigo Siqueira Jordao
<Rodrigo.Siqueira@amd.com> wrote:
>
>
>
> On 7/26/24 5:41 AM, Josh Boyer wrote:
> > On Thu, Jul 25, 2024 at 7:16=E2=80=AFPM Rodrigo Siqueira
> > <Rodrigo.Siqueira@amd.com> wrote:
> >>
> >> The following changes since commit b29f570a9b03d30e33966d653a214597f81=
32b4b:
> >>
> >>    amdgpu: update DMCUB to v0.0.227.0 for DCN35 and DCN351 (2024-07-25=
 15:21:21 -0600)
> >>
> >> are available in the Git repository at:
> >>
> >>    git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-07-25
> >
> > This tree produces merge conflicts.
> >
> > [jwboyer@vader linux-firmware]$ git fetch
> > https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-07-25
> > remote: Enumerating objects: 603, done.
> > remote: Counting objects: 100% (596/596), done.
> > remote: Compressing objects: 100% (91/91), done.
> > remote: Total 503 (delta 484), reused 425 (delta 412), pack-reused 0 (f=
rom 0)
> > Receiving objects: 100% (503/503), 4.55 MiB | 17.76 MiB/s, done.
> > Resolving deltas: 100% (484/484), completed with 66 local objects.
> >  From https://gitlab.freedesktop.org/drm/firmware
> >   * tag                 amd-2024-07-25 -> FETCH_HEAD
> > [jwboyer@vader linux-firmware]$ git merge --no-gpg-sign --signoff FETCH=
_HEAD
> > Auto-merging WHENCE
> > warning: Cannot merge binary files: amdgpu/dcn_3_5_1_dmcub.bin (HEAD
> > vs. b29f570a9b03d30e33966d653a214597f8132b4b)
> > Auto-merging amdgpu/dcn_3_5_1_dmcub.bin
> > CONFLICT (add/add): Merge conflict in amdgpu/dcn_3_5_1_dmcub.bin
> > warning: Cannot merge binary files: amdgpu/dcn_3_5_dmcub.bin (HEAD vs.
> > b29f570a9b03d30e33966d653a214597f8132b4b)
> > Auto-merging amdgpu/dcn_3_5_dmcub.bin
> > CONFLICT (add/add): Merge conflict in amdgpu/dcn_3_5_dmcub.bin
> > Automatic merge failed; fix conflicts and then commit the result.
> > [jwboyer@vader linux-firmware]$
>
> Hi Josh,
>
> Could you try again with the tag amd-2024-07-26?
>
> I rebased our branch against the latest code from the branch main from
> the linux-firmware repo for generating this tag. Hopefully, it will
> address the issue.

Thanks.  Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/262

josh
