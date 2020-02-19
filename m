Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F77C3404D
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Feb 2020 12:33:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2C7A624672; Wed, 19 Feb 2020 12:33:10 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F1D1524670
	for <linux-firmware@kernel.org>; Wed, 19 Feb 2020 12:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582115590;
	bh=QK44ZT+WT5/Bu6W58G6gijq7/gyvYMXEXLsnIlH4yow=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=oKqhoSaGBvEOn9wVxMDfuGHthTYMVIvUnNhzL3nSK71u+O5KGB3s9nPyHhs/XuWyI
	 zpETtn1IgSDrqYBH48vAVsuARVb9tKhCC2bTU0NovOr+eifP7z55RbsPvqiJmm8j74
	 CAuI1+alFpoVnyYu50j/aOmURAIke4TBkEWl4awY=
Received: by mail-qt1-f173.google.com with SMTP id v25so18434qto.7
        for <linux-firmware@kernel.org>; Wed, 19 Feb 2020 04:33:09 -0800 (PST)
X-Gm-Message-State: APjAAAUDtYOh2ql6J5thktQiGoKzi937AU0B4ZseWYNu8mXQAiw81SjQ
	oCN/sLQN82Yl/UJ1OaaQpAadpwwCgpi/y32okgg=
X-Google-Smtp-Source: APXvYqymitKVl+5g9kxH+4n7vAbsMSVeSfVgiHiwZ6xUJesB1AQ52NQ29rn8jsvWj2oP/fAHWe2bQSauWldvnpRYmug=
X-Received: by 2002:ac8:7159:: with SMTP id h25mr21771565qtp.380.1582115589166;
 Wed, 19 Feb 2020 04:33:09 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_PLo73We-obEZAW0tXQE-1iM5rXjBS3SWvggJV47AqBVA@mail.gmail.com>
In-Reply-To: <CADnq5_PLo73We-obEZAW0tXQE-1iM5rXjBS3SWvggJV47AqBVA@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 19 Feb 2020 07:32:58 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6ZGe+kdLedxHqPzahAbUrHA80q1hxk238j2kXSwQmjKQ@mail.gmail.com>
Message-ID: <CA+5PVA6ZGe+kdLedxHqPzahAbUrHA80q1hxk238j2kXSwQmjKQ@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 17, 2020 at 10:11 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated firmware for raven.  Please apply!

Applied and pushed out.

josh
