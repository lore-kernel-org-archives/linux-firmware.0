Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADD4C7EE2E
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jun 2023 11:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99595C4339C; Mon, 12 Jun 2023 11:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C55AC433D2
	for <linux-firmware@kernel.org>; Mon, 12 Jun 2023 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686568075;
	bh=TzAq+DxVtloX+kBkA1y41vwJTd+5FTfwGj1GajdRaZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XwOxitnUtf0P/9TUqItk133FO3QoS5+XTjxVH1Rw4n7KN7rFj6GmSCMidIegxcQdR
	 WpyQcb81IO4ByaPqnNMd3Zek769ddb0tmtTmEiPF7iUpjpJ163t8hWioo+bX/w06jc
	 hLRMPYmPSp625AYA7101POSrR25m+tJJKnPEgZwNiplSoteX85yvM5vlqKQj60zlCz
	 iIGCdQxzp51YBhDEe+ubF+I8FwxV1GK2t7grupML2uwGHQqeTYttItrY55TbkdjIQ4
	 7a/bCin3zvBwjdNFqhXWzOz1JKZ+mqc39oSoYWnSd+o0cjpMAfaMtwv+2o+Gq1QHrD
	 8qWATETOJgn3Q==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-56d2b950447so9569387b3.2
        for <linux-firmware@kernel.org>; Mon, 12 Jun 2023 04:07:55 -0700 (PDT)
X-Gm-Message-State: AC+VfDyeES7IL2/JgAlG/aNhiAAIgKj22y3orJYqzVOTzXOekrVPu3v3
	2hc/F3KOiCIRopoNtK+n8I0uJbqwD/BF4vzL84E=
X-Google-Smtp-Source: ACHHUZ5IpABzaATgdTE+JSIJfr3MP/O+AGHzPxwA1SfT2EXFGSAq7rWG7DLk/PpA2SVuOUIzNtwe5XFR6PDbKADYRAY=
X-Received: by 2002:a25:420d:0:b0:bac:ada7:140d with SMTP id
 p13-20020a25420d000000b00bacada7140dmr8442704yba.12.1686568074456; Mon, 12
 Jun 2023 04:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <BN9PR12MB51454B316F847D31BE09D037FF56A@BN9PR12MB5145.namprd12.prod.outlook.com>
In-Reply-To: <BN9PR12MB51454B316F847D31BE09D037FF56A@BN9PR12MB5145.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 12 Jun 2023 07:07:43 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4fV242Psef4dz8E7yu0uKdWTPJLzfSBKLGsA3yh+xJnw@mail.gmail.com>
Message-ID: <CA+5PVA4fV242Psef4dz8E7yu0uKdWTPJLzfSBKLGsA3yh+xJnw@mail.gmail.com>
Subject: Re: Update of amdgpu DMCUB firmware
To: "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, 
	"VURDIGERENATARAJ, CHANDAN" <CHANDAN.VURDIGERENATARAJ@amd.com>, "Sharma, Deepak" <Deepak.Sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Fri, Jun 9, 2023 at 8:51=E2=80=AFPM Wang, Chao-kai (Stylon)
<Stylon.Wang@amd.com> wrote:
>
> [Public]
>
>
> Hi Josh,
>
> Update amdgpu DMCUB firmware for various display IPs. Please apply.
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
