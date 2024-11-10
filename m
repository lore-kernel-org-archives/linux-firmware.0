Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F2FD12D44
	for <linux-firmware@archiver.kernel.org>; Sun, 10 Nov 2024 15:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D74E0C4CED7; Sun, 10 Nov 2024 15:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BDAC4CED6
	for <linux-firmware@kernel.org>; Sun, 10 Nov 2024 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731252749;
	bh=ZKs5dJc5YS5FuKi2+0+9k/fjFMvIBZG+pY/odJyKRKs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JpL242Hfe3eZKuaa8LWrhzyEfvSq8Gq3f58OSGgCQ5MOReOVylrHRr8TVzu7dYJCD
	 Vn1umB9nkvRFAn4HGZb2wz/NBqaW0KDgMGXI6iYjGNI00MkhouAeCoWld85RpOfDWI
	 7Oh/BcwD0cdk9LGDeMhfj0voaSSMDAlslHylFMnt/8gmOAvm4vBgqTFJqDRYMrpB76
	 s8MInYcqrfH7+IXsE5z0h1aM+TINO4ZLydDM6XdVfPw6qjOVwkVhEGcRP5CILK3fj6
	 SvxwSMZzlRV1mSuxheHTinHcxfHDsAx/YgWgxfC7LvjVeNzn/obpNY44ge6176T55g
	 ydROOMU/hROXw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6eb0e90b729so1735877b3.1
        for <linux-firmware@kernel.org>; Sun, 10 Nov 2024 07:32:29 -0800 (PST)
X-Gm-Message-State: AOJu0YyZoMoWZ8UMD59Y2CIq7PoTiCCexthnbmq5q7HehG41CZuMj9mV
	way0UJeuMDUb1GWnffVdTYD6cipDCFc4ADM1pdPI4dQBgiZL1gt4bX/zH6rbVvf+NveqRG5+wOK
	Z98ItzLRmsqaiY9j4sV3vU/Y46o8=
X-Google-Smtp-Source: AGHT+IFi0VEv/up6vSXEO2xFJoYkk1qeWp0/WHwhZ68HhOzDv2UEmlb9m9BRCHLPVC9iQFEr5QY2vZaJMhcfzaSxzxI=
X-Received: by 2002:a05:690c:498a:b0:6db:de34:8049 with SMTP id
 00721157ae682-6eaddd9aee2mr85028937b3.16.1731252748942; Sun, 10 Nov 2024
 07:32:28 -0800 (PST)
MIME-Version: 1.0
References: <002301db31ee$afbfed50$0f3fc7f0$@opensource.cirrus.com>
In-Reply-To: <002301db31ee$afbfed50$0f3fc7f0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sun, 10 Nov 2024 10:32:18 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4MGReh1bZhWVyHsJ65HEJWb91f2tyjskcM31A8pPFYiA@mail.gmail.com>
Message-ID: <CA+5PVA4MGReh1bZhWVyHsJ65HEJWb91f2tyjskcM31A8pPFYiA@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Update firmware for Cirrus Amps for some
 Dell laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 9:58=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to update the firmware for the Cirrus CS35L56 smart amp=
lifier for some Dell Laptops.
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit 3bbb13a78b3defc5cfca702114108f0bd7fcf5=
42:
>
>
>
>   Merge branch 'amd-staging' into 'main' (2024-11-08 14:14:44 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20241108

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/363

josh

>
>
>
> for you to fetch changes up to 1486d9aa55fd5efea6e242eb993181fdeca43f5e:
>
>
>
>   cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell lapto=
ps (2024-11-08 14:49:01 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell l=
aptops
>
>
>
> WHENCE                                               |  25 ++++++++++++++=
+++++++++++
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampl.bin | Bin 0 -> 11612 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampr.bin | Bin 0 -> 11612 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampl.bin | Bin 0 -> 11616 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampr.bin | Bin 0 -> 11616 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampl.bin | Bin 0 -> 11612 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampr.bin | Bin 0 -> 11612 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampl.bin | Bin 0 -> 11616 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampr.bin | Bin 0 -> 11616 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampl.bin | Bin 0 -> 11620 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampr.bin | Bin 0 -> 11620 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampl.bin | Bin 0 -> 11620 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampr.bin | Bin 0 -> 11620 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampl.bin | Bin 0 -> 11620 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampr.bin | Bin 0 -> 11620 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampl.bin | Bin 0 -> 11624 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampr.bin | Bin 0 -> 11624 byt=
es
>
> cirrus/cs35l56/CS35L56_Rev3.11.25.wmfw               | Bin 0 -> 34596 byt=
es
>
> 18 files changed, 25 insertions(+)
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampr.bin
>
> create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.25.wmfw
>
>
