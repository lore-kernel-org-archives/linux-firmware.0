Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6837EC433F5
	for <linux-firmware@archiver.kernel.org>; Sun, 19 Sep 2021 18:21:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 486B1611C8; Sun, 19 Sep 2021 18:21:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30E6260FED
	for <linux-firmware@kernel.org>; Sun, 19 Sep 2021 18:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632075713;
	bh=hx9nthhTb6ZfVaKH8nAMSOF3Z2vUl2g1SwwHUNrKocI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XIGbbyeVUCVbEbP3RIaAeEJWJughOgWomlQBDbqAvPKu48TslxbMt4Yn5OOHxURwD
	 q9ZBU0djaYYk61QaJ/f6qlkfEVdHw7PhE5Fp0qJj/6gmw4tPCfyc6ZUh+zEjzKXPOT
	 2hNFNC/Z9upwATrEna/pi+u0LPTBb+Pg1BjiJ4sh3w2/QHBtUxGQYJDPv6cE7yKYRX
	 7AJxKjS0KBaSD38QMB4Nez5eg9FCB98QQt2hI637Ytw8uUX5otwqxZd3rykM9ha5YL
	 VSUiJn1kjlmeBpXUtL8wb9lnbQjhDDpu8pD2IFvlweyXgIYoDvZyh4vUrJPbOBCOJa
	 TJW0RbkDHySfA==
Received: by mail-io1-f45.google.com with SMTP id f6so19245788iox.0
        for <linux-firmware@kernel.org>; Sun, 19 Sep 2021 11:21:53 -0700 (PDT)
X-Gm-Message-State: AOAM5325tLs2ZHcCXsjRk5lNdhiUg4rtcwEkbG+q0ssUwP6kn5BJskfc
	ihfs1I8C8JCbwBNllcfNEwml/qlcRl4zqxJDS9M=
X-Google-Smtp-Source: ABdhPJz+mq8IkCbHFXCcjBBjS7UoZyJEj8nPiHigNBbuRR5v+GRn1Tg5fz4w+JuVFa7Hy2cygejlS3I18bl3pNr8cY0=
X-Received: by 2002:a05:6638:1b2:: with SMTP id b18mr747080jaq.95.1632075712619;
 Sun, 19 Sep 2021 11:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <8ddba225f68405b5d4ed8b6cd9dcd05a03f532e4.camel@coelho.fi>
In-Reply-To: <8ddba225f68405b5d4ed8b6cd9dcd05a03f532e4.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sun, 19 Sep 2021 14:21:41 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4NsR3fby_yKjyrkYxee_m1QKfnPG8Zp_BFZOFQ_XeTvg@mail.gmail.com>
Message-ID: <CA+5PVA4NsR3fby_yKjyrkYxee_m1QKfnPG8Zp_BFZOFQ_XeTvg@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2021-09-14 v2
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com, 
	You-Sheng Yang <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 16, 2021 at 8:25 AM Luca Coelho <luca@coelho.fi> wrote:
>
> Hi,
>
> I had typos in the WHENCE file in my previous pull request.  I have
> fixed that and here's v2.
>
> This pull request contains a single patch that adds firmware binaries
> to support one more device family in iwlwifi, namely So SOCs with Gf,
> Hr and Jf radio modules.  This replaces the previous patch that we
> reverted.
>
> Please pull or let me know if there are any issues.
>
> --
> Cheers,
> Luca.
>
>
> The following changes since commit 198ac651f46b7d4efd660a1f5ab4f93ca422947d:
>
>   amdgpu: add initial firmware for Yellow Carp (2021-09-15 09:03:35 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2021-09-14-v2

Pulled and pushed out.

josh

>
> for you to fetch changes up to 0324161cb0723fccf5d7659114851cf8c1b1cda6:
>
>   iwlwifi: add FWs for new So device types with multiple RF modules (2021-09-16 15:19:45 +0300)
>
> ----------------------------------------------------------------
> Add iwlwifi firmware binaries for So with Gf, Hr and Jf.
>
> ----------------------------------------------------------------
> Luca Coelho (1):
>       iwlwifi: add FWs for new So device types with multiple RF modules
>
>  WHENCE                       |  11 +++++++++++
>  iwlwifi-so-a0-gf-a0-64.ucode | Bin 0 -> 1515812 bytes
>  iwlwifi-so-a0-gf-a0.pnvm     | Bin 0 -> 41804 bytes
>  iwlwifi-so-a0-hr-b0-64.ucode | Bin 0 -> 1427384 bytes
>  iwlwifi-so-a0-jf-b0-64.ucode | Bin 0 -> 1365628 bytes
>  5 files changed, 11 insertions(+)
>  create mode 100644 iwlwifi-so-a0-gf-a0-64.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0.pnvm
>  create mode 100644 iwlwifi-so-a0-hr-b0-64.ucode
>  create mode 100644 iwlwifi-so-a0-jf-b0-64.ucode
>
