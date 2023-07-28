Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F6EC001DF
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Jul 2023 18:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF9A6C433C8; Fri, 28 Jul 2023 18:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E0DC433C9
	for <linux-firmware@kernel.org>; Fri, 28 Jul 2023 18:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690568158;
	bh=nyTXgZmBSQDXZliePvcTCCQoFl1xrF2n9pJPVrsxAes=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VkgJaza8HmIk2CK6wzKfT8DfOVOpgKp5ROhpG3izpaK5XD6SM0/A1z2kyzRvoNif+
	 L1k0YTdV+RHzhBT1as2qByipxGtbLgd/beZofOsUaZcZC9MEMXqabRxum2DL9kSPuo
	 5izpWI6+uiyxg8EVCueZlcukSUpYGY7Xr2WeHrixq/dpoyjrHzs9jDQv/0oJ/GqlVz
	 mvabD3bziiJtqMHpdFj37VahUrxsB/xhXmsSrnd8tELBmhvoLeh2q2WehMjjDwYyOd
	 Ts/9Ge7J1PnOGgCx5g+AzUPr711m6AOoM2imGKGWU0ABLy/FrR2mb8oUSt8b+HGVn/
	 Ir1knNxAz8Xfw==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-c2cf4e61bc6so2143830276.3
        for <linux-firmware@kernel.org>; Fri, 28 Jul 2023 11:15:58 -0700 (PDT)
X-Gm-Message-State: ABy/qLb0YYpMswU+F8mohyKMugh9r/4SSyv64YZJUg7AndUXcC4fXcVY
	qC7VClElthlbQIoU7ZA0MORko8YbiSGy+GV9eAk=
X-Google-Smtp-Source: APBJJlGXJTg3EQAwsHI8CDcA417Qg/9EHCN31MYn7w61i9kSDBw+i8E+e7whxW2yk3BGoygepjvu08CignMBWhCLlOA=
X-Received: by 2002:a25:d3c2:0:b0:c76:173c:6718 with SMTP id
 e185-20020a25d3c2000000b00c76173c6718mr2355008ybf.1.1690568157571; Fri, 28
 Jul 2023 11:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <2f6fb9b0-fae9-ec5b-0448-2ee900c1b8a5@opensource.cirrus.com>
In-Reply-To: <2f6fb9b0-fae9-ec5b-0448-2ee900c1b8a5@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 28 Jul 2023 14:15:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4i7j9xwXk7hOUYAyK1WA2=-s=t=z-Rafn2ug0JvV-=hw@mail.gmail.com>
Message-ID: <CA+5PVA4i7j9xwXk7hOUYAyK1WA2=-s=t=z-Rafn2ug0JvV-=hw@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for Dell Oasis
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 10:09=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Hi,
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for Dell Oasis Laptops.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit c7824580d310809b55f95626b4b46954911be8=
20:
>
>    Merge branch 'v2.0.21961' of
> https://github.com/yunfei-mtk/linux_fw_10bit (2023-07-24 08:30:51 -0400)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware for-upstream

Pulled and pushed out.

josh

>
> for you to fetch changes up to c8424cf03def7777a4a83b8305d1af7b1321ab62:
>
>    cirrus: Add CS35L41 firmware for Dell Oasis Models (2023-07-26
> 13:43:05 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>        cirrus: Add CS35L41 firmware for Dell Oasis Models
>
>   WHENCE                                           |  42
> ++++++++++++++++++++++++++++++++++++++++++
>   cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin | Bin 0 -> 1824 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin | Bin 0 -> 1824 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin | Bin 0 -> 3980 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin | Bin 0 -> 3980 bytes
>   5 files changed, 42 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
>
> diff --git a/WHENCE b/WHENCE
> index c94afe7b..e76a9111 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6447,6 +6447,48 @@ File: cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin
>   File: cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin
>   Link: cirrus/cs35l41-dsp1-spk-prot-103c8c26.bin ->
> cs35l41-dsp1-spk-prot-103c8b45.bin
>   Link: cirrus/cs35l41-dsp1-spk-cali-103c8c26.bin ->
> cs35l41-dsp1-spk-cali-103c8b45.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbd.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbd.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbe.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbe.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbf.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbf.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc1.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc1.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc2.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc2.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc3.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc3.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc4.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc4.wmfw ->
> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
> +File: cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
> +File: cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
> +File: cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
> +File: cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbe-spkid0.bin ->
> cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbe-spkid0.bin ->
> cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbe-spkid1.bin ->
> cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbe-spkid1.bin ->
> cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0.bin ->
> cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbf-spkid0.bin ->
> cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1.bin ->
> cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cbf-spkid1.bin ->
> cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0.bin ->
> cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc1-spkid0.bin ->
> cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1.bin ->
> cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc1-spkid1.bin ->
> cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc2-spkid0.bin ->
> cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc2-spkid0.bin ->
> cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc2-spkid1.bin ->
> cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc2-spkid1.bin ->
> cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0.bin ->
> cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc3-spkid0.bin ->
> cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1.bin ->
> cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc3-spkid1.bin ->
> cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0.bin ->
> cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc4-spkid0.bin ->
> cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
> +Link: cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1.bin ->
> cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
> +Link: cirrus/cs35l41-dsp1-spk-cali-10280cc4-spkid1.bin ->
> cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
>
>   License: Redistributable. See LICENSE.cirrus for details.
>
> diff --git a/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
> b/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
> new file mode 100644
> index 00000000..251d3ce4
> Binary files /dev/null and
> b/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin differ
> diff --git a/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
> b/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
> new file mode 100644
> index 00000000..251d3ce4
> Binary files /dev/null and
> b/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin differ
> diff --git a/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
> b/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
> new file mode 100644
> index 00000000..4878c68b
> Binary files /dev/null and
> b/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin differ
> diff --git a/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
> b/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
> new file mode 100644
> index 00000000..4878c68b
> Binary files /dev/null and
> b/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin differ
>
