Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB728C07E9B
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Jul 2021 18:36:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9A15A61029; Mon, 19 Jul 2021 18:36:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8454E61009
	for <linux-firmware@kernel.org>; Mon, 19 Jul 2021 18:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626719803;
	bh=U4iFIW4H1icJ3q4m/sjSnZgFqgCYkSXko/CUNOD5Q7w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sDvBhLaJN5Zz1rNLVr8wxkv8akpAdRrO2e1MzO+wtEtTmS+DvCHNFy03RVQuFkrkl
	 YWCHss9TGQ7YVny/Akgk0itHrxkm0JJQMF/oiN5veNv/rFbxizT8ddrXD2+wnL0V9U
	 6rLF8MMkZLnB3aqPvQF8eNWp9vQjTVObBoQNjb3aXqGuRtZQTp8bTO4ie6b8Qbf2YL
	 umWja8rEU0pJXMe9+ow9eTdqGCu0DmTdEB4finrNyfoGI8bv2Ua/1RJC9iNjfrnNab
	 zDjed9v5REIE5Zm5fsWA41gAH0Z+ZZSaXQ4Z/dvrrxtFdl1Zx8uOmYE+ouMhGmpy01
	 GLCRACutP9xIQ==
Received: by mail-io1-f51.google.com with SMTP id p186so21111249iod.13
        for <linux-firmware@kernel.org>; Mon, 19 Jul 2021 11:36:43 -0700 (PDT)
X-Gm-Message-State: AOAM530X3Q0rM+46LbLhowK874OpsOKYUaJPX68j+DgjBSvPx3Pkol/H
	XrMnxG0LIAAQeqO3c0OF5UkDxc+FVanot1oIrTo=
X-Google-Smtp-Source: ABdhPJyoUf7caTaeSODtZZUNo6qoHHbUnXYh7QscxnVRv7zJTESf0GfKRHSkt6F2zudGzxzti2slC+fiy1/F2J5M+v8=
X-Received: by 2002:a5e:d508:: with SMTP id e8mr6882323iom.101.1626719802992;
 Mon, 19 Jul 2021 11:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210719112621.21043-1-johannes@sipsolutions.net>
In-Reply-To: <20210719112621.21043-1-johannes@sipsolutions.net>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Jul 2021 14:36:32 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7_VythuBOxxUY602YGZZqJD9CLvis6v3ktQMfTFWh+OA@mail.gmail.com>
Message-ID: <CA+5PVA7_VythuBOxxUY602YGZZqJD9CLvis6v3ktQMfTFWh+OA@mail.gmail.com>
Subject: Re: pull-request: iwlwifi-fw-2021-07-19
To: Johannes Berg <johannes@sipsolutions.net>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Linux Wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 7:26 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> Hi,
>
> We've got a new Ty device firmware image, along with an
> updated PNVM data file.
>
> Please pull and let me know if there's any problem.
>
> Thanks,
> johannes
>
>
>
> The following changes since commit b7c134f0d3491113958276d631b4e69771a6c5be:
>
>   linux-firmware: update NXP 8897/8997 firmware images (2021-07-16 07:55:21 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2021-07-19

Pulled and pushed out.

josh

>
> for you to fetch changes up to 5de082d4d0f2db7722c9e6f5c9cff1fefd8073be:
>
>   iwlwifi: add ty firmware from Core63-43 (2021-07-19 13:12:20 +0200)
>
> ----------------------------------------------------------------
> iwlwifi: add ty firmware from Core63-43
>
> ----------------------------------------------------------------
> Johannes Berg (1):
>       iwlwifi: add ty firmware from Core63-43
>
>  LICENCE.iwlwifi_firmware     |   2 +-
>  WHENCE                       |   3 +++
>  iwlwifi-ty-a0-gf-a0-66.ucode | Bin 0 -> 1477864 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm     | Bin 27456 -> 27480 bytes
>  4 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 iwlwifi-ty-a0-gf-a0-66.ucode
>
