Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE73C46CD3
	for <linux-firmware@archiver.kernel.org>; Tue, 26 Dec 2023 19:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94A89C433CD; Tue, 26 Dec 2023 19:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAADC433CB
	for <linux-firmware@kernel.org>; Tue, 26 Dec 2023 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703619696;
	bh=fpZDRU5cQvNas65mKHtsAsOwzWvJuxHuetmnmOoJA+E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=F465B/dZJ3we8gqENaKJBFQQkMn2dCVohdc6arFBSZF0S6HeZcBX3rwfdtPfiHWS1
	 Bz33U/MPqSo5eJS1a0e3rMv5GaEpK6TsyU5OY28J8SITGk0rhlZjsd6vm73l2hqYpK
	 sOPStTT+U2hMk1SrgREGmL6WdmDutsxVOLRRJ67GrTlzDpJkYbc79zPuW/Oik02w3i
	 uUenRQ8IP+N+x+L3uZ/AZBEziIghfuNsPzAb/9iQU2LbXMAWjimrw+NKSTmjM0CLFn
	 g0sk0ZrePNHEM4Bo23MWGk3XEJYcbP9HijY70gYnLehukUNiKH/8e6Si6hTqoWSU0v
	 peWP0c6WhXASA==
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bb98e61b59so1850535b6e.2
        for <linux-firmware@kernel.org>; Tue, 26 Dec 2023 11:41:36 -0800 (PST)
X-Gm-Message-State: AOJu0YxcvJx1HfiTlUTk16Jl7pplaA+zEJ1HlXQtZnjzW1Rotyhs3iSS
	vNzQc7/CU6QdnxxOeJi3JQGOLJyNfTW6OLvBb6I=
X-Google-Smtp-Source: AGHT+IE2E66PHnKmB1/hbd/Mnn8Pk3bKt+e9xvNg/IN2EEYTfQ8YEj9UBayZfDG/aibOq0UzJ+fPJnUMn3A7xZyZ8X8=
X-Received: by 2002:a05:6808:1a11:b0:3ba:f4a:430f with SMTP id
 bk17-20020a0568081a1100b003ba0f4a430fmr6761477oib.45.1703619695759; Tue, 26
 Dec 2023 11:41:35 -0800 (PST)
MIME-Version: 1.0
References: <MW5PR11MB58102B83E0F8E4B2612EC96FA395A@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB58102B83E0F8E4B2612EC96FA395A@MW5PR11MB5810.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 26 Dec 2023 14:41:24 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4Puzg77e2snPmOFSYHBr8gME8GQ4-fzkFE4K=F2L6vSw@mail.gmail.com>
Message-ID: <CA+5PVA4Puzg77e2snPmOFSYHBr8gME8GQ4-fzkFE4K=F2L6vSw@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2023-12-21
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, "Yang, You-Sheng" <vicamo.yang@canonical.com>, 
	"Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 7:18=E2=80=AFAM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
>
>
> This contains an updated firmware for gl device.
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
> The following changes since commit c156e6be6d4a0a2290e7059bc74fb0612aa196=
93:
>
>
>
>   Merge branch 'robot/pr-0-1702625169' into 'main' (2023-12-15 12:16:57 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2023-12-21

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/102

josh

>
>
>
> for you to fetch changes up to 318c64abfb33c4211b002f5e5b4ff25cd19f712b:
>
>
>
>   iwlwifi: update gl FW for core80-165 release (2023-12-21 14:04:36 +0200=
)
>
>
>
> ----------------------------------------------------------------
>
> update gl FW for core80-165 release
>
>
>
> ----------------------------------------------------------------
>
> Miri Korenblit (1):
>
>       iwlwifi: update gl FW for core80-165 release
>
>
>
> WHENCE                       |   2 +-
>
> iwlwifi-gl-c0-fm-c0-83.ucode | Bin 1799504 -> 1797996 bytes
>
> iwlwifi-gl-c0-fm-c0.pnvm     | Bin 226668 -> 246228 bytes
>
> 3 files changed, 1 insertion(+), 1 deletion(-)
>
>
