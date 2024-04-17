Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B154BC4345F
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Apr 2024 11:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3A1BC32781; Wed, 17 Apr 2024 11:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD42C2BD10
	for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 11:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713352711;
	bh=h9rP5BQQ3BeFTASINDfvL2QJJ/wWKwCap2y3EQTRNdc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NmdhhUhAuXBbiC5CpExR+5ucbUbLSfpmgeZwlDjNVNLpv1PjDlTVvEHdoQm4oJlSt
	 6kMEp6Y2kGPQMCojq3b6Mhycvd83lUmQhpbCseI2QNKV1N9h+dWYL7oNHDLq6dJPsZ
	 biMqZlgZ4FQfH9e1M8K/ps48AKt0mwS4J4ZGcorNCqNJKkEl11vwjIS4xwcJect/D3
	 YiYr0ccZPUfg8yFD8Xo5mX2ub5WlMzUQIcNDzYmSs0muPD6shKeAx8BRYSoGJMQRFu
	 TR+teln3R632boCG5BMUGhU5WkqFTj+GgQHEJQUeGs84L11vDgtZGSNxFze/Vi8vBm
	 sHLhz1Gqr/j9w==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-617ddc988f5so62778127b3.2
        for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 04:18:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YwhhZOtwE4/7J8xRtoyYmDsei+JLfKaYcKS0HPx8DjNyZvdremI
	qr0Olbmx9lRCa4c2XTe5KzemxC+S82cUYhYFJ+YY9g2xGgIN0qlSolLGm7reQ3ymucBxMWAXH7m
	P1GfR2vJj+r6/RjbDKiDJXZabMqE=
X-Google-Smtp-Source: AGHT+IEkpRK+nOg8hEgvwarbdcADzHUbMbgzziEnWt0S2l+KdLGujXlROpzLij2kGfEpQhce0OfzVN1XejthdeXKkSM=
X-Received: by 2002:a05:690c:399:b0:61a:e15d:72 with SMTP id
 bh25-20020a05690c039900b0061ae15d0072mr7150031ywb.28.1713352710813; Wed, 17
 Apr 2024 04:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <MW5PR11MB58107B5828493B9CD700BAEDA30F2@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB58107B5828493B9CD700BAEDA30F2@MW5PR11MB5810.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 17 Apr 2024 07:18:19 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5Y77uCdD+9+hXDhxhoue7bfmG+4_2PCTVV=fLpQYkg6Q@mail.gmail.com>
Message-ID: <CA+5PVA5Y77uCdD+9+hXDhxhoue7bfmG+4_2PCTVV=fLpQYkg6Q@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2024-04-17
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 5:54=E2=80=AFAM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
>
>
> This contains some new and updated firmware=E2=80=99s for all our current=
ly
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
>
>
> The following changes since commit 5da74b16166d3c43e5435fda6916fc88575386=
f1:
>
>
>
>   Merge branch 'robot/pr-0-1712895838' into 'main' (2024-04-12 13:04:30 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2024-04-17

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/194

josh

>
>
>
> for you to fetch changes up to f3363b57042099edc95165bfcf9779ac701394f2:
>
>
>
>   iwlwifi: add gl FW for core87-44 release (2024-04-17 09:56:59 +0300)
>
>
>
> ----------------------------------------------------------------
>
> core87
>
>
>
> ----------------------------------------------------------------
>
> Miri Korenblit (3):
>
>       iwlwifi: update cc/Qu/QuZ firmwares for core87-44 release
>
>       iwlwifi: add ty/So/Ma firmwares for core87-44 release
>
>       iwlwifi: add gl FW for core87-44 release
>
>
>
>  WHENCE                        |  33 +++++++++++++++++++++++++++------
>
>  iwlwifi-Qu-b0-hr-b0-77.ucode  | Bin 1404824 -> 1405980 bytes
>
>  iwlwifi-Qu-b0-jf-b0-77.ucode  | Bin 1322476 -> 1322684 bytes
>
>  iwlwifi-Qu-c0-hr-b0-77.ucode  | Bin 1404840 -> 1405996 byte
>
> iwlwifi-Qu-c0-jf-b0-77.ucode  | Bin 1322492 -> 1322700 bytes
>
> iwlwifi-QuZ-a0-hr-b0-77.ucode | Bin 1404968 -> 1406116 bytes
>
>  iwlwifi-cc-a0-77.ucode        | Bin 1366272 -> 1367432 bytes
>
>  iwlwifi-gl-c0-fm-c0-90.ucode  | Bin 0 -> 1890864 bytes
>
>  iwlwifi-gl-c0-fm-c0.pnvm      | Bin 246228 -> 267272 bytes
>
>  iwlwifi-ma-b0-gf-a0-89.ucode  | Bin 0 -> 1721440 bytes
>
>  iwlwifi-ma-b0-gf-a0.pnvm      | Bin 55092 -> 55096 bytes
>
>  iwlwifi-ma-b0-gf4-a0-89.ucode | Bin 0 -> 1598424 bytes
>
>  iwlwifi-ma-b0-gf4-a0.pnvm     | Bin 27820 -> 27820 bytes
>
>  iwlwifi-so-a0-gf-a0-89.ucode  | Bin 0 -> 1709992 bytes
>
>  iwlwifi-so-a0-gf-a0.pnvm      | Bin 55172 -> 55176 bytes
>
>  iwlwifi-so-a0-gf4-a0-89.ucode | Bin 0 -> 1589216 bytes
>
>  iwlwifi-so-a0-gf4-a0.pnvm     | Bin 27860 -> 27860 bytes
>
>  iwlwifi-so-a0-hr-b0-89.ucode  | Bin 0 -> 1526136 bytes
>
>  iwlwifi-ty-a0-gf-a0-89.ucode  | Bin 0 -> 1651956 bytes
>
>  iwlwifi-ty-a0-gf-a0.pnvm      | Bin 55020 -> 55020 bytes
>
>  20 files changed, 27 insertions(+), 6 deletions(-)
>
>  create mode 100644 iwlwifi-gl-c0-fm-c0-90.ucode
>
>  create mode 100644 iwlwifi-ma-b0-gf-a0-89.ucode
>
>  create mode 100644 iwlwifi-ma-b0-gf4-a0-89.ucode
>
>  create mode 100644 iwlwifi-so-a0-gf-a0-89.ucode
>
>  create mode 100644 iwlwifi-so-a0-gf4-a0-89.ucode
>
>  create mode 100644 iwlwifi-so-a0-hr-b0-89.ucode
>
>  create mode 100644 iwlwifi-ty-a0-gf-a0-89.ucode
