Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3845C3DA7F
	for <linux-firmware@archiver.kernel.org>; Thu, 15 Aug 2024 13:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 759BAC4AF0D; Thu, 15 Aug 2024 13:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFADC4AF0C
	for <linux-firmware@kernel.org>; Thu, 15 Aug 2024 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723728952;
	bh=3819GQrsgL7wwpWATbBMaAGHYadzNeajD4BlBqyAwZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PWExAgcH6PuNuo6JiDljXMc1UyIbDovdRTXFCXjTcebkhwFX9mOQnoF86A+eBFSFp
	 uw2+wMHDqbAuVn45zHjts2VXWhKyPHUCIxJq2p6G/b6yHCR5oJUe0Tqe1xykRQPnp3
	 Tyos/Tox20n1iG2KHQ7YQtAQ7odd91TA+c2AzoMY+avlS4y3HGIUi2Uf3Ea02t7p1T
	 w5irkE6g5LMgi6Ze8aYW6hAdAo6bqx/YIyX/JTI4fz5zWUh9ojtIeIjbGeX8BpPrpE
	 RPakvzZD9YZMTqYrn1bHmKxIELd0KbAyxMVSH0X5logI+k2yTPQ1T5331jzTldP0gI
	 M7/pffO/b8xYw==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-690ad83d4d7so9176387b3.3
        for <linux-firmware@kernel.org>; Thu, 15 Aug 2024 06:35:52 -0700 (PDT)
X-Gm-Message-State: AOJu0YxoO0hvq81zufPrkRc7M1oLksKj8wZMoTHPTtXZy7x2JraC0cma
	p1xoBTR+ZfHv19I/qayxbCy29jHv5fX05rPYYhGkbfLVcNdrcZzeOC8JJnRhonJbPmoUYrjDbSy
	9jkV9S6CkSMfvuklZcBkZgiUk/cM=
X-Google-Smtp-Source: AGHT+IGhqnMV9wrfKndcVmORIGHcRbwbRRlLppLycGDwkxFRHFX6uUAY0uRw6//gBND7IU9n9xNnL54J6d//RWeQAGE=
X-Received: by 2002:a05:690c:4d83:b0:64a:efa6:b3d5 with SMTP id
 00721157ae682-6ac9a47849bmr82380347b3.37.1723728951646; Thu, 15 Aug 2024
 06:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240812055246.9294-1-chiahsuan.chung@amd.com>
In-Reply-To: <20240812055246.9294-1-chiahsuan.chung@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 15 Aug 2024 09:35:39 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4Hy=zLVM-2RWoPeV=y0+2hbrtO0Fx-NTHk2MX_9o6BLw@mail.gmail.com>
Message-ID: <CA+5PVA4Hy=zLVM-2RWoPeV=y0+2hbrtO0Fx-NTHk2MX_9o6BLw@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.229.0
To: Tom Chung <chiahsuan.chung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 1:53=E2=80=AFAM Tom Chung <chiahsuan.chung@amd.com>=
 wrote:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-08-12 13:43:13 +08=
00)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-08-12

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/273

josh

>
> for you to fetch changes up to 0600ef249c32e761d2f31d50fddc4f17e6676849:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-08-12 13:43:13 +08=
00)
>
> ----------------------------------------------------------------
