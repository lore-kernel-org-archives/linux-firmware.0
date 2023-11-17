Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA00C072A2
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Nov 2023 16:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2FFEC433C8; Fri, 17 Nov 2023 16:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4DFC433C9
	for <linux-firmware@kernel.org>; Fri, 17 Nov 2023 16:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700239720;
	bh=WFdt3Rrfg+8hlASjjstxkQ9RyRmQptfeERgIN3bqSgc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AWUfH3nVo6Z+4oW/xM+PSQwKMFSrPO6Ei9z+FMIpdff4YjPmMIJdgh4Kq3iR1J2Xh
	 SEX2Q7NAmXvE0j9wM5vapy9LJRnqYXO4Lr9AUDEPx1X0lqmGAcr2sfRSnp0Nt61uPF
	 RYyjsy1RdGexoqT5xM8PvtV6CozjNkb/B8+Y7117lupSen8k5/PRVUe/Op9XdOLK+e
	 2vgMXCjpVblnwpOXPDc6Bzq3iJrYEGz8NSCXSYTJSHQVbFkyv9SEcTMoyomtvFq2gc
	 hifdjvF8bCK40QWCzgAZutLI1+V909xtI09glpuHd3lhh+tx2n2ezBchWNCX0BkQD7
	 616jV8pp9QyYg==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-daf2eda7efaso2207273276.0
        for <linux-firmware@kernel.org>; Fri, 17 Nov 2023 08:48:40 -0800 (PST)
X-Gm-Message-State: AOJu0YzxgDs4/oH/iLgkGnvmTxPk8mSe+lfl/b7/qpQddgPVapyrjCYD
	VLfwbr07WjdOMqRKLAvhzcGGbFV5aBo10dGLNxY=
X-Google-Smtp-Source: AGHT+IGl5fXXuukUdwBc0ZbOAHPk6Hffi7ojADRaEy/H5KVsCzAJIz0uR8FzVGZNqbTGPedTmBZBclwMb5/M5baONes=
X-Received: by 2002:a25:ea4a:0:b0:dae:e896:2a5d with SMTP id
 o10-20020a25ea4a000000b00daee8962a5dmr19031778ybe.51.1700239719925; Fri, 17
 Nov 2023 08:48:39 -0800 (PST)
MIME-Version: 1.0
References: <a51cfb2b-9df3-66fd-3fb1-1deffd6250f0@opensource.cirrus.com>
In-Reply-To: <a51cfb2b-9df3-66fd-3fb1-1deffd6250f0@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 17 Nov 2023 11:48:28 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5SzFgrhVt9L7e2dueppP6bi7Bq+biZ2ZhpCnXA02QJ8Q@mail.gmail.com>
Message-ID: <CA+5PVA5SzFgrhVt9L7e2dueppP6bi7Bq+biZ2ZhpCnXA02QJ8Q@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for HP and ASUS laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 10:56=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for various HP and ASUS laptops.
>
> Thanks,
>
> Stefan Binding
>
>
> The following changes since commit b72eeb603950f39f320c8113e56d69cbcfe2cb=
44:
>
>    Merge branch 'mlimonci/robot-pr-improvements' into 'main' (2023-11-14
> 12:40:38 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ for-upstream

Pulled and pushed out.

josh

>
> for you to fetch changes up to 4f498d09a4a6a905f231a52f33886f8a5d22d5de:
>
>    linux-firmware: Add firmware for Cirrus CS35L41 on HP G11 Laptops
> (2023-11-15 15:46:38 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (2):
>        linux-firmware: Add firmware for Cirrus CS35L41 on 2024 ASUS
> Zenbook Laptops
>        linux-firmware: Add firmware for Cirrus CS35L41 on HP G11 Laptops
>
>   WHENCE                                              |  58
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   cirrus/cs35l41-dsp1-spk-cali-103c8ca4.bin           | Bin 0 -> 1988 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l0.bin        | Bin 0 -> 2048 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l1.bin        | Bin 0 -> 2052 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r0.bin        | Bin 0 -> 2048 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r1.bin        | Bin 0 -> 2052 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-l0.bin | Bin 0 -> 2044 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-r0.bin | Bin 0 -> 2048 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-l0.bin | Bin 0 -> 2048 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-r0.bin | Bin 0 -> 2048 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-l0.bin | Bin 0 -> 1936 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-r0.bin | Bin 0 -> 1932 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-l0.bin | Bin 0 -> 1936 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-r0.bin | Bin 0 -> 1932 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-l0.bin | Bin 0 -> 1936 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-r0.bin | Bin 0 -> 1936 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-l0.bin | Bin 0 -> 1944 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-r0.bin | Bin 0 -> 1944 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-l0.bin | Bin 0 -> 1944 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-r0.bin | Bin 0 -> 1944 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-l0.bin | Bin 0 -> 1944 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-r0.bin | Bin 0 -> 1944 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8ca4.bin           | Bin 0 -> 5360 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8cf5-l0.bin        | Bin 0 -> 5460 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8cf5-l1.bin        | Bin 0 -> 5412 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8cf5-r0.bin        | Bin 0 -> 5460 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8cf5-r1.bin        | Bin 0 -> 5412 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-l0.bin | Bin 0 -> 5248 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-r0.bin | Bin 0 -> 5252 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-l0.bin | Bin 0 -> 5276 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-r0.bin | Bin 0 -> 5276 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-l0.bin | Bin 0 -> 4716 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-r0.bin | Bin 0 -> 4716 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-l0.bin | Bin 0 -> 4716 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-r0.bin | Bin 0 -> 4716 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid0-l0.bin | Bin 0 -> 4728 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid0-r0.bin | Bin 0 -> 4728 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid1-l0.bin | Bin 0 -> 4736 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid1-r0.bin | Bin 0 -> 4736 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-l0.bin | Bin 0 -> 5340 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-r0.bin | Bin 0 -> 5340 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-l0.bin | Bin 0 -> 5340 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-r0.bin | Bin 0 -> 5340 byt=
es
>   43 files changed, 58 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8ca4.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8ca4.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cf5-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cf5-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cf5-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cf5-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-r0.bin
>
