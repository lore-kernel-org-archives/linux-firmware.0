Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AA6CD37B0
	for <linux-firmware@archiver.kernel.org>; Mon, 18 Sep 2023 11:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4ABB2C433CA; Mon, 18 Sep 2023 11:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B74C433C8
	for <linux-firmware@kernel.org>; Mon, 18 Sep 2023 11:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695036296;
	bh=Tt/dpF9DkSsVaRKf3st+YMf00N4R/wExuWYAu3MN5u8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Gc4KA57D6Uk01Sdf+K6qEmJ9In4rWzD2rdbXwnEH0v2EzVbChqRpNbbS7zDd/4O39
	 6/MhP8BLvjNrPy+Lefj8NV0heRF2/ArXbwx9OwQpzhr/7hH/lzLA9kS/jR/82W1V4K
	 BXDlVvxtchAY7URv81YtPB6qQ8O9O8KgEYA07dRZYmt4c8adcH535yLX/ZpkXdSSzh
	 dZrXp49yc3KUzR9tORvw0xqYebDrpOH+dgaYCnLHswssLW/SU2725qnzisGKng0sod
	 jKUFB44rtxoR1PGiOtrS8496oXQnoy+aS/YWMLh3B46n5ZIifv88sl+6SO20ZgxJNv
	 n0hqxiFGtYp+A==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d81b9f0487eso3276619276.2
        for <linux-firmware@kernel.org>; Mon, 18 Sep 2023 04:24:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YwJYV3VUPERxMlbBAyMsmwPAmrMDSm0tGQV5fWj2Vmjd0kg9Vpo
	zv/IBb+EehD19dDL3nLOXf2i/dhRsyvBHDaDmVg=
X-Google-Smtp-Source: AGHT+IH0QlcHGwTRKKPE49lKpD5nh2WnYCuiHuI1/XpnKSmyn52dX0nLY2oS5PcbGNkDbu7+tIhJfAUlFo8jdaNL0Tk=
X-Received: by 2002:a25:ae1b:0:b0:cea:b62d:620f with SMTP id
 a27-20020a25ae1b000000b00ceab62d620fmr7582675ybj.45.1695036295295; Mon, 18
 Sep 2023 04:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <BN9PR12MB5145D1065DEC1C708C56AAB0FFEDA@BN9PR12MB5145.namprd12.prod.outlook.com>
In-Reply-To: <BN9PR12MB5145D1065DEC1C708C56AAB0FFEDA@BN9PR12MB5145.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 18 Sep 2023 07:24:44 -0400
X-Gmail-Original-Message-ID: <CA+5PVA698UXvj9O+trQt197cEvL5DsM55PdGHrqSvDpJEPiogw@mail.gmail.com>
Message-ID: <CA+5PVA698UXvj9O+trQt197cEvL5DsM55PdGHrqSvDpJEPiogw@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware (2023-09-08)
To: "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, "Sharma, Deepak" <Deepak.Sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 8, 2023 at 11:05=E2=80=AFAM Wang, Chao-kai (Stylon)
<Stylon.Wang@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
>
> The following changes since commit 2bbca647e4aeed3813ba7776d309c4525e0ad8=
41:
>
>   amdgpu: update DMCUB to 0.0.183.0 for various AMDGPU ASICs (2023-09-08 =
22:30:18 +0800)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-09-08

Pulled and pushed out.

josh

>
> for you to fetch changes up to 2bbca647e4aeed3813ba7776d309c4525e0ad841:
>
>   amdgpu: update DMCUB to 0.0.183.0 for various AMDGPU ASICs (2023-09-08 =
22:30:18 +0800)
>
>
> Regards
>
> Stylon Wang
>
> MTS Software Development Eng.  |  AMD
> Display Solution Team
>
> O +(886) 2-3789-3667 ext. 23667  C +(886) 921-897-142
>
> -------------------------------------------------------------------------=
---------------------------------------------------------
>
> 6F, 3, YuanCyu St (NanKang Software Park) Taipei, Taiwan
>
> Facebook |  Twitter |  amd.com
>
>
