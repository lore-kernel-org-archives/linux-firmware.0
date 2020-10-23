Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF903C56201
	for <linux-firmware@archiver.kernel.org>; Fri, 23 Oct 2020 11:58:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8F3B72463D; Fri, 23 Oct 2020 11:58:36 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6BFF524248
	for <linux-firmware@kernel.org>; Fri, 23 Oct 2020 11:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603454316;
	bh=xu6ztFg5IBpO5cVaGxm2D9PYP4Ip/ZYqM71qJsQCWd4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Qt3HGB6moIuSuLVF4dz5AIHv57m1lQ2QIZf+cJsUAVY8u6O6agQnI6XEP0GtnqDuD
	 Adrfmh57y5ppEJ9SYl1uJEbvFXjsLvWwobaP8XTFGKYOtEW9FQEvybpfhRhxDB91fB
	 VCaxyOtpHuNAZUD2945mTzuwYJPbIJ2MLEhFDOFw=
Received: by mail-il1-f178.google.com with SMTP id j17so1097922ilr.2
        for <linux-firmware@kernel.org>; Fri, 23 Oct 2020 04:58:36 -0700 (PDT)
X-Gm-Message-State: AOAM531kEiGC9yPOnBTKmRxJvc+BXNRHI6RKGXIFDPaEzQkI94bYlQGN
	Me0YlP69ciaoyfBcvTd5heFwOHuuk/zIUmiJXN0=
X-Google-Smtp-Source: ABdhPJy05gNx/02KcDt4JoV7BlP9meLBkYJMyx3sqQOG33rZybJrPMfaBsTtS1J/tlXAygvs2OD7hv5NI/PELJfGVfI=
X-Received: by 2002:a92:600e:: with SMTP id u14mr1289210ilb.303.1603454315751;
 Fri, 23 Oct 2020 04:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <3997663f047e4ab68fca41e3c8a05671@intel.com>
In-Reply-To: <3997663f047e4ab68fca41e3c8a05671@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Oct 2020 07:58:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4tEqub_1KmA9WeRa3WZ4OpDejdBn2FDxZ-LESfFD1Vnw@mail.gmail.com>
Message-ID: <CA+5PVA4tEqub_1KmA9WeRa3WZ4OpDejdBn2FDxZ-LESfFD1Vnw@mail.gmail.com>
Subject: Re: i915 Update : DG1 DMC
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Kyle McMartin <kyle@mcmartin.ca>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Fri, Oct 9, 2020 at 2:41 PM Srivatsa, Anusha
<anusha.srivatsa@intel.com> wrote:
>
> Hi Kyle, Ben,
>
>
>
> Please add the i915 updates to linux-firmware from branch dg1_dmc_v2_02
>
>
>
> The following changes since commit 58d41d0facca2478d3e45f6321224361519aee96:
>
>
>
>   ice: Add comms package file for Intel E800 series driver (2020-10-05 08:09:03 -0400)
>
>
>
> are available in the Git repository at: dg1_dmc_v2_02
>
>
>
>   git://anongit.freedesktop.org/drm/drm-firmware dg1_dmc_v2_02
>
>
>
> for you to fetch changes up to a140ef3eb3746aba2c897db16e02ffb5ffa9e7a2:
>
>
>
>   i915: Add DG1 DMC v2.02 (2020-10-08 12:13:33 -0700)
>
>
>
> ----------------------------------------------------------------
>
> Anusha Srivatsa (1):
>
>       i915: Add DG1 DMC v2.02
>
>
>
> WHENCE                   |   2 ++
>
> i915/dg1_dmc_ver2_02.bin | Bin 0 -> 16624 bytes
>
> 2 files changed, 2 insertions(+)
>
> create mode 100644 i915/dg1_dmc_ver2_02.bin
>
>
>
> Thanks,
>
> Anusha
