Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B47C433F5
	for <linux-firmware@archiver.kernel.org>; Tue,  3 May 2022 12:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CA17CC385B4; Tue,  3 May 2022 12:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E06C385AE
	for <linux-firmware@kernel.org>; Tue,  3 May 2022 12:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651580469;
	bh=S6At7mx3NVUUtbPoyAtM+qqgCK/kx2Xxh5t2wxKSb/w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=BHKHE5GFSj4Bbj7zfLMjUXAoHF4p6TNE4PbHotWKzuH1l7I0QmMjS9q+0SWOw9wyY
	 GtIYmRGpllW81QQr4NYGXUwA8izO+0Ov8sCgzOcQ/gHoi+TBRBFNL4ZcO4FnLjrgwM
	 ViWgHoeiiSJdXlUQ/XeluiPLWIQGdIEq2ido2Te4H7y852wCMzBmghPHBbaybLxdHX
	 ZsyJoeC7yP3Y6GY91Ld9CctsIOFH5nbnzlR4JPWKGkAgiaw5rvBJmJ8SQaU/2CCGhY
	 U//hsd6mb1Hy6FPPbiXa6834o4EO/31+Iuseo2wK8CIXrLpvFWgoIHpM0Ln9nz5cly
	 yDw9wgxVjyYjg==
Received: by mail-il1-f180.google.com with SMTP id o5so9603947ils.11
        for <linux-firmware@kernel.org>; Tue, 03 May 2022 05:21:09 -0700 (PDT)
X-Gm-Message-State: AOAM533slT5ViMHx5tBl7hWjdNMu0/GmWHVg+/bYBnSQgsbBXh7hygl/
	Q8Jt4IADlC/66PBOT5+mc3CAL3YX1xutRwNQDgk=
X-Google-Smtp-Source: ABdhPJwORRLo6seSzlb42mXL/ZJIr6lcjNgZwf/LnArap3y3wvHoh0Jk4E0BCkc7NtA9u4RAmG0VQoj9BvHTP9SH4qM=
X-Received: by 2002:a92:d752:0:b0:2c7:dbf5:70dd with SMTP id
 e18-20020a92d752000000b002c7dbf570ddmr6634353ilq.251.1651580468804; Tue, 03
 May 2022 05:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <8593a140a0ee01998d28cdafa5a10aa5f8e44380.camel@intel.com>
In-Reply-To: <8593a140a0ee01998d28cdafa5a10aa5f8e44380.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 3 May 2022 08:20:58 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5vFH6vZQpYsTjsGkuc8_d53YPcuXGxM2EyThmudr8itQ@mail.gmail.com>
Message-ID: <CA+5PVA5vFH6vZQpYsTjsGkuc8_d53YPcuXGxM2EyThmudr8itQ@mail.gmail.com>
Subject: Re: i915 Updates: DG2 DMC v2.06
To: "Tolakanahalli Pradeep, Madhumitha" <madhumitha.tolakanahalli.pradeep@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"Srivatsa, Anusha" <anusha.srivatsa@intel.com>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "kyle@mcmartin.ca" <kyle@mcmartin.ca>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 2, 2022 at 3:56 PM Tolakanahalli Pradeep, Madhumitha
<madhumitha.tolakanahalli.pradeep@intel.com> wrote:
>
> The following changes since commit c3624ebd67c68722e0fabc9cae01397b15310239:
>
>   Merge branch 'ath10k-20220423' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware into main
> (2022-05-02 08:31:40 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware dg2_dmc_v2.06_rebase
>
> for you to fetch changes up to b8bd6ccd9c409508a0b424492981721b45c55127:
>
>   i915: Add DMC v2.06 for DG2 (2022-05-02 22:53:23 +0530)
>
> ----------------------------------------------------------------
> Madhumitha Tolakanahalli Pradeep (1):
>       i915: Add DMC v2.06 for DG2

Pulled and pushed out.

josh

>
>  WHENCE                   |   3 +++
>  i915/dg2_dmc_ver2_06.bin | Bin 0 -> 22416 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 i915/dg2_dmc_ver2_06.bin
>
