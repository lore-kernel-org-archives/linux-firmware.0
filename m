Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957F0C38A2D
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Oct 2022 16:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C4BFC43143; Mon, 24 Oct 2022 16:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D84C43142
	for <linux-firmware@kernel.org>; Mon, 24 Oct 2022 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666627717;
	bh=TmJHLZXXQEOBn2/jOdcZLYUP73oamRuLi51ehkHe+1E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LtgO3Eky219Qj1IJT8TUE4lSrRUvDim8RmZgi2mrV+lK3cdisURnl94JJxGEXz0hq
	 LeOjFLGq63ss6o0hh0tEqAt8CdlS8g3DD1KG7qKDyEg5UrZzUhBN0MKi3YvIHkL58A
	 BGKUxbaT8+F5veaRJxPheRjKK2qM2i2LjtiuUDCX0yA6PYDdYG5Rm04+wd0Weeewx4
	 Gf0egJSSMLVDzxvUFqgn/WXiPy5zdWQCiv5dNXplV1uzKj4Ow8QBVZbVHTNEX5eT/E
	 YvOpLcP81iaL/W26HnuJU9unL78J3INT5x0qUUWYxqefpVzwdzJiLPb0YbjbtCNqHL
	 IUfr8bQk6FUaA==
Received: by mail-oi1-f177.google.com with SMTP id w196so11300044oiw.8
        for <linux-firmware@kernel.org>; Mon, 24 Oct 2022 09:08:37 -0700 (PDT)
X-Gm-Message-State: ACrzQf3Iq4YpWm/O7kuby4a/J2vSmmJnFH9e+TRK0uIwWMMm0Gi50vz+
	TVn4BWyM3x32Sh1DuWDHVWIi+CDwF5xLdb4h6C8=
X-Google-Smtp-Source: AMsMyM77l1ubiqIRMNJBiHqC9j2in6rtl2DYfz/qLU1x0Jro31gtPJyNZPJUOtN6MlySqnUA69cI/RJqeauoWg52poE=
X-Received: by 2002:a05:6808:1986:b0:355:3525:8fb with SMTP id
 bj6-20020a056808198600b00355352508fbmr16823781oib.3.1666627716243; Mon, 24
 Oct 2022 09:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <003901d8dfcd$46b9c8a0$d42d59e0$@opensource.cirrus.com>
In-Reply-To: <003901d8dfcd$46b9c8a0$d42d59e0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Oct 2022 12:08:25 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4PLTHtKD9-e0Anh+zTqAdAA9X+7NRyrwccaRZOCbyqeA@mail.gmail.com>
Message-ID: <CA+5PVA4PLTHtKD9-e0Anh+zTqAdAA9X+7NRyrwccaRZOCbyqeA@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus CS35L41 for
 HP/Lenovo/ASUS laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 14, 2022 at 9:03 AM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Hi,
>
>
>
> We would like to add firmware files to support Cirrus Logic Smart Amp CS35L41 for some HP, Lenovo and Asus Laptops.
>
>
>
> Thanks,
>
> Stefan Binding
>
>
>
> The following changes since commit 49fccf689a13c0d49bc2f911247d51a4435a7eaa:
>
>
>
>   Merge tag 'iwlwifi-fw-2022-13-10' of http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware (2022-10-13 08:34:06 -0400)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware for-upstream
>
>
>
> for you to fetch changes up to 771968c6819101b078f41293f80415efa17d3b51:
>
>
>
>   linux-firmware: Add firmware for Cirrus CS35L41 on ASUS Laptops (2022-10-14 13:49:31 +0100)
>
>
>
> ----------------------------------------------------------------
>
> Stefan Binding (3):
>
>       linux-firmware: Add firmware for Cirrus CS35L41 on HP Laptops
>
>       linux-firmware: Add firmware for Cirrus CS35L41 on Lenovo Laptops
>
>       linux-firmware: Add firmware for Cirrus CS35L41 on ASUS Laptops

Pulled and pushed out.  Apologies for the delay.

josh

>
>
>
> WHENCE                                                  | 144 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>
> cirrus/cs35l41-dsp1-spk-cali-103c896e-l0.bin            | Bin 0 -> 1976 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c896e-r0.bin            | Bin 0 -> 1976 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c8971.bin               | Bin 0 -> 1868 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c8972.bin               | Bin 0 -> 1868 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c8973.bin               | Bin 0 -> 1888 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c8975-l0.bin            | Bin 0 -> 1920 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c8975-r0.bin            | Bin 0 -> 1920 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c8981-l0.bin            | Bin 0 -> 2012 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c8981-l1.bin            | Bin 0 -> 1968 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c8981-r0.bin            | Bin 0 -> 2012 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c8981-r1.bin            | Bin 0 -> 1968 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c89c3-r0.bin            | Bin 0 -> 1972 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c89c3-r1.bin            | Bin 0 -> 1960 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c89c6-l0.bin            | Bin 0 -> 1776 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-103c89c6-r0.bin            | Bin 0 -> 1776 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-l0.bin     | Bin 0 -> 1976 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-r0.bin     | Bin 0 -> 1976 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-l0.bin     | Bin 0 -> 1976 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-r0.bin     | Bin 0 -> 1976 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-l0.bin     | Bin 0 -> 1968 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-r0.bin     | Bin 0 -> 1972 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-l0.bin     | Bin 0 -> 1968 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-r0.bin     | Bin 0 -> 1972 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-l0.bin     | Bin 0 -> 1996 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-r0.bin     | Bin 0 -> 1996 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-l0.bin     | Bin 0 -> 1996 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-r0.bin     | Bin 0 -> 1996 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-17aa22f1-l0.bin            | Bin 0 -> 1564 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-17aa22f1-r0.bin            | Bin 0 -> 1564 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-17aa22f2-l0.bin            | Bin 0 -> 1556 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-17aa22f2-r0.bin            | Bin 0 -> 1556 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid0.bin        | Bin 0 -> 1528 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid1.bin        | Bin 0 -> 1520 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid0.bin        | Bin 0 -> 1528 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid1.bin        | Bin 0 -> 1520 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c896e-l0.bin            | Bin 0 -> 5420 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c896e-r0.bin            | Bin 0 -> 5424 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c8971.bin               | Bin 0 -> 4904 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c8972.bin               | Bin 0 -> 4904 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c8973.bin               | Bin 0 -> 4924 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c8975-l0.bin            | Bin 0 -> 5364 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c8975-r0.bin            | Bin 0 -> 5364 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c8981-l0.bin            | Bin 0 -> 5456 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c8981-l1.bin            | Bin 0 -> 5448 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c8981-r0.bin            | Bin 0 -> 5456 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c8981-r1.bin            | Bin 0 -> 5448 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c89c3-r0.bin            | Bin 0 -> 5432 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c89c3-r1.bin            | Bin 0 -> 5404 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c89c6-l0.bin            | Bin 0 -> 4000 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-103c89c6-r0.bin            | Bin 0 -> 4000 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-l0.bin     | Bin 0 -> 4920 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-r0.bin     | Bin 0 -> 4920 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-104312af-spkid1-l0.bin     | Bin 0 -> 4920 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-104312af-spkid1-r0.bin     | Bin 0 -> 4920 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid0-l0.bin     | Bin 0 -> 4944 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid0-r0.bin     | Bin 0 -> 4948 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid1-l0.bin     | Bin 0 -> 4944 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid1-r0.bin     | Bin 0 -> 4948 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid0-l0.bin     | Bin 0 -> 5516 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid0-r0.bin     | Bin 0 -> 5516 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid1-l0.bin     | Bin 0 -> 5516 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid1-r0.bin     | Bin 0 -> 5516 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-17aa22f1-l0.bin            | Bin 0 -> 5016 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-17aa22f1-r0.bin            | Bin 0 -> 5016 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-17aa22f2-l0.bin            | Bin 0 -> 4868 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-17aa22f2-r0.bin            | Bin 0 -> 4868 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid0-l0.bin     | Bin 0 -> 5392 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid0-r0.bin     | Bin 0 -> 5392 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid1-l0.bin     | Bin 0 -> 4984 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid1-r0.bin     | Bin 0 -> 4984 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid0-l0.bin     | Bin 0 -> 5008 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid0-r0.bin     | Bin 0 -> 5012 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid1-l0.bin     | Bin 0 -> 5008 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid1-r0.bin     | Bin 0 -> 5012 bytes
>
> cirrus/cs35l41/v6.39.0/halo_cspl_RAM_revB2_29.41.0.wmfw | Bin 0 -> 31060 bytes
>
> cirrus/cs35l41/v6.47.0/halo_cspl_RAM_revB2_29.49.0.wmfw | Bin 0 -> 33988 bytes
>
> cirrus/cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw | Bin 0 -> 34068 bytes
>
> cirrus/cs35l41/v6.63.0/halo_cspl_RAM_revB2_29.65.0.wmfw | Bin 0 -> 34060 bytes
>
> 79 files changed, 144 insertions(+)
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c896e-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c896e-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8971.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8972.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8973.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8975-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8975-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-l1.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-r1.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c3-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c3-r1.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c6-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c6-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f1-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f1-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f2-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f2-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid1.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid1.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c896e-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c896e-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8971.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8972.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8973.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8975-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8975-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8981-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8981-l1.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8981-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8981-r1.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c89c3-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c89c3-r1.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c89c6-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c89c6-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104312af-spkid1-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104312af-spkid1-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid0-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid0-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid1-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid1-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid0-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid0-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid1-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid1-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa22f1-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa22f1-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa22f2-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa22f2-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid0-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid0-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid1-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid1-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid0-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid0-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid1-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid1-r0.bin
>
> create mode 100644 cirrus/cs35l41/v6.39.0/halo_cspl_RAM_revB2_29.41.0.wmfw
>
> create mode 100644 cirrus/cs35l41/v6.47.0/halo_cspl_RAM_revB2_29.49.0.wmfw
>
> create mode 100644 cirrus/cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
>
> create mode 100755 cirrus/cs35l41/v6.63.0/halo_cspl_RAM_revB2_29.65.0.wmfw
