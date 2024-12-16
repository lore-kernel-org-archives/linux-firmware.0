Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D968E77183
	for <linux-firmware@archiver.kernel.org>; Mon, 16 Dec 2024 12:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E23AC4CEDE; Mon, 16 Dec 2024 12:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0819CC4CED0
	for <linux-firmware@kernel.org>; Mon, 16 Dec 2024 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734352774;
	bh=fhHMSLRcgqYtl/17oclTyZILewsxt3/DolPsWTFBcX4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=P6JTD5EBl3lURXt+I8cvF2t+JyJBuW3nIjZvRmMOsdCkRyITvcUTIzX2nv+Gb0hph
	 XEsRq2Z+60T2fPakHsKR1uP0OtaiQXG2/r/K/EkJmuoaVxdPiqw27wdp9DPyMJAun+
	 NWtU7JDQHPBGQWFNuOPkJptM4bqlXDSY3cWjagdnRfYPFJ4zNeW0d5jgrlqGRiR0kq
	 1KmTc7ZeqODrO4yfHnN4TxSOHbha1mAFH0Sqo4IjOlcJa/1KSTGM9SNtBljs+w4jmI
	 OjSQXHFtczQiv1FOXuC3YSMd/Ni+h7cWn/R6kwXwC9ay0+CjEbQcEtfrntyX3rX60w
	 MPbl+VVT+/+uQ==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6efea3c9e6eso28202487b3.0
        for <linux-firmware@kernel.org>; Mon, 16 Dec 2024 04:39:33 -0800 (PST)
X-Gm-Message-State: AOJu0Yxm78/Zz5upQQnbCnddD6Qs9mqCRRqReHANfqKxYDRntGPtzUIA
	24IixETpBqXCP9EXzEOtsK4+TQVAq+8BPNePt43EZvwrFKChuW87Udpxw3UhVrs1Gp+/cYGLbSy
	3JeqQ6fqnXHPgAp90/R4tbHa+TJU=
X-Google-Smtp-Source: AGHT+IHDxQCBRFDBEZH49jCJojbAnhRZFqVein3i/Mi5LrDLnj2KTAWd33dW3IqcCYBdy7WSmtAT9p1zfashoz1PE+g=
X-Received: by 2002:a05:690c:685:b0:6ef:7312:d05e with SMTP id
 00721157ae682-6f279b1bd21mr93256237b3.19.1734352773261; Mon, 16 Dec 2024
 04:39:33 -0800 (PST)
MIME-Version: 1.0
References: <000f01db4fab$e6a8ddb0$b3fa9910$@opensource.cirrus.com>
In-Reply-To: <000f01db4fab$e6a8ddb0$b3fa9910$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 16 Dec 2024 07:39:22 -0500
X-Gmail-Original-Message-ID: <CA+5PVA69zNZzUo3DCRuEhK=kdNYepfu7mXgh5dT_cDnPXVksuQ@mail.gmail.com>
Message-ID: <CA+5PVA69zNZzUo3DCRuEhK=kdNYepfu7mXgh5dT_cDnPXVksuQ@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l56: Correct filenames of
 SSID 17aa3832
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 6:16=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> I=E2=80=99d like to correct the naming of a few firmware files
>
> Thanks,
>
> -Simon
>
>
>
>
>
> The following changes since commit 2cdfe09ef48746c4de791ccc1b6f2cc59e9912=
89:
>
>
>
>   Merge branch 'robot/pr-0-1734020971' into 'main' (2024-12-12 16:53:23 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20241216

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/389

josh

>
>
>
> for you to fetch changes up to bd491523d7f02d20b8031e4fc934f719f4388ae2:
>
>
>
>   cirrus: cs35l56: Correct filenames of SSID 17aa3832 (2024-12-16 11:10:2=
4 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Correct filenames of SSID 17aa3832
>
>
>
> WHENCE                                                                   =
                               |   8 ++++----
>
> cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp1.bin =3D> cs35l56-b0-dsp=
1-misc-17aa3832-spkid0-ampl.bin} | Bin
>
> cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp2.bin =3D> cs35l56-b0-dsp=
1-misc-17aa3832-spkid0-ampr.bin} | Bin
>
> cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp1.bin =3D> cs35l56-b0-dsp=
1-misc-17aa3832-spkid1-ampl.bin} | Bin
>
> cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp2.bin =3D> cs35l56-b0-dsp=
1-misc-17aa3832-spkid1-ampr.bin} | Bin
>
> 5 files changed, 4 insertions(+), 4 deletions(-)
>
> rename cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp1.bin =3D> cs35l56=
-b0-dsp1-misc-17aa3832-spkid0-ampl.bin} (100%)
>
> rename cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp2.bin =3D> cs35l56=
-b0-dsp1-misc-17aa3832-spkid0-ampr.bin} (100%)
>
> rename cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp1.bin =3D> cs35l56=
-b0-dsp1-misc-17aa3832-spkid1-ampl.bin} (100%)
>
> rename cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp2.bin =3D> cs35l56=
-b0-dsp1-misc-17aa3832-spkid1-ampr.bin} (100%)
