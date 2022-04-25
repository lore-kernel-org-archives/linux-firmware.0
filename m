Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F41CC433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Apr 2022 11:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0AB7C385AE; Mon, 25 Apr 2022 11:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA783C385AB
	for <linux-firmware@kernel.org>; Mon, 25 Apr 2022 11:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650886614;
	bh=vUMWx7tc3UVXCj40AWL9uOh5Im7AawIkqrmY3mN5O9k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lxkmecYi+WbTG3TQs9/G1L+qkXd4I0QV8ohz89wb0npeZi7MNbTT7XcLXn8PJf8rM
	 R+1LrlCQNYp5xMq7jWtg47Hjzfl6VWYPWzsecO+gG8AXC2RTpyOxPsw6HIg39B9YFw
	 jYA2bUgx9veodaeYKBQqltqJhc0AM7iSC4ANPBU0PA52ayr/ZJfb6lB7y5N0JjZQJD
	 RrzSe4eyFXsT+sKqLkPj2jS9DaySPwU+RM0w7CwUQVDBe3Z3j3S81K9GuJYzblh99L
	 vgZub/4v6P3u9PquSHp3yFKUedtym5pi7jlasSKiZanP0XjToemZLgECByc8UKCjmM
	 vbf0UchNeYhSw==
Received: by mail-il1-f169.google.com with SMTP id y16so9116678ilc.7
        for <linux-firmware@kernel.org>; Mon, 25 Apr 2022 04:36:54 -0700 (PDT)
X-Gm-Message-State: AOAM530Y2sW1raeQjuqm8zznjRK5qwZsKV2guHjKlUvQAF/tdwKYESFe
	GCModUSTSQ57lKSHePK4RUrIxlF+FyaYZebRBIk=
X-Google-Smtp-Source: ABdhPJzSsvdc8eWLo0RVHjo1/H65KU+SMTjbjWArNgAgjjvr0eSGKo+3XHrlYyh8uZCT+NjEiDbqC4QhwxrCbIw++5I=
X-Received: by 2002:a05:6e02:1aa1:b0:2cd:a26b:a8b8 with SMTP id
 l1-20020a056e021aa100b002cda26ba8b8mr692413ilv.218.1650886613775; Mon, 25 Apr
 2022 04:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1650613831.git.petrm@nvidia.com>
In-Reply-To: <cover.1650613831.git.petrm@nvidia.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 25 Apr 2022 07:36:43 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4goW4LdBbbWLrfo40Yfb1strOTZQKNG=3a4eE-KwxCig@mail.gmail.com>
Message-ID: <CA+5PVA4goW4LdBbbWLrfo40Yfb1strOTZQKNG=3a4eE-KwxCig@mail.gmail.com>
Subject: Re: [PATCH linux-firmware 0/2] Mellanox: lc_ini_bundle updates
To: Petr Machata <petrm@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Ido Schimmel <idosch@nvidia.com>, mlxsw@nvidia.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 3:54 AM Petr Machata <petrm@nvidia.com> wrote:
>
> In patch #1, repackage the existing lc_ini_bundle sans xz compression.
>
> In patch #2, contribute an additional lc_ini_bundle for the minimum
> required FW version, XX.2010.1006.
>
> Petr Machata (2):
>   Mellanox: xx.2010.1502: Distribute non-xz-compressed lc_ini_bundle
>   Mellanox: Add lc_ini_bundle for xx.2010.1006

Both applied and pushed out.

josh

>
>  WHENCE                                  |   3 ++-
>  mellanox/lc_ini_bundle_2010_1006.bin    | Bin 0 -> 12300 bytes
>  mellanox/lc_ini_bundle_2010_1502.bin    | Bin 0 -> 12300 bytes
>  mellanox/lc_ini_bundle_2010_1502.bin.xz | Bin 632 -> 0 bytes
>  4 files changed, 2 insertions(+), 1 deletion(-)
>  create mode 100644 mellanox/lc_ini_bundle_2010_1006.bin
>  create mode 100644 mellanox/lc_ini_bundle_2010_1502.bin
>  delete mode 100644 mellanox/lc_ini_bundle_2010_1502.bin.xz
>
> --
> 2.31.1
>
