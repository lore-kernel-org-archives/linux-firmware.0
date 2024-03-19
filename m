Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C385C54E5D
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Mar 2024 11:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DB7DC43394; Tue, 19 Mar 2024 11:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286E3C43390
	for <linux-firmware@kernel.org>; Tue, 19 Mar 2024 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710849041;
	bh=1PVHAaNGMo6dmDcDZ9vhIqfn4I7a3/ZmGd2yBA15zv0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OYeKRdIwIpeIlsuYyP0uMav/CGahizGQySH2d9GR2a6hSgqF3Kgk3tmoxXjXPq3SV
	 otj1E3kb7EyF0jETN2WaVkawEpqUCOzgAcNzsPft2IzgFWwp+ql/jnoSjBOABAwAZw
	 4r4bDOZ4twvfbzYwjPYWpl6CJKtVp9MiTEbD1sM9cyoubJ+PWEOjHdubPLxFS5JnMj
	 AZFs/REBPZ4v/bMrQ92W8hnzlizLw/wFCQ7rjFFpVhLjIf+TOy3zdX/hKhTx6JsoLx
	 pItE+Ju6+NMs93Cs78NdNDiozgyUmzI+DeBybMAo3ucUkcu91763Ba6G0KYDkgWiKn
	 npmGIrIASAieg==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso3720849276.1
        for <linux-firmware@kernel.org>; Tue, 19 Mar 2024 04:50:41 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxr0PY7Mg6EpcqsP5SQOWGHtekqmWF+mClsv32ELkWBW7O3GPWg
	L7NOIaDBDctliaVDY7bcyjGZ2ptSknhp4zmyS4tV8o5OHG6jOFvQbTf+QK5RyHZcO4RMGIvgLka
	FN7Lv4idf4XkS2h0moBzM3WarCdU=
X-Google-Smtp-Source: AGHT+IGPMQa4cdtLkLPnUQ4Y1YFRCGijNYdUAMrT923zf0q2wsW73F1vfam4wQtAzcja4INlLTQvoTlJWcvoRmQgb+k=
X-Received: by 2002:a05:6902:50a:b0:dcc:467c:cecb with SMTP id
 x10-20020a056902050a00b00dcc467ccecbmr1581092ybs.37.1710849040307; Tue, 19
 Mar 2024 04:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240315041052.1029736-1-Wayne.Lin@amd.com>
In-Reply-To: <20240315041052.1029736-1-Wayne.Lin@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Mar 2024 07:50:29 -0400
X-Gmail-Original-Message-ID: <CA+5PVA64HgxgB8bjk1JJD-OXF74AKswWFX9NojHRnDdiOWyvcw@mail.gmail.com>
Message-ID: <CA+5PVA64HgxgB8bjk1JJD-OXF74AKswWFX9NojHRnDdiOWyvcw@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.209.0
To: Wayne Lin <Wayne.Lin@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 12:11=E2=80=AFAM Wayne Lin <Wayne.Lin@amd.com> wrot=
e:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-03-15 11:56:11 +08=
00)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-03-15

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/177

josh

>
> for you to fetch changes up to ad8aea35cfcb90e1579082b828c4d965603b8c0a:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-03-15 11:56:11 +08=
00)
>
> ----------------------------------------------------------------
