Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78479C83F1A
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Jul 2025 19:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D32DC4CEF7; Mon, 21 Jul 2025 19:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376D5C4CEED
	for <linux-firmware@kernel.org>; Mon, 21 Jul 2025 19:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753124808;
	bh=nqzwCgCQq+fE0Zq58Jg9I0UQcqDyrhk67TnwjU9I/aw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=QhH7NLStP/JaNYiu6A5zoMHwxerA+2rgLpLmT6bpPCwK0Du7mO3z7CFa0DaySeQXr
	 12Pq50A6yBmQDeklJNaJmHU4BdPSdMJ++U1NXeZvJwU6yfTTaDJMXpzHS51y4ylyXE
	 65DI87UUNatBkIDRZVaIEiqBtxRDtKMIGbUB4L8mcj2DIhAVUooHLR6uab/s4R7kAV
	 QrE6PZHn8eN0Pz4y+TxuCuYiJVnkxSsNO5AU7Dv64wRTAcy54a6QZWvmshkbkGXYG7
	 wNaWYDbJ7dGAhyzq3gtIw1EjT2WKTL9xhHZSZRFRG974iizWNuJjQSqyv7mCgYGbfM
	 /eYdTB155k09A==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e75668006b9so4585735276.3
        for <linux-firmware@kernel.org>; Mon, 21 Jul 2025 12:06:48 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzb8GZMGKYJvHJT6UovXpAsr1VWV3PMhw6K2DQKFZXL2Qhwytkr
	I5IroYH1OywjwTk0A3F6mSLiBv8vXRyf+y6daCUe59pHmcFtysIuX8KFgsjDM0cFHdd2q0fKAxg
	qLXXfEl7oxak+Py50MvPaO9FUsfebt3g=
X-Google-Smtp-Source: AGHT+IFGqPaFwubBXeYx8JUbi9DUQyGSvTMW7mPzZ23hnOJL/3zEBJkNEs3IFVeNIzz27SezFmf6PyywcQE+tBnFfC0=
X-Received: by 2002:a05:690c:6e0a:b0:711:af14:3981 with SMTP id
 00721157ae682-71837472eb1mr299713207b3.31.1753124807337; Mon, 21 Jul 2025
 12:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <7b358989-0b9c-4a53-bc72-5f1bb59d5a46@opensource.cirrus.com>
In-Reply-To: <7b358989-0b9c-4a53-bc72-5f1bb59d5a46@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 21 Jul 2025 15:06:36 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5EVYYx8Ynh348eMpSspPzP3b4sVPx9rgQQbbbtavi9dw@mail.gmail.com>
X-Gm-Features: Ac12FXzrn1WO6ntGMAMP-IgfN-J1E11She0503mhSGUTUoXfEz2ayd7nfm6hTGA
Message-ID: <CA+5PVA5EVYYx8Ynh348eMpSspPzP3b4sVPx9rgQQbbbtavi9dw@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add and update firmware for Cirrus Smart
 Amp CS35L41
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 11:01=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp CS3=
5L41 for a couple of Asus laptops.
>
> In addition, we would like to update the firmware and tuning files for se=
veral Dell Oasis laptops using CS35L41.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit 9c2794b0f0373c627fd1c635bc2a416ba1ecc0=
e1:
>
>   Merge branch 'qcs6490' into 'main' (2025-07-21 13:13:27 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250721

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/623

josh

>
> for you to fetch changes up to 82c2fdb0fd0f4bbbd552a3faed749dd6744a08db:
>
>   cirrus: cs35l41: Add Firmware for various ASUS commercial Laptops using=
 CS35L41 HDA (2025-07-21 15:15:50 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (2):
>       cirrus: cs35l41: Update Firmware for Dell Oasis
>       cirrus: cs35l41: Add Firmware for various ASUS commercial Laptops u=
sing CS35L41 HDA
>
>  WHENCE                                              |  94 ++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------=
-----
>  cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0-l0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0-r0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin    | Bin 3980 -> 0 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1-l0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1-r0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin    | Bin 3980 -> 0 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0-l0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0-r0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1-l0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1-r0.bin | Bin 0 -> 5436 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0-l0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0-r0.bin | Bin 0 -> 5436 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1-l0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1-r0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0-l0.bin | Bin 0 -> 5436 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0-r0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1-l0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1-r0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0-l0.bin | Bin 0 -> 5436 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0-r0.bin | Bin 0 -> 5436 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1-l0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1-r0.bin | Bin 0 -> 5440 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431454-spkid0-l0.bin | Bin 0 -> 5272 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431454-spkid0-r0.bin | Bin 0 -> 5272 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431454-spkid1-l0.bin | Bin 0 -> 5264 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431454-spkid1-r0.bin | Bin 0 -> 5320 byte=
s
>  27 files changed, 73 insertions(+), 21 deletions(-)
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0-r0.bin
>  delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1-r0.bin
>  delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431454-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431454-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431454-spkid1-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431454-spkid1-r0.bin
>
