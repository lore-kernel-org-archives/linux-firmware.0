Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C347AC47258
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Jan 2024 13:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA07EC433C7; Thu, 11 Jan 2024 13:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946D9C43390
	for <linux-firmware@kernel.org>; Thu, 11 Jan 2024 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704980935;
	bh=l/qeoheEuGRvx+hR3KhYfCPiSl7sLV7rNvtpAGq28Zw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nfa3zTiwff9BCwaC2D70SYZK0VYPYBJVncD+L8WzGJJeBoV39yrKk8DGO397c6Wk1
	 WZ69PctwFvyHG6H/SrwpatG/+gz2kEDu6+LA8GXwmbSeqdhG4kMtcdqYN9cuoIacXU
	 3enCjS3yH5yNmKeW+yoB9KoGpuOXceP6AWgL+0xUSiO7VBs0o1WNlv5U48kF+wBzcd
	 9WOJA8AoaTvOZB8+jX53GPRmyVHTaqLtqljO+jkpEtugC03FwGZSK7U8yOxtznT84g
	 qjUW8jzqnAC4R9bJqUJCJbkFUnyLVltDn8Y4xwI2OzXjuXhDc7NpOCTrP/ylWDHeB0
	 xHFgL2rpQ78Ww==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5fa52e173f7so20078767b3.3
        for <linux-firmware@kernel.org>; Thu, 11 Jan 2024 05:48:55 -0800 (PST)
X-Gm-Message-State: AOJu0YztsTaTPMcMSja2PXzi/YBUIHtJPX8JCpVsMcPxQGWPsJGt4VAT
	5a7Q8YVJCF6XGhrTuAlvOTu9yJYsK7kngmjAc60=
X-Google-Smtp-Source: AGHT+IGieh8S/4nRgy0OGbHGP6SSzuDi/OETdvg2tMFQkay843bS9HhphJA5rtBfImmcCjO6IHh6e0TQqdKLKAvWHRQ=
X-Received: by 2002:a05:690c:24b:b0:5eb:1d7a:2664 with SMTP id
 ba11-20020a05690c024b00b005eb1d7a2664mr499059ywb.29.1704980934756; Thu, 11
 Jan 2024 05:48:54 -0800 (PST)
MIME-Version: 1.0
References: <cd4c4d75-87c4-4d9d-b849-ef3aca596283@opensource.cirrus.com>
In-Reply-To: <cd4c4d75-87c4-4d9d-b849-ef3aca596283@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 11 Jan 2024 08:48:44 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4AZkBvSvnm_58Xx2ckX1EsFnJhS0SQxUMeEbcuEauSHQ@mail.gmail.com>
Message-ID: <CA+5PVA4AZkBvSvnm_58Xx2ckX1EsFnJhS0SQxUMeEbcuEauSHQ@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] cirrus: Add CS35L41 firmware for Legion
 Slim 7 Gen 8 laptops
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 2:02=E2=80=AFPM Vitaly Rodionov
<vitalyr@opensource.cirrus.com> wrote:
>
> We would like to merge the firmware for Legion Slim 7 Gen 8 laptops
> using Cirrus Logic CS35L41 amps on I2C bus.
>
> Thanks,
> Vitaly
>
> The following changes since commit 323d51ed5b64519e5cffdd51e39c48919b3f33=
81:
>
>    Merge branch 'robot/patch-0-1704834007' into 'main' (2024-01-10
> 12:46:22 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ cs35l41_legion7g8

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/123

josh

>
> for you to fetch changes up to 2b6dd0c8d9b4273b805943921842774ac71538fe:
>
>    cirrus: Add CS35L41 firmware for Legion Slim 7 Gen 8 laptops
> (2024-01-10 17:12:03 +0000)
>
> ----------------------------------------------------------------
> Vitaly Rodionov (1):
>        cirrus: Add CS35L41 firmware for Legion Slim 7 Gen 8 laptops
>
>   WHENCE                                             |  40
> +++++++++++++++++++++
>   .../cs35l41-dsp1-spk-cali-17aa38b4-spkid0-l0.bin   | Bin 0 -> 1536 byte=
s
>   .../cs35l41-dsp1-spk-cali-17aa38b4-spkid0-r0.bin   | Bin 0 -> 1536 byte=
s
>   .../cs35l41-dsp1-spk-prot-17aa38b4-spkid0-l0.bin   | Bin 0 -> 5464 byte=
s
>   .../cs35l41-dsp1-spk-prot-17aa38b4-spkid0-r0.bin   | Bin 0 -> 5464 byte=
s
>   .../cs35l41-dsp1-spk-prot-17aa38b4-spkid1-l0.bin   | Bin 0 -> 5476 byte=
s
>   .../cs35l41-dsp1-spk-prot-17aa38b4-spkid1-r0.bin   | Bin 0 -> 5476 byte=
s
>   7 files changed, 40 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa38b4-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa38b4-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa38b4-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa38b4-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa38b4-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa38b4-spkid1-r0.bin
