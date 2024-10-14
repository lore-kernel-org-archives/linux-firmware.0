Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF0ED18144
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Oct 2024 20:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0353EC4CED5; Mon, 14 Oct 2024 20:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0544C4CED0
	for <linux-firmware@kernel.org>; Mon, 14 Oct 2024 20:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728938109;
	bh=+5G6SKmagcmI5YhwOoZ4BXLLGiL20lBQrK/sSVDhXQo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=eZaLKY5yFuU9Dga+H8HkRRtDG6m90RjPz2xi+ip4adCkU72j7vvQJcmm4iZFyMDBq
	 Qgq1i71dfVrfQJb8o6gzqyabn27InyPGNQyW/ZuY+pxCzzWU4dzIV/aKF4O9jIY+pI
	 aeYVblvg57nOGBD7W4tkXGB2nX5xFELfutULrbyOuvy2hzxUAF5zKo4luGYXTXQcHB
	 cOvfgABaxUznXA9wo2X+2AJuSrZzCYrWMFGpp9lZsiypaRfnlCAnRnHKTkwXFy4k3B
	 jaMN+7di9lSQOGyFpDjYROQ59dxVxJDbTRdkwt5ZHUR6nMbNTXfvP7hC8LtOjDleT3
	 MOuSyIKVY5h/A==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e34fa656a2so26245697b3.1
        for <linux-firmware@kernel.org>; Mon, 14 Oct 2024 13:35:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YyW6VAer74xurYSbvy4zbLm2r3l4Fes0PvJYuvC0t7RxDaadV7c
	Du/U+w/YTJTrerUmxg26T63kp++dX+HAPnbB+MKL5jGSPRSnNrB/+OSiodAlLXjnHYUgctX8Cxb
	XmzetSDaa9gCDuBNUp6JCi1uwPp0=
X-Google-Smtp-Source: AGHT+IGB4ptS2rT0YcBTjluBBj/NelLNDWZFNd3GbCWqdCKOeH5bIxbTlH9bNTKNAHiTnfuBWb695W7vVzDbcGM+Pm8=
X-Received: by 2002:a05:690c:6381:b0:6e3:36cc:eb74 with SMTP id
 00721157ae682-6e3644c016dmr75453537b3.32.1728938109071; Mon, 14 Oct 2024
 13:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <MW5PR11MB5810AC10222B41ADE565FBD6A3442@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB5810AC10222B41ADE565FBD6A3442@MW5PR11MB5810.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 14 Oct 2024 16:34:57 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4VvWAR+-T0Jy8y3xNxGuRN4k0xHLYg3VEyw42F1JhpWA@mail.gmail.com>
Message-ID: <CA+5PVA4VvWAR+-T0Jy8y3xNxGuRN4k0xHLYg3VEyw42F1JhpWA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2024-10-14
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Wireless <linux-wireless@vger.kernel.org>, 
	"kyle@infradead.org" <kyle@infradead.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"Ben Ami, Golan" <golan.ben.ami@intel.com>, "Yang, You-Sheng" <vicamo.yang@canonical.com>, 
	"Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 2:35=E2=80=AFPM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
>
>
> This contains some new and updated firmwares for all our currently
>
> maintained FW binaries.
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
> The following changes since commit 06bad2f17030ea91ca4c9b965c2131e468af9d=
dc:
>
>
>
>   Merge branch 'robot/pr-0-1728664917' into 'main' (2024-10-11 17:01:39 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2024-10-14

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/329

josh

>
>
>
> for you to fetch changes up to d232b8dc6d48cc5bd6847d945b4e615c066458d2:
>
>
>
>   iwlwifi: add gl/Bz FW for core91-69 release (2024-10-14 21:28:53 +0300)
>
>
>
> ----------------------------------------------------------------
>
> core91
>
>
>
> ----------------------------------------------------------------
>
> Miri Korenblit (3):
>
>       iwlwifi: update cc/Qu/QuZ firmwares for core91-69 release
>
>       iwlwifi: update ty/So/Ma firmwares for core91-69 release
>
>       iwlwifi: add gl/Bz FW for core91-69 release
>
>
>
>  WHENCE                        |  34 ++++++++++++++++++++--------------
>
>  iwlwifi-Qu-b0-hr-b0-77.ucode  | Bin 1405980 -> 1405988 bytes
>
>  iwlwifi-Qu-b0-jf-b0-77.ucode  | Bin 1322684 -> 1322744 bytes
>
>  iwlwifi-Qu-c0-hr-b0-77.ucode  | Bin 1405996 -> 1406004 bytes
>
>  iwlwifi-Qu-c0-jf-b0-77.ucode  | Bin 1322700 -> 1322760 bytes
>
>  iwlwifi-QuZ-a0-hr-b0-77.ucode | Bin 1406116 -> 1406124 bytes
>
>  iwlwifi-QuZ-a0-jf-b0-77.ucode | Bin 1322760 -> 1322828 bytes
>
>  iwlwifi-bz-b0-fm-c0-94.ucode  | Bin 0 -> 1933520 bytes
>
>  iwlwifi-bz-b0-fm-c0.pnvm      | Bin 295832 -> 295324 bytes
>
>  iwlwifi-cc-a0-77.ucode        | Bin 1367496 -> 1367504 bytes
>
>  iwlwifi-gl-c0-fm-c0-94.ucode  | Bin 0 -> 1919788 bytes
>
>  iwlwifi-gl-c0-fm-c0.pnvm      | Bin 295512 -> 295004 bytes
>
>  iwlwifi-ma-b0-gf-a0-89.ucode  | Bin 1746844 -> 1747384 bytes
>
>  iwlwifi-ma-b0-gf-a0.pnvm      | Bin 55112 -> 55112 bytes
>
>  iwlwifi-ma-b0-gf4-a0-89.ucode | Bin 1599272 -> 1599724 bytes
>
>  iwlwifi-ma-b0-gf4-a0.pnvm     | Bin 27828 -> 27828 bytes
>
>  iwlwifi-ma-b0-hr-b0-89.ucode  | Bin 1539360 -> 1539472 bytes
>
>  iwlwifi-so-a0-gf-a0-89.ucode  | Bin 1731172 -> 1739904 bytes
>
>  iwlwifi-so-a0-gf-a0.pnvm      | Bin 55192 -> 55192 bytes
>
>  iwlwifi-so-a0-gf4-a0-89.ucode | Bin 1589864 -> 1590316 bytes
>
>  iwlwifi-so-a0-gf4-a0.pnvm     | Bin 27868 -> 27868 bytes
>
>  iwlwifi-so-a0-hr-b0-89.ucode  | Bin 1530624 -> 1530736 bytes
>
>  iwlwifi-ty-a0-gf-a0-89.ucode  | Bin 1681232 -> 1681772 bytes
>
>  iwlwifi-ty-a0-gf-a0.pnvm      | Bin 55036 -> 55036 bytes
>
>  24 files changed, 20 insertions(+), 14 deletions(-)
>
>  create mode 100644 iwlwifi-bz-b0-fm-c0-94.ucode
>
>  create mode 100644 iwlwifi-gl-c0-fm-c0-94.ucode
