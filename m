Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DA6CDB465
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Oct 2023 11:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17421C433D9; Thu, 19 Oct 2023 11:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BD3C433CB
	for <linux-firmware@kernel.org>; Thu, 19 Oct 2023 11:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697715510;
	bh=iNwKG+Eirkj+mYzvPQlhSqslbKDxlqg8bgYacq+axeU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tNKEmKiSL7oSoozwHDVCWcYzwpOjt/WRKMavE9mi7TZxKoevF5RLaQWTWKv/Fskjs
	 2Rt93NeYib1ik7Hwifa+9PQClcFL8ydCFGd3iFYfZbOEwSkzTVy80aGiJ7wrQGEl0e
	 FF6hC3NWMLVTst/kG9/iFiojKmTxUkj1JGkyNjBMJeFVro9viz9Zxh6ovoc09mUv4c
	 /ET7QO5yNEwP4J4/DDJEexLjknR/kjbsbV6Hig1L3pG4uDBSGGW8vOGbNbpqlM+RPm
	 NnVB+xouq9gTLq55prGXxKb7GePLAfGlCJDTQRsEo9N2ZYK1b1gGfJEOB2pKUfkECx
	 i6IiifSvdDXzQ==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d9a7a3e17d1so9127743276.2
        for <linux-firmware@kernel.org>; Thu, 19 Oct 2023 04:38:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YyP1zzczugqrVJmxphUQZABLhFid+pzMajAJimead+QxJnqyBfr
	9NULh4OBqMwhvi7ZeaF2N/JXymR4jVHH+uQMrQI=
X-Google-Smtp-Source: AGHT+IE3NJixI0+wBkwTeeDIVXrEXYTMHAc6iOaxTPXsU7ZS2WWgh0IK84wY1NlSKapdyVxPp0kiE7rSpjrDOsbJM8k=
X-Received: by 2002:a25:41d6:0:b0:d9a:c8a1:70d0 with SMTP id
 o205-20020a2541d6000000b00d9ac8a170d0mr2097310yba.30.1697715509121; Thu, 19
 Oct 2023 04:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <d922d3246f1e62d8380a7566bfe23479d8c0e748.camel@intel.com>
In-Reply-To: <d922d3246f1e62d8380a7566bfe23479d8c0e748.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 19 Oct 2023 07:38:18 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4a0zYqzebHji+7Fy5RLGj3gekm6_7ucVr_bOv_izhtoA@mail.gmail.com>
Message-ID: <CA+5PVA4a0zYqzebHji+7Fy5RLGj3gekm6_7ucVr_bOv_izhtoA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2023-10-12
To: "Greenman, Gregory" <gregory.greenman@intel.com>, Mario Limonciello <superm1@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"kyle@infradead.org" <kyle@infradead.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>, 
	"linux-wireless@vger.kernel.or" <linux-wireless@vger.kernel.or>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 9:40=E2=80=AFAM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> Hi,
>
> One firmare file was missing from the pull request for core80-39.
> Send the missing file.
>
> Please pull or let me know if there are any issues.
>
> --
> Thanks,
> Gregory
>
> The following changes since commit 7727f7e3b3358713c7c91c64a835e80c331a6b=
8b:
>
>   Merge branch 'patch-1696561325' into 'main' (2023-10-06 03:04:57 +0000)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2023-10-12

Pulled and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/30

josh

>
> for you to fetch changes up to 92e24e048136d6ebf29bd9f3afaba0f24f8997cd:
>
>   iwlwifi: add a missing FW from core80-39 release (2023-10-12 16:22:55 +=
0300)
>
> ----------------------------------------------------------------
> iwlwifi firmware for So with HR radio
>
> ----------------------------------------------------------------
> Gregory Greenman (1):
>       iwlwifi: add a missing FW from core80-39 release
>
>  WHENCE                       |   3 +++
>  iwlwifi-so-a0-hr-b0-83.ucode | Bin 0 -> 1552480 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 iwlwifi-so-a0-hr-b0-83.ucode
