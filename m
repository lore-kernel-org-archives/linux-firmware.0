Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC59D729FD
	for <linux-firmware@archiver.kernel.org>; Fri, 29 Nov 2024 20:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78204C4CED9; Fri, 29 Nov 2024 20:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D89DC4CED3
	for <linux-firmware@kernel.org>; Fri, 29 Nov 2024 20:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732911902;
	bh=SEhByLLJSVh0lL8kDYYuSS2ZzqA/rdLiRmFX2cpmZKc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=QDKXfaJ4LMasLaEvVZwW4Sd9TcglMKW1c5GQ438+RMw9ksyq3g3xxf6Tb0QdSQ0/x
	 3qutrDnp2meY2+lVu+mVpnGLzZ6EZ2Ur5bQmSJgiSSo4qPQPriGFWpQ8IDfl76fO4c
	 FBgk7pd61hNtZL6DtlHqG+dFZxOrKoKM+7homG8Z+/X09letKL7SrSZAy14zhuVgKT
	 Z5zJwmmv3S7XFUZPOGDKtBW6B8x2aeue3rDB1QTCc+Y2KAA2GTo5ukROQIklCF/OJ5
	 983im1NoER0cbJawSjvDNXhy8LGT0U/D15ksk7OGHlVoDzyGWsxj40+mGPcZ+xA/sg
	 1edOA0aQEj87g==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6eeca160f14so24076117b3.2
        for <linux-firmware@kernel.org>; Fri, 29 Nov 2024 12:25:02 -0800 (PST)
X-Gm-Message-State: AOJu0YyCHShN+wAIpmbMzCte2NQ34tXXxjNKXmPJAc6J4CVckmgnQZZO
	xLC4ett7caEiQvVI2R+XlL5lZMFrHJw9g32m8+jsL+JCaFX36DdJbQvFuLLPKXCQnn076zMb4w9
	V/4N0VRXrCEQqxzYeJotIxO2XtRw=
X-Google-Smtp-Source: AGHT+IGie085J8NR0/Hi9KMsBQveos1rzEGHeXaeKBZI4mn5UDhu+WRBkAfI0hvOfcnhKk8cdW0OlxkwknSUqRvomNA=
X-Received: by 2002:a05:690c:5708:b0:6ef:4fba:8140 with SMTP id
 00721157ae682-6ef4fba84a0mr71033107b3.6.1732911901568; Fri, 29 Nov 2024
 12:25:01 -0800 (PST)
MIME-Version: 1.0
References: <MW5PR11MB5810EC530D4AEAABD72BEF6FA3292@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB5810EC530D4AEAABD72BEF6FA3292@MW5PR11MB5810.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 29 Nov 2024 15:24:50 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6Y5z7LPdZ4C4oFhuGEn8gO=cYZTEMVzJc55RrXPer_XA@mail.gmail.com>
Message-ID: <CA+5PVA6Y5z7LPdZ4C4oFhuGEn8gO=cYZTEMVzJc55RrXPer_XA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2024-11-28
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>, "Berg, Johannes" <johannes.berg@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/380

josh

On Thu, Nov 28, 2024 at 12:12=E2=80=AFPM Korenblit, Miriam Rachel
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
> The following changes since commit 7c3031c18ab851792c49f594a4d43200d55a79=
43:
>
>
>
>   Merge branch 'robot/pr-0-1732634796' into 'main' (2024-11-26 16:12:19 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2024-11-28
>
>
>
> for you to fetch changes up to 42b01d49689c754438c7b9c32aadfa722da98429:
>
>
>
>   iwlwifi: add Bz-gf FW for core89-91 release (2024-11-28 19:08:21 +0200)
>
>
>
> ----------------------------------------------------------------
>
> core89 bz-gf
>
>
>
> ----------------------------------------------------------------
>
> Miri Korenblit (1):
>
>       iwlwifi: add Bz-gf FW for core89-91 release
>
>
>
>  WHENCE                       |   3 +++
>
>  iwlwifi-bz-b0-gf-a0-92.ucode | Bin 0 -> 1757392 bytes
>
>  iwlwifi-bz-b0-gf-a0.pnvm     | Bin 55192 -> 55192 bytes
>
>  3 files changed, 3 insertions(+)
>
>  create mode 100644 iwlwifi-bz-b0-gf-a0-92.ucode
