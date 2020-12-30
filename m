Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BD2C433E0
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Dec 2020 13:37:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E81EB22227; Wed, 30 Dec 2020 13:37:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C34FC22225
	for <linux-firmware@kernel.org>; Wed, 30 Dec 2020 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609335470;
	bh=Ra2g5Sf7QMEIOX3ZegHSUAhOBEBc0BuRHjW3kFYFpgM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ObSTvQ/yHo1T8+CmOlhVwqpwUe5d2D1HirI0Vj1au/n3glDkFnHQNwZNuIqWraCYl
	 B30zHsbibcfFSN8siOyZs9m7XzmaK+/gQILsTmqcCHeOOk/TF47Ln/H7LQJL/bj+5P
	 1/tDyUM0cR1SrIXNafegvsa4o9iFinqcch4YjwRceyXdBWGrf7EQdHMRzhnkulAMXI
	 K66OuYZnxoGHtXqJboWLc9hVpibAwXLTMv4JSOVc71JkFacS3n7kFe/cVzlzDM6eAx
	 GjTYH7/o/vwD2kG+TWHB04YH+oQt7M2CC8cLBCAgbahPqhyLRk68KknwaPMsrLcHGC
	 Ff586ZUEmvC0w==
Received: by mail-io1-f45.google.com with SMTP id m23so14772038ioy.2
        for <linux-firmware@kernel.org>; Wed, 30 Dec 2020 05:37:50 -0800 (PST)
X-Gm-Message-State: AOAM532RC5++jHm1nZbYKpMAD0WiXteG4MFW0cX0b/0U/23iYLVEiIaw
	R7XC8vyvqvZlPtbYkqmN6BmkM10ZATD30nQIsEs=
X-Google-Smtp-Source: ABdhPJyt3z+/oeGlbV+8yPRM4+b5Iyx4NbGlD6u02YPL6oFAf4XS93uOwxa33EA83sNpQHH2BxjEjKCupKlDCgi6URk=
X-Received: by 2002:a02:b607:: with SMTP id h7mr47065055jam.120.1609335470214;
 Wed, 30 Dec 2020 05:37:50 -0800 (PST)
MIME-Version: 1.0
References: <CAGDk_A-uNtewPCAf3mDOAvjvXY005RCMb2cdBmqtS4ysE392Zg@mail.gmail.com>
In-Reply-To: <CAGDk_A-uNtewPCAf3mDOAvjvXY005RCMb2cdBmqtS4ysE392Zg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 30 Dec 2020 08:37:39 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7qZ_wXnJ-X955+vWx_OMCNoO3eyMAk7LomuLQspxxLnQ@mail.gmail.com>
Message-ID: <CA+5PVA7qZ_wXnJ-X955+vWx_OMCNoO3eyMAk7LomuLQspxxLnQ@mail.gmail.com>
Subject: Re: Suspecting firmware issue on RTL 8152/8153
To: Yorick de Wid <ydewid@gmail.com>, Hayes Wang <hayeswang@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hayes,

Have you seen similar issues?

josh

On Sat, Dec 19, 2020 at 3:50 AM Yorick de Wid <ydewid@gmail.com> wrote:
>
> Hi all,
>
> We've been tracking a bug via Bugzilla which is assigned to the
> virtual alias drivers_network@kernel-bugs.osdl.org.
> It looks like there is no maintainer assigned to the issue.
>
> From what I can tell it points into the direction of a RTL firmware bug.
>
> Konstantin Ryabitsev advised to inform this mailing list as well.
>
> https://bugzilla.kernel.org/show_bug.cgi?id=198931
>
> Yorick de Wid
