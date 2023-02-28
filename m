Return-Path: <SRS0=wfpw=6Y=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DA6C64ED6
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Feb 2023 14:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6458EC4339B; Tue, 28 Feb 2023 14:18:51 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D75FC4339C;
	Tue, 28 Feb 2023 14:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D75FC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-536be69eadfso277463867b3.1;
        Tue, 28 Feb 2023 06:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYSRUaVdZz1cUG/rTpJGwJbLZM2/LTs8e/Nm0xXlTyo=;
        b=G0Z9POnOXAHMAVHqoFQPK/J1q7AhA68mUP4IkubyZ4JneJUl4rb1vYCcKTnOINNSrg
         lNJExNkr02UcO+d682I3XzSrv3TtuPemFOMuW1t1HSCub3bqOKOQsI25Ag1DORiCza8E
         DfyexARmr7dtpVviRbVX/NK7DO147ATJA0HUxqwTKlkRs2/0Q1WhOmuuEPDyZd8VKWrT
         p2mJbP0DZYnWslMrWJKqOIgcRmZp+nwHPaZx5eX5RlmYn2rGVJU+xIV5emGNp66E2MjC
         j2fAaoYFyB23O8cD3IwQTrJcFFh0zGM5x4UABlgsGbjQyWvDxmNOW8jiv+vz06R0u+6V
         8gdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYSRUaVdZz1cUG/rTpJGwJbLZM2/LTs8e/Nm0xXlTyo=;
        b=aM4vrHcew+aUcX4oXaLPIDQA3rC69feHMFoh/ELtyOTDXaXEU6ztpBM/2+56OetjtK
         8+AaajW3Z7fd3oLZq5tQhEwxfML5sRKS6IrIiGtqIZruYhB75kqI3lQYt+QgG02074mN
         u7/vxWrQNI4e5JpPteVpy7g+msXLCln0aWGJdWRnp7lfmHlndp070D701VusZYHADusI
         C/j65SUHEjMfz2aVRTXryTsmjtuyZ+OpfwTT6RjsZAafn83sm5yFFBnuPtNzUn1jhnEk
         bYX0nST1FOkxEAebLDOWSYWBQiaTI16TdyMn5LH0Q6/x/OlD4l1uyOd86yR6I/0O20mb
         Ad7A==
X-Gm-Message-State: AO0yUKVp0gN8/drkHKJUtD0ISUnzxoSlvd7XVN6ZoRJEQVoZkzv1O9LY
	yQm2+sDT6RmXoPwAuThlZXd/hPlnoFBdIsJ8agYLNcMrQ2o=
X-Google-Smtp-Source: AK7set/3XJX5YpI97x7cf0euRtANsw90mQyHcKUSp86jau9gCLw2grX5Tht7KDentIYn1ZDKBTJmJu2yTzyef2izIks=
X-Received: by 2002:a81:ad03:0:b0:530:bbd3:798b with SMTP id
 l3-20020a81ad03000000b00530bbd3798bmr1771156ywh.0.1677593929071; Tue, 28 Feb
 2023 06:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 28 Feb 2023 14:18:37 +0000
Message-ID: <CACvgo50K0kSFh_bRUz5=0oSL2W92XERiyzGZhD1SjT5u6A0cgg@mail.gmail.com>
Subject: Re: [PATCH 00/15] Misc fixes, sanity checks and xz/zstd compression
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 18 Feb 2023 at 18:46, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Greetings everyone,
>
> For a while now, the kernel has been accepting compressed firmware - be that xz
> or zstd. There is a patch for the former on the ML, yet the latter is still
> lacking.
>
> While working through I've noticed a few issues - of various severity - so
> decided to fix them all.
>
> Mind you, I'm sending everything as single patch series to gauge feedback. I'm
> quite happy to split and rework as per the community's feedback.
>
> In a gist:
>  - remove quoted filenames in WHENCE - escape white space as needed
>  - remove _nearly_ all duplicate entries in WHENCE && add check
>    - NOTE: one entry remains, which I'm not sure how to resolve cleanly
>  - check if directory is listed as File - had a mistake like that locally
>  - check we have no symlinks and drop symlink workarounds
>  - quote deskdir (genuine bug) + few more shellcheck inspired fixes
>  - support xz and zstd compressed firmware - no intermediate files, pipe
>    directly into destdir
>
>
> Kind regards
> Emil
>
>
> Emil Velikov (15):
>   WHENCE: remove trailing white space
>   WHENCE: remove unnecessary filename quotation
>   check_whence, WHENCE, copy-firmware: escape filenames with spaces
>   WHENCE: remove duplicate File entries
>   check_whence: error on duplicate file entries
>   check_whence: error on directory listed as File
>   copy-firmware: remove non-applicable file presence test
>   check_whence: error if File: is actually a link
>   check_whence: error if symlinks are in-tree
>   copy-firmware: remove unreachable symlink workarounds
>   copy-firmware: quote deskdir to prevent word splitting
>   copy-firmware: tweak sed invocation
>   copy-firmware: quote the output of dirname
>   copy-firmware: silence the last shellcheck warnings
>   Makefile, copy-firmware: support xz/zstd compressed firmware
>
>  Makefile         |  8 ++++
>  WHENCE           | 97 +++++++++++++++++++-----------------------------
>  check_whence.py  | 44 +++++++++++++++++++---
>  copy-firmware.sh | 71 +++++++++++++++++------------------
>  4 files changed, 119 insertions(+), 101 deletions(-)
>

Adding Josh Boyer - the maintainer, according to git log.

Josh, do you have any objections to the patches - part or in full? Can
you pick these off the ML or shall I send you a git request-pull?

Thanks
Emil
