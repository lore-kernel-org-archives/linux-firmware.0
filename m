Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A53C4332F
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Oct 2022 16:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3AA34C43470; Wed, 12 Oct 2022 16:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210F6C433D7
	for <linux-firmware@kernel.org>; Wed, 12 Oct 2022 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665593743;
	bh=eFyyUB4b1tnWofN0KicdTIR1EmulPG2jWsKOBNzZkKE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XjgXmiiMDUNDy3uymeAU9WeY+O9s79B+6cIj74sInumjr6Oj0fctApJpnTdaHryBZ
	 iYT8MC7svxEnqRPmslUFQw9ES0ZY0hDWAl95tvgzGK4bqENbsFTkTUqmf8XJeubntx
	 fsbdz8jNZ/844qzOo+8STVy88po75q7Z3zkC5oBonbqI7h8wdkw9+rFwuI9jZSJ3jA
	 uOMvVG8Zk/LZz8YOzqbSR7CpSGEbL41tawuwtQ1KEkt+XUy4AX9lZ7QrQZheyX3RxM
	 XH7Uy4aIykcQxlvj7OLIEOTodwBIKUz4+L5Dn3FhEIf9UAQRI7xEGteSuo54+i2YHD
	 BhbrBt0gyV6Eg==
Received: by mail-oi1-f176.google.com with SMTP id o64so19697748oib.12
        for <linux-firmware@kernel.org>; Wed, 12 Oct 2022 09:55:43 -0700 (PDT)
X-Gm-Message-State: ACrzQf2N3dcEjsUXLRHnNbmTFMhCmQDu9sUEZJuvscWQZut9UxB/E8mJ
	MLSVWffUup6T0GbiGSuuw/qhQndHUfZNSQ3LLSg=
X-Google-Smtp-Source: AMsMyM7EMB0v6jihrSB+5qG77gzueYhOKk3iyvbbLjuVjqkfAtRwt/ncAWcU1liv5Ye/5sgGV8V/O1K5JYvodsFUmj0=
X-Received: by 2002:a05:6808:bca:b0:350:b366:157 with SMTP id
 o10-20020a0568080bca00b00350b3660157mr2571521oik.3.1665593742238; Wed, 12 Oct
 2022 09:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PZyNbVCiWMK3t=3qrHNc4jnKvpu_ceJ+MxQ7q-Dx5Obg@mail.gmail.com>
In-Reply-To: <CADnq5_PZyNbVCiWMK3t=3qrHNc4jnKvpu_ceJ+MxQ7q-Dx5Obg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 12 Oct 2022 12:55:31 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7xZ8QfAg7OKHjVKq+2rkt4eQ-vG_Yh31buAPzUguLGrg@mail.gmail.com>
Message-ID: <CA+5PVA7xZ8QfAg7OKHjVKq+2rkt4eQ-vG_Yh31buAPzUguLGrg@mail.gmail.com>
Subject: Re: Updated amdgpu firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Hawking Zhang <Hawking.Zhang@amd.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.  Apologies for the delay.

josh

On Fri, Sep 30, 2022 at 6:51 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi Josh,
>
> Some updates for amdgpu.  Please apply!
>
> Thanks,
>
> Alex
