Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E4AC61DB2
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Jun 2025 12:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B6B9C4CEEF; Fri, 13 Jun 2025 12:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0569AC4CEF0
	for <linux-firmware@kernel.org>; Fri, 13 Jun 2025 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749817000;
	bh=5H9NLp7Ft7Y7q/qEgKU95O3iPjslWCYbeR1YE31kWjg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=R6nUsnF6bo+FbOER6ycjyfx4a8X4GgZGjfhrGxkc5Cr4B+cTzKANZcnEKHEnMirJI
	 PkJZ3qOoPLiLYd2BROTQ7N50gGvCDLe1jHvFPrcOjZuLm5KKWXRN9y3cVW5w7aRH5F
	 lHBM9KQm/WzOJ1On84abZ6K/+v18F2GJw7bLRLSbHusVkgoJPlUH5Q/PfZGpkFvQlH
	 QQ/LcQw7BfQT4pr24zTrJNRJ23js2f5nXR4hzU6d1fAqa2SCTWre+N04QZm7MkpMu2
	 9HrDkZKRjMLWVIAdlqPq81kZMBlj4Eb8bhP1AI7obSPN6Cu2lsojIOo2q5pkOFVBRW
	 2G0bTiny3QfIw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e75f30452so12756897b3.2
        for <linux-firmware@kernel.org>; Fri, 13 Jun 2025 05:16:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YwNGqSEgc+QITbWf02XJ0AzRuqK3qRlPXEsyWsWmoJgaw7arYrV
	7CNynH4HuuBpyYfCIhUhLVVZuHDYeTpwIIo5f6TmY5UqhCPk7FaMXrQ/Y+kBjDjm+vAo1XyXbY/
	7ZQUq2ckeBtYKUZ1DxSINEViFzsYdmk8=
X-Google-Smtp-Source: AGHT+IGXCDpa8gEg4sR+F2kdgs5Romwfu2dxImXqH5zY+mdPZ/mYfokwROAoaiqCpl/+VTGtwJ+qmZIN/wuaVz/NT8E=
X-Received: by 2002:a05:690c:67c9:b0:70e:7706:8250 with SMTP id
 00721157ae682-71163676fa5mr45345477b3.16.1749816999240; Fri, 13 Jun 2025
 05:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <b2c1fc03-4ba3-435c-9b94-9d719d3b601b@opensource.cirrus.com>
In-Reply-To: <b2c1fc03-4ba3-435c-9b94-9d719d3b601b@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 13 Jun 2025 08:16:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7y0jH8e5-DFCeAps8T=whOcYf2KMRVy97r82J-agELJg@mail.gmail.com>
X-Gm-Features: AX0GCFtsJHkfNzs0qjOOENeHDUXUAhXOOoFb23aAJzpE9cXZXb-0gWJ2r7GN4SU
Message-ID: <CA+5PVA7y0jH8e5-DFCeAps8T=whOcYf2KMRVy97r82J-agELJg@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for ASUS NUC
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 12:18=E2=80=AFPM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp CS3=
5L41 for ASUS NUC.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit 0d92efb540f49e0aa254f0685b8a71b82608f5=
c1:
>
>   Merge branch 'robot/pr-0-1749464821' into 'main' (2025-06-09 15:11:51 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250612

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/580

josh

>
> for you to fetch changes up to 64823fcdf0596a630cfcf92408504fe2f813e23b:
>
>   cirrus: cs35l41: Add Firmware for ASUS NUC using CS35L41 (2025-06-12 17=
:15:01 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>       cirrus: cs35l41: Add Firmware for ASUS NUC using CS35L41
>
>  WHENCE                                           |   3 +++
>  cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid0.bin | Bin 0 -> 4696 bytes
>  cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid1.bin | Bin 0 -> 4696 bytes
>  3 files changed, 3 insertions(+)
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid1.bin
>
