Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A001C432BE
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Sep 2021 13:01:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1D8A461074; Wed,  1 Sep 2021 13:01:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0580661059
	for <linux-firmware@kernel.org>; Wed,  1 Sep 2021 13:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630501300;
	bh=gVHAFRHp8U6X9JwYXHozwT8C3aO77HfaPkzxtAvzYY0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AFjTr5p3xu4a8URBmNCY1k8qwVhfAzeQuwCjcTVWolctUxZpVHgeThIm/bv9gVNEH
	 S8wNROu9iNfwxL/L0gBpWo89UQRWGrB+HIDoyHw9xtkicEOx9dgdPyLGgVGfoFVU85
	 2AU+jhqLo/2gKkrsf7RJn7EBTu0j/UlYQEfKfsgchjglWI74If59tNAVVzI+4yfIrc
	 GbVgB9ugtOeIzfmqEEMlJEMOzcstwS8JH8OESHSgViY2ozFUC4K0djlp5UgS2Z0dJ+
	 gAzY6Kv7xsZPDadRN019YaWF1AKPVAkFlyKKvMFotOuFHrtWsX0LqBB27aN20GGyJU
	 QtfZ6fnd2SOzw==
Received: by mail-il1-f169.google.com with SMTP id j15so3246388ila.1
        for <linux-firmware@kernel.org>; Wed, 01 Sep 2021 06:01:39 -0700 (PDT)
X-Gm-Message-State: AOAM533iFwgS5oJBosMOb9+sP9gw8ZIUz5k6gxU4SKA6z7ogN6rFbBrs
	K+MmvMP+KBejfE0jYPfl5h7aLsCZpWFKCJRgkwA=
X-Google-Smtp-Source: ABdhPJwzYWE/lHhCBHSsc02JJJJ+GL9nKOy8cPwyTQoZku7RkU2hojTne0OsWSn/8uAIUHY01w5XqXwwjqNKUgZRi0Q=
X-Received: by 2002:a05:6e02:1bab:: with SMTP id n11mr25173403ili.85.1630501299405;
 Wed, 01 Sep 2021 06:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <99e8d907c34295f3a00e052b2370ea19a29580df.camel@coelho.fi>
In-Reply-To: <99e8d907c34295f3a00e052b2370ea19a29580df.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 1 Sep 2021 09:00:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6R3=xMLDakfnPjfQ5ct2rzjut1y_8M3VOf1JC_oQ6fJw@mail.gmail.com>
Message-ID: <CA+5PVA6R3=xMLDakfnPjfQ5ct2rzjut1y_8M3VOf1JC_oQ6fJw@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2021-08-31
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Tue, Aug 31, 2021 at 6:18 AM Luca Coelho <luca@coelho.fi> wrote:
>
> Hi,
>
>
> This pull request contains a single patch that adds firmware binaries
> to support one more device in iwlwifi, So SOCs with Gf radio modules.
>
> Please pull or let me know if there are any issues.
>
> --
> Cheers,
> Luca.
>
>
> The following changes since commit 2e271f23ce4787b3598753f743bb75b8a2da3c61:
>
>   rtl_bt: Update RTL8852A BT USB firmware to 0xD9A9_127B (2021-08-30 19:27:58 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2021-08-31
>
> for you to fetch changes up to 1418f75c63fbc72de41aba61376ea30d199cd23e:
>
>   iwlwifi: add FW for new So/Gf device type (2021-08-31 12:30:18 +0300)
>
> ----------------------------------------------------------------
> Add iwlwifi firmwares for so-a0-gf-a0.
>
> ----------------------------------------------------------------
> Luca Coelho (1):
>       iwlwifi: add FW for new So/Gf device type
>
>  WHENCE                       |   5 +++++
>  iwlwifi-so-a0-gf-a0-64.ucode | Bin 0 -> 1515812 bytes
>  iwlwifi-so-a0-gf-a0.pnvm     | Bin 0 -> 41804 bytes
>  3 files changed, 5 insertions(+)
>  create mode 100644 iwlwifi-so-a0-gf-a0-64.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0.pnvm
>
