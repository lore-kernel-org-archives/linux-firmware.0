Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E82DD5E13D
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Dec 2025 18:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D113C113D0; Tue, 16 Dec 2025 18:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CD4C4CEFB
	for <linux-firmware@kernel.org>; Tue, 16 Dec 2025 18:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765911148;
	bh=lZZk4X92YGQ4bYvOpJQhBSojcA9OWJekFSNv4AgBaM4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=DxENG2mivYxlKknLGrhkW43ZclhLRJfLVm4Vx25BcHmkgJxu4pUfLBz/UeenUVwvB
	 h7ycJi/4Fyl1lLszeSkJEeW3OkgrraSkb1Z+whaUNyigUClDjccUaTs+QheWgAmrP4
	 5drkfFETP3B9IiUwqIp7nw7C9r8hBBsSKEbDdw+uWlppyoqA8io3tVKcBphQO44W5x
	 YaZNqX7ILTDlP0oi1ib7zHB/3lMphBOPzFuUyOWrkMHbV+yNO5wOd2G21yhu+/wrdu
	 fTQqrWZQHaaM29wXPt/f3J1SkO7R0ED1rtSBj20dRDJT3MdPl/RDI2VdNzJwfUAi6M
	 AplM/qNoqEUpw==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64472c71fc0so4497857d50.0
        for <linux-firmware@kernel.org>; Tue, 16 Dec 2025 10:52:28 -0800 (PST)
X-Gm-Message-State: AOJu0YwdFkhYUqaMAivrNU9Cohm9ZhzpjwVz5rMbbE73cvHcrQzRQMls
	cxA6ezQi52znzeZNu5nRyIcV9fHw4Gtv/aJ3PdqnHAIy/1yoUJjcconAbEfkr2n1Luv7sQIsTbm
	dPrzZJfpNOoPgtSgj5zIxb/U891thM5E=
X-Google-Smtp-Source: AGHT+IHpfJslYsTRQb0up3s6goDLUbtrxTLUhZqnbqhZqXomfG0QtZ+R39bDaOvLS8Pw5zsUcj56YdK/MZJah0jkEws=
X-Received: by 2002:a05:690e:1248:b0:644:60d9:8671 with SMTP id
 956f58d0204a3-64555680695mr12229758d50.86.1765911147450; Tue, 16 Dec 2025
 10:52:27 -0800 (PST)
MIME-Version: 1.0
References: <58130bd8-25f7-44fd-930c-d9391ec06878@opensource.cirrus.com>
In-Reply-To: <58130bd8-25f7-44fd-930c-d9391ec06878@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 16 Dec 2025 13:52:15 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5J5tB2HU+cMi6H27FmeOTQNJMG6pApYeOusbaqGNR_hw@mail.gmail.com>
X-Gm-Features: AQt7F2qDTwF_CBm0daw6o4gUmzHou-OXLy8czbj2TW7QBEqPSodCfYfjOp2PVAE
Message-ID: <CA+5PVA5J5tB2HU+cMi6H27FmeOTQNJMG6pApYeOusbaqGNR_hw@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for HP laptops using CS35L41
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 11:55=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add and update firmware files for Cirrus Logic Smart Amp=
 CS35L41 for HP Clipper and Trekker laptops.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit 03912c51ac907052f5d8f4bf6ccd987410479e=
80:
>
>   Merge branch 'qcom-gpu-fw' into 'main' (2025-12-16 12:14:32 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20251216

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/826

josh

>
> for you to fetch changes up to fe9e5c89d5e8931e5c660713029f8ee85a6404f8:
>
>   cirrus: cs35l41: Update firmware and tuning for various HP laptops (202=
5-12-16 16:51:36 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (2):
>       cirrus: cs35l41: Add support for new HP Clipper laptop
>       cirrus: cs35l41: Update firmware and tuning for various HP laptops
>
>  WHENCE                                           |   6 ++++++
>  cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin | Bin 4804 -> 4852 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin | Bin 4796 -> 4852 byte=
s
>  3 files changed, 6 insertions(+)
>
