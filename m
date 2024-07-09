Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC6CC2BD09
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Jul 2024 11:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DE49C32786; Tue,  9 Jul 2024 11:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC10FC3277B
	for <linux-firmware@kernel.org>; Tue,  9 Jul 2024 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720523750;
	bh=jwPq6ibcpxyP0UhuaTaD8XDcHnJe2aPyL21uNmCADtU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Ud37dhZ3GxJKLcGkZHbVsj+7Z7M2lZkdFCNhYihuQeBLWS8TfqPn0wrDxMPqxiGRY
	 sFPWmW70ovhtkGUh5+e1kw/UDw5gqBEbv6ofa+12bhKisJlIVFiCdMUANoDjvSECQ6
	 4xzogcfZ4WrsycMGx6aWfN7pZ2Fb3WYxCEaLqkvu7E9bvoyKDOKJW61K/r+P0tHQe/
	 DBe2DH7/FrZLWsO2pCNaAaa5uK3USEtta/E3+To1QLs2jf9y7o40S9bdkzJU/8NgBa
	 +AfQ1ViCECd5xxsxuDnWMjbYzkzizGqJC8mp8B3hLvgPvrvdk3NXbBMwZIWJIMn/8I
	 gL9CHRc6HRNFQ==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e03609bd52dso5105968276.1
        for <linux-firmware@kernel.org>; Tue, 09 Jul 2024 04:15:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YwYrHCPJyB83EIBoAoPC/1dA4VtVt9tK8/7c1PsfKF8GbJ8yA+9
	SFyHpTWN5bQghiiA819L4JinOZ6XKdrJ0zFCn36ugYvvZqrzlfHeHThsud+OO/RmX3Lsg7wYz3p
	nbpBRYkPC8+rnToUYB98IQOeFBfc=
X-Google-Smtp-Source: AGHT+IG5SbJu/pGdIjBYAwLijdyHKIAE5duNavvky85oqc/Us9eh/xqRyOqtBytb0BRfvDY+eLkzf5/GhFEyhOKRbFU=
X-Received: by 2002:a25:c787:0:b0:dff:2f2c:d6ad with SMTP id
 3f1490d57ef6-e041b120e3bmr3071465276.51.1720523749169; Tue, 09 Jul 2024
 04:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <26f3a4f4-a081-4e8e-aae5-6db919d9c804@opensource.cirrus.com>
In-Reply-To: <26f3a4f4-a081-4e8e-aae5-6db919d9c804@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 9 Jul 2024 07:15:37 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7DKk6gMk0QCQivki9A9HUOuztRgf-kOaRm8SG5Yohc-g@mail.gmail.com>
Message-ID: <CA+5PVA7DKk6gMk0QCQivki9A9HUOuztRgf-kOaRm8SG5Yohc-g@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Update firmware for Cirrus Smart Amp
 CS35L41 for various ASUS laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 11:49=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to update firmware files for Cirrus Logic Smart Amp CS35L41=
 for various ASUS laptops.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit d4fee3a21b1daba9ea99f2c341ab8f7386503e=
5b:
>
>   Merge branch 'amd-isp-staging' into 'main' (2024-06-27 19:34:37 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/ 2024-07-02

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/239

josh

>
> for you to fetch changes up to fe07c4bdd435c623fdf215bb0d94f9e6f838e164:
>
>   cirrus: cs35l41: Update various firmware for ASUS laptops using CS35L41=
 (2024-07-02 16:16:00 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>       cirrus: cs35l41: Update various firmware for ASUS laptops using CS3=
5L41
>
>  cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-l0.bin | Bin 5248 -> 5540 b=
ytes
>  cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-r0.bin | Bin 5252 -> 5532 b=
ytes
>  cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-l0.bin | Bin 5276 -> 5556 b=
ytes
>  cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-r0.bin | Bin 5276 -> 5556 b=
ytes
>  cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-l0.bin | Bin 4716 -> 5388 b=
ytes
>  cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-r0.bin | Bin 4716 -> 5388 b=
ytes
>  cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-l0.bin | Bin 4716 -> 5388 b=
ytes
>  cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-r0.bin | Bin 4716 -> 5388 b=
ytes
>  cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-l0.bin | Bin 5340 -> 5364 b=
ytes
>  cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-r0.bin | Bin 5340 -> 5364 b=
ytes
>  cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-l0.bin | Bin 5340 -> 5364 b=
ytes
>  cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-r0.bin | Bin 5340 -> 5364 b=
ytes
>  12 files changed, 0 insertions(+), 0 deletions(-)
>
