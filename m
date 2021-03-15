Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D8CC433E0
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Mar 2021 11:47:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 279BB64ED2; Mon, 15 Mar 2021 11:47:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 045EF61601
	for <linux-firmware@kernel.org>; Mon, 15 Mar 2021 11:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615808826;
	bh=wvr6bs806HxMAp1yTIA5pwJZLbn11pi1nLNJqWk+OdU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VQSTOrh6ekJnpkqg7/UlQn0/hZXxJci+/P6KYwSOo4F2TC3fcblT517BKh69eMrc5
	 xFiOVS+iTGb2TwbAwweFu8uUk3QCmTsQNfaEupzr49RfEHPV5zbKCaTGb+guo5InbT
	 bILzAlYNYWMlNSoFC9/g0rVZHSUMIn6+njVozFan8iPmynJgZ+J1D6uylTGxhK3Z7p
	 DdoI6OGoeDVHLIKHejjGoRF8rwgrXQxaKLPpAHiwJMwi8EftlsNK2cBtNJRG/8m1i8
	 XQrVoPjt9fcTLaRQL/QTfPICg3C+URi4O1cTo7rPhXlI1fgZ1+jdP1+9yY6b85Rs0y
	 cuo0ttJaYRQnA==
Received: by mail-il1-f178.google.com with SMTP id e7so9009475ile.7
        for <linux-firmware@kernel.org>; Mon, 15 Mar 2021 04:47:05 -0700 (PDT)
X-Gm-Message-State: AOAM5309mO73Lkr7FWpaGbeMrlB1o3ROK9XK+0rgFuXRi/87yBxr47X6
	VwSR8f7lZNdOUEULLVh071tdTcXIw28HP1NHjxM=
X-Google-Smtp-Source: ABdhPJxcdGeGW0OfeR8pwsQ40Su/wv7vB2FZ5ZXaD+PATKafRw2QnNtZsJ5Nw+3yUksu/oIJhEhm7eZtnp8yqXTVkLg=
X-Received: by 2002:a92:d0c3:: with SMTP id y3mr10936130ila.303.1615808825358;
 Mon, 15 Mar 2021 04:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <fd69b57a71eb6a86f857d7b46c0b79dfc39c97cd.camel@coelho.fi>
In-Reply-To: <fd69b57a71eb6a86f857d7b46c0b79dfc39c97cd.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 Mar 2021 07:46:54 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5CR=8t3HM23vdu6ttX9BWGMuukyTH++p+P+pBQ1F3aqA@mail.gmail.com>
Message-ID: <CA+5PVA5CR=8t3HM23vdu6ttX9BWGMuukyTH++p+P+pBQ1F3aqA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2021-03-05-v3
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, tmb@tmb.nu, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 5:27 AM Luca Coelho <luca@coelho.fi> wrote:
>
> Hi,
>
> This is v3 of my update which contains some new and updated files for
> all our currently maintained FW binaries.
>
> In v3:
>    * Fixed a few more issues in the WHENCE file
>    * Reset the author dates to avoid confusion
>
> In v2:
>
>    * Fixed WHENCE so that the new files match, with "62" instead of
>    "59"
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
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-firmware.git iwlwifi-fw-2021-03-05-v3

Still the wrong tree URL, but I pulled
git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git
iwlwifi-fw-2021-03-05-v3 and pushed it out.

josh

>
> for you to fetch changes up to 5a2fd63596125d4ed5ac65614b1811b2d4a68536:
>
>   iwlwifi: add new FWs from core59-66 release (2021-03-10 12:23:21 +0200)
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
>  WHENCE                            |  32 +++++++++++++++++++++++++++++---
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
>  13 files changed, 29 insertions(+), 3 deletions(-)
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
