Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71B7C64ED8
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Feb 2023 14:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4BCEC4339B; Mon, 27 Feb 2023 14:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EADEC433EF
	for <linux-firmware@kernel.org>; Mon, 27 Feb 2023 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677507148;
	bh=xDzbC0X9JnUgIJ0VRNXQpV5EDnx/D+LP58b9hj0tpSo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=WTaT/QUt3W8XmOYsGt1LXfQp6NxpLBvhaqN7wnGn2wPYKKqI3dQlYDFCFnXNYmscZ
	 xDaPBa0a5C3Lvb+vpUF1MSF2udn44WDq1YYReDD1xx/0RB+eYH5F2D1/k7lcLEk4IT
	 z5TymWSdm48w1Z758w39dhV4pwppCaKpRRkZOSU3ypP+4DglTtDPKuiXvY0WcSe6Iq
	 pR7n++rQxWwBIwGDyViGh7CBc5e4Yqm0sX7OWByYOQOGWD5sN4ZVvKdqdFBzPGBjqA
	 EbFD5ZoUc3E3+4358fVoTpA1ai6z+0dWgw7//famA+LKjEOomfWdW4JhGKILWfK0fU
	 x6jYJF2/PNQFQ==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-536bbef1c5eso178636157b3.9
        for <linux-firmware@kernel.org>; Mon, 27 Feb 2023 06:12:28 -0800 (PST)
X-Gm-Message-State: AO0yUKXqN7mowUOOMnQ/qmR77mTcGp2e+CP46jutzpKTfu61l/K0HhZV
	w9ekKh4t6tnmLlNjHDhemtMTpyvLjOVfEZZSYPc=
X-Google-Smtp-Source: AK7set8x3APU9KH1D+bX3C1bBF9u8CJNXOj7Utvo3oaqJnCAcXxJ85c4H5sBGLkl8odNcSnl6LOZ+OQOTTJbrYF8P44=
X-Received: by 2002:a05:6902:1203:b0:a09:314f:9f09 with SMTP id
 s3-20020a056902120300b00a09314f9f09mr7642650ybu.6.1677507147616; Mon, 27 Feb
 2023 06:12:27 -0800 (PST)
MIME-Version: 1.0
References: <BY3PR18MB4785E40BF7A834EE264B4D78ACA99@BY3PR18MB4785.namprd18.prod.outlook.com>
In-Reply-To: <BY3PR18MB4785E40BF7A834EE264B4D78ACA99@BY3PR18MB4785.namprd18.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 27 Feb 2023 09:12:16 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5OUi76B-ex8X2HiJ1XsFzKcwrFstObEAYCuDDJxDgkjQ@mail.gmail.com>
Message-ID: <CA+5PVA5OUi76B-ex8X2HiJ1XsFzKcwrFstObEAYCuDDJxDgkjQ@mail.gmail.com>
Subject: Re: pull request: liquidio: remove lio_23xx_vsw.bin
To: Derek Chickles <dchickles@marvell.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Satananda Burla <sburla@marvell.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 24, 2023 at 7:27 PM Derek Chickles <dchickles@marvell.com> wrote:
>
> Hi,
>
> We would like to remove one firmware binary from this repository per our security team's concerns (Cavium was acquired by Marvell).

What security concerns would those be?  Where would users of these
devices get firmware from?

> Thanks,
> Derek
> --
> The following changes since commit 83f1d7781300b52785c062a8285da59042c0d1ff:
>
>   Merge branch 'ath10k-20230215' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware (2023-02-15 14:27:03 -0500)
>
> are available in the git repository at:
>
>
>   https://github.com/dchickles/linux-firmware.git liquidio-20230222
>
> for you to fetch changes up to c6008409440f18da7109e20a3f8db0c6c0a0586b:
>
>   liquidio: remove lio_23xx_vsw.bin (2023-02-22 18:48:26 -0800)
>
> ----------------------------------------------------------------
> Chickles, Derek (1):
>       liquidio: remove lio_23xx_vsw.bin
>
>  LICENCE.cavium_liquidio   | 361 ------------------------------------------------------------------------------------------------

There are multiple liquidio firmware files under this license.  You
can't remove it just because you want to remove only one firmware.

josh

>  WHENCE                    |   3 -
>  liquidio/lio_23xx_vsw.bin | Bin 20434408 -> 0 bytes
>  3 files changed, 364 deletions(-)
>  delete mode 100644 liquidio/lio_23xx_vsw.bin
