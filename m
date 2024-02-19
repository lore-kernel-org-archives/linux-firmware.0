Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB73C48BC3
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Feb 2024 12:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7C57C43390; Mon, 19 Feb 2024 12:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A98C433F1
	for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 12:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708346830;
	bh=23CLwgVnS3Ti6EWKja1d3y4OSdJZioR7lcTl+R6jjso=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ebM1XrKDaMIyZfbCns+XyJ8H6vVIzj3nK/S7+IiXogUWIT2WCX8cjNnkXgYNNngIH
	 SIAphCiQbV+FhzA/TdFXdH86YjeXByBx2gG3vafJ6FbgHx0VBq6npHd8u1KO+S+dnF
	 twK9wW5F664wWfRGGb0MPMI8+0Lc9BGPahiU5f9eCnNnFRjjwjKeAblCObIGvrpby8
	 3NvjjJ4tBhf0KnQHNDCtgC1p2iTADpdRdcJLZENdFaPF7yZZ3X64ud5fwZtr54Q5F5
	 OlJBTBINYq1wX43BnaCdXv3BOalyJkaso7aJl7/vYeGHFUQbfB09VpuOBAVS0UC3Lk
	 qFb5NoXd4DHnA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6084c93f80eso3364547b3.3
        for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 04:47:10 -0800 (PST)
X-Gm-Message-State: AOJu0Yz6mBwMXHj/GGuj1qTIKMoqkmHzLCk+y82HFu9RuQIaIL3+hOLx
	gEelELfSJbsajPrdcjs/4b6zYeelF+2I487wUN62tk6HNLqSafzHymkgHax+mf23pZ9qfKSV6Js
	OC7MyuZqElGFQgNpWYIUwjpXD3Ks=
X-Google-Smtp-Source: AGHT+IEfdJoMsCFFAraBM4F+WnBtxENGsEsbXVge/I6wAcIdwLYHHj0nA2UaoSvARYrk6wXPPUNkdMn9Ebj2DgtJDpA=
X-Received: by 2002:a81:8446:0:b0:608:13ee:8f3f with SMTP id
 u67-20020a818446000000b0060813ee8f3fmr5184269ywf.27.1708346829948; Mon, 19
 Feb 2024 04:47:09 -0800 (PST)
MIME-Version: 1.0
References: <b8e9a2a8-1524-4358-9e23-27875a4b3243@opensource.cirrus.com>
In-Reply-To: <b8e9a2a8-1524-4358-9e23-27875a4b3243@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Feb 2024 07:46:59 -0500
X-Gmail-Original-Message-ID: <CA+5PVA64TNve_k=stZRSB4ucnbC_z3PEkFMxauDh9yauMe8_3Q@mail.gmail.com>
Message-ID: <CA+5PVA64TNve_k=stZRSB4ucnbC_z3PEkFMxauDh9yauMe8_3Q@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for Lenovo Legion 7i gen7 laptop (16IAX7)
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 11:19=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for Lenovo Legion 7i gen7 laptop (16IAX7)
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit f0e2f70ceb682d38604d88343dfc7f80cc46a6=
94:
>
>    Merge branch 'robot/patch-0-1708082607' into 'main' (2024-02-16
> 11:29:57 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ Lenovo16IAX7

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/155

josh

>
> for you to fetch changes up to d9fa75944debb977e635a302a1ccd94932fe7cea:
>
>    linux-firmware: Add CS35L41 firmware for Lenovo Legion 7i gen7 laptop
> (16IAX7) (2024-02-16 14:26:27 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>        linux-firmware: Add CS35L41 firmware for Lenovo Legion 7i gen7
> laptop (16IAX7)
>
>   WHENCE                                       |   5 +++++
>   cirrus/cs35l41-dsp1-spk-cali-17aa386f.bin    | Bin 0 -> 1580 bytes
>   cirrus/cs35l41-dsp1-spk-prot-17aa386f-l0.bin | Bin 0 -> 4808 bytes
>   cirrus/cs35l41-dsp1-spk-prot-17aa386f-r0.bin | Bin 0 -> 4812 bytes
>   4 files changed, 5 insertions(+)
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa386f.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa386f-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa386f-r0.bin
>
