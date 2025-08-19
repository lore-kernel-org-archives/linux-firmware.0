Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE79CA0EE6
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Aug 2025 11:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3BDA8C19422; Tue, 19 Aug 2025 11:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E09C116B1;
	Tue, 19 Aug 2025 11:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755603195;
	bh=XRdiDp/3C0n00gqHXJYBUqxKKp5lQRyRbHM02ZD53sA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=H89LUWFp4fbgt8wioVEz2IoHbsI+YiGjNJWRZ98Psh9svEjVU5AczwYw7VQUT1PDw
	 JvYk+RsQDNQcM3GUIkLYjZ5TAAcGiAL1EndM8K5G7wQRTLkkJjV+00h6Ech4fG5d5L
	 T74OxMjno0/kOgguXUqtvmj7Hk83sCqKffCRCHnO4xjvCzw41dKlIf7ptoamLkpJ1J
	 IyZRHjb/Grjmqw0d7snlvmLQvhBO2f46Hlz3SMSVtKBy5avTTIelIVPPvnD5lO02hd
	 R8AhiXDZfSjFyz1liS+OIwd4QHtPHNt8bezJ9C1LTBUtzl3leBRSXqnsFMwkK6teUW
	 1+7F9U8OS4oiw==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e94e3c3621fso733559276.0;
        Tue, 19 Aug 2025 04:33:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJgpJALCQjyGMgNqkUFLT4a3Mdi98SAOQPQY5w3mawIMPfY2jRpDOXgsai+vz7/tvz2G2gFelP@kernel.org
X-Gm-Message-State: AOJu0Ywv/iSwjok9pETJCvcUq8nJQhjyxTF8O/xBXbsimMDE0UbReqUv
	7UqGBdFpmUS83Cz49r7C1VKACLEdxT2SMj0MggGF8PsMxlKRFMoG3s0l5YCR4llzUgE4saKuEjB
	xMZ8jT6zsPhGRWcofQUSOwEZU6UmCG70=
X-Google-Smtp-Source: AGHT+IGJwzigz0HEH/8/52Cc3yFuoANIfJNsSnK9dRTnS2+oDBTgiyjDWl34taeCBgPpXJL31H+pObxyhks2FGDMMxw=
X-Received: by 2002:a05:6902:c0a:b0:e94:d4ff:e8c0 with SMTP id
 3f1490d57ef6-e94e6343ad4mr2280668276.46.1755603194309; Tue, 19 Aug 2025
 04:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <DM3PPF63A6024A98DDD1D55C6EECDDE41B2A331A@DM3PPF63A6024A9.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF63A6024A98DDD1D55C6EECDDE41B2A331A@DM3PPF63A6024A9.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Aug 2025 07:33:03 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5fuDwVA0LVKKGaeyt_g-WcJS5VEEJheLJstV-cPE4fqA@mail.gmail.com>
X-Gm-Features: Ac12FXzGxUGVWSOuvLMyKSxg_jkIXVUp05lKotMoDR27FAuWyBofilQJJQXEAag
Message-ID: <CA+5PVA5fuDwVA0LVKKGaeyt_g-WcJS5VEEJheLJstV-cPE4fqA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2025-08-18
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, "Dreyfuss, Haim" <haim.dreyfuss@intel.com>, 
	"kyle@infradead.org" <kyle@infradead.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/650

josh

On Mon, Aug 18, 2025 at 4:19=E2=80=AFPM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
> This contains some new and updated firmwares for all our currently mainta=
ined FW binaries.
>
> Please pull or let me know if there are any issues.
>
> Thanks,
> Miri
> ---
>
> The following changes since commit 07ed893df57c8b1fb30e497d617548254bbf11=
23:
>
>   Merge branch 'amd-staging' into 'main' (2025-08-15 20:59:11 +0000)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2025-08-18
>
> for you to fetch changes up to b5b78dda06f9a62955abfaac54515b6039a681d3:
>
>   iwlwifi: add Bz/gl FW for core97-84 release (2025-08-18 23:11:14 +0300)
>
> ----------------------------------------------------------------
> core97
>
> ----------------------------------------------------------------
> Miri Korenblit (3):
>       iwlwifi: update cc/Qu/QuZ firmwares for core97-84 release
>       iwlwifi: update ty/So/Ma firmwares for core97-84 release
>       iwlwifi: add Bz/gl FW for core97-84 release
>
>  WHENCE                        |  40 ++++++++++++++++++++++++++----------=
----
>  iwlwifi-Qu-b0-hr-b0-77.ucode  | Bin 1406184 -> 1406572 bytes
>  iwlwifi-Qu-b0-jf-b0-77.ucode  | Bin 1322896 -> 1323292 bytes
>  iwlwifi-Qu-c0-hr-b0-77.ucode  | Bin 1406200 -> 1406588 bytes
>  iwlwifi-Qu-c0-jf-b0-77.ucode  | Bin 1322912 -> 1323308 bytes
>  iwlwifi-QuZ-a0-hr-b0-77.ucode | Bin 1406320 -> 1406716 bytes
>  iwlwifi-QuZ-a0-jf-b0-77.ucode | Bin 1322988 -> 1323376 bytes
>  iwlwifi-bz-b0-fm-c0-100.ucode | Bin 0 -> 2225948 bytes
>  iwlwifi-bz-b0-gf-a0-100.ucode | Bin 0 -> 1837024 bytes
>  iwlwifi-bz-b0-hr-b0-100.ucode | Bin 0 -> 1584684 bytes
>  iwlwifi-cc-a0-77.ucode        | Bin 1367700 -> 1368096 bytes
>  iwlwifi-gl-c0-fm-c0-100.ucode | Bin 0 -> 2210748 bytes
>  iwlwifi-ma-b0-gf-a0-89.ucode  | Bin 1751700 -> 1752072 bytes
>  iwlwifi-ma-b0-gf-a0.pnvm      | Bin 55128 -> 55128 bytes
>  iwlwifi-ma-b0-gf4-a0-89.ucode | Bin 1599948 -> 1600024 bytes
>  iwlwifi-ma-b0-gf4-a0.pnvm     | Bin 27836 -> 27836 bytes
>  iwlwifi-ma-b0-hr-b0-89.ucode  | Bin 1539656 -> 1539788 bytes
>  iwlwifi-so-a0-gf-a0-89.ucode  | Bin 1736028 -> 1736108 bytes
>  iwlwifi-so-a0-gf-a0.pnvm      | Bin 55208 -> 55208 bytes
>  iwlwifi-so-a0-gf4-a0-89.ucode | Bin 1590540 -> 1590688 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm     | Bin 27876 -> 27876 bytes
>  iwlwifi-so-a0-hr-b0-89.ucode  | Bin 1526824 -> 1522860 bytes
>  iwlwifi-ty-a0-gf-a0-89.ucode  | Bin 1677896 -> 1677976 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm      | Bin 55052 -> 55052 bytes
>  24 files changed, 26 insertions(+), 14 deletions(-)
>  create mode 100644 iwlwifi-bz-b0-fm-c0-100.ucode
>  create mode 100644 iwlwifi-bz-b0-gf-a0-100.ucode
>  create mode 100644 iwlwifi-bz-b0-hr-b0-100.ucode
>  create mode 100644 iwlwifi-gl-c0-fm-c0-100.ucode
