Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F23C3DA79
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Jan 2024 12:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1498BC43394; Mon, 15 Jan 2024 12:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3950C43390
	for <linux-firmware@kernel.org>; Mon, 15 Jan 2024 12:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705321038;
	bh=tAws818Z0NJDAse2pGdBZ/wO24BREGz2yedmZtgeoTI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZjrWr14Z7YVMS2kWKb2WZklPOLZ0eZ89lUJKGSfrcPOJWhAtNAKdY2P7+KW8R0wBy
	 6w5t56OWvFXVe5KfSXL5MAS71GsS/tPcuziR9laRti3XHjhujFOGrfOu32LCVUhQBQ
	 jY9FUwfsf4SXWIa254p2OFw3arimrXJxZY5MK6z+qjPIkqmr3oEMi//cslpgAQBrUx
	 oYkDBC0xKfRRlGC40C/RHYsC4PzJH3KZcimQpLNraGMlxifEdl1ftu4t1hMN5y6rNU
	 DUudoQKmpN9T7gUy+p5r2pIlDrcOAyHT3JV0WFn87lnPgHbNVowL2TEAHltmjqP92C
	 HRnSIHF+kUlXg==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5e7409797a1so82330057b3.0
        for <linux-firmware@kernel.org>; Mon, 15 Jan 2024 04:17:17 -0800 (PST)
X-Gm-Message-State: AOJu0YyEpWifKpy3CIly+fbIBUkXnKs8kTu59Rb5+flNXUaVDyR1K/R5
	AgjDfdQWZErVERUNK+Lm12ABWjOKUbLXyl6hAoY=
X-Google-Smtp-Source: AGHT+IFGKT4pE1KfQv/dx1QDPcy+cJllVoK2lHRujUS5hhEx+xh2VByJlChtx4INgCaoVtDAUiA7ZYqcuW0NdrKFC/Q=
X-Received: by 2002:a81:4001:0:b0:5f5:63ee:6adf with SMTP id
 l1-20020a814001000000b005f563ee6adfmr3222511ywn.93.1705321037159; Mon, 15 Jan
 2024 04:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20240112224928.3827132-1-alex.hung@amd.com>
In-Reply-To: <20240112224928.3827132-1-alex.hung@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 Jan 2024 07:17:05 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5DSWezmpeTUCQpVzii_891=DE0BK8bruep++=Nx6zO0Q@mail.gmail.com>
Message-ID: <CA+5PVA5DSWezmpeTUCQpVzii_891=DE0BK8bruep++=Nx6zO0Q@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware for DCN314 to v0.0.199.0
To: Alex Hung <alex.hung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 5:50=E2=80=AFPM Alex Hung <alex.hung@amd.com> wrote=
:
>
> The following changes since commit 4d8afe32753bff72f05b8eb125b401408f718a=
50:
>
>   amdgpu: DMCUB updates for DCN314 (2024-01-12 14:43:41 -0700)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-01-12

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/125

josh
