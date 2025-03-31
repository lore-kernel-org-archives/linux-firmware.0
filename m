Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86130C3600B
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Mar 2025 11:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A24EC4CEEB; Mon, 31 Mar 2025 11:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34841C4CEE5
	for <linux-firmware@kernel.org>; Mon, 31 Mar 2025 11:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743421685;
	bh=NYb6I8pD/uQe8gyatD4fKiT84zK3NRAI/j2enpX4sm8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Ap3HZ24qwYxGkACEbSsEcN8CXaEX+kJVNIB1VQlUCm7rUBqRbXCz/nNJxqsH+8d8p
	 ucr85gOLrMv0wZPtH0emMHzr65slNGkRiSttym/AZi+C9yzzna3gwmsuL7wA3ibqEM
	 wpT9ooE4agDwkL/GxjTINBK1uKHTtVTOryOlzy4DM3IQerRn6N5B4exYsL2MqVZP7z
	 LVk4vNKjEcvFBtYDjkoYcorw4QTt4WD78qd3hMCBuzzOSSLV4YyAyU6oURhnibbUoD
	 dzypTqNDplVNfb+WLsetqrw7zhB1cKvcefq4eHxHf7I8h/07LmcRGIFSoPKHna82lT
	 BA+67o4OcJCCg==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e6582542952so2945576276.3
        for <linux-firmware@kernel.org>; Mon, 31 Mar 2025 04:48:05 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx0xn+7+QxUTwhOuXPp57QiXphyhIkUKJcBVt1LmnwSZrzx97Vh
	YlJbVRRkbAq1BKwSP+sQ233BOHrgg9K9H2naVkDUFiJujAqoXtP+H7PyBvpZ/GODozt7redXUEp
	B2xMbta7StaI3YPenGQZDAUtpyJw=
X-Google-Smtp-Source: AGHT+IGCuUMD64kPrcdnl6vHaEzWDoE0iXbijBneekxz+F2UxwvI+oi1qOKlDgLM/omsZP0+yIWV1CzpPv2YPx1In3s=
X-Received: by 2002:a05:6902:4890:b0:e6b:7aa8:59fb with SMTP id
 3f1490d57ef6-e6b8391f733mr9437111276.13.1743421684373; Mon, 31 Mar 2025
 04:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <000e01dba21e$9d5280b0$d7f78210$@opensource.cirrus.com>
In-Reply-To: <000e01dba21e$9d5280b0$d7f78210$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 31 Mar 2025 07:47:53 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4d3g9YVDhHfX2kSJ9DTweF+dYBMQGJxYXGHxEb5Bbw_A@mail.gmail.com>
X-Gm-Features: AQ5f1JpVyHkiz1uBj08IONruf9mBYY5R8SAw1Ol6cVJxOz2JakqMvHaoLiJn5Zg
Message-ID: <CA+5PVA4d3g9YVDhHfX2kSJ9DTweF+dYBMQGJxYXGHxEb5Bbw_A@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Correct filenames of SSID 103c8e1b and 103c8e1c
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 5:24=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to correct the firmware naming for the Cirrus CS35L56 s=
mart amplifier used in
>
> a couple of SSIDs
>
> Thanks,
>
> -Simon
>
>
>
>
>
> The following changes since commit 4bfa7c6351ab64e5f1429f30df1e478e2bd9df=
36:
>
>
>
>   Merge branch 'amd-staging' into 'main' (2025-03-28 16:39:59 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250331

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/501

josh

>
>
>
> for you to fetch changes up to e1f0996657cf8900dc60a8df6fd6eba276a822ea:
>
>
>
>   cirrus: cs35l56: Correct filenames of SSID 103c8e1b and 103c8e1c (2025-=
03-31 09:18:41 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Correct filenames of SSID 103c8e1b and 103c8e1c
>
>
>
> WHENCE                                                                   =
                 |  12 ++++++------
>
> cirrus/{cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin =3D> cs35l56-b0-dsp1-misc-=
103c8e1b-amp1.bin} | Bin
>
> cirrus/{cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin =3D> cs35l56-b0-dsp1-misc-=
103c8e1b-amp2.bin} | Bin
>
> 3 files changed, 6 insertions(+), 6 deletions(-)
>
> rename cirrus/{cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin =3D> cs35l56-b0-dsp=
1-misc-103c8e1b-amp1.bin} (100%)
>
> rename cirrus/{cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin =3D> cs35l56-b0-dsp=
1-misc-103c8e1b-amp2.bin} (100%)
