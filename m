Return-Path: <SRS0=3jid=FE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6322BC64E8A
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 14:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E89AE20656
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 14:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tAEYduZ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E89AE20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C086E4CD;
	Mon, 30 Nov 2020 14:26:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0226E4D0
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 14:26:38 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F39FD20656
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606746398;
 bh=7ec0oOUrfomFYXbCiVsScTHXfiU8uWHMOIkFXTxyDJ8=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=tAEYduZ2CNe+mGkIrmNLitu8mn/SoUU49A58CVc0sEDpAWFFhTOwco9i0U0iQ7/c/
 YWCesqyOZUPbpQnXE4OtsW9fWyXqYkwstrIe3e2mVm0NZ5RmA3e+efAcLrnOcYPyzm
 +hMyeJt7jQNsTFs4RfheWPXfKyw6wW07HF0aRv3Y=
Received: by mail-io1-f49.google.com with SMTP id r9so11909757ioo.7
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 06:26:37 -0800 (PST)
X-Gm-Message-State: AOAM530XK/fOIgdx+Pz8xdZhRwtGed0g080/7AaA4vhEjrxeiJ2OP2J6
 fc0nXQ6vpNtmyzt0A2XZpyzzaXaNWtUi8Ysr0JU=
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
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] linux firmware PR for i915 GuC v49.0.1
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kyle McMartin <kyle@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
Message-ID: <20201130142625.yXJ1cM_Dsy-AHao0zLF4v0Vgn0e7hE6Co04iiYogGUk@z>

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
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
