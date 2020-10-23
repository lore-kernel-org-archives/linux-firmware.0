Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C61C55179
	for <linux-firmware@archiver.kernel.org>; Fri, 23 Oct 2020 12:03:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E04C324248; Fri, 23 Oct 2020 12:03:35 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B5CB92225F
	for <linux-firmware@kernel.org>; Fri, 23 Oct 2020 12:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603454615;
	bh=jm7AapgYULlmW/oT1clsm4ctQnIZKjRGAHXoHL6I//Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TJpSkWzxmRP/T44auGf0p6LEH4N+xtnqPZ3vNMUIVbjoJNwGEamNAuKwbfyFwuaim
	 kps5+zIaL8OKuOl0HDhBxi20NqNQdI1ObTH4ekv7r8IcHPukg1LKjZiMeqKgGGslNm
	 CxlGUewBXDf3X5Ys+8yBylSAweraMqGdjzQMXzII=
Received: by mail-il1-f180.google.com with SMTP id p16so1106019ilq.5
        for <linux-firmware@kernel.org>; Fri, 23 Oct 2020 05:03:35 -0700 (PDT)
X-Gm-Message-State: AOAM533Bkb7Zrp1yt9gypw24znLZauUMqLZ5P/muT3mcsE6zq8c+ttlG
	qE+TsIXZPrBWu5hm6u3pNe+l0BoUTSEYdbj6OVE=
X-Google-Smtp-Source: ABdhPJwAnUBpqMF9VtaoyTVyPeQwbL06Ghm6ZrHs6tjhFlUSnzJLFWnFrdEA86ONMjO1X6A0Jb225Wrrj3NWpSjbttI=
X-Received: by 2002:a05:6e02:664:: with SMTP id l4mr1394383ilt.81.1603454615092;
 Fri, 23 Oct 2020 05:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <c26822c0a6d19869d7eeaa6bf07db1f3298a1984.camel@coelho.fi>
In-Reply-To: <c26822c0a6d19869d7eeaa6bf07db1f3298a1984.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Oct 2020 08:03:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4=R4jJ+jwsj3ayji+PfeV6yVp7T=n1=qF2MUz25iftTQ@mail.gmail.com>
Message-ID: <CA+5PVA4=R4jJ+jwsj3ayji+PfeV6yVp7T=n1=qF2MUz25iftTQ@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2020-10-14
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Wed, Oct 14, 2020 at 10:01 AM Luca Coelho <luca@coelho.fi> wrote:
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
> The following changes since commit 58d41d0facca2478d3e45f6321224361519aee96:
>
>   ice: Add comms package file for Intel E800 series driver (2020-10-05 08:09:03 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2020-10-14
>
> for you to fetch changes up to 4f41e9d6437d03e7ce9279076107dd08f46656f3:
>
>   iwlwifi: update and add new FWs from core56-54 release (2020-10-14 16:07:28 +0300)
>
> ----------------------------------------------------------------
> Update iwlwifi firmwares to Core56-54
>
> ----------------------------------------------------------------
> Luca Coelho (2):
>       iwlwifi: update 3168, 7265D, 8000C and 8265 firmwares
>       iwlwifi: update and add new FWs from core56-54 release
>
>  WHENCE                            |  36 ++++++++++++++++++++++++++++++------
>  iwlwifi-3168-29.ucode             | Bin 1036288 -> 1036288 bytes
>  iwlwifi-7265D-29.ucode            | Bin 1036656 -> 1036444 bytes
>  iwlwifi-8000C-36.ucode            | Bin 2401100 -> 2428004 bytes
>  iwlwifi-8265-36.ucode             | Bin 2409984 -> 2436632 bytes
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1481104 -> 1512096 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1470272 -> 1483116 bytes
>  iwlwifi-Qu-b0-hr-b0-59.ucode      | Bin 0 -> 1300764 bytes
>  iwlwifi-Qu-b0-jf-b0-59.ucode      | Bin 0 -> 1226208 bytes
>  iwlwifi-Qu-c0-hr-b0-59.ucode      | Bin 0 -> 1300780 bytes
>  iwlwifi-Qu-c0-jf-b0-59.ucode      | Bin 0 -> 1226224 bytes
>  iwlwifi-QuZ-a0-hr-b0-59.ucode     | Bin 0 -> 1299660 bytes
>  iwlwifi-QuZ-a0-jf-b0-59.ucode     | Bin 0 -> 1226064 bytes
>  iwlwifi-cc-a0-59.ucode            | Bin 0 -> 1261280 bytes
>  iwlwifi-ty-a0-gf-a0-59.ucode      | Bin 0 -> 1413868 bytes
>  15 files changed, 30 insertions(+), 6 deletions(-)
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-59.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-59.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-59.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-59.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-59.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-59.ucode
>  create mode 100644 iwlwifi-cc-a0-59.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-59.ucode
