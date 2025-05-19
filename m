Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F69C2D0CD
	for <linux-firmware@archiver.kernel.org>; Mon, 19 May 2025 11:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B564DC4CEF2; Mon, 19 May 2025 11:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A013BC4CEE4
	for <linux-firmware@kernel.org>; Mon, 19 May 2025 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747654900;
	bh=OclF39h2fx62GGWpSjllW8xXRcFpXjqSSWwsfAv8+nk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=SHWHFWgWDr9OV/e1eJbEnQneimI+MvG1QIS2KXzDwggOMaCoPEBX6v6ToxHIviU3X
	 O2XL5XsFSVFbHnh6h1ybaJnT5Ti9atldJn6ER/XWklKXwymxqL4LaJXwLazCQPmSSF
	 XM7E5EqVSb/IsC1MJK+r01oskJioqWA4yaS1QbJNRUqRZXzabSiiyG+Tjo7o8Grg4n
	 HmFj7MIkjYwzvbllLJeXA3s1wY457qXveZT67ClFrwUGQdAReeXPLyFy36hVBgKKjV
	 HUtv0iEYmPYNfroMTwSLwFXNaS5ZgS+k6qbOcvTpaqbHRUI1lA0qwJX/l8K2+PI32Q
	 Ja+EnGw9PC61g==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e75668006b9so4384265276.3
        for <linux-firmware@kernel.org>; Mon, 19 May 2025 04:41:40 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx8okCB43qBlYrgHNyG8dznIzsdIwkER8S2WSypOyxdyWnrfKLM
	cXBfJTNGzyKxqzm7TifRCCAorMV+/l94EaKHHba7JNf2m4ohefb3Aur21IJkt2yMK4bthRQ6Dz3
	nKcQgUmoHIEr/1w0ieH8R9mUNKmmgzLM=
X-Google-Smtp-Source: AGHT+IH1DzVz02Y4ANebTMTEe4iBSt92cykTg0TxqQCzq+xie+Nhh0RC/H8088oLBW9YrJQ7K2mNXUn5kCOk2lVo+W8=
X-Received: by 2002:a05:690c:3:b0:707:dba5:2e44 with SMTP id
 00721157ae682-70ca7ba0d8emr177822307b3.30.1747654899864; Mon, 19 May 2025
 04:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <31fd25aa-587e-4adf-a33b-109335b46ba9@opensource.cirrus.com>
In-Reply-To: <31fd25aa-587e-4adf-a33b-109335b46ba9@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 May 2025 07:41:28 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6xpavEn+2vi1w0u53ytnzZLy18NDu9zJJnVvE=vKV1BA@mail.gmail.com>
X-Gm-Features: AX0GCFs7T2Ddr0QQZ2eYWyGym0BEJVvFH-tIh5ZidUCfQMUSJHE31vg0uf1LJNI
Message-ID: <CA+5PVA6xpavEn+2vi1w0u53ytnzZLy18NDu9zJJnVvE=vKV1BA@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add Firmware for Acer Helios Laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/548

josh

On Fri, May 16, 2025 at 8:11=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to update firmware files for Cirrus Logic Smart Amp CS35L41=
 for Acer Helios laptops.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit 64899f3955a043f1506e7720881d8f850381c9=
00:
>
>   Merge branch 'robot/patch-0-1747309101' into 'main' (2025-05-15 12:22:2=
8 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250516
>
> for you to fetch changes up to 034b673fc6bc06e2b5c9f4eb1ffd6c725e3b0eea:
>
>   cirrus: cs35l41: Add Firmware for various ACER Laptops using CS35L41 HD=
A (2025-05-16 11:46:23 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>       cirrus: cs35l41: Add Firmware for various ACER Laptops using CS35L4=
1 HDA
>
>  WHENCE                                       |   9 +++++++++
>  cirrus/cs35l41-dsp1-spk-prot-1025182c-l0.bin | Bin 0 -> 5500 bytes
>  cirrus/cs35l41-dsp1-spk-prot-1025182c-r0.bin | Bin 0 -> 5500 bytes
>  cirrus/cs35l41-dsp1-spk-prot-10251844-l0.bin | Bin 0 -> 5196 bytes
>  cirrus/cs35l41-dsp1-spk-prot-10251844-r0.bin | Bin 0 -> 5196 bytes
>  5 files changed, 9 insertions(+)
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-1025182c-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-1025182c-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10251844-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10251844-r0.bin
>
