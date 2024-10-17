Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7249D37485
	for <linux-firmware@archiver.kernel.org>; Thu, 17 Oct 2024 12:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B88BC4CECD; Thu, 17 Oct 2024 12:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652E6C4CEC7
	for <linux-firmware@kernel.org>; Thu, 17 Oct 2024 12:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729169364;
	bh=POGnb0H0VGq5Z926vXAAUZ+cAPAV8dTicvqoLV2d0gk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kwd8T6kWeThp2WOLvXx/zQj6fMsJD9iiY/s2oR/mKghsRnKW8Ny//iPPAitMLIaEr
	 5il/ptjxqPvG8/Tq6z2/na++vc+hPFH9FUOH9ux++YaoxhxV13VodwCVE52lB5bxfi
	 7kz500bGsjqsBsefxo1JM7OuHqxCgxmT5CZei8U+Ur4l9B2z4PPRpMK479UaHXtL2F
	 lnEPE5CH43N02+IQ/ydcGhWqJsU7vqTKHVFEPU09tGnjtW3oRd4D9PaPy/ftR1PLkz
	 FMPX6Bkr75oBR8MiiZZQyoYebaihtih7QPOVHfE99KpFjrI3vflJmeoq1Nm/D0xoi9
	 XTZphpn3ARTyw==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e35bf59cf6so19899587b3.0
        for <linux-firmware@kernel.org>; Thu, 17 Oct 2024 05:49:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQFr1KZGL/h1MC4BYdTJOf1WWgAs1YrqoRWeHpf7jg0EX+oXdVUnLp/330Tu5R3xZ5nFZrmxcLcnu1E4c91A==@kernel.org
X-Gm-Message-State: AOJu0YxUuRrwZasW0J5/vu/6EsnaCCM1c6926g4g2a8vsZPP16+3nBY9
	+9jhzfQi3WSJad2Z/LYmOtEMWBqf9BN6P6/Cm3I+gtQ21ftuNSUuFPOmid+Mks4WWflyxYQgHh0
	mZaZ4FBOSBsLkt7SlE54Jn9b5KQ0=
X-Google-Smtp-Source: AGHT+IEIsRINLrjCJSwg0aiCuQ99rkRpN72S9FT+zkS2Ic8v2O56g7Z/Z2WysHWhbFGWNfdr8j1qgSTSJ8pbCz2RCNw=
X-Received: by 2002:a05:690c:c19:b0:6bf:1ca2:f6ce with SMTP id
 00721157ae682-6e5a3d9bb1bmr27598037b3.11.1729169363653; Thu, 17 Oct 2024
 05:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20241016121544.5557-1-zenmchen@gmail.com> <CA+5PVA6gOcu611LcLzv47ZPwe-AtUb+GN2K-zK_84eMfk7Yc6A@mail.gmail.com>
 <8f3ebe73a46e4bf3b1b9eeb74bbc305a@realtek.com>
In-Reply-To: <8f3ebe73a46e4bf3b1b9eeb74bbc305a@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 17 Oct 2024 08:49:12 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4c+5oow0qhXe9wkbkQtzaDW2y8raQYnPP0G_wUesSicQ@mail.gmail.com>
Message-ID: <CA+5PVA4c+5oow0qhXe9wkbkQtzaDW2y8raQYnPP0G_wUesSicQ@mail.gmail.com>
Subject: Re: [PATCH] rtlwifi: Update firmware for RTL8192FU to v7.3
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Zenm Chen <zenmchen@gmail.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 8:36=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Josh Boyer <jwboyer@kernel.org> wrote:
> >
> > Ping-Ke, can we get an Acked-by for this?
> >
>
> Confirmed with released package, so
>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/333

>
> By the way, it seems you missed a pull-request [1] days ago.
> If not, sorry for the ping.
>
> [1] https://lore.kernel.org/linux-firmware/2e2e7eac86db45e8a1980021c7a398=
3d@realtek.com/T/#u

I replied on that thread.

josh
