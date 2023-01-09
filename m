Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B952FC54EBD
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Jan 2023 14:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 726B8C433D2; Mon,  9 Jan 2023 14:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE8EC433F0
	for <linux-firmware@kernel.org>; Mon,  9 Jan 2023 14:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673273635;
	bh=OXpYyFzouV2c4oBb5fBkR/MUw3zc7LAwhfUcZTvOnlY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NSplOVSr179wEksC+IKyAzGrIGgOTbG0+5UFoHgbkg+aECQrKApAjw3w81tgGBvKw
	 /2r1PGQt/b97bYqkJCsv0HQs2vGsiRM0foGVWnDenv/pi/u8Ex1r1bdsld3jIgNDlM
	 BOJ/zCGz6a/z4anQyIzUXBUNHccAexzz5ggLBeYtf11Q7eqnVepmvjy0mmFl8l5/Df
	 SY7pVIyx376OXtCtwl2EGmAwLulOjNeDWaXkEWD9G71UZs4ZkBVIvQG0GtZN5YVoAu
	 IBzIA+Wc9GgWoyr/58+ZW4JsaFBhjR8cqhK+c/52n65PuoB1MDtkhzuOSMtVnuSTs4
	 nbBgYQPZ0wRCw==
Received: by mail-yb1-f169.google.com with SMTP id e21so8629781ybb.3
        for <linux-firmware@kernel.org>; Mon, 09 Jan 2023 06:13:55 -0800 (PST)
X-Gm-Message-State: AFqh2kpR4IeoipI7jdBl9G5VAXu7HfcstMkFAMisdRXrHgZfatY05YAP
	5ehGByUXNM2BwyU+9N6FKafe25fTJwAjwral/vg=
X-Google-Smtp-Source: AMrXdXuS44PtVqFM0CFPSHAkG7kRSNH8+D1Al6NOSoSZKJ4Bb560fGbYRw/HZlutahf4nNfSV5cudiySMFvfJ1m/QVM=
X-Received: by 2002:a25:4bc4:0:b0:794:4ff7:1111 with SMTP id
 y187-20020a254bc4000000b007944ff71111mr2991128yba.603.1673273634427; Mon, 09
 Jan 2023 06:13:54 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_O__Bam0Qz4J7dNO=stmgpAV8d0GAA2ezja=eNz7_FB2g@mail.gmail.com>
In-Reply-To: <CADnq5_O__Bam0Qz4J7dNO=stmgpAV8d0GAA2ezja=eNz7_FB2g@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 9 Jan 2023 09:13:43 -0500
X-Gmail-Original-Message-ID: <CA+5PVA51PULd1+1cPwUhCZeCRC3ZpCHRidQraywLhxB72jZyZw@mail.gmail.com>
Message-ID: <CA+5PVA51PULd1+1cPwUhCZeCRC3ZpCHRidQraywLhxB72jZyZw@mail.gmail.com>
Subject: Re: Updated amdgpu firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.  Thanks.

josh

On Fri, Jan 6, 2023 at 11:35 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Updated amdgpu firmware for renoir.  Please apply!
>
> Thanks,
>
> Alex
