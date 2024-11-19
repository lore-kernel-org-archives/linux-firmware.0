Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E313FD44148
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Nov 2024 12:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7890C4CED2; Tue, 19 Nov 2024 12:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AA4C4AF0B
	for <linux-firmware@kernel.org>; Tue, 19 Nov 2024 12:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732019362;
	bh=4Y0Ncso2hiLriECLAWZtuiJdI2pzp+eIK+rT6X1/yOg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Rt137uojDholpupgW30TDaSe9F5lHuAGlasxlagPJ+3zw/V8aLceKvdtPKNOqZ1XH
	 iAIYtKZ21A8/ENOH2S5H7Q1N+aWjNOfPTzRpRwQ8F0o05P8rz+b0JyjZbSjXnxieVI
	 GYpof/EaDKls1iiwd/KsNATc2c6lBGX0J7LXvrmpvFVDLxpxGclKWjHwWN9Ud+z5CJ
	 JdN0NVNF5ePUXp+Tl6rEabkOed4Zi+qvX6rhPmZd24VoJmGyqOIDKYau41yrHTNcpX
	 2SkWG4/hpIn0lOQNq4uexav1/FMOvncUmJuBgdvgN5zdzXFzY3krN+dAmPDNwAgXng
	 a0sbesmYsS34w==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e2bd7d8aaf8so3766533276.3
        for <linux-firmware@kernel.org>; Tue, 19 Nov 2024 04:29:22 -0800 (PST)
X-Gm-Message-State: AOJu0Yzz7mmarOqBJAJLUbxw+FFeyO/igOt/vGRU6lMXqlrnRw2/8EgE
	OaFYLEqaRc8lI+oZUa0o8pUb2gD5Bwg5D6Fd9r8U4tcIRrxzISgWJAPllqzEdD1bHY0vxRIkGz5
	5kd9X7lRD4P/2COLHcqso3P6fQS8=
X-Google-Smtp-Source: AGHT+IGs4Yuc13fIMX0q6cduhZT+DN+jacNQH/JddrKn1itPuVIkBajzOnJmB6yW5Fv2GgNgj3rXS1C8bOSZ0nyaviQ=
X-Received: by 2002:a05:690c:6d0e:b0:6ee:5068:7510 with SMTP id
 00721157ae682-6ee55c5cc61mr163786147b3.26.1732019361806; Tue, 19 Nov 2024
 04:29:21 -0800 (PST)
MIME-Version: 1.0
References: <MW5PR11MB5810FC51EC5F7618E7AB32FFA3202@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB5810FC51EC5F7618E7AB32FFA3202@MW5PR11MB5810.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Nov 2024 07:29:10 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4SHQ46gcgxBAUFi_P7gE0DYki4n+1TnHib9g=6pTvtSQ@mail.gmail.com>
Message-ID: <CA+5PVA4SHQ46gcgxBAUFi_P7gE0DYki4n+1TnHib9g=6pTvtSQ@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2024-11-19
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 11:57=E2=80=AFPM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
>
>
> This contains some new firmwares for Bz-gf device.
>
>
>
> Please pull or let me know if there are any issues.
>
>
>
> --
>
> Thanks,
>
> Miri
>
>
>
> The following changes since commit 6e4e94b02da0357ed7db03b2120b02e378c403=
e0:
>
>
>
>   Merge branch 'venus' into 'main' (2024-11-13 12:23:42 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2024-11-19

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/372

josh

>
>
>
> for you to fetch changes up to 60cdfe1831e8ad39f7644693b1d6da01e4e80e2a:
>
>
>
>   iwlwifi: add Bz-gf FW for core91-69 release (2024-11-19 06:48:38 +0200)
>
>
>
> ----------------------------------------------------------------
>
> core91 bz-gf
>
>
>
> ----------------------------------------------------------------
>
> Miri Korenblit (1):
>
>       iwlwifi: add Bz-gf FW for core91-69 release
>
>
>
>  WHENCE                       |   5 +++++
>
>  iwlwifi-bz-b0-gf-a0-94.ucode | Bin 0 -> 1760372 bytes
>
>  iwlwifi-bz-b0-gf-a0.pnvm     | Bin 0 -> 55192 bytes
>
>  3 files changed, 5 insertions(+)
>
>  create mode 100644 iwlwifi-bz-b0-gf-a0-94.ucode
>
>  create mode 100644 iwlwifi-bz-b0-gf-a0.pnvm
>
>
