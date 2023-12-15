Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BD0C35274
	for <linux-firmware@archiver.kernel.org>; Fri, 15 Dec 2023 12:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14952C433CB; Fri, 15 Dec 2023 12:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BC6C433CA
	for <linux-firmware@kernel.org>; Fri, 15 Dec 2023 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702642716;
	bh=8Yoz63bJ4CQTknqzoOQ0iGl4oMDqVWxuAI4eMzykv4Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=aT2eYwbm56eFcexUmRYb2+UUq2mIp29Nnazy486D2J/WVoiqsiT6Zx6H58xlyO52q
	 FMv07pHUyRv1wc/oOgta+8fsyVIbAc0uOm7bRkwxvbUI34NBwZJda9iHor9ho1IItt
	 epv55b6ElirYejZYv8BiKyGSrUvYA5y4afmsTZnBiXWTF84oV2QMMfi3j3fI5oLCQ+
	 pWLb4LOA95DixRKRMzrXHsvgbIAimdxVuhB9NqYPvFa/02acW6JQbj9OsU43aKt3+9
	 xQk2kEQbx8KwobP3EWU1RY56LtVx8dsF7ZORb5WKBArXTn/qmUL2RZbgH0mLu3YlTe
	 9sefmkXLDSvww==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5e45405bda9so4786347b3.1
        for <linux-firmware@kernel.org>; Fri, 15 Dec 2023 04:18:35 -0800 (PST)
X-Gm-Message-State: AOJu0YxpQjExBOP8AH6QRZrub0byvNCOqkL5CcP7bp63GTgHVGILKvle
	cU2pOqbZRh09TKfhxbHS8LMxLjrfQJ9VOpOr3gw=
X-Google-Smtp-Source: AGHT+IHFUQVdT+Ee/wTR17/0KUXnrC2WayndRzVXZt+sogAXX9U4r1yrgTHf4siqOXhZS2QNUun4MA1Nz3cR8RL41bY=
X-Received: by 2002:a81:d541:0:b0:5d9:5e89:18cd with SMTP id
 l1-20020a81d541000000b005d95e8918cdmr8299980ywj.1.1702642715060; Fri, 15 Dec
 2023 04:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20231215070256.3850993-1-Wayne.Lin@amd.com>
In-Reply-To: <20231215070256.3850993-1-Wayne.Lin@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 15 Dec 2023 07:18:24 -0500
X-Gmail-Original-Message-ID: <CA+5PVA71+UAs7Ma+txRTSxQhtir0_buQg6-7dVpsSbJ44zMwrw@mail.gmail.com>
Message-ID: <CA+5PVA71+UAs7Ma+txRTSxQhtir0_buQg6-7dVpsSbJ44zMwrw@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.197.0
To: Wayne Lin <Wayne.Lin@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 2:03=E2=80=AFAM Wayne Lin <Wayne.Lin@amd.com> wrote=
:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2023-12-15 14:54:01 +08=
00)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-12-15
>
> for you to fetch changes up to 87be457c2e50d35caeefc00cd590af21c29a8b83:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2023-12-15 14:54:01 +08=
00)

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/99

josh
