Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C640C5478C
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Mar 2024 19:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24CF0C43394; Fri,  1 Mar 2024 19:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A81AC433C7
	for <linux-firmware@kernel.org>; Fri,  1 Mar 2024 19:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709320758;
	bh=wLGETAvTVuCS4oY+W+6WQ5NPR6fPI2LoZ1NWSZV8+zA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=htH86L47lAXbm5OdT0btZgFMKPhNnf4pS4IbGW6XSqvxws3/Z8v/Lr1uHZPaZEH2D
	 U85fpdYG8oD9V48+2U9polhtPM4LsFGh03wFiCRl0/bMmheItCkPt+wwl+Q3TS2L9F
	 Xz15uATNR18f3L3k3NbIa+t6tMQnbxq9RgV87AKKDr0pmGr39JpeSJCreCnz29557X
	 fwafGkzzGF0q1hMyIdQ7M3N0RFcCO/EmU0bj8M0RujToRF9Z1UAzWunl2brVU25fAP
	 36gL+dUs0T3+n/Hdm5sNJLX6S42/uK6yeyozysm7SKlsgQIfJjr5SQ8Mz0prfaxnyY
	 Cm6cfFicbBkKA==
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c1c51f2fb1so1141182b6e.0
        for <linux-firmware@kernel.org>; Fri, 01 Mar 2024 11:19:18 -0800 (PST)
X-Gm-Message-State: AOJu0Yzj/XYOg1sHULEVXbZKiNnHOpYyH/BIIJgyTcHtlZ7h5wbuCiLD
	MLFGuogywarHZ0qcomwi5ZWVP5Lq4yvPt1ZjMt6Nqj3AtS712Lh9Cy7SDZ9wo0EvrQsmBntEdAy
	qoSIC5EPTPGB6+S2oTOh0v9pP8VA=
X-Google-Smtp-Source: AGHT+IGueygVr9VbzNZ+KschAcARA0+Qo1NUgi+0Rt2koI8rDVDW7q4llUf9F0cyIFDCf0YnGViN4RSippiZsOj19MY=
X-Received: by 2002:a05:6808:159c:b0:3c1:d352:9598 with SMTP id
 t28-20020a056808159c00b003c1d3529598mr2972399oiw.31.1709320757295; Fri, 01
 Mar 2024 11:19:17 -0800 (PST)
MIME-Version: 1.0
References: <ZeCGEN8PgbkY3k_g@kekkonen.localdomain>
In-Reply-To: <ZeCGEN8PgbkY3k_g@kekkonen.localdomain>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 1 Mar 2024 14:19:06 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4PM-53Y4pEdD39-kx_+OishOghz9ePwxNfpSpSN3DReg@mail.gmail.com>
Message-ID: <CA+5PVA4PM-53Y4pEdD39-kx_+OishOghz9ePwxNfpSpSN3DReg@mail.gmail.com>
Subject: Re: [GIT PULL] Intel Image Processing Unit 2 firmware
To: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bingbu Cao <bingbu.cao@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 8:26=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi folks,
>
> This PR adds firmware files for Intel IPU2. The atomisp driver that needs
> the firmware is currently in staging.
>
>
> The following changes since commit fe0274513384acb3be3756ae17da97f551a1e0=
e7:
>
>   Merge branch 'robot/patch-0-1709160821' into 'main' (2024-02-28 23:13:2=
3 +0000)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.g=
it tags/ipu2-2024-02-29-2

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/162

josh

>
> for you to fetch changes up to 28fbeb4f8b8cf5fa214eeaa93c83d4ee779d7a5b:
>
>   Intel IPU2: Add firmware files (2024-02-29 15:24:23 +0200)
>
> ----------------------------------------------------------------
> IPU2 firmware binaries
>
> ----------------------------------------------------------------
> Sakari Ailus (1):
>       Intel IPU2: Add firmware files
>
>  WHENCE                         |  12 ++++++++++++
>  intel/ipu/shisp_2400b0_v21.bin | Bin 0 -> 10972768 bytes
>  intel/ipu/shisp_2401a0_v21.bin | Bin 0 -> 12093280 bytes
>  3 files changed, 12 insertions(+)
>  create mode 100644 intel/ipu/shisp_2400b0_v21.bin
>  create mode 100644 intel/ipu/shisp_2401a0_v21.bin
>
> --
> Sakari Ailus
