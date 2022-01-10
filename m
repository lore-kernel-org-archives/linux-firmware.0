Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C66C433F5
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Jan 2022 17:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37216C36AF4; Mon, 10 Jan 2022 17:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E39C36AE9
	for <linux-firmware@kernel.org>; Mon, 10 Jan 2022 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641835510;
	bh=pDx4uNDXv/SWD5uzVfR3YhyTf+ttE312AXa2Kl7cTGM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=d9nR+ngcrVoh1GEmITyAYNLPp5qMN08BH8udAgT8IL0yLVnFcjVgsOgZkG5oFwiiJ
	 hDYWMLBs0MKQH0CuZF7Nx4+LxZNu4VqcuH/RzpSERT0rdMp/u86mbHPvnTdFDaza7t
	 a1QKT+yjnCLWZMI5XO0O2K0Zb3tl5tm4C0QH2KGJ+YnRMNqLwNgcuDt2vgM7s700Oh
	 tqVczJX7EmFNXgEYwRnN7SYMZuvGD+jgoebahUm4w/jOspQP5LS3sCbcQiHyEtMJHx
	 YtsupUTwikMHDnGkXNtgrBKRPr1JQ1e8+jCx75WLRPYvqug3ZFkP0IcIE8roIErCWB
	 +FD+eJYyCt1OA==
Received: by mail-il1-f171.google.com with SMTP id h30so2081355ila.12
        for <linux-firmware@kernel.org>; Mon, 10 Jan 2022 09:25:10 -0800 (PST)
X-Gm-Message-State: AOAM532rbNx58KHNuMII8ZksMcNTWabWNrKS94ZiIQU7rI37xlD4YSLz
	h1xyFETejl0vjq1sdNlOzWaL6ZNpg0Ijqc6JlYg=
X-Google-Smtp-Source: ABdhPJznUNaVyXOVjpU2nM6g8yJ0yn4OLRl3ko/KypLOo0vFwYwfyS7BMzJ4rlTQk3HUugeamzeI+SEMogQ7X+gxOBg=
X-Received: by 2002:a92:da07:: with SMTP id z7mr401701ilm.2.1641835509328;
 Mon, 10 Jan 2022 09:25:09 -0800 (PST)
MIME-Version: 1.0
References: <ea02828f6ebb5d8e3cd6b8a84aeeb2951d065207.camel@coelho.fi>
In-Reply-To: <ea02828f6ebb5d8e3cd6b8a84aeeb2951d065207.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 10 Jan 2022 12:24:58 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4+C06cNCDtzue4nUT4zFQPbc_2n4K6BnX4SrFSEFYK+w@mail.gmail.com>
Message-ID: <CA+5PVA4+C06cNCDtzue4nUT4zFQPbc_2n4K6BnX4SrFSEFYK+w@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2022-01-10
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com, 
	You-Sheng Yang <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 7:45 AM Luca Coelho <luca@coelho.fi> wrote:
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
> The following changes since commit 182a186c570baab3968ca9116ee58b1875fb0168:
>
>   Merge branch 'for-upstream' of git://git.chelsio.net/pub/git/linux-firmware into main (2022-01-07 07:20:18 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2022-01-10
>
> for you to fetch changes up to 8d8c6e9d9eb5402295c434603007377487458fef:
>
>   iwlwifi: add new FWs from core66-88 release (2022-01-10 14:37:12 +0200)
>
> ----------------------------------------------------------------
> Update and add iwlwifi firmware binaries for release Core66-88
>
> ----------------------------------------------------------------
> Luca Coelho (2):
>       iwlwifi: update 9000-family firmwares to core66-88
>       iwlwifi: add new FWs from core66-88 release
>
>  WHENCE                            |  44 ++++++++++++++++++++++++++++++++++++++++++--
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1519264 -> 1519544 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1490096 -> 1490376 bytes
>  iwlwifi-Qu-b0-hr-b0-68.ucode      | Bin 0 -> 1355836 bytes
>  iwlwifi-Qu-b0-jf-b0-68.ucode      | Bin 0 -> 1275268 bytes
>  iwlwifi-Qu-c0-hr-b0-68.ucode      | Bin 0 -> 1355852 bytes
>  iwlwifi-Qu-c0-jf-b0-68.ucode      | Bin 0 -> 1275284 bytes
>  iwlwifi-QuZ-a0-hr-b0-68.ucode     | Bin 0 -> 1355800 bytes
>  iwlwifi-QuZ-a0-jf-b0-68.ucode     | Bin 0 -> 1275264 bytes
>  iwlwifi-cc-a0-68.ucode            | Bin 0 -> 1314392 bytes
>  iwlwifi-so-a0-gf-a0-68.ucode      | Bin 0 -> 1533812 bytes
>  iwlwifi-so-a0-gf-a0.pnvm          | Bin 41804 -> 41808 bytes
>  iwlwifi-so-a0-gf4-a0-68.ucode     | Bin 0 -> 1552216 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm         | Bin 21576 -> 21576 bytes
>  iwlwifi-so-a0-hr-b0-68.ucode      | Bin 0 -> 1429192 bytes
>  iwlwifi-so-a0-jf-b0-68.ucode      | Bin 0 -> 1378284 bytes
>  iwlwifi-ty-a0-gf-a0-68.ucode      | Bin 0 -> 1494304 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 41612 -> 41588 bytes


[jwboyer@vader linux-firmware]$ ./check_whence.py
E: iwlwifi-s0-a0-gf-a0.pnvm listed in WHENCE does not exist
E: iwlwifi-s0-a0-gf4-a0.pnvm listed in WHENCE does not exist
[jwboyer@vader linux-firmware]$

I think you added files with "...-so-a0-gf..." as the name, but added
them to WHENCE as "...s0-a0-gf..." (letter o vs. number 0).

Can you fix this up?

josh

>  18 files changed, 42 insertions(+), 2 deletions(-)
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-68.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-68.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-68.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-68.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-68.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-68.ucode
>  create mode 100644 iwlwifi-cc-a0-68.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0-68.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-68.ucode
>  create mode 100644 iwlwifi-so-a0-hr-b0-68.ucode
>  create mode 100644 iwlwifi-so-a0-jf-b0-68.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-68.ucode
>
