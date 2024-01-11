Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D82C47077
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Jan 2024 13:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6C67C433F1; Thu, 11 Jan 2024 13:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CF6C43390
	for <linux-firmware@kernel.org>; Thu, 11 Jan 2024 13:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704980880;
	bh=G9pD/Apy1+1VzOW8FhLO5/b4PWFAaj3LqPx8e4lwJIE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Q1ybv1biCCgXHB6cJJG3PTQhjwfdOFIevBDJ3uLacDoVLalZqgamCydXbybv/Jc+f
	 uUwSp8Vhf80Fe3RwCfyHvNd9rVNUn29Ijr5hy6dvgipDLfWaa1ErSDX27BNKRBZkm6
	 SBbP0n4/N3W6sjUIxVxt1g6LWouOz9iUkSv7G9lZp3nye1I/JVQeAABOzqnER6D1jV
	 bNPPaYciod7qpIHBB/gxDuTz1QeDdtk54DUPMe0AAXdCdxe8rlFPsi3JbQJRd6zZki
	 f07K2fd5sunjqkPtY7gLO0LYhLgw0jCbm0JcgRKpqv9b14Jn7ZRAjczvhA37QWLvjY
	 7JYRwzU0ZXU1w==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5f07f9d57b9so51210997b3.1
        for <linux-firmware@kernel.org>; Thu, 11 Jan 2024 05:48:00 -0800 (PST)
X-Gm-Message-State: AOJu0Yy+hZi2yFsXwDnMTXrZcvYdxsVf7KPFFpD8CSK63VeP97WVlOZn
	GFtfbBIWORtzg0XNmUR7aqcPcClnoTd79oGAbu8=
X-Google-Smtp-Source: AGHT+IH7b5S4V+UlPlio3gaDz3aCUz3uJCMx3VwIf+T0Rey8Z3kDuq5XRXqTifjRZ0XEReP5DpDgDaJD09vhDKQWBto=
X-Received: by 2002:a0d:cb04:0:b0:5f8:f50e:bcf9 with SMTP id
 n4-20020a0dcb04000000b005f8f50ebcf9mr541123ywd.20.1704980879914; Thu, 11 Jan
 2024 05:47:59 -0800 (PST)
MIME-Version: 1.0
References: <9078e155-4d59-4529-8595-f4297f2aeab6@opensource.cirrus.com>
In-Reply-To: <9078e155-4d59-4529-8595-f4297f2aeab6@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 11 Jan 2024 08:47:48 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4WkpqfBSHUS-YoqS8tMGkBggSC74GKmJ6Tpyi=YRJzcQ@mail.gmail.com>
Message-ID: <CA+5PVA4WkpqfBSHUS-YoqS8tMGkBggSC74GKmJ6Tpyi=YRJzcQ@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for Dell systems
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 9:55=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for various Dell systems.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit 323d51ed5b64519e5cffdd51e39c48919b3f33=
81:
>
>    Merge branch 'robot/patch-0-1704834007' into 'main' (2024-01-10
> 12:46:22 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ dell_fw

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/122

josh

>
> for you to fetch changes up to d4b77b4fdaa3ea00bf26822f38f05fb3fe62bdff:
>
>    linux-firmware: Add firmware for Cirrus CS35L41 for various Dell
> laptops (2024-01-10 13:17:16 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>        linux-firmware: Add firmware for Cirrus CS35L41 for various Dell
> laptops
>
>   WHENCE                                                  |  41
> +++++++++++++++++++++++++++++++++++++++++
>   cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid0.bin        | Bin 0 ->
> 1920 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid1.bin        | Bin 0 ->
> 1920 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-l0.bin     | Bin 0 ->
> 1924 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-r0.bin     | Bin 0 ->
> 1924 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-l0.bin     | Bin 0 ->
> 1924 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-r0.bin     | Bin 0 ->
> 1924 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280beb-l0.bin            | Bin 0 ->
> 2232 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280beb-r0.bin            | Bin 0 ->
> 2232 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l0.bin     | Bin 0 ->
> 1912 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l1.bin     | Bin 0 ->
> 1908 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r0.bin     | Bin 0 ->
> 1912 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r1.bin     | Bin 0 ->
> 1908 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l0.bin     | Bin 0 ->
> 1912 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l1.bin     | Bin 0 ->
> 1912 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r0.bin     | Bin 0 ->
> 1912 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r1.bin     | Bin 0 ->
> 1912 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280b27-spkid0.bin        | Bin 0 ->
> 4896 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280b27-spkid1.bin        | Bin 0 ->
> 5012 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid0-l0.bin     | Bin 0 ->
> 5284 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid0-r0.bin     | Bin 0 ->
> 5284 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid1-l0.bin     | Bin 0 ->
> 5284 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid1-r0.bin     | Bin 0 ->
> 5280 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280beb-l0.bin            | Bin 0 ->
> 5456 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280beb-r0.bin            | Bin 0 ->
> 5456 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-l0.bin     | Bin 0 ->
> 4684 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-l1.bin     | Bin 0 ->
> 4684 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-r0.bin     | Bin 0 ->
> 4684 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-r1.bin     | Bin 0 ->
> 4684 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-l0.bin     | Bin 0 ->
> 4688 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-l1.bin     | Bin 0 ->
> 4684 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-r0.bin     | Bin 0 ->
> 4688 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-r1.bin     | Bin 0 ->
> 4684 bytes
>   cirrus/cs35l41/v6.80.0/halo_cspl_RAM_revB2_29.82.0.wmfw | Bin 0 ->
> 34100 bytes
>   34 files changed, 41 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280beb-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280beb-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280b27-spkid0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280b27-spkid1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280beb-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280beb-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-r1.bin
>   create mode 100755 cirrus/cs35l41/v6.80.0/halo_cspl_RAM_revB2_29.82.0.w=
mfw
>
