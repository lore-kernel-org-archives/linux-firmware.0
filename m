Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D0EC4332F
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Oct 2022 17:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BBEEC433D6; Wed, 12 Oct 2022 17:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F41C433D7
	for <linux-firmware@kernel.org>; Wed, 12 Oct 2022 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665594241;
	bh=3LKA2WzzWFCaWiCcz7/cXgqrftJwzygI5lkr2s183QI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=k5+j6btT1v3LdBeqUHMyqPveTFpMap4r6+M42FwLogrfzVqgw0Kr9WaexINE2/qB6
	 4OP09fsArNRiWoTV7xD2cg4VT5tqjmN+TSlU0Kn8l26N3TsuiT5s/DP/JAB5qDWJ+h
	 2s1ztubftXCTU12gmP9h/K9OKChQAnEtx+AqQXX34Ej/meuv6WIoie+bdkVUE0v3Ij
	 wqRWMLZd8z/hFMrzuiumP9eg0QESx6CvqG1z8WAzpRgY3nqYyVdO3GsBuic2g75rT6
	 2SlnpklDKU7LmUbcF4wB6WzwA4uTIBQJfgAZCKSjCaSgpgkNrec202Pki4T/k2BES2
	 BOIxJTLm9IYdw==
Received: by mail-oi1-f180.google.com with SMTP id n83so19701901oif.11
        for <linux-firmware@kernel.org>; Wed, 12 Oct 2022 10:04:00 -0700 (PDT)
X-Gm-Message-State: ACrzQf3ORYlwa3sFDoqIM34ykHpISsexaN/x9Mlhlymy1yN/aY1zISoN
	HE0QxXn6Thrln1rGHWd3LD61Fx5WRWCZeoGXJ4Q=
X-Google-Smtp-Source: AMsMyM4IOkNNHtc+uNTfdM6inFgS96U4wCphE5iPkUg6STcVm2Ko6nZZ+zPcAJ7XVXR66ACpmyYRNnOnJRXQFbeTWBI=
X-Received: by 2002:a05:6808:1446:b0:354:f46b:8802 with SMTP id
 x6-20020a056808144600b00354f46b8802mr1000453oiv.267.1665594240051; Wed, 12
 Oct 2022 10:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <418eecee438cd3386b1001a3bdba6d8e4e6307a3.camel@mediatek.com>
In-Reply-To: <418eecee438cd3386b1001a3bdba6d8e4e6307a3.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 12 Oct 2022 13:03:49 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7s-LQsrqkpz99qihetyafch-wA1V_=8pRDiFZ5p=WESA@mail.gmail.com>
Message-ID: <CA+5PVA7s-LQsrqkpz99qihetyafch-wA1V_=8pRDiFZ5p=WESA@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Update Mediatek MT8186 SCP firmware
To: =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	=?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2022 at 7:42 AM Allen-KH Cheng (=E7=A8=8B=E5=86=A0=E5=8B=B3)
<Allen-KH.Cheng@mediatek.com> wrote:
>
> Hi maintianers,
>
> Update a SCP firmware for MediaTek MT8186.
> Thank you!
>
> Regards,
> Allen
>
> ---
>
> The following changes since commit
> fdf1a65258522edf18a0a1768fbafa61ed07e598:
>
>   linux-firmware: Update AMD cpu microcode (2022-09-30 17:33:35 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/kuanhsuncheng/linux-firmware-scp 8186-v0.0.9
>
> for you to fetch changes up to
> b7d6c9f66579d0ad8010340947ae2f63a787b88b:
>
>   mediatek: Update mt8186 SCP firmware (2022-10-05 19:34:58 +0800)
>
> ----------------------------------------------------------------
> Allen-KH Cheng (1):
>       mediatek: Update mt8186 SCP firmware

Pulled and pushed out.  Thank you.

josh

>
>  WHENCE                  |   2 +-
>  mediatek/mt8186/scp.img | Bin 416960 -> 419488 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
>
