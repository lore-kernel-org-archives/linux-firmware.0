Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE60C83F12
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Aug 2023 11:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B884FC433C9; Tue, 29 Aug 2023 11:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA91C433C8
	for <linux-firmware@kernel.org>; Tue, 29 Aug 2023 11:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693308438;
	bh=ANDCGTzSJLoMjLaeMZjnO7QGU0rluTG4DUSTmDrG6gk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=acDIQqnr2XCzlvtMGBWt4I6JHP1Gn9u/hv1wtiP5Pk5QxdxO7WYoXgc9QWUHOsYsw
	 tbYc4G9jEXij5fPaNBCd8tqo4YmIn2ta+Puvq2ni17u6WwQuqL3K6khtNx86wuZ+7r
	 bMwoJhraS30i20alTwtjCwxvHCLa1UG16F5G1msLmIhIRCY1mtl3boZJuYlQcc9tf6
	 63ydimVjn6wa2kD3nWIzHdiqM+S0Bos7NfqAVF3rx66vyVzrWDoMRNqsZ3AUvvHU44
	 xrk1KV8yRs1idvwAt7di52wpSnt+7gxuzOyIkoMWlDWjMwU+0BiJ28FC7vsw3n6KFT
	 D0j38DCjwN9RQ==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59234aaca15so48929367b3.3
        for <linux-firmware@kernel.org>; Tue, 29 Aug 2023 04:27:18 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw2RGmpEbVqIpwTkrM4d7PyItgY0YTfuJCma9v94JF8kBKIWFbu
	DU1unMpuoayCuFw4e4BetFwQx6wMgtOE8bSZLSI=
X-Google-Smtp-Source: AGHT+IF1urrMdblJcVQvHD3D7liGJz5M2C0NaCjAHI/fdG2ByEWXvbE2k9ki+MmDUDnvr6fPq14xcwg9nFiBHj/tN9s=
X-Received: by 2002:a0d:e8ca:0:b0:586:6a71:b018 with SMTP id
 r193-20020a0de8ca000000b005866a71b018mr31600906ywe.20.1693308437650; Tue, 29
 Aug 2023 04:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <CO6PR12MB5489D16A4E8E7301B9C43911FC1EA@CO6PR12MB5489.namprd12.prod.outlook.com>
In-Reply-To: <CO6PR12MB5489D16A4E8E7301B9C43911FC1EA@CO6PR12MB5489.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 29 Aug 2023 07:27:06 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4a5nfJCGHhRdcVmjfZYALvOzim96riA67w+ozKBZhpXA@mail.gmail.com>
Message-ID: <CA+5PVA4a5nfJCGHhRdcVmjfZYALvOzim96riA67w+ozKBZhpXA@mail.gmail.com>
Subject: Re: Update of amdgpu DMCUB firmware
To: "Lin, Wayne" <Wayne.Lin@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, 
	"chandan.vurdigerenataraj@amd.com" <chandan.vurdigerenataraj@amd.com>, "Sharma, Deepak" <Deepak.Sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 20, 2023 at 10:30=E2=80=AFPM Lin, Wayne <Wayne.Lin@amd.com> wro=
te:
>
> [AMD Official Use Only - General]
>
> Hi Josh,
>
> DMCUB updates for various AMDGPU asics.
>
> The following changes since commit 0e048b061bde79ad735c7b7b5161ee1bd34001=
50:
>
>   Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-fir=
mware (2023-08-14 13:03:41 -0400)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-08-18

Pulled and pushed out.

josh

>
> for you to fetch changes up to 5eeda20da0d7c79ab38ea3337bf402ce90246e8c:
>
>   amdgpu: DMCUB updates for various AMDGPU asics (2023-08-18 10:59:22 +08=
00)
>
> ----------------------------------------------------------------
> Wayne Lin (1):
>       amdgpu: DMCUB updates for various AMDGPU asics
>
>  amdgpu/dcn_3_2_1_dmcub.bin | Bin 232224 -> 232352 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
