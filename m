Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828AAC433F5
	for <linux-firmware@archiver.kernel.org>; Mon,  2 May 2022 12:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AED8C385AE; Mon,  2 May 2022 12:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EE0C385A4;
	Mon,  2 May 2022 12:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651494597;
	bh=EsmYFwfMHQTy4IqFW58UOfCfW2WnrOBdYhWKBTzZmtU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=On2UsJZR+gy0xzq5Jb4QI4zel8DoTuC5QiPjXW6qWUULBOIxZ6HiaBCuhMOsTaoHu
	 Vnr3FgXt74Ixw7MTdpC3sMri2PI15feudNeFgRxoMCFvTfC4pqGpVqJ+ojtOHDtj+C
	 R4FTDma1fi2EZzJGxoKNLpj8li6QgfeOIRBOWsrarisNT6MmaljM87Lt6PGoO914Cl
	 8df9rGJztPZo7i/ymrxJClGuFcJC9SuCeE/EJQCsnyd99OSTQqs2lIfRVA1djVujaz
	 rAS7nrH/Ed5TtyMFNG2T7f3HrPcfLQ6DFfoQ4LsK8jA5SyqrmQ2DSK85Ot0ailDnsg
	 JTyVQP7ATAaUw==
Received: by mail-io1-f41.google.com with SMTP id c125so15801829iof.9;
        Mon, 02 May 2022 05:29:57 -0700 (PDT)
X-Gm-Message-State: AOAM533TVrjPsbPkY39YnLBtzEOqc8ckAIxUDRPrSiLlM+lTNJvxLx2Q
	v8x/GGMSX43OU9bZUu1mXZ+CJia98DMgc/1yYaY=
X-Google-Smtp-Source: ABdhPJx6dzE13U4u5EW3uGCoZVC0g17eY5T/fJIFCIT7PZ/SPrTHyd2Z+Ax9mMBVrnptesovqdvfm+YXKMfIfjnKZmM=
X-Received: by 2002:a5e:821a:0:b0:657:c59f:898c with SMTP id
 l26-20020a5e821a000000b00657c59f898cmr4056306iom.209.1651494596445; Mon, 02
 May 2022 05:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220428190725.3704842-1-John.C.Harrison@Intel.com>
In-Reply-To: <20220428190725.3704842-1-John.C.Harrison@Intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 May 2022 08:29:45 -0400
X-Gmail-Original-Message-ID: <CA+5PVA50kgprAj-n+HsB4sEa=MEujkvm_dA2sEQ-a0NEE6-3Tw@mail.gmail.com>
Message-ID: <CA+5PVA50kgprAj-n+HsB4sEa=MEujkvm_dA2sEQ-a0NEE6-3Tw@mail.gmail.com>
Subject: Re: PR for new GuC v70.1.2 for DG2
To: John Harrison <John.C.Harrison@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Kyle McMartin <kyle@kernel.org>, 
	Ben Hutchings <ben@decadent.org.uk>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 28, 2022 at 3:07 PM <John.C.Harrison@intel.com> wrote:
>
> The following changes since commit ac21ab5d1de0de34201c90d32eee436f873d1e5b:
>
>   Mellanox: Add lc_ini_bundle for xx.2010.1006 (2022-04-25 07:36:16 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware guc_v70.1.2_dg2
>
> for you to fetch changes up to 89ae5eb20f65752db6a3e38b9a69144f19540567:
>
>   i915: Add GuC v70.1.2 for DG2 (2022-04-26 13:27:47 -0700)

Pulled and pushed out.

josh

>
> ----------------------------------------------------------------
> John Harrison (1):
>       i915: Add GuC v70.1.2 for DG2
>
>  WHENCE                  |   3 +++
>  i915/dg2_guc_70.1.2.bin | Bin 0 -> 365568 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 i915/dg2_guc_70.1.2.bin
