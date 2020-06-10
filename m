Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CDAC433E1
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Jun 2020 12:24:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 37C8E20853; Wed, 10 Jun 2020 12:24:13 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1650F20734
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2020 12:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591791853;
	bh=+Ippmnj/cUNN1KBGOsZDYxyM+3prrjz2Twj30BGgDV8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LhmeSyKavSu7LnuufszckaLKT6fHuYL4pyACLhlAG9xMnMpxjocz8He5m+OZEq5QN
	 OMkM3gPBtidDPZ17jE8tx0wQgAR407bRjnMHqHvudMkmN/QDiMhm3ya2n+bOD4fwOE
	 Hm1eO0N9ICV5yWNzJjb8humggqXX1I14f+oTrBo0=
Received: by mail-io1-f46.google.com with SMTP id q8so1908825iow.7
        for <linux-firmware@kernel.org>; Wed, 10 Jun 2020 05:24:13 -0700 (PDT)
X-Gm-Message-State: AOAM531NjP0CAFkaOlU7vma3W+3VxyarawE8Pso3caEprPBy6CWdZyBU
	/MEPdq28MCSNRF6Q9tc/ybrW+oEJnfx3F2kOaCk=
X-Google-Smtp-Source: ABdhPJyc1EDp6vIaQMzhCJxwG6n3iE+pOfSWjxWIdIvaxdBdDdIIyS8eu98NiJ74yLnnl51Yiht/Jdvy6oMwumckD+M=
X-Received: by 2002:a02:c004:: with SMTP id y4mr2777642jai.81.1591791852591;
 Wed, 10 Jun 2020 05:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200528150431.GC13898@plvision.eu>
In-Reply-To: <20200528150431.GC13898@plvision.eu>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 10 Jun 2020 08:24:01 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5UmoRKC9UWj9hBhFWAc1FUUzB9wncFrGi7Ua0N-eXp5A@mail.gmail.com>
Message-ID: <CA+5PVA5UmoRKC9UWj9hBhFWAc1FUUzB9wncFrGi7Ua0N-eXp5A@mail.gmail.com>
Subject: Re: pull: mrvl: add firmware for Prestera ASIC devices
To: Vadym Kochan <vadym.kochan@plvision.eu>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, netdev <netdev@vger.kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
	Oleksandr Mazur <oleksandr.mazur@plvision.eu>, Serhiy Boiko <serhiy.boiko@plvision.eu>, 
	Serhiy Pshyk <serhiy.pshyk@plvision.eu>, Volodymyr Mytnyk <volodymyr.mytnyk@plvision.eu>, 
	Taras Chornyi <taras.chornyi@plvision.eu>, Andrii Savka <andrii.savka@plvision.eu>, 
	Mickey Rachamim <mickeyr@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jiri Pirko <jiri@mellanox.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 28, 2020 at 11:04 AM Vadym Kochan <vadym.kochan@plvision.eu> wrote:
>
> The following changes since commit 8ba6fa665c52093ddc0d81137fc3c82cee2c5ef8:
>
>   Merge tag 'iwlwifi-fw-2020-05-19' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware (2020-05-19 07:28:12 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/PLVision/linux-firmware.git mrvl-prestera
>
> for you to fetch changes up to 561100014bb60b17c070aaa5449ee9970afa6620:
>
>   mrvl: add firmware for Prestera ASIC devices (2020-05-28 14:07:49 +0300)
>
> ----------------------------------------------------------------
> Vadym Kochan (1):
>       mrvl: add firmware for Prestera ASIC devices

Pulled and pushed out.

josh

>
>  WHENCE                                  |   8 ++++++++
>  mrvl/prestera/mvsw_prestera_fw-v2.0.img | Bin 0 -> 13687252 bytes
>  2 files changed, 8 insertions(+)
>  create mode 100755 mrvl/prestera/mvsw_prestera_fw-v2.0.img
