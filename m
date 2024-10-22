Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC25D2C541
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Oct 2024 12:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 783AFC4CEE6; Tue, 22 Oct 2024 12:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626F6C4CEC3
	for <linux-firmware@kernel.org>; Tue, 22 Oct 2024 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729599397;
	bh=LJv7fudyC4bqxZX8FZK+xY49CwMBo19aSJ0N7hOuYD0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YcJm75eP1hT8PMxP0Zte4XgAY7L8a+voP84A77xVVeIEx3bUHHHOwLHkWMzuYYAVH
	 5r7zw3UnY8jhHefH+001I4S5UhI3OiOWwOpq7naez7nLQWmPrv2zSKvdN3ifVk0upZ
	 pXnGpmplggh+4E5hAM2bOscOdvb6fEBbp7+r3eVCR7tX5a4/fXggvNLj8KBvV9Uhlv
	 +9pzUGTQw8XkO94Vk6DT0UWQMmhv8VkBHo5ga9BHA1inKkZLXvtzEDYwbW07y/mh3d
	 wfSze3HyWZCOR5hNhP4DuGyEWcR+amc1png/qGO/QXosh19u+33utWQt3+MFQN4D98
	 ZTZnqEfESf8rw==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e314136467so48827627b3.0
        for <linux-firmware@kernel.org>; Tue, 22 Oct 2024 05:16:37 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw0cZ8fz3O3605ZwwtBUVuTH8CjfjD+Zjo6vw2rJWUubDN65uz9
	ON+kNd8iYaM4fYVK42DkFXKdxLEWDuP4wp3lKLh5vZWtbtEeoJFeqsLcnHOZMNHDdDekVj2tjpB
	Eb6e5UMNIEZAA7buSh2Qspux8KwY=
X-Google-Smtp-Source: AGHT+IGGUQwwB8u/fwL/TMzDKVy0+8bq7MWzldwt+11r8We1FknnFCH1TN2YbMBxByoOD4fPEXIXOcp+L4fZOA7ViCE=
X-Received: by 2002:a05:690c:6612:b0:6e2:451c:df02 with SMTP id
 00721157ae682-6e7d48bba34mr21304547b3.16.1729599396587; Tue, 22 Oct 2024
 05:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <ae35e90e-21d4-4567-a97a-c9e680cc1a12@opensource.cirrus.com>
In-Reply-To: <ae35e90e-21d4-4567-a97a-c9e680cc1a12@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 22 Oct 2024 08:16:25 -0400
X-Gmail-Original-Message-ID: <CA+5PVA76Sh8=yMUCL6Ypi0xtL7V=WpzgNnh439SpehW8B=Hq9Q@mail.gmail.com>
Message-ID: <CA+5PVA76Sh8=yMUCL6Ypi0xtL7V=WpzgNnh439SpehW8B=Hq9Q@mail.gmail.com>
Subject: Re: [PULL v3 linux-firmware] cirrus: cs35l41: Add firmware for Cirrus
 CS35L41 for some HP laptops
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/342

josh

On Wed, Oct 16, 2024 at 5:59=E2=80=AFPM Vitaly Rodionov
<vitalyr@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to add the firmware for the Cirrus CS35L41 smart amplif=
iers on
> a couple of HP laptop.
> Thanks,
> Vitaly
>
> Changes in v3:
> It was my typo. Fixed GitHub URL, it should work now.
>
> The following changes since commit 919f79f9fb5536c1928a15ac82a2e53183b213=
cf:
>
>    Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware branch:cs35l41_snowwhite
>
> for you to fetch changes up to 72884e091e2e1a0842b5c11572aa4187de0b1d33:
>
>    linux-firmware: Add firmware for Cirrus CS35L41 (2024-10-09 16:08:14
> +0100)
>
> ----------------------------------------------------------------
> Vitaly Rodionov (1):
>        linux-firmware: Add firmware for Cirrus CS35L41
>
>   WHENCE                                              |  10 ++++++++++
>   cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid0-l0.bin | Bin 0 -> 4080 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin | Bin 0 -> 4088 byt=
es
>   3 files changed, 10 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
