Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A03C5B543
	for <linux-firmware@archiver.kernel.org>; Tue, 10 Jun 2025 10:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99D46C4CEF6; Tue, 10 Jun 2025 10:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8014DC4CEF3
	for <linux-firmware@kernel.org>; Tue, 10 Jun 2025 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749552975;
	bh=LeMCqbsz2Y6lOb1tBEOvdEU2lstNBFQUpl1wwV7BPVY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Ks1zTuIOUyn+tyC0ju1aj4EsoInuX1ZIU5xGMlJ3q3vJ3AgJeLJ4OJ6JA11KAokcz
	 Naz3LPf86u+N9Smb02wzCYZueEr5eS6u+kJUW0Q1KKEMdYmL/n4Db457NcmV3TfBkl
	 E1tyJx93BGxU1gc9KXMYJsVHakr11Gk6kHs4sfDmT5EQ7Q9hOm/vr5UHs0bTPKLLPN
	 UKk29B7IcEdavLweqlMWIhdpI0RuY26TAMI5RNi9bH95p+RA2Dvhba9GLODOGe4uRI
	 rHUvR23iT0EdT2pHhLajnt7KtlMx5ADX/GGY6HWAPXhAiLokx+CWBW72B8W9pXfbYO
	 8L1SQ4l/z3Osw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70f862dbeaeso53457497b3.1
        for <linux-firmware@kernel.org>; Tue, 10 Jun 2025 03:56:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YyLeQsd2ar9lt4noeNRCxFEhhPJMwy+l/GVX4MhQwY78XMfDLi/
	LLO85S1CvFRNnrtdLi1If9O9Ty9ehOuK8dFlk3wFmX8jtQ7YZC0mIZ058yIdO14WRlRjPqaDIHA
	TEm3iYZkGHALpn7RQySmME6Pcw9sUa3A=
X-Google-Smtp-Source: AGHT+IGScghRE/zlPz+X1QQqXKGLodydzMYxvVqaKFuHJnBPG0bTil/7smICi/J2D74Xc8gLOSQpLdjVQXjkn2ITGV4=
X-Received: by 2002:a05:690c:360a:b0:70c:90af:154 with SMTP id
 00721157ae682-710f76863d6mr253191787b3.20.1749552974708; Tue, 10 Jun 2025
 03:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <DM3PPF63A6024A9415C3A590026C051A7A2A36BA@DM3PPF63A6024A9.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF63A6024A9415C3A590026C051A7A2A36BA@DM3PPF63A6024A9.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 10 Jun 2025 06:56:03 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7TR0NZEmn02zetxUHQvHZk3LtNOLW5a1qUaJOhAn0=Yw@mail.gmail.com>
X-Gm-Features: AX0GCFuzzO-OGaUbuzg1r5Cc6kHI7YCshe0JTmFHLVP3zDKwzC2VInjNgwz8BuQ
Message-ID: <CA+5PVA7TR0NZEmn02zetxUHQvHZk3LtNOLW5a1qUaJOhAn0=Yw@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2025-06-09
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, "Dreyfuss, Haim" <haim.dreyfuss@intel.com>, 
	"kyle@infradead.org" <kyle@infradead.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/578

josh

On Mon, Jun 9, 2025 at 6:22=E2=80=AFAM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
> Due to an unexpected incompatibility between the FW and PNVM,
> Revert the FW and PNVM updates for the affected devices.
>
> Please pull or let me know if there are any issues.
>
> Thanks,
> Miri
> ---
>
> The following changes since commit 5ac6303062e4f052100439783cf06f26c5529b=
4c:
>
>   amdgpu: DMCUB updates for various ASICs (2025-06-06 20:58:30 +0000)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2025-06-09
>
> for you to fetch changes up to 7738031c44a325b63247f984d19d3a578423f5f3:
>
>   Revert "iwlwifi: add Bz/gl FW for core96-76 release" (2025-06-09 10:18:=
18 +0300)
>
> ----------------------------------------------------------------
> revert core96 for Bz/Gl, due to FW and PNVM compatibility issue
>
> ----------------------------------------------------------------
> Miri Korenblit (1):
>       Revert "iwlwifi: add Bz/gl FW for core96-76 release"
>
>  WHENCE                       |  12 ------------
>  iwlwifi-bz-b0-fm-c0-99.ucode | Bin 1927196 -> 0 bytes
>  iwlwifi-bz-b0-fm-c0.pnvm     | Bin 296060 -> 295356 bytes
>  iwlwifi-bz-b0-gf-a0-99.ucode | Bin 1777464 -> 0 bytes
>  iwlwifi-bz-b0-gf-a0.pnvm     | Bin 55208 -> 55208 bytes
>  iwlwifi-bz-b0-hr-b0-99.ucode | Bin 1578840 -> 0 bytes
>  iwlwifi-bz-b0-hr-b0.pnvm     | Bin 1788 -> 1788 bytes
>  iwlwifi-gl-c0-fm-c0-99.ucode | Bin 1912536 -> 0 bytes
>  iwlwifi-gl-c0-fm-c0.pnvm     | Bin 295740 -> 295036 bytes
>  9 files changed, 12 deletions(-)
>  delete mode 100644 iwlwifi-bz-b0-fm-c0-99.ucode
>  delete mode 100644 iwlwifi-bz-b0-gf-a0-99.ucode
>  delete mode 100644 iwlwifi-bz-b0-hr-b0-99.ucode
>  delete mode 100644 iwlwifi-gl-c0-fm-c0-99.ucode
