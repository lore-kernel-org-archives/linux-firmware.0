Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A494EF4ED8
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Apr 2026 12:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E702DC2BCB6; Mon,  6 Apr 2026 12:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA676C2BCB1
	for <linux-firmware@kernel.org>; Mon,  6 Apr 2026 12:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775478877;
	bh=aWO8RHsZcZZssxXU7mTdmzqkHVI82Y7M1hm/1TCqoUE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fyO+f04CIqXQBiYOdMQ/tEkUO8uFPSH/XmOxOrwzzZ9Lr9Z2EZYNn1TLdeaIPOW9r
	 JYx07eHDYbaM7RUm1i8ZeSM3e4RcEKHx0RMD72jYoZwtCFAat64+IxQ8TF3qPkISgz
	 /uqPGHNvinAQ4NefQ8k6tCEt+//NuFOw6Oumbu++0Aa5HERohDtV6VVZik9eRPuNRa
	 nSultb4TLt9034A/k9Yp/ygflxnj34rHi9WPWD0WDTHmVO52dazmpAjZnkRw1Teacc
	 8tXg5VoxjyExW+lHR4q2s3PnXLQX1xK1BvDrQ45zuWdI/Rg9s22Ov4RpkIF3xkxAp0
	 F0uAyN8bMkCJQ==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7a2b6adbfa6so35304937b3.0
        for <linux-firmware@kernel.org>; Mon, 06 Apr 2026 05:34:37 -0700 (PDT)
X-Gm-Message-State: AOJu0YwgT3C/j+l5t9yFzv2CW6rJkIAnxDG4Uv58tDvrIL+Q5orqBZox
	np24F+v+QxBtZygF0Bc82MohoRQgfC5QiKIsoZRT6BN3zXsqwckIMw30tA2lRfV9D2P7KOItmfw
	XFN3Qe7MJr5MI+HDCaAxhAfHJweeVp3Y=
X-Received: by 2002:a05:690c:101:b0:7a4:e4e5:3910 with SMTP id
 00721157ae682-7a4e4e54243mr113990937b3.50.1775478876950; Mon, 06 Apr 2026
 05:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <DM3PPF63A6024A9C0E49D41DE491E608383A355A@DM3PPF63A6024A9.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF63A6024A9C0E49D41DE491E608383A355A@DM3PPF63A6024A9.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 6 Apr 2026 08:34:25 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4G_f=Btc1s9tMwdv=Rq1u5YeVfXUNdmU4EiaOQdZKv_A@mail.gmail.com>
X-Gm-Features: AQROBzBqv8W_2BceT0fs_Ji4p3-kY-BRvNwKxaLbwUg1lpHkxSEaM_lTq0wFTow
Message-ID: <CA+5PVA4G_f=Btc1s9tMwdv=Rq1u5YeVfXUNdmU4EiaOQdZKv_A@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware update 2026-03-29
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>, "Dreyfuss, Haim" <haim.dreyfuss@intel.com>, 
	"Damary, Guy" <guy.damary@intel.com>, "kyle@infradead.org" <kyle@infradead.org>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, "Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/980

josh

On Sun, Mar 29, 2026 at 3:00=E2=80=AFAM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
> This contains the firmware of core103 for all supported devices.
>
> Please pull or let me know if there are any issues.
>
> Thanks,
> Miri
> ---
>
> The following changes since commit 85786b4413fdc486e3bc0f4f6cfedce7802ed0=
41:
>
>   Merge branch 'amd-staging' into 'main' (2026-03-27 17:22:24 +0000)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2026-03-29
>
> for you to fetch changes up to f56580c068ec7ca8bc09eb0adaa703cdd64abfcf:
>
>   iwlwifi: add Bz/Sc FW for core103-40 release (2026-03-29 09:47:47 +0300=
)
>
> ----------------------------------------------------------------
> Release Core_manual_signed_core103/40
>
> 2026-03-29
>
> ----------------------------------------------------------------
> Miri Korenblit (3):
>       iwlwifi: update ty/So/Ma firmwares for core103-40 release
>       iwlwifi: Add Hr/Gf firmware for core103-40 release
>       iwlwifi: add Bz/Sc FW for core103-40 release
>
>  WHENCE                                       |  40 ++++++++++++++++++++-=
------
>  intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c103.ucode | Bin 0 -> 2243748 bytes
>  intel/iwlwifi/iwlwifi-bz-b0-gf-a0-100.ucode  | Bin 1837172 -> 1836712 by=
tes
>  intel/iwlwifi/iwlwifi-bz-b0-hr-b0-100.ucode  | Bin 1584684 -> 1584620 by=
tes
>  intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c103.ucode | Bin 0 -> 2112100 bytes
>  intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c103.ucode | Bin 0 -> 2226528 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-gf-a0-89.ucode   | Bin 1752652 -> 1752712 by=
tes
>  intel/iwlwifi/iwlwifi-ma-b0-gf-a0.pnvm       | Bin 55096 -> 55096 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-gf4-a0-89.ucode  | Bin 1604692 -> 1604752 by=
tes
>  intel/iwlwifi/iwlwifi-ma-b0-gf4-a0.pnvm      | Bin 27820 -> 27820 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-hr-b0-89.ucode   | Bin 1539788 -> 1539788 by=
tes
>  intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c103.ucode | Bin 0 -> 2326720 bytes
>  intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode  | Bin 1810848 -> 1810548 by=
tes
>  intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c103.ucode | Bin 0 -> 2226060 bytes
>  intel/iwlwifi/iwlwifi-so-a0-gf-a0-89.ucode   | Bin 1736688 -> 1736748 by=
tes
>  intel/iwlwifi/iwlwifi-so-a0-gf-a0.pnvm       | Bin 55176 -> 55176 bytes
>  intel/iwlwifi/iwlwifi-so-a0-gf4-a0-89.ucode  | Bin 1591660 -> 1591720 by=
tes
>  intel/iwlwifi/iwlwifi-so-a0-gf4-a0.pnvm      | Bin 27860 -> 27860 bytes
>  intel/iwlwifi/iwlwifi-so-a0-hr-b0-89.ucode   | Bin 1526956 -> 1526956 by=
tes
>  intel/iwlwifi/iwlwifi-ty-a0-gf-a0-89.ucode   | Bin 1678756 -> 1678816 by=
tes
>  intel/iwlwifi/iwlwifi-ty-a0-gf-a0.pnvm       | Bin 55020 -> 55020 bytes
>  21 files changed, 30 insertions(+), 10 deletions(-)
>  create mode 100644 intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c103.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c103.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c103.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c103.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c103.ucode
