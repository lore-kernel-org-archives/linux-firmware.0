Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55018C4345F
	for <linux-firmware@archiver.kernel.org>; Thu, 25 Apr 2024 14:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F0DFC3277B; Thu, 25 Apr 2024 14:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F3CC4AF09
	for <linux-firmware@kernel.org>; Thu, 25 Apr 2024 14:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714054691;
	bh=m/4RwH+t+5Nm0lD7Leh6FprIdJL1JnJ+zsxyN8vrxsY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ST5ybEdrkQbESUIVZXo4t/rheZ6Pt4IpI4ZMmcA0IT1Pm5OEf9sDgIOMktYhKbiEv
	 NP67zkbGexj6TyjSXG1xUm19dL3dJM6DQppSEryFAXs/O2nmVpeFus4mDEMi4GlXLn
	 TA0QS6oAkdH8Isz0G7N18qAsYJT/fWeuSRJsW10pfjQDeozAemMJxgNzWrsmJbkv7a
	 690aMn7tpYpjMgANuvYTgx+vZFcjcXeZlqxqimkUIGqaAcoBCacIocs3HwqeSQ4QDy
	 GmESiZSmnUzHO9ms5GlwpaGKfl1l6V8BOxnER2P52tBVqgE8lBNMUg7L1nWe8Db8bU
	 SZJxHwIiS43VQ==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61af74a010aso10551647b3.0
        for <linux-firmware@kernel.org>; Thu, 25 Apr 2024 07:18:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YwoRyDsLgTXxQslx98WTfs7JN95AholPQPgscd6mWXejqYbCEm9
	7wrVjXPkjeM2EGmtShqMRa7q1P7mV++A9ZR8V/nTJKNSloZo7FtjBDJDmnNieakK6U8kZQb6R4S
	96TaD4sKB9nkL6RAlSJ4pWDd4GQw=
X-Google-Smtp-Source: AGHT+IGJG5+Ogf+aBSaODet5sMXmab9kt5Z66m2EfnfNh0nQxgQweBAsZL+v82+mhr0ZjM1qzQpzb80wl11hPCMqybg=
X-Received: by 2002:a25:a068:0:b0:dcf:6122:ccec with SMTP id
 x95-20020a25a068000000b00dcf6122ccecmr6972878ybh.36.1714054690220; Thu, 25
 Apr 2024 07:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <001001da9714$0c2d81e0$248885a0$@opensource.cirrus.com>
In-Reply-To: <001001da9714$0c2d81e0$248885a0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 25 Apr 2024 10:17:58 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6hwJN477av66wbwhRBnzVVDqpnsSUYjCjnV=OuBxaUGA@mail.gmail.com>
Message-ID: <CA+5PVA6hwJN477av66wbwhRBnzVVDqpnsSUYjCjnV=OuBxaUGA@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add CS35L56 firmware for HP laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 9:25=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
>
> CS35L56 for some HP laptops.
>
>
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit 63a66b66576fa0c43d8e1b757bb79165e1be39=
3a:
>
>
>
>   Merge branch 'robot/pr-0-1713990671' into 'main' (2024-04-24 22:51:31 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/202

josh

>
>
>
> for you to fetch changes up to 09c1846d416e2fccd293bc77dfb989c9c6ea4ea1:
>
>
>
>   linux-firmware: Add firmware for Cirrus CS35L56 for various HP laptops =
(2024-04-25 11:54:09 +0100)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       linux-firmware: Add firmware for Cirrus CS35L56 for various HP lapt=
ops
>
>
>
> WHENCE                                        |  11 +++++++++++
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp1.bin | Bin 0 -> 8136 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin | Bin 0 -> 8132 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp3.bin | Bin 0 -> 8124 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp4.bin | Bin 0 -> 8124 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp1.bin | Bin 0 -> 8132 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp2.bin | Bin 0 -> 8128 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp3.bin | Bin 0 -> 8120 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp4.bin | Bin 0 -> 8120 bytes
>
> cirrus/cs35l56/CS35L56_Rev3.11.16.wmfw        | Bin 0 -> 31996 bytes
>
> 10 files changed, 11 insertions(+)
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp4.bin
>
> create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.16.wmfw
