Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84874C02180
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Jan 2025 12:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58A06C4CEE4; Thu, 16 Jan 2025 12:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41219C4CEE3
	for <linux-firmware@kernel.org>; Thu, 16 Jan 2025 12:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737028805;
	bh=aIzrQq9tBTdcVGI4/Nll1Kjfe3pVlC5BM/kqbcXYrDs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=EBQuTfftzFpQ1VMwNKHQXOhazjdIzUClt8c1HnZ7Z1atbFJ8cftmrc7rUO6C7uNHU
	 PRcHU5FgkXGtuoaZbZySDZj3XOdlPIqgFjGrE7TRtQQuj2QQJNo9gXRrvjWstbY4ol
	 ji4eVwCLVOlNbH+NFPHzGBrPjv3wi4dN/LzShx1r8HnAYfuK1rCGg1KsQUMDtw1WoR
	 yBKJatMiuZkPMeOIyvYNV8CImBtSGjF11N4cxySz3Zffm3CkZJ2hz/U2i56ijYcejA
	 RF6qilHpQ20giR4DzlWgE0vQoX8NtnXtgVmqx/XD46PfTGO1P3c7M96Tzhu6QTYjEw
	 BSzoyeAzwTejg==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaec61d0f65so187916066b.1
        for <linux-firmware@kernel.org>; Thu, 16 Jan 2025 04:00:05 -0800 (PST)
X-Gm-Message-State: AOJu0YzXhP7aKxjt9PQ1fUV76Zrbv0BGWtHlUrzxb1CKic9l79az25UG
	UmcwDMOaHOK4KY4ykzdJQfX8WWYehJzNdl6HjAeaC4+kz30zRsw+nFKT/1pcaNZzXls+q+UK/Eo
	vm8s86V6p1RMNOxVepjHmlsrkcQo=
X-Google-Smtp-Source: AGHT+IEknswj0r6+jEMspheA8T+7pscfhXggdRbCTT49JUROv5lFYLojtUGe4XA8Xiy0BTeI1TZYz0HEqlySvLWz7/M=
X-Received: by 2002:a17:907:6d0e:b0:aaf:5c9:19f9 with SMTP id
 a640c23a62f3a-ab2ab6f3455mr3054182766b.27.1737028803814; Thu, 16 Jan 2025
 04:00:03 -0800 (PST)
MIME-Version: 1.0
References: <MW5PR11MB5810AB20FCCD2A0B4AFDC901A3192@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB5810AB20FCCD2A0B4AFDC901A3192@MW5PR11MB5810.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 16 Jan 2025 06:59:50 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5E8R0XNAJX3ymphG4PL66YxJ6RbNZG+1fCvo3cq9hR3g@mail.gmail.com>
X-Gm-Features: AbW1kvbjSZ1EgFzukx00E4xmUcszM-BRtX3HfFmSR70PW7EVuFFU-mXGPiF2Msw
Message-ID: <CA+5PVA5E8R0XNAJX3ymphG4PL66YxJ6RbNZG+1fCvo3cq9hR3g@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2024-01-15
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, "Yang, You-Sheng" <vicamo.yang@canonical.com>, 
	"Dreyfuss, Haim" <haim.dreyfuss@intel.com>, Wireless <linux-wireless@vger.kernel.org>, 
	"Damary, Guy" <guy.damary@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 2:46=E2=80=AFAM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
>
>
> This contains a new firmware for Bz device.
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
> The following changes since commit a28a9226ccb8bf393b8e7dd8970a4d967c1a1d=
92:
>
>
>
>   Merge branch 'robot/pr-0-1736646402' into 'main' (2025-01-13 14:30:09 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2025-01-15

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/407

josh

>
>
>
> for you to fetch changes up to 04e6d3f371ab3ad6970603be194023bd4c700126:
>
>
>
>   iwlwifi: add Bz FW for core90-93 release (2025-01-15 09:38:48 +0200)
>
>
>
> ----------------------------------------------------------------
>
> released core90 of BZ+FM
>
>
>
> ----------------------------------------------------------------
>
> Miri Korenblit (1):
>
>       iwlwifi: add Bz FW for core90-93 release
>
>
>
>  WHENCE                       |   3 +++
>
>  iwlwifi-bz-b0-fm-c0-93.ucode | Bin 0 -> 1931432 bytes
>
>  2 files changed, 3 insertions(+)
>
>  create mode 100644 iwlwifi-bz-b0-fm-c0-93.ucode
