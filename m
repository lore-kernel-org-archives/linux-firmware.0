Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFA6C433F5
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Mar 2022 12:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A37AC340F9; Wed,  9 Mar 2022 12:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0505EC340F5
	for <linux-firmware@kernel.org>; Wed,  9 Mar 2022 12:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646828970;
	bh=qFfXbjO/IuTqLZSktDznYsZrYo3Gc74UYZq/P1VayS0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=todDn2TZ2DG46etodhsoFqd0mOe79DGQhgpBtEYYDrSRohaqvA2qicuhxuxjMqkDR
	 9Xw6D9UhxaNSTWroje58B0QdfLBf58wjYM0HHX6iFCI0G8Pe9iiQD8YRz81sivER4a
	 aRp82fDdtUVDGI0He46MnL9C8Cz7hBThoeGXpvDfPLAzZf3n29eHcCsGAxHiKk49o6
	 jI8iw3O4Q3M/5xNNgWFXLFUkHNGwCHVK4nLP1239efKCTMUZFwbz+hCtE6BMI/sa/9
	 tSpOVOmeXBuJn4AhtOfA9glpwtjMDrlhi7cA3xaJDroDS3hvz5DKO6QD2K5qqHVfcQ
	 bO5XSE4DY9Uvg==
Received: by mail-io1-f48.google.com with SMTP id 195so2581638iou.0
        for <linux-firmware@kernel.org>; Wed, 09 Mar 2022 04:29:29 -0800 (PST)
X-Gm-Message-State: AOAM532nuMCZH0td9RM2Mxnb2kXIHPOBkDbXdPCJ1LE/HLtvBCmCOoJY
	/haMys1dKrqBecWfJVGdbNKJZii0RLBLJCGjOF4=
X-Google-Smtp-Source: ABdhPJypVfvmEWX58Nrc42BepFkPwhlFgAdsRWzT9g/SW9XoNZaKmPMeoBMUXiptqdztyQIjal5mEKzW91wX1S5kH3w=
X-Received: by 2002:a05:6638:260f:b0:317:d73e:3038 with SMTP id
 m15-20020a056638260f00b00317d73e3038mr7261517jat.144.1646828969162; Wed, 09
 Mar 2022 04:29:29 -0800 (PST)
MIME-Version: 1.0
References: <45c8a31b79f538425f9524b0d65c002e1e24fc16.camel@coelho.fi>
In-Reply-To: <45c8a31b79f538425f9524b0d65c002e1e24fc16.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Mar 2022 07:29:18 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7fQLuQ3E+AWrVyEmXEKYTYkTCHHDbwHfsQzuiXSMAFxA@mail.gmail.com>
Message-ID: <CA+5PVA7fQLuQ3E+AWrVyEmXEKYTYkTCHHDbwHfsQzuiXSMAFxA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2022-03-03-v2
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com, 
	You-Sheng Yang <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 8, 2022 at 1:43 AM Luca Coelho <luca@coelho.fi> wrote:
>
> Hi,
>
> This contains some new and updated firmwares for all our currently
> maintained FW binaries.
>
> In v2 I added three missing binaries that I had forgotten to commit.
>
> Please pull or let me know if there are any issues.
>
> --
> Cheers,
> Luca.
>
>
> The following changes since commit ee0667aa201e7d725ec87b1e4cf08de1d748d64f:
>
>   amdgpu: update raven2 VCN firmware (2022-02-28 09:44:17 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2022-03-03-v2
>
> for you to fetch changes up to 8f9285cca830cb709439ee2cf14d0519d155983b:
>
>   iwlwifi: add new FWs from core68-60 release (2022-03-08 08:39:39 +0200)
>
> ----------------------------------------------------------------
> Update and add iwlwifi firmware binaries for release Core68-60
>
> ----------------------------------------------------------------
> Luca Coelho (2):
>       iwlwifi: update 9000-family firmwares to core68-60
>       iwlwifi: add new FWs from core68-60 release

Pulled and pushed out.  Thanks.

josh

>
>  WHENCE                            |  40 ++++++++++++++++++++++++++++++++++++++--
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1519544 -> 1520208 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1490376 -> 1491056 bytes
>  iwlwifi-Qu-b0-hr-b0-71.ucode      | Bin 0 -> 1364312 bytes
>  iwlwifi-Qu-b0-jf-b0-71.ucode      | Bin 0 -> 1285192 bytes
>  iwlwifi-Qu-c0-hr-b0-71.ucode      | Bin 0 -> 1364328 bytes
>  iwlwifi-Qu-c0-jf-b0-71.ucode      | Bin 0 -> 1285208 bytes
>  iwlwifi-QuZ-a0-hr-b0-71.ucode     | Bin 0 -> 1364308 bytes
>  iwlwifi-QuZ-a0-jf-b0-71.ucode     | Bin 0 -> 1285188 bytes
>  iwlwifi-cc-a0-71.ucode            | Bin 0 -> 1322288 bytes
>  iwlwifi-so-a0-gf-a0-71.ucode      | Bin 0 -> 1550124 bytes
>  iwlwifi-so-a0-gf-a0.pnvm          | Bin 41808 -> 41808 bytes
>  iwlwifi-so-a0-gf4-a0-71.ucode     | Bin 0 -> 1566352 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm         | Bin 21576 -> 28064 bytes
>  iwlwifi-so-a0-hr-b0-71.ucode      | Bin 0 -> 1456960 bytes
>  iwlwifi-so-a0-jf-b0-71.ucode      | Bin 0 -> 1400056 bytes
>  iwlwifi-ty-a0-gf-a0-71.ucode      | Bin 0 -> 1494024 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 41588 -> 41588 bytes
>  18 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-71.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-71.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-71.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-71.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-71.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-71.ucode
>  create mode 100644 iwlwifi-cc-a0-71.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0-71.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-71.ucode
>  create mode 100644 iwlwifi-so-a0-hr-b0-71.ucode
>  create mode 100644 iwlwifi-so-a0-jf-b0-71.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-71.ucode
>
