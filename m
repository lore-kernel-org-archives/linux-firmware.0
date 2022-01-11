Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313A5C433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 11 Jan 2022 11:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E34F1C36AF6; Tue, 11 Jan 2022 11:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD6FC36AF3
	for <linux-firmware@kernel.org>; Tue, 11 Jan 2022 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641901968;
	bh=3IbD8iiXISrJpnbLWlPiSYU9bRYz5U3WyT2C8rV07Qg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tkvK/IxgpWAIGC/SV32k06JGf9eOpT24Kr3WuO2fPOayuHUID47IdBuGH1Jvz2Uxc
	 TAmeZVPzeubsUyihleVhyDmyG0A/9CAZRUXdeGB9PXo6feQo8dec5ZDN1WUVvS/yJL
	 +UTogUP7YKlIvkG6tqvdoh+JM/2R9DIkyxsOF3smPP/mLIy/dx2UZGv78P9GSVb+yq
	 pKiod3GJCKjJE33AUSVfdIwAWN1qaG7+P+MZyHNHpM0MgvKGqLG/IQwaJU/8Mhv1DA
	 mJLCX1Sz+CBKsQHROVTLiBfi8Jwah33oL9M0HchHk7AeE4nRJvG/7b8WTIznelEutX
	 O6X/S6e1ccCcQ==
Received: by mail-io1-f47.google.com with SMTP id y11so21970629iod.6
        for <linux-firmware@kernel.org>; Tue, 11 Jan 2022 03:52:48 -0800 (PST)
X-Gm-Message-State: AOAM532UyQCsFKTcS/pWNrYldKNGgly+KQuxvMqT2UN3heybW/6Df7Zw
	8es/vObi9RmApxpnfD0miVEmERvJlil5gmHlqM0=
X-Google-Smtp-Source: ABdhPJyAkvMGIpPMDWUtMrCGZRu+KM0UJchbd3svOh1iPqGf5wjzql78UDh/IbSxzq7t8BMxmt7AgD7HAAqjSZ/1R1U=
X-Received: by 2002:a05:6602:2e8a:: with SMTP id m10mr1975246iow.209.1641901968022;
 Tue, 11 Jan 2022 03:52:48 -0800 (PST)
MIME-Version: 1.0
References: <39ee0e148eb24523830b766da9c637c41ad3673c.camel@coelho.fi>
In-Reply-To: <39ee0e148eb24523830b766da9c637c41ad3673c.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 11 Jan 2022 06:52:37 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7tJddA3EJEHPePJ3mFpbEmkS=7GTkqZgqUBHTgUOnkmg@mail.gmail.com>
Message-ID: <CA+5PVA7tJddA3EJEHPePJ3mFpbEmkS=7GTkqZgqUBHTgUOnkmg@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2022-01-11
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com, 
	You-Sheng Yang <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 11, 2022 at 3:30 AM Luca Coelho <luca@coelho.fi> wrote:
>
> Hi,
>
> This contains some new and updated firmwares for all our currently
> maintained FW binaries.
>
> This adds firmwares from an older stable branch, because this version
> is what is support in v5.15 LTS.  Sorry for not including this in my
> previous pull-request, but only today I realized they were missing.
>
> Please pull or let me know if there are any issues.
>
> --
> Cheers,
> Luca.
>
>
> The following changes since commit 13fc9c285a399932f5a6205b827cf690b4a3c29b:
>
>   Merge tag 'iwlwifi-fw-2022-01-10-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware into main (2022-01-10 13:20:21 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2022-01-11
>
> for you to fetch changes up to 76e8373e07753ebe406f314894f6eae9f8493dfe:
>
>   iwlwifi: add new FWs from core63-136 release (2022-01-11 10:23:38 +0200)
>
> ----------------------------------------------------------------
> Update and add iwlwifi firmware binaries for release Core63-136
>
> ----------------------------------------------------------------
> Luca Coelho (1):
>       iwlwifi: add new FWs from core63-136 release

Pulled and pushed out.  Thanks.

josh

>
>  WHENCE                        |  23 ++++++++++++++++++++++-
>  iwlwifi-Qu-b0-hr-b0-66.ucode  | Bin 0 -> 1344220 bytes
>  iwlwifi-Qu-b0-jf-b0-66.ucode  | Bin 0 -> 1262312 bytes
>  iwlwifi-Qu-c0-hr-b0-66.ucode  | Bin 0 -> 1344236 bytes
>  iwlwifi-Qu-c0-jf-b0-66.ucode  | Bin 0 -> 1262328 bytes
>  iwlwifi-QuZ-a0-hr-b0-66.ucode | Bin 0 -> 1344216 bytes
>  iwlwifi-QuZ-a0-jf-b0-66.ucode | Bin 0 -> 1262244 bytes
>  iwlwifi-cc-a0-66.ucode        | Bin 0 -> 1307180 bytes
>  iwlwifi-ty-a0-gf-a0-66.ucode  | Bin 1477864 -> 1481960 bytes
>  9 files changed, 22 insertions(+), 1 deletion(-)
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-66.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-66.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-66.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-66.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-66.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-66.ucode
>  create mode 100644 iwlwifi-cc-a0-66.ucode
>
