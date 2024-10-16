Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B853D1AD53
	for <linux-firmware@archiver.kernel.org>; Wed, 16 Oct 2024 13:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D83CC4CEC7; Wed, 16 Oct 2024 13:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FC4C4CECF
	for <linux-firmware@kernel.org>; Wed, 16 Oct 2024 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729084197;
	bh=xKCFo8MA043MHqAj5qTSKNuBo4QCyuB7CPa3wxEztjU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sMn6vHImo0WOb5KXVWgAyUkCnGaHtpgJNQ0uVDaAb84pHpEBZNWa7hvcF1URBAg1M
	 XMe5ank/OOWnlbeQVBfmPp55ANROX42mH9cBb6V57gtS7Cvdi6N0DczOP79iUMa6R9
	 n6E56AQyr2b9bIKBEgdCq6TLvVaIW0c59qkRUi2ccdsph5KPtw3btsEP5NOEa2+/od
	 QIHdxyCUe26kAVoUW7h9KuM2Mv+CAHxbH98WrZaL21Y+4LjnDLAgCy7D3gNcYXigTY
	 HtRFSPztrDu8FdRWd4V6Ymke7UEDCkO23qaLKOWp5ytJk7aqRFmP9Qml+IYmfiNttC
	 wxWx8mIsyLyzw==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e2908e8d45eso5480321276.2
        for <linux-firmware@kernel.org>; Wed, 16 Oct 2024 06:09:57 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx1Fy7pZ25v8t4pN+pRhar0Pbwoo+B9+oi9X1uGEhamkBL+HKH5
	J/+3dxfzXr1SdjihHB4L8FOmnh5+9OCmqh0iZ1cN0qXQvr0RAkCG/qHtzIHHm5f3CycIdfpeX5d
	O2WST7zcjtkZpCJkz1YMtVy7BV6Q=
X-Google-Smtp-Source: AGHT+IF6XcBItVGwbQUS9BXN1K9DBPdyYGmxgifKD4u6h0TAgZVKJUkLjD4zdnA80vVJt3KlFQyuecykNrqWdxxtiFg=
X-Received: by 2002:a05:690c:d90:b0:6e2:3f8c:8fe2 with SMTP id
 00721157ae682-6e3d3f853ccmr35995947b3.4.1729084196264; Wed, 16 Oct 2024
 06:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <3b8e87de-a74e-45a9-9b2c-b5f94dcc2bb8@opensource.cirrus.com>
In-Reply-To: <3b8e87de-a74e-45a9-9b2c-b5f94dcc2bb8@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 16 Oct 2024 09:09:44 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6bk6eXYVg2XxCpeoM4-bM_xo2CFgjy-32JvuN=WgCdQg@mail.gmail.com>
Message-ID: <CA+5PVA6bk6eXYVg2XxCpeoM4-bM_xo2CFgjy-32JvuN=WgCdQg@mail.gmail.com>
Subject: Re: [PULL v2 linux-firmware] cirrus: cs35l41: Add firmware for Cirrus
 CS35L41 for some HP laptops
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 1:18=E2=80=AFAM Vitaly Rodionov
<vitalyr@opensource.cirrus.com> wrote:
>
>
> Hi,
>
> We=E2=80=99d like to add the firmware for the Cirrus CS35L41 smart amplif=
iers on
> a couple of HP laptop.
> Thanks,
> Vitaly
>
> Changes in v2:
> Fixed GitHub repo URL
>
> The following changes since commit 919f79f9fb5536c1928a15ac82a2e53183b213=
cf:
>
>    Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/cs35l41_snowwhite

This returns a 404.  Perhaps it's a private repo.

josh

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
