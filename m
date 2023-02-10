Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AEEC636D4
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Feb 2023 19:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89DE2C4339E; Fri, 10 Feb 2023 19:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7489CC433D2
	for <linux-firmware@kernel.org>; Fri, 10 Feb 2023 19:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676057597;
	bh=RYmEVmZBmfAtwjOh4PlB+cwOmH4kDIbl+ItCCD3ead4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Fd4e1LCeo+n/46WQln6yFnqgcRmocVAZ7cgPy4WhQpOnm8DaLQH0+j8IvAPLXxP0S
	 XFPM6yiJF8RxcwaiysomBvcdp+jKAAEnvf1eRpLEzPO+VcHmQmdT+P09MrxenytT7D
	 qk9vLZGuYvmflgBBgX28HKh5onmDp+SB/z72zKjZATbZ4i89v9mvgaa/MIm0t/c98N
	 T8GacJJ2oSie6px751hxenFmsnwv8aO8HEEJkg7jhHvwoqR8Rk+wHFJvZwuME+95Ph
	 yWgIj15EqO4MW9OPzwiDJxDhMqIF1vDZ2GQbfoTYcczBKvAkh5Ne7RJKczKrfXfPMV
	 sPd2QYAlb0M3w==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-52bed2ce9bdso81286137b3.13
        for <linux-firmware@kernel.org>; Fri, 10 Feb 2023 11:33:17 -0800 (PST)
X-Gm-Message-State: AO0yUKVVw0UFGzR14rhoaFVdKD5uYi5PZQwIcI8PnMy/PFoqzSeJQOR7
	PuJ4fb9d31DicBqtqasyCIcGjPMGhIRhOUZyYZM=
X-Google-Smtp-Source: AK7set87Eja7iDU3Qoab7OzEwkwq8WEhfMvEGwiRVmqVBnbU1ymTcMqJbhm9atb8VRoDG4qkWTFcl2UtAc1r3Tbhzxk=
X-Received: by 2002:a81:9304:0:b0:52e:e6ed:30a7 with SMTP id
 k4-20020a819304000000b0052ee6ed30a7mr35239ywg.551.1676057596543; Fri, 10 Feb
 2023 11:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20230207140320.5xydvcqvkl6eiidc@gjsousa-mobl2>
In-Reply-To: <20230207140320.5xydvcqvkl6eiidc@gjsousa-mobl2>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Feb 2023 14:33:05 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5jpyDyKUWe68yGBxY1ztRj4NXL+tAexWWxQ-nC1abJww@mail.gmail.com>
Message-ID: <CA+5PVA5jpyDyKUWe68yGBxY1ztRj4NXL+tAexWWxQ-nC1abJww@mail.gmail.com>
Subject: Re: PR for MTL DMC v2.11
To: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kyle@mcmartin.ca, ben@decadent.org.uk, 
	intel-gfx@lists.freedesktop.org, Anusha Srivatsa <anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 7, 2023 at 9:07 AM Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>
> The following changes since commit 5c11a3742947810ee8bffbd476eb5a1b0c7999f2:
>
>   amdgpu: Add VCN 4.0.2 firmware (2023-01-25 07:40:41 -0500)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware dmc-mtl_2.11

Pulled and pushed out.

josh

>
> for you to fetch changes up to c1181ae796970b6b48218bd2bdb9392fab0e070f:
>
>   i915: Add DMC v2.11 for MTL (2023-02-07 09:13:10 -0300)
>
> ----------------------------------------------------------------
> Gustavo Sousa (1):
>       i915: Add DMC v2.11 for MTL
>
>  WHENCE           |   3 +++
>  i915/mtl_dmc.bin | Bin 0 -> 48512 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 i915/mtl_dmc.bin
