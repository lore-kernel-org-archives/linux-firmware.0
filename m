Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0736C4363A
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Oct 2020 12:01:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BB1BD20774; Mon,  5 Oct 2020 12:01:24 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 95A8E206DD
	for <linux-firmware@kernel.org>; Mon,  5 Oct 2020 12:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601899284;
	bh=0Hb6765ABCstj843oyK6b91teB6KFEGrTAeulHM8ucQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sMXXHDHiETwObmn2Xw36vrydlgZ3hgf/zRg4AW0oLBY9va7aEYL1XMvQBxClQdcJS
	 b/Z0ganVL1K2lzAbmPLXRQLFec52cj9HcJGJf4qPpLJIMwndbTgtsEyeycaDosF8sa
	 4fRvRJ4Nkl2L/S3lwmAeXVJ8OGW7CLLr2+fJaJnM=
Received: by mail-il1-f172.google.com with SMTP id u9so7493501ilj.7
        for <linux-firmware@kernel.org>; Mon, 05 Oct 2020 05:01:24 -0700 (PDT)
X-Gm-Message-State: AOAM53387ZpoaTZ6QB0/PA4tcnvBlAX5OeWdnWFtbj7wOtlcp8Prausj
	hgrwYfUmQhViiLt2eEYi6Igw8gUhnnSzEzClmeE=
X-Google-Smtp-Source: ABdhPJwcP4KPcv484VyF01Qep4PIMX3N5DS8SXzRXqKyfn9e/YJVHkZwtATYUFBwVX7PJCFToOU4Vt3yEvI75DwKSoo=
X-Received: by 2002:a92:d105:: with SMTP id a5mr11256526ilb.206.1601899283834;
 Mon, 05 Oct 2020 05:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_NRGnxzhzMBiqvu2nY9g+sQqU0H2n=oc3tELTWBa445Lw@mail.gmail.com>
In-Reply-To: <CADnq5_NRGnxzhzMBiqvu2nY9g+sQqU0H2n=oc3tELTWBa445Lw@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 5 Oct 2020 08:01:12 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5uEA5bCe+QaKLAWgRNk442mos9d=3r=W-+dty8EJEKNA@mail.gmail.com>
Message-ID: <CA+5PVA5uEA5bCe+QaKLAWgRNk442mos9d=3r=W-+dty8EJEKNA@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Wed, Sep 30, 2020 at 11:11 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi, amdgpu firmware updates.  Please apply!
>
> Thanks,
>
> Alex
