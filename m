Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA430C63777
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Nov 2020 19:09:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AC5BF20825; Mon, 30 Nov 2020 19:09:44 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8624920691;
	Mon, 30 Nov 2020 19:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606763384;
	bh=n/9Kbytlf6Unp0K3HpFeEsEoB7fVhDNCzKVcttZjn1M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Buk2I68PF1y6vSkiBFbwQHDP6F4+hZfr621Dmo9oEkzJW29Ef+sYl+DdmWXWB/UrD
	 ag4Blv7I8J+p8jIoGBaHP1H5AK+M1io42tbQacqsceqYoeEKxhdjuKXNNfqH+leAIT
	 V81Qc+HoS/Y1KYP61dH5+1iVReGi7bF7pOeijX80=
Received: by mail-il1-f170.google.com with SMTP id r17so12359760ilo.11;
        Mon, 30 Nov 2020 11:09:44 -0800 (PST)
X-Gm-Message-State: AOAM53137IiUAzn+T5PPs0sOacBMmo8VYsLl0rks/bns+jvor66zM9O2
	9Mk/4iH5TMVdXpbVD89x0kSyZkSdsWraccQVw0M=
X-Google-Smtp-Source: ABdhPJzKVGS1UyAPmwaj94OxR5VOUHejZ+z7ic5+1lNvFDsO0ou4QQefST088D6UBrKLYrRvwwmr5gYl3HCotSArW/g=
X-Received: by 2002:a92:a154:: with SMTP id v81mr20838704ili.85.1606763383900;
 Mon, 30 Nov 2020 11:09:43 -0800 (PST)
MIME-Version: 1.0
References: <20201125014214.3772152-1-John.C.Harrison@Intel.com>
 <CA+5PVA5n3C3fzTrLWLAmjqdjnVzxN2ae+fZDRS5Qbqj3UG+iKw@mail.gmail.com> <c0aa4cb2-1374-b90f-e7cc-88bfb17ce04b@intel.com>
In-Reply-To: <c0aa4cb2-1374-b90f-e7cc-88bfb17ce04b@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 30 Nov 2020 14:09:32 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4zc3wRGv0ZhUSQLpiQs2kbDZN0jbux++JM-i+EFRTeDA@mail.gmail.com>
Message-ID: <CA+5PVA4zc3wRGv0ZhUSQLpiQs2kbDZN0jbux++JM-i+EFRTeDA@mail.gmail.com>
Subject: Re: linux firmware PR for i915 GuC v49.0.1
To: John Harrison <john.c.harrison@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Kyle McMartin <kyle@kernel.org>, 
	Ben Hutchings <ben@decadent.org.uk>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 30, 2020 at 1:49 PM John Harrison <john.c.harrison@intel.com> wrote:
>
> On 11/30/2020 06:26, Josh Boyer wrote:
> > On Tue, Nov 24, 2020 at 8:42 PM <John.C.Harrison@intel.com> wrote:
> >> Hi Josh, Kyle, Ben,
> >>
> >> Kindly add the below i915 changes to linux-firmware.git:
> >>
> >>
> >> The following changes since commit b362fd4cb8963ad75517dbcf424974f65a29a60e:
> >>
> >>    Mellanox: Add new mlxsw_spectrum firmware xx.2008.2018 (2020-11-24 09:55:03 -0500)
> >>
> >> are available in the Git repository at:
> >>
> >>    git://anongit.freedesktop.org/drm/drm-firmware FDO/guc_v49
> > This doesn't exist.  Git complains with:
> >
> > fatal: couldn't find remote ref FDO/guc_v49
> >
> > Did you just mean guc_v49?
> >
> > josh
> I guess. The FDO part is the name of the remote repo in my local .git.
> When I tried to create the pull request without that part it gave me an
> error.
>
> Do you need me to resend the email with the 'FDO/' part dropped?

No.  I pulled that tag and pushed it out.  Take a look at the mainline
repo and make sure it included the 2 commits you wanted.  Should be
good to go.

josh

> >> for you to fetch changes up to c487f7dadcd21116613441ed355b764003b3f57b:
> >>
> >>    i915: Add GuC firmware v49.0.1 for all platforms (2020-11-24 17:04:17 -0800)
> >>
> >> ----------------------------------------------------------------
> >> John Harrison (2):
> >>        i915: Remove duplicate KBL DMC entry
> >>        i915: Add GuC firmware v49.0.1 for all platforms
> >>
> >>   WHENCE                  |  25 ++++++++++++++++++++++++-
> >>   i915/bxt_guc_49.0.1.bin | Bin 0 -> 196224 bytes
> >>   i915/cml_guc_49.0.1.bin | Bin 0 -> 197184 bytes
> >>   i915/ehl_guc_49.0.1.bin | Bin 0 -> 324160 bytes
> >>   i915/glk_guc_49.0.1.bin | Bin 0 -> 196672 bytes
> >>   i915/icl_guc_49.0.1.bin | Bin 0 -> 324160 bytes
> >>   i915/kbl_guc_49.0.1.bin | Bin 0 -> 197184 bytes
> >>   i915/skl_guc_49.0.1.bin | Bin 0 -> 196288 bytes
> >>   i915/tgl_guc_49.0.1.bin | Bin 0 -> 321792 bytes
> >>   9 files changed, 24 insertions(+), 1 deletion(-)
> >>   create mode 100644 i915/bxt_guc_49.0.1.bin
> >>   create mode 100644 i915/cml_guc_49.0.1.bin
> >>   create mode 100644 i915/ehl_guc_49.0.1.bin
> >>   create mode 100644 i915/glk_guc_49.0.1.bin
> >>   create mode 100644 i915/icl_guc_49.0.1.bin
> >>   create mode 100644 i915/kbl_guc_49.0.1.bin
> >>   create mode 100644 i915/skl_guc_49.0.1.bin
> >>   create mode 100644 i915/tgl_guc_49.0.1.bin
>
