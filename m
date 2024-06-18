Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749B1C27C4F
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Jun 2024 11:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4CBADC4AF1D; Tue, 18 Jun 2024 11:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37653C4AF48
	for <linux-firmware@kernel.org>; Tue, 18 Jun 2024 11:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718709435;
	bh=9A6q7RZvZD13LFb7uVXlj+g5RgK1PXu6zJZ57jrSx9c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iI5viGjp/Z/aKfhGDeh8dmBq7bDBN0y8WhvC/lbwG5XGwWomYEIe8vdcPsoOD4Yd9
	 oQHe7NSQpn6wfd3jzGnEX0N2wEWwEFps1r1mTQeBxZbbcQc4E+q4oRT9nAlJKnWEwh
	 jmaWw0zDdcX6wslqwLIJEyUK/F3Fo+4AgQfREAELuHE1GI5Osio2ulGoxNu4hM3m76
	 pY9HyMBEs9twSp2+sdpqpzXChPZc4FRlzO8XtDMPYnYlW0LfOwr/v6M1RpQjo97NEf
	 yVrLrnL/qw648/f+GAv5pV7E7TG71aRq8npC8EYa0RD/tJFztYViCryKDZ0nVWu4i7
	 7nx4JZREyZCsA==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dfa71ded97bso4032461276.1
        for <linux-firmware@kernel.org>; Tue, 18 Jun 2024 04:17:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YxESekNG2cDGee5wSGS2i1ciKMcLZ5EzA3BgzIP0aVcwavVhIkv
	vWvqyyXfI/x10KjHL9/3F9qJ1C0t6RBfkvPZ0oQoW2iZ9wi/Njcf1/5hLS3o7JCF/gIvz73N1ps
	EcyLRoabw/QKwxhron3HAQwmwINQ=
X-Google-Smtp-Source: AGHT+IE/pFmT3pkHfk/sKxSYWh74guUHor1PXJAcC24HbP0tMj84rHc4+Eu//s8T1N+JcHm0JEJuXjG0nEMXWj5lra4=
X-Received: by 2002:a5b:b81:0:b0:dff:5e2:b8a7 with SMTP id 3f1490d57ef6-e022246b741mr1454161276.10.1718709434382;
 Tue, 18 Jun 2024 04:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <005801dabce4$8a671df0$9f3559d0$@opensource.cirrus.com>
In-Reply-To: <005801dabce4$8a671df0$9f3559d0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Jun 2024 07:17:02 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6asPiTUeJ3Lu0=FdkaTajnPVwFORQL5QiHVZ=OkKCj9A@mail.gmail.com>
Message-ID: <CA+5PVA6asPiTUeJ3Lu0=FdkaTajnPVwFORQL5QiHVZ=OkKCj9A@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l56: Update firmware for
 Cirrus CS35L56 for various ASUS laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 12:21=E2=80=AFPM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to update the firmware for the Cirrus CS35L56 smart amp=
lifiers on a couple of ASUS laptops.
>
> Thanks,
>
> -Simon
>
>
>
>
>
> The following changes since commit 9c10a2083c3663828e7c06554dfbb3929085b5=
bd:
>
>
>
>   Merge branch 'qca' into 'main' (2024-06-10 14:06:27 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20240612

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/224

josh

>
>
>
> for you to fetch changes up to 87fd13b131d5aed2e8c4ded4797d4d5f19c1c8d9:
>
>
>
>   cirrus: cs35l56: Update firmware for Cirrus CS35L56 for various ASUS la=
ptops (2024-06-12 16:09:40 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Update firmware for Cirrus CS35L56 for various ASU=
S laptops
>
>
>
> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin | Bin 8196 -> 8196 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin | Bin 8196 -> 8196 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp1.bin | Bin 8192 -> 8192 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp2.bin | Bin 8192 -> 8192 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp1.bin | Bin 8196 -> 8196 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp2.bin | Bin 8196 -> 8196 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin | Bin 8192 -> 8192 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin | Bin 8192 -> 8192 b=
ytes
>
> 8 files changed, 0 insertions(+), 0 deletions(-)
>
>
