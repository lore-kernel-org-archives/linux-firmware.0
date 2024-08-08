Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A12C52D6F
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Aug 2024 11:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B229C4AF0C; Thu,  8 Aug 2024 11:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3A1C4AF09
	for <linux-firmware@kernel.org>; Thu,  8 Aug 2024 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723117857;
	bh=YOr/BHXSx+3Aala9Yysuvq5cywB99NZTyp0oUgitwBw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XyckQRbrdfq00omHF99E2/5HzeOr3s68axoOXfdbUDXE70CNyi8pP8NkP4K7Kvv0K
	 bLAc1ZG5dqxLlXfSRbCM+wZQifB7K/H4BCca2UgH6Ior0T9+7lO2CJdeEAkQ654REh
	 oSOciEgKsqrIoQaGhm8aBJKzoXrBqQM0z0oMCnTLiPGC9oqmEPq7lX3kMECHK54rpw
	 BsP0/1IQ6y0Ihv/fLQmjcU9Tuy71/RVjseGFVcnlP+Lai+zUZdjZYQaDyLPVVjJ0h2
	 DbGlc8oDs8eNZfzYagrisfMGOqIQNY5sRLzCanLCYufRwnFQA80evpJcoGocRPfoxI
	 HXlHF0aWpYqtw==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-690b6cbce11so8698667b3.2
        for <linux-firmware@kernel.org>; Thu, 08 Aug 2024 04:50:57 -0700 (PDT)
X-Gm-Message-State: AOJu0YxsBVFgtkBOhvmyhuygYb4CstitBQNtTTxm2oCkYS3fsK/HBlNM
	CdaIF7fxY3FPGYT//zeb5GvOCXCTWU+OgXVcXfaWq1Oh+t72aAVkofKuVpnYXmbVICFLaAN0Tux
	M5ETd4QyevRpPzwD3H8Q4Ma2XikA=
X-Google-Smtp-Source: AGHT+IHWkNowSzdGd2HshKk3C2xzGTYqc1j64p4QhXxUqRcioC/Z06PAnQvBfzBG+6SK3uWQvbrwHzNpUV77PHs8z2w=
X-Received: by 2002:a05:690c:4781:b0:64b:941:1d55 with SMTP id
 00721157ae682-69bf7fec2e4mr16035677b3.13.1723117856514; Thu, 08 Aug 2024
 04:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240807202233.246768-1-pratap.nirujogi@amd.com>
In-Reply-To: <20240807202233.246768-1-pratap.nirujogi@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 8 Aug 2024 07:50:45 -0400
X-Gmail-Original-Message-ID: <CA+5PVA62Vi2x4+pNLYjsOQm2KBsGfYHqAiG5M-ioNuj_BFzjhQ@mail.gmail.com>
Message-ID: <CA+5PVA62Vi2x4+pNLYjsOQm2KBsGfYHqAiG5M-ioNuj_BFzjhQ@mail.gmail.com>
Subject: Re: pull request: amdgpu: Update ISP FW for isp v4.1.1
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Benjamin Chan <benjamin.chan@amd.com>, 
	King Li <king.li@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 4:22=E2=80=AFPM Pratap Nirujogi <pratap.nirujogi@amd=
.com> wrote:
>
>   amdgpu: Update ISP FW for isp v4.1.1 (2024-08-06 16:02:04 -0400)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git amd-isp-staging

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/267


josh

>
> for you to fetch changes up to 4f1305448553b71b138ee0f197d96299039a9a50:
>
>   amdgpu: Update ISP FW for isp v4.1.1 (2024-08-06 16:02:04 -0400)
>
> ----------------------------------------------------------------
