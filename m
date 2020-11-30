Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DD3C64E8A
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Nov 2020 14:26:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E78A5206B6; Mon, 30 Nov 2020 14:26:37 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BA06220656;
	Mon, 30 Nov 2020 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606746397;
	bh=7ec0oOUrfomFYXbCiVsScTHXfiU8uWHMOIkFXTxyDJ8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mJMwezUF/vr2DB/7FxzAmVmeGzlmNt9DYc4ap1fzH9yh5i6GBgRQAkczWdyKf4soV
	 iDnHtfghJ7AYbH2FMFZOQFPTCiwglHOR4BOVA0xuis+/9E31asAPVGrKMx7MVhWBko
	 6l6Bn9HDP0sA14bTyHDi1h4Eb2ocrL+FZQ6VAkOQ=
Received: by mail-io1-f42.google.com with SMTP id o8so11942038ioh.0;
        Mon, 30 Nov 2020 06:26:37 -0800 (PST)
X-Gm-Message-State: AOAM531f78IdJkm4et98IeKMRxO/fxu3wC5aa8FDez0rbmBhijoYFmK+
	wMig59fTZ+I4jQ5TPQO3GRUHesF78xhshRbyKJI=
X-Google-Smtp-Source: ABdhPJwWB82FKrxopzoeOn1FrsRnJtGQfYL5R5cZWtTUtJlW42x8352m3WK3o/eOc7bNT9hZWJng5g7y3/yWYiRIWhs=
X-Received: by 2002:a02:11c8:: with SMTP id 191mr10069115jaf.107.1606746397065;
 Mon, 30 Nov 2020 06:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20201125014214.3772152-1-John.C.Harrison@Intel.com>
In-Reply-To: <20201125014214.3772152-1-John.C.Harrison@Intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 30 Nov 2020 09:26:25 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5n3C3fzTrLWLAmjqdjnVzxN2ae+fZDRS5Qbqj3UG+iKw@mail.gmail.com>
Message-ID: <CA+5PVA5n3C3fzTrLWLAmjqdjnVzxN2ae+fZDRS5Qbqj3UG+iKw@mail.gmail.com>
Subject: Re: linux firmware PR for i915 GuC v49.0.1
To: John.C.Harrison@intel.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Kyle McMartin <kyle@kernel.org>, 
	Ben Hutchings <ben@decadent.org.uk>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 8:42 PM <John.C.Harrison@intel.com> wrote:
>
> Hi Josh, Kyle, Ben,
>
> Kindly add the below i915 changes to linux-firmware.git:
>
>
> The following changes since commit b362fd4cb8963ad75517dbcf424974f65a29a60e:
>
>   Mellanox: Add new mlxsw_spectrum firmware xx.2008.2018 (2020-11-24 09:55:03 -0500)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware FDO/guc_v49

This doesn't exist.  Git complains with:

fatal: couldn't find remote ref FDO/guc_v49

Did you just mean guc_v49?

josh

>
> for you to fetch changes up to c487f7dadcd21116613441ed355b764003b3f57b:
>
>   i915: Add GuC firmware v49.0.1 for all platforms (2020-11-24 17:04:17 -0800)
>
> ----------------------------------------------------------------
> John Harrison (2):
>       i915: Remove duplicate KBL DMC entry
>       i915: Add GuC firmware v49.0.1 for all platforms
>
>  WHENCE                  |  25 ++++++++++++++++++++++++-
>  i915/bxt_guc_49.0.1.bin | Bin 0 -> 196224 bytes
>  i915/cml_guc_49.0.1.bin | Bin 0 -> 197184 bytes
>  i915/ehl_guc_49.0.1.bin | Bin 0 -> 324160 bytes
>  i915/glk_guc_49.0.1.bin | Bin 0 -> 196672 bytes
>  i915/icl_guc_49.0.1.bin | Bin 0 -> 324160 bytes
>  i915/kbl_guc_49.0.1.bin | Bin 0 -> 197184 bytes
>  i915/skl_guc_49.0.1.bin | Bin 0 -> 196288 bytes
>  i915/tgl_guc_49.0.1.bin | Bin 0 -> 321792 bytes
>  9 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 i915/bxt_guc_49.0.1.bin
>  create mode 100644 i915/cml_guc_49.0.1.bin
>  create mode 100644 i915/ehl_guc_49.0.1.bin
>  create mode 100644 i915/glk_guc_49.0.1.bin
>  create mode 100644 i915/icl_guc_49.0.1.bin
>  create mode 100644 i915/kbl_guc_49.0.1.bin
>  create mode 100644 i915/skl_guc_49.0.1.bin
>  create mode 100644 i915/tgl_guc_49.0.1.bin
