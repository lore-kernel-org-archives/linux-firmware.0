Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4989DEB64D9
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Jul 2023 19:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D2C9C433CD; Thu,  6 Jul 2023 19:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16ECBC433CC
	for <linux-firmware@kernel.org>; Thu,  6 Jul 2023 19:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688672695;
	bh=+NUTjq3igoxtz4BVk3ZnjGYgRcFd1OgWQVN9U7nEbv4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FrOE36PNnYULGrjC+uuUDUPkmbYfPCPPWdLEBSH1/6gCk59MVy2c7NOXrInrLJJcR
	 CN60Z+p//SXZjJNImaPe/fq1o4/7UvePxKH+lFK65JON36GliR8PuDaZUMVMfz21c7
	 qpx50V6M3caaAzJ0lAyKV/eH7oJDpxf1NQEvs1k8M7dIEhUjQQ+lfpTN4IJr5zinNA
	 16wqVLuBLmn+o1tk6WOA7TScpNFmi6f0lCR2dyEaeyKUq1Y+v8VQV2XqzjnMszxgIq
	 uJETyaUtUwbR5Lmxo74PujYZjjHb/6TyNP4zd4TJp3jEscZXjRyLhA8iCF/cUBp2R4
	 be+Iqv93ej59g==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5774335bb2aso14960267b3.0
        for <linux-firmware@kernel.org>; Thu, 06 Jul 2023 12:44:55 -0700 (PDT)
X-Gm-Message-State: ABy/qLY5CShBWEbCXi+GcIHnPsZfOfMqATi2mipno2RpaByw6mWWab3A
	Y9ByO3gsfgkRxKCJmOoC4RT/x9kmpGl2AXqXuBk=
X-Google-Smtp-Source: APBJJlHApBZfJkOWwx820ISKwgnHKj0g//Ys9apRKB6vemHOTSHxiAPEbTI5NgFRNUU1PhSnXoosOD0H390D+hj15WE=
X-Received: by 2002:a0d:ea48:0:b0:577:60d4:a879 with SMTP id
 t69-20020a0dea48000000b0057760d4a879mr2825514ywe.33.1688672694087; Thu, 06
 Jul 2023 12:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <357e342788eaa17c8bb8113812d67c38df3236c0.camel@intel.com>
In-Reply-To: <357e342788eaa17c8bb8113812d67c38df3236c0.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 6 Jul 2023 15:44:43 -0400
X-Gmail-Original-Message-ID: <CA+5PVA55+fdTi=w6Bp=f3igSEOVv0DQD_OanNrBdpQMY0Q+BmQ@mail.gmail.com>
Message-ID: <CA+5PVA55+fdTi=w6Bp=f3igSEOVv0DQD_OanNrBdpQMY0Q+BmQ@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2023-06-29
To: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"kyle@infradead.org" <kyle@infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 2:34=E2=80=AFAM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> Hi,
>
> This contains some new and updated firmwares for all our currently
> maintained FW binaries.
>
> Please pull or let me know if there are any issues.
>
> Thanks,
> Gregory
>
>
> The following changes since commit ee91452dac5abfc4c5b9827cf55e701d8c0ca6=
78:
>
>   Makefile, copy-firmware: support xz/zstd compressed firmware (2023-06-2=
5 12:18:57 -0400)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2023-06-29

Pulled and pushed out.

josh

>
> for you to fetch changes up to b255f5b92998d0277f1068e69768e3e70aae5210:
>
>   iwlwifi: add new FWs from core80-39 release (2023-06-29 12:18:42 +0300)
>
> ----------------------------------------------------------------
> Update iwlwifi firmwares according to core80-39 release
>
> * for cc/Qu/QuZ - update the existing firmwares
> * for ty/so add new firmware/PNVM
>
> ----------------------------------------------------------------
> Gregory Greenman (2):
>       iwlwifi: update cc/Qu/QuZ firmwares for core80-39 release
>       iwlwifi: add new FWs from core80-39 release
>
>  WHENCE                        |  21 +++++++++++++++------
>  iwlwifi-Qu-b0-hr-b0-77.ucode  | Bin 1404676 -> 1404704 bytes
>  iwlwifi-Qu-b0-jf-b0-77.ucode  | Bin 1321900 -> 1322436 bytes
>  iwlwifi-Qu-c0-hr-b0-77.ucode  | Bin 1404692 -> 1404720 bytes
>  iwlwifi-Qu-c0-jf-b0-77.ucode  | Bin 1321916 -> 1322452 bytes
>  iwlwifi-QuZ-a0-hr-b0-77.ucode | Bin 1404820 -> 1404840 bytes
>  iwlwifi-cc-a0-77.ucode        | Bin 1366120 -> 1366144 bytes
>  iwlwifi-so-a0-gf-a0-83.ucode  | Bin 0 -> 1739988 bytes
>  iwlwifi-so-a0-gf-a0.pnvm      | Bin 56048 -> 55580 bytes
>  iwlwifi-so-a0-gf4-a0-83.ucode | Bin 0 -> 1703968 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm     | Bin 28252 -> 28064 bytes
>  iwlwifi-ty-a0-gf-a0-83.ucode  | Bin 0 -> 1683076 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm      | Bin 41876 -> 55484 bytes
>  13 files changed, 15 insertions(+), 6 deletions(-)
>  create mode 100644 iwlwifi-so-a0-gf-a0-83.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-83.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-83.ucode
