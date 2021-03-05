Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3950C433E0
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Mar 2021 13:18:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9509764FF0; Fri,  5 Mar 2021 13:18:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7360364FD4
	for <linux-firmware@kernel.org>; Fri,  5 Mar 2021 13:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614950324;
	bh=zEQcrNa+pwkuYnmBEFNVSQ/tisHBPDMSvkGW+I+SS/M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UFitIzOK3QNRRSc0meAbBT1wV+CEVAywg8/VtbOozy1wn6mWcmNLB313zKRsIU3pT
	 xJpKnokMEp/k2BsI+KMhTo4MDu2p50kfRpHOaa3NWKxdMY4JzMI2dzR2eVnnfPKWus
	 UdQ6N/2tHGO8FVW17bOA49rWOSCnjX6+I+Jfx2wrr6Bquybw/iNr3NY7lcdqV3tuk7
	 jy+yJtpGHURJd2E4jQp8ABMLDBmzXqrN3b3sA6pNVzveTHcbUPrbMpcsqIHYLnOG4u
	 QdZfmUva8AIZ46r7LmtaGnPADahRKp7aSPBxJ2sbCSBynsuBVUBAgJ6Uv9It689orw
	 dp7IYK/rSwIIg==
Received: by mail-io1-f53.google.com with SMTP id u8so1906159ior.13
        for <linux-firmware@kernel.org>; Fri, 05 Mar 2021 05:18:44 -0800 (PST)
X-Gm-Message-State: AOAM5310qyQurERDjRBYf+0x3pqDmFu7iTnBTHdWvi+kzQmzTptTYIkO
	C7CQjAc0BOwlLw7qUuwaNY9sPbsGqMN00TtGsCQ=
X-Google-Smtp-Source: ABdhPJwjvId3H0cXMiwcRZpA+C/xEF+4kk4B6lEbw1iDkPeWWaAiYMrXArMdEEskMNfDHpbBjvb7tqur5EYLGEjEeDk=
X-Received: by 2002:a5d:9d01:: with SMTP id j1mr8222635ioj.195.1614950323886;
 Fri, 05 Mar 2021 05:18:43 -0800 (PST)
MIME-Version: 1.0
References: <3f941262db82a01ff00dbdb405cc315ee4dec480.camel@coelho.fi>
In-Reply-To: <3f941262db82a01ff00dbdb405cc315ee4dec480.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 5 Mar 2021 08:18:32 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5Zpua+JEg+sTj6GjYwejZxLxfgn2YaZgZQP3fwTQochA@mail.gmail.com>
Message-ID: <CA+5PVA5Zpua+JEg+sTj6GjYwejZxLxfgn2YaZgZQP3fwTQochA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2021-03-05
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 5, 2021 at 6:01 AM Luca Coelho <luca@coelho.fi> wrote:
>
> Hi,
>
> This contains some new and updated firmwares for all our currently
> maintained FW binaries.
>
> Please pull or let me know if there are any issues.
>
> --
> Cheers,
> Luca.
>
>
> The following changes since commit 5ecd13ffe8e24385cf4f30f3d0dcaff4dfb24de2:
>
>   Mellanox: Add new mlxsw_spectrum firmware xx.2008.2406 (2021-03-03 13:23:49 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-firmware.git iwlwifi-fw-2021-03-05

[jwboyer@vader linux-firmware]$ git fetch
git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-firmware.git
iwlwifi-fw-2021-03-05
fatal: remote error: access denied or repository not exported:
/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-firmware
[jwboyer@vader linux-firmware]$

I'm going to assume you meant:
git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git
iwlwifi-fw-2021-03-05

When I pull that, it fails check_whence

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: iwlwifi-Qu-b0-hr-b0-62.ucode not listed in WHENCE
E: iwlwifi-Qu-b0-jf-b0-62.ucode not listed in WHENCE
E: iwlwifi-Qu-c0-hr-b0-62.ucode not listed in WHENCE
E: iwlwifi-Qu-c0-jf-b0-62.ucode not listed in WHENCE
E: iwlwifi-QuZ-a0-hr-b0-62.ucode not listed in WHENCE
E: iwlwifi-QuZ-a0-jf-b0-62.ucode not listed in WHENCE
E: iwlwifi-cc-a0-62.ucode not listed in WHENCE
E: iwlwifi-ty-a0-gf-a0-62.ucode not listed in WHENCE
[jwboyer@vader linux-firmware]$

Can you fix that up please?

josh

>
> for you to fetch changes up to 568016467deab716b8a382bf087209b781d4bca7:
>
>   iwlwifi: add new FWs from core59-66 release (2021-03-05 12:18:25 +0200)
>
> ----------------------------------------------------------------
> Update iwlwifi firmwares to Core59-66
>
> ----------------------------------------------------------------
> Luca Coelho (3):
>       iwlwifi: update 7265D firmware
>       iwlwifi: update 9000-family firmwares
>       iwlwifi: add new FWs from core59-66 release
>
>  WHENCE                            |  34 +++++++++++++++++++++++++++++++++-
>  iwlwifi-7265D-29.ucode            | Bin 1036444 -> 1036772 bytes
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1512096 -> 1514240 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1483116 -> 1485556 bytes
>  iwlwifi-Qu-b0-hr-b0-62.ucode      | Bin 0 -> 1329296 bytes
>  iwlwifi-Qu-b0-jf-b0-62.ucode      | Bin 0 -> 1248672 bytes
>  iwlwifi-Qu-c0-hr-b0-62.ucode      | Bin 0 -> 1329312 bytes
>  iwlwifi-Qu-c0-jf-b0-62.ucode      | Bin 0 -> 1248688 bytes
>  iwlwifi-QuZ-a0-hr-b0-62.ucode     | Bin 0 -> 1328924 bytes
>  iwlwifi-QuZ-a0-jf-b0-62.ucode     | Bin 0 -> 1248672 bytes
>  iwlwifi-cc-a0-62.ucode            | Bin 0 -> 1292672 bytes
>  iwlwifi-ty-a0-gf-a0-62.ucode      | Bin 0 -> 1455104 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 0 -> 27456 bytes
>  13 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-62.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-62.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-62.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-62.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-62.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-62.ucode
>  create mode 100644 iwlwifi-cc-a0-62.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-62.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0.pnvm
>
