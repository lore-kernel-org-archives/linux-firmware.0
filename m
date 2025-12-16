Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B13D5E146
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Dec 2025 12:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03A28C19425; Tue, 16 Dec 2025 12:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D51C4AF09
	for <linux-firmware@kernel.org>; Tue, 16 Dec 2025 12:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765886633;
	bh=IgzttXJzlOXpAFKGJvEVU3HBSoz/pHHSYCusRnm7Cs8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ofbuWpXJpNOZvWhTLcxjKvXikim4VT64yWuRaCyDIB7drId4jrJH1yZyZlHfySJ/K
	 jkbLYJkFBE5Jiolq8VnXzTdz+BaG4qGXMavxP2Tyg8eWKIqbYDuMjj9z7EQQliXjjF
	 ChP96s+7iCCXq6jm9JfNP8ISz4IO8JreO2doWrMybnLVyfiygqcjiWsy6ule4LcozK
	 AgJ6BQJ9GPVw4DIJMPob3nRqGGGj5vT0qZ0ERomek3lqfKEFN+MfTklzi+Pgm9/efH
	 zZyKd+y5oLsH4DWJZ54rBI9IgUETjG2jBYDp0EYpry9ENs9NcgJLVN52TLXzKito29
	 AJWXjzYtYdHyA==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6446c2bbfe3so4065041d50.1
        for <linux-firmware@kernel.org>; Tue, 16 Dec 2025 04:03:53 -0800 (PST)
X-Gm-Message-State: AOJu0YzU902lw5Zwnh3929/Rz6QUd3HwnOWkfpZvlDZ9HaLyb6v8fVNP
	rhA/2SQdYyOqcccDf1guIbgFDYMzg172jluZuc7B3zkncuuNl/SJx96DlV91vQychbXOKIezDr/
	Nj7JXFn6UTyi9eFqn41OeId6NIpVVeMk=
X-Google-Smtp-Source: AGHT+IEw3tYsyih7jchswTDOjmyrorwZaH1rf/Mm1X5tOQWvrfNt8P/J+6/o4Y9pIpfNYhXmBU19ZfA+5lp0H1jQm9o=
X-Received: by 2002:a05:690e:1388:b0:63f:ab4c:9603 with SMTP id
 956f58d0204a3-6455564ef60mr10413827d50.45.1765886633152; Tue, 16 Dec 2025
 04:03:53 -0800 (PST)
MIME-Version: 1.0
References: <DM3PPF63A6024A9654428CE36E88D571C8AA3AAA@DM3PPF63A6024A9.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF63A6024A9654428CE36E88D571C8AA3AAA@DM3PPF63A6024A9.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 16 Dec 2025 07:03:42 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5xVm6E2hG5+6Zjs5KUY-gKZQAJ6-0kWWJ5ucMOEnnycw@mail.gmail.com>
X-Gm-Features: AQt7F2pwzbYg4PQb2-4pLJHevKnlyeZtcXHaKJYvf0PxrBMCS66J4Q01NMXCLwQ
Message-ID: <CA+5PVA5xVm6E2hG5+6Zjs5KUY-gKZQAJ6-0kWWJ5ucMOEnnycw@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware update 2025-12-16
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, "Dreyfuss, Haim" <haim.dreyfuss@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>, Linux Wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/825

josh

On Tue, Dec 16, 2025 at 4:43=E2=80=AFAM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
> This contains the firmware of core101 for all our supported devices
>
> Please pull or let me know if there are any issues.
>
> Thanks,
> Miri
> ---
>
> The following changes since commit 6c60d1128566f8cc9c3ddd7ad1db7adec824f7=
1b:
>
>   Merge branch 'amd-staging' into 'main' (2025-12-12 14:41:29 +0000)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2025-12-16
>
> for you to fetch changes up to 0a041632c1564a6acf6d2b9ab7cbc64474a2c323:
>
>   iwlwifi: add Bz/Sc FW for core101-82 release (2025-12-16 11:03:08 +0200=
)
>
> ----------------------------------------------------------------
> Relase core 101
>
> ----------------------------------------------------------------
> Miri Korenblit (4):
>       iwlwifi: update cc/Qu/QuZ firmwares for core101-82 release
>       iwlwifi: update ty/So/Ma firmwares for core101-82 release
>       iwlwifi: Add Sc/Gf firmware for core101-82 release
>       iwlwifi: add Bz/Sc FW for core101-82 release
>
>  WHENCE                                       |  48 +++++++++++++++++++--=
------
>  intel/iwlwifi/iwlwifi-Qu-b0-hr-b0-77.ucode   | Bin 1406572 -> 1406572 by=
tes
>  intel/iwlwifi/iwlwifi-Qu-b0-jf-b0-77.ucode   | Bin 1323292 -> 1323292 by=
tes
>  intel/iwlwifi/iwlwifi-Qu-c0-hr-b0-77.ucode   | Bin 1406588 -> 1406588 by=
tes
>  intel/iwlwifi/iwlwifi-Qu-c0-jf-b0-77.ucode   | Bin 1323308 -> 1323308 by=
tes
>  intel/iwlwifi/iwlwifi-QuZ-a0-hr-b0-77.ucode  | Bin 1406716 -> 1406716 by=
tes
>  intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode  | Bin 1323376 -> 1323376 by=
tes
>  intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c101.ucode | Bin 0 -> 2239444 bytes
>  intel/iwlwifi/iwlwifi-cc-a0-77.ucode         | Bin 1368096 -> 1368096 by=
tes
>  intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c101.ucode | Bin 0 -> 2222248 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-gf-a0-89.ucode   | Bin 1752072 -> 1752580 by=
tes
>  intel/iwlwifi/iwlwifi-ma-b0-gf-a0.pnvm       | Bin 55128 -> 55096 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-gf4-a0-89.ucode  | Bin 1604120 -> 1604620 by=
tes
>  intel/iwlwifi/iwlwifi-ma-b0-gf4-a0.pnvm      | Bin 27836 -> 27820 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-hr-b0-89.ucode   | Bin 1539788 -> 1539788 by=
tes
>  intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c101.ucode | Bin 0 -> 2305636 bytes
>  intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode  | Bin 0 -> 1810548 bytes
>  intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c101.ucode | Bin 0 -> 2209076 bytes
>  intel/iwlwifi/iwlwifi-so-a0-gf-a0-89.ucode   | Bin 1736108 -> 1736616 by=
tes
>  intel/iwlwifi/iwlwifi-so-a0-gf-a0.pnvm       | Bin 55208 -> 55176 bytes
>  intel/iwlwifi/iwlwifi-so-a0-gf4-a0-89.ucode  | Bin 1590688 -> 1591588 by=
tes
>  intel/iwlwifi/iwlwifi-so-a0-gf4-a0.pnvm      | Bin 27876 -> 27860 bytes
>  intel/iwlwifi/iwlwifi-so-a0-hr-b0-89.ucode   | Bin 1526956 -> 1526956 by=
tes
>  intel/iwlwifi/iwlwifi-ty-a0-gf-a0-89.ucode   | Bin 1678176 -> 1678684 by=
tes
>  intel/iwlwifi/iwlwifi-ty-a0-gf-a0.pnvm       | Bin 55052 -> 55020 bytes
>  25 files changed, 34 insertions(+), 14 deletions(-)
>  create mode 100644 intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c101.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c101.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c101.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c101.ucode
