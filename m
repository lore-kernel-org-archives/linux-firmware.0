Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E333CEACEF
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Nov 2025 17:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12DABC19423; Mon, 17 Nov 2025 17:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0296C2BCB4
	for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 17:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763401224;
	bh=LWw1W21UquRqL8e3bZjh/X9OQfgRxMvVHjzBSJh+tu8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JDGE1mYtwk902x9ZlOVQKbJC0OJJ5umT2cGfHyx0rANdtnnhfWiWr1G685eru75Yd
	 SIoRmbgWmmQbSjqeSByIJuAeQMMDkNRk+zlnHGmebubhcsGlDHoCJfbvp3VXD7c4t6
	 t6lxycTEXNEr1LuGGDsAOgUfy7vc0nFbpShSmjScgoqbJXzOKPeJNa026kXciED742
	 QRilaUELkyb+0A5HZfiMLy7Zzs69K2IyMHL27Hjx5nyvNwo5aSaxmGmeBYROC3cfNS
	 gUHl0l1mzt3kCRb2o5F6T65MEi+QTpfavAJBYZJIWXvs0VpcRMEpFk3b3I3InITyDL
	 oPMqZGFUfUC0Q==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-789524e6719so18158947b3.1
        for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 09:40:24 -0800 (PST)
X-Gm-Message-State: AOJu0YyDOJAQa0C3zGk1XTFSO1Uj/MTXlyy4cUZXO742m0emrFvHyJcZ
	G8JjFu4E41W3EXmMxgkYWc3uw0XnlznDuyqeubAzs9ASFYJS9DcuQfp5Vz+NyQ3mpMLSg7dOH4G
	pSd2N+94ga1PNqw0p5wm32lqQ1U2c8mI=
X-Google-Smtp-Source: AGHT+IGwuRI3ltw6PBsA5rjpE2QZl8UQfa4hIA2PGDL7Iz4tRTwFDCoYqcXtdDLB/5+fZEP6mnd3etpe1sGcEx0YMg0=
X-Received: by 2002:a05:690e:1906:b0:640:ce59:128b with SMTP id
 956f58d0204a3-64213417719mr207526d50.2.1763401223104; Mon, 17 Nov 2025
 09:40:23 -0800 (PST)
MIME-Version: 1.0
References: <000801dc57ae$0d17c5a0$274750e0$@opensource.cirrus.com>
In-Reply-To: <000801dc57ae$0d17c5a0$274750e0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 17 Nov 2025 12:40:11 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7Nzmdwyt=wOo6kyDEVJmF4kxevGZoqm_xNC_FEMWHH9Q@mail.gmail.com>
X-Gm-Features: AWmQ_bn2fTu13Mrjb7dTjmWJ_tNASfsUnTC4fX6ifjdG-Jki9DUlFTy2zG9pjmc
Message-ID: <CA+5PVA7Nzmdwyt=wOo6kyDEVJmF4kxevGZoqm_xNC_FEMWHH9Q@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Amps and Codecs
 for some Dell laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 5:36=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> I couple of patches today - we=E2=80=99d like to add the firmware for the=
 Cirrus CS35L57 smart amplifier and CS42L45 smart codec for some Dell Lapto=
ps.
>
> Thanks,
>
> -Simon
>
>
>
>
>
> The following changes since commit fb0dbcd3011839d85920d1e4aa956f6a84700c=
af:
>
>
>
>   Merge branch 'amd-ucode' into 'main' (2025-11-13 22:26:11 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ 20251117-cs42l45-cs35l57

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/783

josh

>
>
>
> for you to fetch changes up to 251bc9c4f9d16a2c9ada6e4768f5abf9b01d3a06:
>
>
>
>   cirrus: cs35l57: Add firmware for a few Dell products (2025-11-17 10:25=
:56 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Maciej Strozek (1):
>
>       cirrus: cs42l45: Add firmware for Cirrus Logic CS42L45 SDCA codec
>
>
>
> Simon Trimmer (1):
>
>       cirrus: cs35l57: Add firmware for a few Dell products
>
>
>
> WHENCE                                               |  59 ++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++
>
> cirrus/cs35l56/CS35L56_Rev4.5.9.wmfw                 | Bin 0 -> 31296 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u2.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u3.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u0.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u1.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u2.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u3.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u0.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u1.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u2.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u3.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u0.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u1.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u2.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u3.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u0.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u1.bin | Bin 0 -> 10556 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u2.bin | Bin 0 -> 12396 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u3.bin | Bin 0 -> 12388 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u0.bin | Bin 0 -> 12396 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u1.bin | Bin 0 -> 12388 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u2.bin | Bin 0 -> 12392 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u3.bin | Bin 0 -> 12388 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u0.bin | Bin 0 -> 12392 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u1.bin | Bin 0 -> 12388 byt=
es
>
> sdca/1fa/1028/db3/1.bin                              | Bin 0 -> 16 bytes
>
> sdca/1fa/1028/db3/2.bin                              | Bin 0 -> 16 bytes
>
> sdca/1fa/1028/db3/3.bin                              | Bin 0 -> 16 bytes
>
> sdca/1fa/1028/db3/4.bin                              | Bin 0 -> 16 bytes
>
> sdca/1fa/1028/db3/42450005.bin                       | Bin 0 -> 10764 byt=
es
>
> sdca/1fa/1028/db9/1.bin                              | Bin 0 -> 16 bytes
>
> sdca/1fa/1028/db9/2.bin                              | Bin 0 -> 16 bytes
>
> sdca/1fa/1028/db9/3.bin                              | Bin 0 -> 16 bytes
>
> sdca/1fa/1028/db9/4.bin                              | Bin 0 -> 16 bytes
>
> sdca/1fa/1028/db9/42450005.bin                       | Bin 0 -> 10764 byt=
es
>
> 36 files changed, 59 insertions(+)
>
> create mode 100644 cirrus/cs35l56/CS35L56_Rev4.5.9.wmfw
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u2.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u3.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u0.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u1.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u2.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u3.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u0.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u1.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u2.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u3.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u0.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u1.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u2.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u3.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u0.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u1.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u2.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u3.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u0.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u1.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u2.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u3.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u0.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u1.bin
>
> create mode 100644 sdca/1fa/1028/db3/1.bin
>
> create mode 100644 sdca/1fa/1028/db3/2.bin
>
> create mode 100644 sdca/1fa/1028/db3/3.bin
>
> create mode 100644 sdca/1fa/1028/db3/4.bin
>
> create mode 100644 sdca/1fa/1028/db3/42450005.bin
>
> create mode 100644 sdca/1fa/1028/db9/1.bin
>
> create mode 100644 sdca/1fa/1028/db9/2.bin
>
> create mode 100644 sdca/1fa/1028/db9/3.bin
>
> create mode 100644 sdca/1fa/1028/db9/4.bin
>
> create mode 100644 sdca/1fa/1028/db9/42450005.bin
