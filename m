Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2716EEF4EDF
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Apr 2026 12:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11E26C2BC9E; Mon,  6 Apr 2026 12:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2A7C19425
	for <linux-firmware@kernel.org>; Mon,  6 Apr 2026 12:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775479009;
	bh=GetUF0bycvQnSxJgHJDtPSjAT5j1TiZ12djPGdQOcNI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pN2D5+K5sMTh0NYJ/KVcqeOkXuJrC5e8ol8xVxR6yZekgtjgm91G7gTBp2IO6Xtl7
	 6wMxe0Z/0EqN5GqL3m6Ot0SNi3sDSu/ogLYBNaX9z6+RL1xArITP+CSi5679/qFJaJ
	 MklSKNRwra77bMuUQigN+8Lqva0cqnpmXn3N0rku5/BQcIQpe4WBd0MpJswqimHctM
	 GfoAk+Z6b8ABsQ6ctTg5fHjqmpOIFgnzvLx7SueJA0jCJXIpwJz7kL0xk9vZyoqbik
	 Xo9gEuKuCY2JlRcOOTq1PhkZ31pp+PST31slV2aZCmwFMfzaRSxXSFhQ3mhrT1Mv7+
	 JBodYDtbsiFew==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64eb84d1e37so2883277d50.2
        for <linux-firmware@kernel.org>; Mon, 06 Apr 2026 05:36:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YzHpUf5YFOpG5PGFX5Fs/7IUalJVcLQwWa0A4Wt4BD+Pb5/NwGa
	8UfGqD5OnvqRltqIEbIeBGSc92CoERK381WBFv4JBOZm2zYfm0E16iukKSPNA8SZDjmhookAUOY
	rJW/xaoXizMeNoNCXCpR30BpJWOcNKGI=
X-Received: by 2002:a05:690e:d48:b0:64e:f106:60f0 with SMTP id
 956f58d0204a3-65048867573mr10423071d50.51.1775479008068; Mon, 06 Apr 2026
 05:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <ac6be932-c320-4327-8922-194b6d55d47f@opensource.cirrus.com>
In-Reply-To: <ac6be932-c320-4327-8922-194b6d55d47f@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 6 Apr 2026 08:36:36 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4isqmGP2DfnDvZ9eTg+NJw3A-u=QquhVxQTNYm3FWH_Q@mail.gmail.com>
X-Gm-Features: AQROBzBBO1Tl4z5ZgOI54npCMbLaTO1bDGEOva725vzBl_HnR0r1Z2eJ1FXxppo
Message-ID: <CA+5PVA4isqmGP2DfnDvZ9eTg+NJw3A-u=QquhVxQTNYm3FWH_Q@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add Firmware for HP and ASUS Laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/982

josh

On Mon, Mar 30, 2026 at 10:12=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to update firmware files for Cirrus Logic Smart Amp CS35L41=
 various HP and ASUS laptops.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit e09aaf21f9183cce4baeffacfdb1dd9de0ff73=
3d:
>
>   Merge branch 'robot/pr-0-1774868898' into 'main' (2026-03-30 13:36:35 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20260330
>
> for you to fetch changes up to ddf93e3a0384ccab84babab89918c43dbe23fbd8:
>
>   cirrus: cs35l41: Add support for new HP laptops (2026-03-30 15:03:38 +0=
100)
>
> ----------------------------------------------------------------
> Stefan Binding (3):
>       cirrus: cs35l41: Add support for ASUS GZ302EAC and add 15.5dB bincf=
g
>       cirrus: cs35l41: Add support for new ASUS laptops
>       cirrus: cs35l41: Add support for new HP laptops
>
>  WHENCE                                            |  40 ++++++++++++++++=
++++++++++++++++++++++++
>  cirrus/cs35l41/bincfgs/cs35l41-dsp1-15_5dB.bincfg | Bin 0 -> 32 bytes
>  2 files changed, 40 insertions(+)
>  create mode 100644 cirrus/cs35l41/bincfgs/cs35l41-dsp1-15_5dB.bincfg
>
