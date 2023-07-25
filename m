Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37126C0015E
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Jul 2023 10:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8D9DC433CA; Tue, 25 Jul 2023 10:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D09C433C7
	for <linux-firmware@kernel.org>; Tue, 25 Jul 2023 10:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690282452;
	bh=9ZCTpfFj0NevwdomscNycY3DyRTqc3WD5936Fp8iCpM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kzFsZ0oMYHAQ7MRC9wQqInBdc06aY58lwQL7m/wO2xJu+wKaRN1bhx3I0cS86oQXt
	 fvglbcLCfuSKE2XRUnFxDI2F3z9bvaCuHNNMPuRtLEHoUVlE5js5oCITzwJVjj0WEm
	 AfSwl9OuDkZrc2r1m+6039cMy9ChzmcFF9IOmegPUamTw47GDLAwdSkXxqPdXQK6SB
	 7bL/Ox+Np+FXbKcKtWOwpS0de5IQbVdwL4E9BmonDhjw92u78bBbxo+1+c7CjYudBw
	 v7ldGQO8J5Fa3NzYsQupdNeFBj/EE9n2SD8Q9KI3coqH7VcJYbopeFcoiM2bvKQ1cE
	 py8VXat5i4AZw==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-583b019f1cbso39463037b3.3
        for <linux-firmware@kernel.org>; Tue, 25 Jul 2023 03:54:12 -0700 (PDT)
X-Gm-Message-State: ABy/qLbwgJaqVr+PhPwFflBr6DhI1fasXbDKL3EXMaxtKw6XV3tyAdSl
	RgrRRH2H6oF2N3f1Q65wwc6LdYSg1eKAut3weVo=
X-Google-Smtp-Source: APBJJlFv4BjP9nLBWE9ZdWjVgbisVBK7xTvEbf1F1z5ROKA6hkr9FPBKA+wZiq3sSG4OAh48guFGr2tgzVJDoAe8UPA=
X-Received: by 2002:a25:c588:0:b0:d0e:ff07:1277 with SMTP id
 v130-20020a25c588000000b00d0eff071277mr5356333ybe.1.1690282451872; Tue, 25
 Jul 2023 03:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <1addfae3b9a376ebbf39c0d05642394ebcfb9ee9.camel@canonical.com>
In-Reply-To: <1addfae3b9a376ebbf39c0d05642394ebcfb9ee9.camel@canonical.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 25 Jul 2023 06:54:01 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5pNe=jDbYQr5c_dfq+w47iDhEjpA5CfxiYpOBtZpkGMQ@mail.gmail.com>
Message-ID: <CA+5PVA5pNe=jDbYQr5c_dfq+w47iDhEjpA5CfxiYpOBtZpkGMQ@mail.gmail.com>
Subject: Re: [PATCH] copy-firmware: Fix test: unexpected operator
To: Benjamin Drung <benjamin.drung@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Tue, Jul 18, 2023 at 7:29=E2=80=AFAM Benjamin Drung
<benjamin.drung@canonical.com> wrote:
>
> dash is the default /bin/sh on Debian based system.
>
> ```
> dash ./copy-firmware.sh --zstd example
> ./copy-firmware.sh: 37: test: unexpected operator
> ```
>
> `=3D` should be used with the test command for POSIX conformance.
>
> --
> Benjamin Drung
> Debian & Ubuntu Developer
