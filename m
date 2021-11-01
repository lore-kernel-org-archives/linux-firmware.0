Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54B8C433EF
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Nov 2021 14:43:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B04E3610FC; Mon,  1 Nov 2021 14:43:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AB4D610A0
	for <linux-firmware@kernel.org>; Mon,  1 Nov 2021 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635777801;
	bh=gK9UtRsYc4NkjBhRDgPOGcRSTu7GzGfr16e0tR3koCk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iQAJ/lvgV1ky7DmRWfUHwyG2qOgdFPw405sdCgjdS0jqUk3Zeh8o1xfWjRC2s7sA4
	 9F7k6wQRiWzLnbkDP/GW5cjn0QM29qtzU1fJ6fgjPgK8tgVxESIajGKGrDorru2s/r
	 WS0qnK10/XEwH7TQUwWojcZWej/GCsoMQ4gAvSLvNFzYYQgHNxqYNqo7c2UHrmA3Og
	 qcp/5B0xyoIWptPMAqVT5zcmEiQsNIbaAeE2wNjkbtx8ujOFWGOFbhdaCD3/0oF4Cr
	 GCq9mx9fVHCaMcEKIlJC4kwLT648Eoy+QWnz1XgVOdgRHruFyqFkc6xkY36r+SrY6D
	 nnLQ+01cLRPoA==
Received: by mail-io1-f50.google.com with SMTP id 62so14353207iou.2
        for <linux-firmware@kernel.org>; Mon, 01 Nov 2021 07:43:21 -0700 (PDT)
X-Gm-Message-State: AOAM531QfMEsjL3WBUTdHFByPEL7EAeNP9gGMik5/HIvokagZGYyH6jn
	NiD35eoKcVWSgzIdvshv7sehi2ger9TyObTSohA=
X-Google-Smtp-Source: ABdhPJyYIp+F3No2HmOWzWGXM85/XCA1MgFT2WGK1JxKzYHEYhhaQPg54TqO76Woh0NUOYQ9qbmSO/yYTE0oIyEA8t0=
X-Received: by 2002:a05:6638:1311:: with SMTP id r17mr20419875jad.76.1635777800944;
 Mon, 01 Nov 2021 07:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <19391a6dd10076e3a64aff20d68a9a37ac56e794.camel@coelho.fi>
In-Reply-To: <19391a6dd10076e3a64aff20d68a9a37ac56e794.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 1 Nov 2021 10:43:10 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4ai7fw9WWiQWaj50LoK8o0FUwh+D5x9HqhcKna0BBmLA@mail.gmail.com>
Message-ID: <CA+5PVA4ai7fw9WWiQWaj50LoK8o0FUwh+D5x9HqhcKna0BBmLA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2021-11-01
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com, 
	You-Sheng Yang <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 1, 2021 at 10:18 AM Luca Coelho <luca@coelho.fi> wrote:
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
> The following changes since commit b21eb2607f167408b780d1360431a93525e9f229:
>
>   amdgpu: update VCN firmware for green sardine (2021-10-28 10:07:10 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2021-11-01
>
> for you to fetch changes up to 4474519a1fd4e7167afae7c5ca2c1b93e17b4d8a:
>
>   iwlwifi: add new FWs from core64-96 release (2021-11-01 15:50:49 +0200)
>
> ----------------------------------------------------------------
> Update and add iwlwifi firmware binaries for release Core64-96.
>
> ----------------------------------------------------------------
> Luca Coelho (2):
>       iwlwifi: update 9000-family firmwares to core64-96
>       iwlwifi: add new FWs from core64-96 release

Pulled and pushed out.  Thanks.

josh

>
>  WHENCE                            |  21 +++++++++++++++++++--
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1514876 -> 1519264 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1485620 -> 1490096 bytes
>  iwlwifi-QuZ-a0-hr-b0-67.ucode     | Bin 0 -> 1347524 bytes
>  iwlwifi-cc-a0-67.ucode            | Bin 0 -> 1310488 bytes
>  iwlwifi-so-a0-gf-a0-67.ucode      | Bin 0 -> 1524432 bytes
>  iwlwifi-so-a0-gf-a0.pnvm          | Bin 41804 -> 41804 bytes
>  iwlwifi-so-a0-gf4-a0-67.ucode     | Bin 0 -> 1541932 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm         | Bin 0 -> 21576 bytes
>  iwlwifi-ty-a0-gf-a0-67.ucode      | Bin 0 -> 1482872 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 27480 -> 41612 bytes
>  11 files changed, 19 insertions(+), 2 deletions(-)
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-67.ucode
>  create mode 100644 iwlwifi-cc-a0-67.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0-67.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-67.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0.pnvm
>  create mode 100644 iwlwifi-ty-a0-gf-a0-67.ucode
>
