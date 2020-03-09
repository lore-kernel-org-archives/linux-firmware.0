Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8EFC10F27
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Mar 2020 17:50:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6ECDA21927; Mon,  9 Mar 2020 17:50:38 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4B59C208C3;
	Mon,  9 Mar 2020 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583776238;
	bh=IqkP2cQ1tanWWBC7/FvJu2+USviXtwQlw8Gm+JaKeOU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YUxZgi1oCvrr318keFuhUnR6Enob3OZLj7JH2eR38tcRojNNOS4wizTUMPDYrubJi
	 EumVeobF9sBGT9+kge4BiBjGgreZdQqeRY7YI81p143YugHaaXReJzhMrPyDMLLdgZ
	 0xVWAiIKz57E2ML4ZV9bJc2UfBgR8ppzhIy7MIaE=
Received: by mail-io1-f48.google.com with SMTP id h8so10044044iob.2;
        Mon, 09 Mar 2020 10:50:38 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1W+vruQKrGD4v0gwOvcBUxbIxGf4s+mK/HDszhWrDzlBH1qiyT
	LWmZuiE/ScjbdF6amXY/elNYfX849sltymsrXWk=
X-Google-Smtp-Source: ADFU+vsw9etjX+/B/69FRItZyc1hFZ5aZGJOpvbL3Rg6sjSGP5yWm/yGd+BKnzQRiynEp0kleRiyvFdHlWg3KIwg500=
X-Received: by 2002:a05:6602:2098:: with SMTP id a24mr12959827ioa.101.1583776237711;
 Mon, 09 Mar 2020 10:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200304213513.2239-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20200304213513.2239-1-daniele.ceraolospurio@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 9 Mar 2020 13:50:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5Hr0RQ5W6-fDCTUHOJoGuwebebFw8OD7Wj+1_zHYrhNQ@mail.gmail.com>
Message-ID: <CA+5PVA5Hr0RQ5W6-fDCTUHOJoGuwebebFw8OD7Wj+1_zHYrhNQ@mail.gmail.com>
Subject: Re: PR - i915 firmware updates (TGL HuC 7.0.12 and DMC 2.06)
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Kyle McMartin <kyle@kernel.org>, 
	Ben Hutchings <ben@decadent.org.uk>, jose.souza@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2020 at 4:36 PM Daniele Ceraolo Spurio
<daniele.ceraolospurio@intel.com> wrote:
>
> Hi,
>
> Kindly add the below i915 changes to linux-firmware.git
>
> The following changes since commit 0148cfefcbf98898ca65bb26d9d7d638b30e21=
1d:
>
>   Merge https://github.com/rjliao-qca/qca-btfw (2020-03-02 08:08:15 -0500=
)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware tgl_huc_7.0.12_dmc_2.06

Pulled and pushed out.

josh

>
> for you to fetch changes up to fb83402c757034fd9adef083047390b3b2f54cb4:
>
>   i915: Add DMC firmware v2.06 for TGL (2020-03-04 13:19:07 -0800)
>
> ----------------------------------------------------------------
> Daniele Ceraolo Spurio (1):
>       i915: add HuC firmware v7.0.12 for TGL
>
> Jos=C3=A9 Roberto de Souza (1):
>       i915: Add DMC firmware v2.06 for TGL
>
>  WHENCE                   |   6 ++++++
>  i915/tgl_dmc_ver2_06.bin | Bin 0 -> 18660 bytes
>  i915/tgl_huc_7.0.12.bin  | Bin 0 -> 530368 bytes
>  3 files changed, 6 insertions(+)
>  create mode 100644 i915/tgl_dmc_ver2_06.bin
>  create mode 100644 i915/tgl_huc_7.0.12.bin
