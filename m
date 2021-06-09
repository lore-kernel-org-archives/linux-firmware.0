Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D6EC48BD1
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Jun 2021 12:00:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 79CE7613BD; Wed,  9 Jun 2021 12:00:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62EF3613B8;
	Wed,  9 Jun 2021 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623240014;
	bh=s3qXMnWhIvPlhYUc9LQ3T3/TyjjteDNO4MALpyRwGII=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XGWmyQUIvCXc6v5AXcgCw8ftgCUE8BMnw9YJZEzcqfwvBAnMVGt8Y4u/yfeLtgANH
	 RcRu4arQFpC9RHCdASVyWBqIUyp2YkUdEk23EjpIffSEB4C3pYT+JheEHWI0QpGtoi
	 HR+bkoTFCwYPsS34LNRkNHFPcAtetcX33SfaOYC5U9+Dlm8tsiNrMRqI6re0WOELFg
	 ER2vcCFwaBlt70lGPV4Mhdj8tpkTHInp7pZfzZtwVTqnYk7wMnTt3ywHgLf27napGb
	 rqH3XvfeVlOwBWYuYcLl9NTpLfSk+oIFl5UoBVrn5TBSjuhGw5BpQ+d7QfSNYlrxgT
	 loXIh1Nllt1Bg==
Received: by mail-il1-f169.google.com with SMTP id z1so25460472ils.0;
        Wed, 09 Jun 2021 05:00:14 -0700 (PDT)
X-Gm-Message-State: AOAM5308Wyu30uI64Z9jNu1B5BVbFhhmJVi69tFqGt751iuLNnV94lyr
	d7W0g1PBJ5KxrcnRTW+pnxt3+Iq/HnjbVhTl/M0=
X-Google-Smtp-Source: ABdhPJwtyeNFumFvIDgmRdN1I9D04ldszv8+zVbhY7KsFw4kYpXEpbcBRVBrXUCNM5fHPWZt4NvRDKei+QhWRe3QQD8=
X-Received: by 2002:a92:750c:: with SMTP id q12mr11864326ilc.303.1623240013829;
 Wed, 09 Jun 2021 05:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <BN9PR12MB53218D9345EF839962E1E4C9BC269@BN9PR12MB5321.namprd12.prod.outlook.com>
In-Reply-To: <BN9PR12MB53218D9345EF839962E1E4C9BC269@BN9PR12MB5321.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Jun 2021 08:00:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA76GS7Mfess2HzUC9nM20Vs=DVBCo6_RJ9vdFY4uPkefg@mail.gmail.com>
Message-ID: <CA+5PVA76GS7Mfess2HzUC9nM20Vs=DVBCo6_RJ9vdFY4uPkefg@mail.gmail.com>
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.25.6.0
To: Raju Rangoju <rajur@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ramaraju Yelavarthy <ramaraju@chelsio.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 24, 2021 at 7:00 AM Raju Rangoju <rajur@chelsio.com> wrote:
>
> Hi,
>
> Can you please pull the new firmware from the following URL?
> git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Raju
>
> The following changes since commit f8462923ed8fc874f770b8c6dfad49d39b381f14:
>
>   nvidia: fix symlinks for tu104/tu106 acr unload firmware (2021-05-18 11:03:08 -0400)
>
> are available in the git repository at:
>
>   git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> for you to fetch changes up to 0c8946d82f059f90199f4926ab55033d8aa9c920:
>
>   cxgb4: Update firmware to revision 1.25.6.0 (2021-05-24 00:51:20 -0700)
>
> ----------------------------------------------------------------
> Raju Rangoju (1):
>       cxgb4: Update firmware to revision 1.25.6.0
>
>  WHENCE                                         |  12 ++++++------
>  cxgb4/{t4fw-1.25.4.0.bin => t4fw-1.25.6.0.bin} | Bin 569856 -> 570368 bytes
>  cxgb4/{t5fw-1.25.4.0.bin => t5fw-1.25.6.0.bin} | Bin 675328 -> 675840 bytes
>  cxgb4/t6fw-1.25.4.0.bin                        | Bin 728064 -> 0 bytes
>  cxgb4/t6fw-1.25.6.0.bin                        | Bin 0 -> 730112 bytes
>  5 files changed, 6 insertions(+), 6 deletions(-)
>  rename cxgb4/{t4fw-1.25.4.0.bin => t4fw-1.25.6.0.bin} (75%)
>  rename cxgb4/{t5fw-1.25.4.0.bin => t5fw-1.25.6.0.bin} (78%)
>  delete mode 100644 cxgb4/t6fw-1.25.4.0.bin
>  create mode 100644 cxgb4/t6fw-1.25.6.0.bin

Pulled and pushed out.

josh
