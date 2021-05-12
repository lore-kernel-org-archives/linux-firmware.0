Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCEAC433B4
	for <linux-firmware@archiver.kernel.org>; Wed, 12 May 2021 11:03:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AD64B613C0; Wed, 12 May 2021 11:03:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97A5E613AA
	for <linux-firmware@kernel.org>; Wed, 12 May 2021 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620817435;
	bh=cW+ZJ8XAbaA9MNhGC+l5Iuc9po+7aaPCv/rijp3FrwE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sAZ2J1RubQ/uY5JHlejfoZ7lhujkBccFRpnuBw8sIih1D/2x5/2HXfv8tG5FRTnPO
	 9dXuaOI7MTRF6lIGyqMCt2+Rj4Ksw2YJyy53HXfNB7U7aBB8c8jGp1vkmMONjxavAh
	 7exBLZceHGfPPAB6aIgDlQ7Bbz1fyl1y+lm5wkmt9VR3+7IpzzbNHN6Z8qsgTE3+pq
	 pvouIhPHV1iGESVCikSKv74mvAgLCLp/5csq+BQvytDyCs34uQNeyQHi8XQfov8vpN
	 eaqTK3A19HHyEPHdX9QXjJALCXVLNFvARUsm5cpUvcAM8k43udg1zBdP79vlTGfhXN
	 CT0YOg2J8mthA==
Received: by mail-io1-f42.google.com with SMTP id l21so21218898iob.1
        for <linux-firmware@kernel.org>; Wed, 12 May 2021 04:03:55 -0700 (PDT)
X-Gm-Message-State: AOAM5310ncC8W4OUN3Y0uYdLgvLYTEhqwU/DjiDi98vfyTU+dg9Z88bT
	mxjM9KiboFhDn2QNViX7C1Md8xThB88ESxRYTRM=
X-Google-Smtp-Source: ABdhPJx3iGvcCkG/EZ+af79ySsIxzTOiVYE7kZRtypUYkzsiKw0Xou78rJ/SInPt7YQrPDPu7jsgTCCreJxOhaR0Yxw=
X-Received: by 2002:a05:6602:3146:: with SMTP id m6mr26444575ioy.158.1620817433879;
 Wed, 12 May 2021 04:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <c4d8c2f040b368225b72a91e74ee282d9ceab4d5.camel@coelho.fi>
In-Reply-To: <c4d8c2f040b368225b72a91e74ee282d9ceab4d5.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 12 May 2021 07:03:42 -0400
X-Gmail-Original-Message-ID: <CA+5PVA52PGAiLpsjpEY1kZive4VrkqvZHCpoyC4Wd6W9CCr=Og@mail.gmail.com>
Message-ID: <CA+5PVA52PGAiLpsjpEY1kZive4VrkqvZHCpoyC4Wd6W9CCr=Og@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2021-05-12
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, tmb@tmb.nu, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, May 12, 2021 at 4:33 AM Luca Coelho <luca@coelho.fi> wrote:
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
> The following changes since commit 7685cf49917b281b8799ba822e97595eeecb26b5:
>
>   nvidia: Update Tegra194 XUSB firmware to v60.09 (2021-05-11 07:48:10 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2021-05-12
>
> for you to fetch changes up to 56115b259807e0417f30ef84bc6d2093572e6901:
>
>   iwlwifi: update 8000 family firmwares (2021-05-12 10:53:38 +0300)
>
> ----------------------------------------------------------------
> Update iwllwifi firmwaresto Core60-51
>
> ----------------------------------------------------------------
> Luca Coelho (3):
>       iwlwifi: add new FWs from core60-51 release
>       iwlwifi: update 9000-family firmwares to core60-51
>       iwlwifi: update 8000 family firmwares
>
>  WHENCE                            |  32 ++++++++++++++++++++++++++++----
>  iwlwifi-8000C-36.ucode            | Bin 2428004 -> 2428004 bytes
>  iwlwifi-8265-36.ucode             | Bin 2436632 -> 2436632 bytes
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1514240 -> 1514876 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1485556 -> 1485620 bytes
>  iwlwifi-Qu-b0-hr-b0-63.ucode      | Bin 0 -> 1334856 bytes
>  iwlwifi-Qu-b0-jf-b0-63.ucode      | Bin 0 -> 1252748 bytes
>  iwlwifi-Qu-c0-hr-b0-63.ucode      | Bin 0 -> 1334872 bytes
>  iwlwifi-Qu-c0-jf-b0-63.ucode      | Bin 0 -> 1252764 bytes
>  iwlwifi-QuZ-a0-hr-b0-63.ucode     | Bin 0 -> 1334804 bytes
>  iwlwifi-QuZ-a0-jf-b0-63.ucode     | Bin 0 -> 1252744 bytes
>  iwlwifi-cc-a0-63.ucode            | Bin 0 -> 1298688 bytes
>  iwlwifi-ty-a0-gf-a0-63.ucode      | Bin 0 -> 1460012 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 27456 -> 27456 bytes
>  14 files changed, 28 insertions(+), 4 deletions(-)
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-63.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-63.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-63.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-63.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-63.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-63.ucode
>  create mode 100644 iwlwifi-cc-a0-63.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-63.ucode

Pulled and pushed out.  Thanks.

josh
