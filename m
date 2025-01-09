Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD7EE7719A
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Jan 2025 22:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99F47C4CEE5; Thu,  9 Jan 2025 22:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846A0C4CEE2
	for <linux-firmware@kernel.org>; Thu,  9 Jan 2025 22:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736460700;
	bh=/EUAjwk/WEr1ONv5icBHW65VZTYDCTAs755SwZdvIlo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LQaokLnE3YajRdGYUnPKSOwWwoiNAZcxcc+rmSCG1/wfLbH7bbFedFTLoJvsKfu8z
	 XmF51pG6m/HCd5oZVPp9gOd+FNXCiMLZBvvP2cEZ3R3uiUh+yEm/Z9Za5FtZZzqNlF
	 IUW/Gyw1P6aFCtuUD493zs+bFaXJ90CIWAZJx2bU9P+PniPIuQRCwsJFKZ4l3R7LsN
	 GZa0zkSLZzrpSk1M+8OuPGvYmoOVCsJJtfLY2ssr9RJUfLGWEBLRwbD9QRVdHbioI5
	 Wy72EANUdcF377j0qNcUU+g7coEJ3D2hfE8b/xDDBFDfR7tX0+kcgCTY24VRxiSTFM
	 yULtIV1Yhbnpw==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3a26de697fso2246038276.3
        for <linux-firmware@kernel.org>; Thu, 09 Jan 2025 14:11:40 -0800 (PST)
X-Gm-Message-State: AOJu0YwKemUWW7yvVHe8n8qIZ+Szlm/8548v0f1VlcQiyBt10fELVJep
	Zok8AWkAI2XevCb5/YYUOGJHbDGE/k6oERX0vww53DQ5kp/lnje5e4/LupRWqLzHcrAKgcHuYeY
	0AvhalMYLeOuNArNp8JW7k5WVNrw=
X-Google-Smtp-Source: AGHT+IFYF5hrPmpHnElv7oD9abxRq8hQvbbhMMq7gi8XyKA//O/8zavVuRhwdQQtl+BHzr7nuJuI4lkLvehilrf06i4=
X-Received: by 2002:a05:690c:6703:b0:6ef:504e:a50a with SMTP id
 00721157ae682-6f5311e72f8mr82536507b3.2.1736460699629; Thu, 09 Jan 2025
 14:11:39 -0800 (PST)
MIME-Version: 1.0
References: <00392d03-71c0-4f39-81b6-f18de441a072@opensource.cirrus.com>
In-Reply-To: <00392d03-71c0-4f39-81b6-f18de441a072@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 9 Jan 2025 17:11:28 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7Q=MiAeGtjXqZqLUMhRZrAd4xeu7jw7Y0z8r1Fu6fzCA@mail.gmail.com>
X-Gm-Features: AbW1kvamuDSKyEqodw0_AGDzA2XdZ3x419YZbdcXL0shI9vK1KCQ57kmf7JhykM
Message-ID: <CA+5PVA7Q=MiAeGtjXqZqLUMhRZrAd4xeu7jw7Y0z8r1Fu6fzCA@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add Firmware for Ayaneo system 1f660105
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 12:00=E2=80=AFPM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to update firmware files for Cirrus Logic Smart Amp CS35L41=
 for Ayaneo system 1f660105.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit c0f414a6f71154fdbb0e88f29f64e401241ca3=
3d:
>
>   Merge branch 'parallel' into 'main' (2025-01-07 17:33:43 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/ 2025-01-09

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/401

josh

>
> for you to fetch changes up to 838bf587d539ddb2d3889fec841586197dd3ee03:
>
>   cirrus: cs35l41: Add Firmware for Ayaneo system 1f660105 (2025-01-09 16=
:52:26 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>       cirrus: cs35l41: Add Firmware for Ayaneo system 1f660105
>
>  WHENCE                                    |   2 ++
>  cirrus/cs35l41-dsp1-spk-prot-1f660105.bin | Bin 0 -> 4760 bytes
>  2 files changed, 2 insertions(+)
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-1f660105.bin
>
