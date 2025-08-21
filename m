Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89804CA0EEB
	for <linux-firmware@archiver.kernel.org>; Thu, 21 Aug 2025 13:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43DFAC113CF; Thu, 21 Aug 2025 13:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF34C113D0
	for <linux-firmware@kernel.org>; Thu, 21 Aug 2025 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755781932;
	bh=fXZemugYrgZP5a51axyXDM5fTUHiaAN8+r6MoCSRGCg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MVL1lTqDIFDA7rEmzFHHjw3n1SkxVV7SmTounSQT06Rq3EZKvx/jMGd2DHdyxk+Lm
	 eIzvFcKxTtn0S6mWeiefoim0Mc92LNDEZ1fhaydUrGStfK48+cY1wVseVj8PsWo8gG
	 8u2ixBRt1vlRQ7ngKFCufB8VWiaqmPMTahkYPBTZUpXfH4CYGRiX8idwpijSqdV04c
	 9NNnSESG6dRbyg7tRIx8JvzqExjrbfC/JmZb2rq26KoRb3bEnOoBuWlO2DexAUWaup
	 SczA4SI6hoJv4EPULLwtx2h9Wa8DMThkzedpArtwXMjkvQk+T7+J7+DgjutnHMWbKL
	 m77zNSvjPZW1w==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e932ded97easo927396276.1
        for <linux-firmware@kernel.org>; Thu, 21 Aug 2025 06:12:12 -0700 (PDT)
X-Gm-Message-State: AOJu0YwJGAZAI4dWgKzG+3PoBTqmg4laP+i7Sy3TcsqjbYC2iqZM1qcL
	LF2cM0w+fmohdhUET7CgCr+0/v2OmoThpI4d6eOt7bCXn2+tvRltVeRxGeqxMTVn6RphQbRS8Lx
	zDBbHYTm8SkvIAogbJjBYbkBjfzV3JCI=
X-Google-Smtp-Source: AGHT+IG1trOf/MXadz1nX1kZIM5kIvbPduU41cGLNtYfo3Pr+yt76lOL+W0iVpMgMam0q/KWVcEtt4WjKrY5r4M6/AQ=
X-Received: by 2002:a05:6902:2807:b0:e93:47cc:f445 with SMTP id
 3f1490d57ef6-e950892674dmr2795874276.22.1755781931328; Thu, 21 Aug 2025
 06:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <001401dc129b$dfec7a00$9fc56e00$@opensource.cirrus.com>
In-Reply-To: <001401dc129b$dfec7a00$9fc56e00$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 21 Aug 2025 09:11:59 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7R5m7qpnZHsRE4vCPJ1p3BAoYPFR8sDM=gQ6OPzECB1g@mail.gmail.com>
X-Gm-Features: Ac12FXwcPexsUYVyA_wP0m2gXeWLNASuPVc_jUePyjei8uvI0YuWf8-a-iUJyPQ
Message-ID: <CA+5PVA7R5m7qpnZHsRE4vCPJ1p3BAoYPFR8sDM=gQ6OPzECB1g@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l41: Move entries to correct
 driver section in WHENCE
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com, 
	mpearson-lenovo@squebb.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 9:02=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> A couple more patches =E2=80=93 this small chain updates the firmware for=
 the Cirrus CS35L56
>
> smart amplifier for a couple of Lenovo Laptops and we also noticed that t=
here were a
>
> few cs35l41 entries in the wrong place in WHENCE.
>
>
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit 70dda28e509833f07a7191c363057ab056ff09=
06:
>
>
>
>   Merge branch 'robot/pr-0-1755703547' into 'main' (2025-08-20 16:16:47 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250821

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/657

josh

>
>
>
> for you to fetch changes up to fa855bd9ece7a6ced493ff22d8fa5028ac43c38f:
>
>
>
>   cirrus: cs35l41: Move entries to correct driver section in WHENCE (2025=
-08-21 12:57:36 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (2):
>
>       cirrus: cs35l56: Update firmware for Cirrus Amps for some Lenovo la=
ptops
>
>       cirrus: cs35l41: Move entries to correct driver section in WHENCE
>
>
>
> WHENCE                                               |  20 ++++++++++----=
------
>
> cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin | Bin 8384 -> 8452 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin | Bin 8368 -> 8436 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp1.bin | Bin 8368 -> 8436 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp2.bin | Bin 8368 -> 8436 b=
ytes
>
> 5 files changed, 10 insertions(+), 10 deletions(-)
