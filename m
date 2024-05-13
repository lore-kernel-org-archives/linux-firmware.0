Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24249C25B10
	for <linux-firmware@archiver.kernel.org>; Mon, 13 May 2024 11:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9CC5C32781; Mon, 13 May 2024 11:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D088AC32782
	for <linux-firmware@kernel.org>; Mon, 13 May 2024 11:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715599095;
	bh=r32mIDPv3PFeY0SosELOOgOOnD7QKePrcp1s5uhohvw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Y//jGMQj6p7QU565Q/TE7Cl74Xp6fmhFSZjNwd5df162C6iQKZzkAnJVjckBaSaZ7
	 8qOw7aSxJxTvg/7Ia5vNm+JRXZza3R3NIEitiV0Yp47eq04A9/p8a+FpNd1xtfJLv3
	 j+hk4lXQ1MVa6KXgfnMApGw+NS4tq33t0z8eZrClz+s9XJy1q6na6t7kfNHOxSb6B6
	 uds6+pz+MhdE5CBF9usqI50FvEKy9ZQMZmw0BMY0ZnKyVGY6598A94zCm1Z6tzLkur
	 xjr+v1F2WE2xUbj10QVdUAR7SjigKx6Zm1I2qCHQRPz+7TI16PGRmyYl3FWVgpprDQ
	 L+pTMmpPcronw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-61b4cbb8834so41527417b3.0
        for <linux-firmware@kernel.org>; Mon, 13 May 2024 04:18:15 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx+boNGqb3+LGwtGngvdBCcv8f8XlabWibUSTozpThqHY8jcuMT
	Y7XL5Rc3dmxEuv5JokkKwyrs/oE1Az6nYNHQf+rxfs0eZvjxpK10WsLWSsXa8rGHhUujkz1cWeq
	mt8dlf+MHta2WPpwu/xsukTpN6vk=
X-Google-Smtp-Source: AGHT+IHQJPICI04i3Z11ON+b1Cu57XDHaHtSVmlY4rnLwEK0GvHo5l4uPx0SFL5/Oq7WtPQqPHdEnpUOXXYhPgZo6yo=
X-Received: by 2002:a05:690c:6408:b0:618:8a27:6150 with SMTP id
 00721157ae682-622affc0e4cmr101137007b3.24.1715599095040; Mon, 13 May 2024
 04:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240510173705.1276833-1-alex.hung@amd.com>
In-Reply-To: <20240510173705.1276833-1-alex.hung@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 13 May 2024 07:18:03 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7o+crnJW8BKWysc5EPRTvCxp9pU=3e8LC9j_fFe3V4Dg@mail.gmail.com>
Message-ID: <CA+5PVA7o+crnJW8BKWysc5EPRTvCxp9pU=3e8LC9j_fFe3V4Dg@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.217.0\n
To: Alex Hung <alex.hung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 1:37=E2=80=AFPM Alex Hung <alex.hung@amd.com> wrote=
:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-05-10 11:12:05 -06=
00)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-05-10

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/213

josh

>
> for you to fetch changes up to 1aa355aabd61cfe904fb01878b29f6f8957dca24:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-05-10 11:12:05 -06=
00)
>
> ----------------------------------------------------------------
