Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0044BC48BC3
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Feb 2024 12:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0496C433C7; Mon, 19 Feb 2024 12:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0F6C43390
	for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708346920;
	bh=hMQfTz/xPbfcne0+aJGWJcVBUjqdM8gnaqC6PRFC/PY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LoUdzijEkcgjdk57PbMVmydUtMsVJr+rP3G/UjtcpjiJVeYj87hbqKqJCXWWqLK/W
	 cmY0EuOQkmdEj4m/UTvzH5NrAzfp68h3hDvyiBj0Igkf3b9MX8Htk/fZjQ6vmp/cVR
	 UjICQr3vHtcfR/Wg+hJHzhNSGxgHwC06NiPZtL2yx/mwyTpYAXhDC7YxcveKQo54Aq
	 QzRdHQ5BF+9GgG1o1XjJ3RodG2AgyeVGCjN8nowDbPzpBBV0Nu6ph+ep/uikpEKApU
	 ZxbkzAM0kDmrgLGJ0Xd8EyYyUIRMU1A6/azEQ+IciUCAxr1zIiXgm+IWjDIiCKnPZv
	 5LaB+SbisE+rA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60823dd1703so10711657b3.3
        for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 04:48:40 -0800 (PST)
X-Gm-Message-State: AOJu0YzGYZ20y7SYUNROmBWc0j1dMuME/IfSjYYNODyyLUPWa6pnqwgU
	MxevNl/6cgGPpYAaPtZXuRC9+HM8sjQaXDunnNjvB28t/afnA/j2rsxZylrI3PQGR3pLvj6rhoP
	Kpc0fhNHo9un9Jp7mCH+Jy14yvKk=
X-Google-Smtp-Source: AGHT+IH9YIWGsafpGPNySokrb7VKe5gxYi4ff/i5WDLrAxRbtdz2ByxMlUuy6MlafMjNmYRwKNHMsmZZEozSDnFK/J4=
X-Received: by 2002:a81:6d50:0:b0:608:24b4:2591 with SMTP id
 i77-20020a816d50000000b0060824b42591mr4024760ywc.27.1708346919939; Mon, 19
 Feb 2024 04:48:39 -0800 (PST)
MIME-Version: 1.0
References: <20240214182340.3220667-1-anthony.l.nguyen@intel.com>
In-Reply-To: <20240214182340.3220667-1-anthony.l.nguyen@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Feb 2024 07:48:29 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4suNZ5Yurexk3KsvCAfHoqxCWCw4PU0Qq5Fq2CaZumdw@mail.gmail.com>
Message-ID: <CA+5PVA4suNZ5Yurexk3KsvCAfHoqxCWCw4PU0Qq5Fq2CaZumdw@mail.gmail.com>
Subject: Re: [linux-firmware v1 0/1][pull request] Intel Wired LAN Firmware
 Updates 2024-02-14
To: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, przemyslaw.kitszel@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 1:23=E2=80=AFPM Tony Nguyen <anthony.l.nguyen@intel=
.com> wrote:
>
> Update ice DDP to support additional devices.
>
> The following changes since commit 98db5411b132623478549d3abdb06e18472412=
8b:
>
>   Merge branch 'robot/pr-0-1707900738' into 'main' (2024-02-14 12:28:41 +=
0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware.git dev-qu=
eue

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/153

josh

>
> for you to fetch changes up to 4bbb468986a7df041c90659115d9331b57ac2708:
>
>   ice: update ice DDP package to 1.3.36.0 (2024-02-14 10:08:22 -0800)
>
> ----------------------------------------------------------------
> Przemek Kitszel (1):
>       ice: update ice DDP package to 1.3.36.0
>
>  WHENCE                                             |   4 ++--
>  .../ice/ddp/{ice-1.3.35.0.pkg =3D> ice-1.3.36.0.pkg} | Bin 692776 -> 692=
776 bytes
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename intel/ice/ddp/{ice-1.3.35.0.pkg =3D> ice-1.3.36.0.pkg} (98%)
