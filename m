Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E5DC4345F
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Apr 2024 11:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A8B2C113CE; Fri, 26 Apr 2024 11:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15125C2BD10
	for <linux-firmware@kernel.org>; Fri, 26 Apr 2024 11:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714130235;
	bh=0ELPuPv+aYUcaqbRVYs9hYSzvFFIlZ4NhSVemcZIAkg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MYt5JWHFIMq1K815JWP4Go/TJ9VbsLBgrVdIWTSPJEwKeI9j/b0afNP9Hq3PC0bRD
	 Hti3iz06r7htQ7nDFraV+fKe+mHaQhjemWpAGEJNR0a0rfHQIbZqV7TWbes5cyViCB
	 X+L/bHrdUhBpoV+/soQj0YIaUaXVcXVCvMomR1vFfKHS3z6SQWIngbCc20bC9XNNAD
	 g6xvOgTql2IC7PTsf+oGo0b7bbgTq4kidNzKAp/Bk7rjJjeY9ygwjIMlPWERO3YtkB
	 nwlA0Vm+C+pipzSwz4ONixIRP6srsqVXnlwH2JseQY8re3GrmhRtT0LVoHjtWOvZth
	 H4VSn+ShinRPQ==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de46da8ced2so2283559276.0
        for <linux-firmware@kernel.org>; Fri, 26 Apr 2024 04:17:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YwYPAgwRzDtF7vAW2Ccroy3TLttCz82STAgQYEuWxZQzjmEeBTq
	ecpg0XSF3dMCvskMUCS1OebaBWMEY1+oSJ5L5/90VgJHlc7/NUV173AP4hkTYPVsDWuF0+Xzvnc
	/JN5NTGlDHncMx4JuXKRpe4ttF/o=
X-Google-Smtp-Source: AGHT+IFbpClFwMb72ucMyldYcRgGOzwEmIj8sWVZP7/ZxJ+rRCK9u3Fyc7l31882egd+bLuYzXRxUeQeloq/Sgc4wL0=
X-Received: by 2002:a05:6902:2209:b0:dc6:aeba:5aaf with SMTP id
 dm9-20020a056902220900b00dc6aeba5aafmr2895589ybb.19.1714130234265; Fri, 26
 Apr 2024 04:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240426040656.4111527-1-Wayne.Lin@amd.com>
In-Reply-To: <20240426040656.4111527-1-Wayne.Lin@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 26 Apr 2024 07:17:02 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6W6QDU_wQDtL0YxSFVS-GtsJ7qh-6Hkw55Eh6+6PdjmQ@mail.gmail.com>
Message-ID: <CA+5PVA6W6QDU_wQDtL0YxSFVS-GtsJ7qh-6Hkw55Eh6+6PdjmQ@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.215.0
To: Wayne Lin <Wayne.Lin@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 12:07=E2=80=AFAM Wayne Lin <Wayne.Lin@amd.com> wrot=
e:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-04-26 11:48:14 +08=
00)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-04-26

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/203

josh

>
> for you to fetch changes up to 7945da5ee5d06132283c9f2f15312975d9559b9a:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-04-26 11:48:14 +08=
00)
>
> ----------------------------------------------------------------
