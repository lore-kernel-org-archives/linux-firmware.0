Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E982EC678D5
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 14:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5D63C4339B; Tue,  7 Mar 2023 14:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF2EC433EF
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 14:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678200058;
	bh=hl1xULsu6VvxQZ3Kt7jBAwBnobVTw0RqQJK0HNWYRlU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FJZcB3K2nyChua+2WUfBZgOt7BhW6C9UwzqXKjYJ11HMI0ASWYsBdo1Hginur3fcr
	 vEpDGn5PCuXW/yeWWzalRam2qfrXPd5Uaq1gWB5KQfc2kEBbifI2fmyARgtW4qsLsF
	 TPkBhAQIeC1NQoaaEj5LyC9l/DfDfzxmF9mZELd9nWdZTFg9OrLvOQYFXwrm78fs2B
	 4pyXLe2FwKUzzqsvQ4jrhOFX52ochD4eusS7MHWnOr3PMynFs8gTFsFDP/TqvYpMjo
	 bGHgVtbMYOmSUosJ3C+RUdHLxXIbPINgRsCVu/zjOWyGWX8fDLCN9bclGKeOYapTWU
	 qYwphpKViR70Q==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-536c02c9dfbso247850927b3.11
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 06:40:58 -0800 (PST)
X-Gm-Message-State: AO0yUKUyI12to+zaDpBsUymwgjyYzFnHYOpk4tqt8jb8QxNgbDNsVsvx
	PONhKByxreSakkp5mKLcYBhF2vz5+VEti3zkVg4=
X-Google-Smtp-Source: AK7set9AyMcPw2hxwMJcd6ODebvAK1Ubte6vjGUHQkc/ATPHMTqkChMrbw0xThzzg+9fbQlnuyxG+YZ9oS1M6Tovj2M=
X-Received: by 2002:a81:ac21:0:b0:534:2d49:7912 with SMTP id
 k33-20020a81ac21000000b005342d497912mr9393450ywh.6.1678200057658; Tue, 07 Mar
 2023 06:40:57 -0800 (PST)
MIME-Version: 1.0
References: <758660d0-0cc7-18b4-5f88-c8f341fe2d50@redhat.com>
In-Reply-To: <758660d0-0cc7-18b4-5f88-c8f341fe2d50@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 09:40:46 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7HHEMiK91yEDJ1-NB+sB+EoOj==mSead+9wShTzP1zKw@mail.gmail.com>
Message-ID: <CA+5PVA7HHEMiK91yEDJ1-NB+sB+EoOj==mSead+9wShTzP1zKw@mail.gmail.com>
Subject: Re: [linux-firmware GIT PULL] brcmfmac nvram file updates
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 3, 2023 at 3:56=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi Josh,
>
> Here is a linux-firmware pull-req with 1 brcmfmac nvram file fix +
> 2 new brcmfmac nvram files to make Wifi work OOTB for users on
> the boards needing these files.
>
> Regards,
>
> Hans
>
>
> The following changes since commit 60971a6485ee604c47cc905ff77c583ae001f9=
df:
>
>   Merge branch 'liquidio-20230222' of https://github.com/dchickles/linux-=
firmware (2023-02-27 12:33:07 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux-firmware.git =
brcmfmac-nvram-updates-3-3-2023

Pulled and pushed out.

josh

>
> for you to fetch changes up to 76ad2755a29fcace1a948b4413313dfac3aff284:
>
>   brcm: Add nvram for the Lenovo Yoga Book X90F / X90L convertible (2023-=
03-03 21:45:12 +0100)
>
> ----------------------------------------------------------------
> Hans de Goede (3):
>       brcm: Add nvram for the Advantech MICA-071 tablet
>       brcm: Fix Xiaomi Inc Mipad2 nvram/.txt file macaddr
>       brcm: Add nvram for the Lenovo Yoga Book X90F / X90L convertible
>
>  WHENCE                                             |   2 +
>  brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt   | 147 +++++++++++++++=
++++++
>  ...ie.Intel Corporation-CHERRYVIEW D1 PLATFORM.txt | 139 +++++++++++++++=
++++
>  brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt       |   2 +-
>  4 files changed, 289 insertions(+), 1 deletion(-)
>  create mode 100644 brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt
>  create mode 100644 brcm/brcmfmac4356-pcie.Intel Corporation-CHERRYVIEW D=
1 PLATFORM.txt
>
