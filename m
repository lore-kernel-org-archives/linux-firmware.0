Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C78C10DC1
	for <linux-firmware@archiver.kernel.org>; Mon,  4 Dec 2023 13:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E127CC433CB; Mon,  4 Dec 2023 13:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1C3C433C7
	for <linux-firmware@kernel.org>; Mon,  4 Dec 2023 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701695356;
	bh=SeXx+O1jNdAy6o6/NUQ1Q6hvXK2Yw0wQE39mTw9yxBU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=EcOcOcNucVgYGBFJ474u8I/t4lv33vqdLbVhr1SQuH6ruBNo5pHPAvpPxsbnfRkPq
	 mwRhTbXI/okI+SAaIk3+Ajb16zEoLlfIFF2aDRNsWl11vHhw5+tgtWMpGmR4GCkwPx
	 z62Msn31g6tdfShb+mb8bZxVXcBf240C+NeApZBw2SVQ9F+2S3exQqxG2favOeYW9O
	 udH2eYSA3XS09q06vFZzbcACj/3vb2Fnn7MvFa8z6FuKhtsk5prSjSbCXM+cYxAQTF
	 2wH3wJgiUTdRisy6Q7oS9zJ7DlhhwyAAWUiz7QZ3284c3bfqvQjwv4p8qLZ0ev0FOX
	 l6ik0x5m1ZbdQ==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5cdc0b3526eso36463757b3.1
        for <linux-firmware@kernel.org>; Mon, 04 Dec 2023 05:09:16 -0800 (PST)
X-Gm-Message-State: AOJu0Yyzo2AiKwVMIgIvrzM2cM6JujZK2aHlOCYyzIVAXNYRlsVTpc4+
	hc+2rnP121MzWqdlI87MgYUrvzacez2BuOcDcZQ=
X-Google-Smtp-Source: AGHT+IFdA03VsHc9mkzkLi18rspXQV4a8CWM9+zhTgxaDf+z9wWlm1zE8rm30s40ZKjelYF/3R8GXm79ueA+yFLl4SA=
X-Received: by 2002:a81:4e90:0:b0:5d9:2d08:bf65 with SMTP id
 c138-20020a814e90000000b005d92d08bf65mr280272ywb.0.1701695355983; Mon, 04 Dec
 2023 05:09:15 -0800 (PST)
MIME-Version: 1.0
References: <ZWikFs6ZxaxyDMZc@chelsio.com>
In-Reply-To: <ZWikFs6ZxaxyDMZc@chelsio.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 4 Dec 2023 08:09:04 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5sZ5AmQjLU2f-LeYH4tK+8O=5Bg25BUMy7onn1Pt4TKA@mail.gmail.com>
Message-ID: <CA+5PVA5sZ5AmQjLU2f-LeYH4tK+8O=5Bg25BUMy7onn1Pt4TKA@mail.gmail.com>
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.27.5.0
To: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org, 
	ramaraju@chelsio.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 10:03=E2=80=AFAM Rahul Lakkireddy
<rahul.lakkireddy@chelsio.com> wrote:
>
> Please pull the new Chelsio firmware from the following URL.
>
>  http://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Rahul
>
>
> The following changes since commit 034e24b835d1f8b8e8266f766d610683aefe14=
c3:
>
>   Merge branch 's5p-mfc-v12' into 'main' (2023-11-29 17:05:38 +0000)
>
> are available in the Git repository at:
>
>   http://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> for you to fetch changes up to dbf82492ca9000ad794dc8fac6feda1179cd5216:
>
>   cxgb4: Update firmware to revision 1.27.5.0 (2023-11-30 14:11:49 +0000)

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/91

josh

>
> ----------------------------------------------------------------
> Rahul Lakkireddy (1):
>       cxgb4: Update firmware to revision 1.27.5.0
>
>  WHENCE                                         |  12 ++++++------
>  cxgb4/{t4fw-1.27.4.0.bin =3D> t4fw-1.27.5.0.bin} | Bin 570880 -> 570880 =
bytes
>  cxgb4/{t5fw-1.27.4.0.bin =3D> t5fw-1.27.5.0.bin} | Bin 678912 -> 678912 =
bytes
>  cxgb4/{t6fw-1.27.4.0.bin =3D> t6fw-1.27.5.0.bin} | Bin 730624 -> 730624 =
bytes
>  4 files changed, 6 insertions(+), 6 deletions(-)
>  rename cxgb4/{t4fw-1.27.4.0.bin =3D> t4fw-1.27.5.0.bin} (99%)
>  rename cxgb4/{t5fw-1.27.4.0.bin =3D> t5fw-1.27.5.0.bin} (59%)
>  rename cxgb4/{t6fw-1.27.4.0.bin =3D> t6fw-1.27.5.0.bin} (76%)
