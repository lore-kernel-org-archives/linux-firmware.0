Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEF6C369D3
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Apr 2025 13:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB297C4CEEE; Tue, 22 Apr 2025 13:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56E7C4CEEA
	for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745329287;
	bh=N19FrgGTcdkh++JMcwxzAiXDq4nFd61Clmk3t5m9c50=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=gnmQJx/9hIQHZGH9XoiVW3YAmD87d0BLTdEYoyS7vAkXhkD4wMz36nrzAB4MSFkNl
	 PB3bo6X/YPRD0hn2LRuHckpLt3tByXYFIbXjo3PVZhX75qlcB+1NNmkBWFZYAgzwxq
	 i2oOPJY4XC62brwi9K+Q4BVml1t3ziy/ZiQUkOWaMggRGoJ7TQ+aL96jQD9TVADXm0
	 6b0zngxJD1LNCBU5Y2CdaEYBrPifuDu6iAFV/blvN88AR9TNRFCSQAWsX0UhJBzF/u
	 iY9pWJQQY0SEC4ZmtAbA+V+9TL8LqUnJW9HnxnTmnUFGbQKQXOZpi5d3+/jr3+yVsV
	 mePWLWUSPUOoA==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e643f235a34so3898828276.1
        for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 06:41:27 -0700 (PDT)
X-Gm-Message-State: AOJu0YyF/8m8YmRd76/87ZL4+S73ft0OlfLfrixWcO72p2yTnO5F0A45
	tqBW8AOI46zo96V10MqjoiWgYF3ZO4rXLqHB/QBb/yyY88bN1al6TlHgabCxiqZ7FHgu/90FaBb
	V1ez7RXZ9J9GXMMH+F2ypOkWKiuU=
X-Google-Smtp-Source: AGHT+IF34MZegsCuUxSOjGXZ/5Fjtt8VTvQBlIBBYFL36HGe/5SijRyqfMKHsHrK/lHdO35wafVcOU2aS3amSRmo8C4=
X-Received: by 2002:a05:6902:114f:b0:e72:97bc:a19b with SMTP id
 3f1490d57ef6-e7297dc97dbmr21423026276.16.1745329287016; Tue, 22 Apr 2025
 06:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <e4c6c159-7824-4fa9-b7b2-5f36c97ef6c2@oss.qualcomm.com>
In-Reply-To: <e4c6c159-7824-4fa9-b7b2-5f36c97ef6c2@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 22 Apr 2025 09:41:15 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5rSmTLL_rWOd7n=0oB5Za8fPeOTOvukR3KfFxve+vkRQ@mail.gmail.com>
X-Gm-Features: ATxdqUHTHqqPfSQZZHCb1BAALAhEgtqtrEHQNRx2YCwXEzoV82KJvfr3sL6Ogz4
Message-ID: <CA+5PVA5rSmTLL_rWOd7n=0oB5Za8fPeOTOvukR3KfFxve+vkRQ@mail.gmail.com>
Subject: Re: Firmware point releases / LTS branches
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 9:22=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Hello,
>
> Up to now we have been having a single stream of linux-firmware
> releases. One of my colleagues has raised a question of providing
> bugfixes for the firmware. In other words, what should be our course of
> actions (and should be our recommendations to the distributions if we
> want to provide a bugfix or a security fix for the binary that was a
> part of one of the previous linux-firmware releases?

That requires firmware vendors to provide more insight into the
changes being made, as well as discrete changes for fixes vs.
features/upgrades.  It's more work for them to do this and we have
little influence there.

> Usually we can not recommend e.g. Debian to just bump up to the next
> release. By requiring them to backport necessary binary patches might be
> a bit of a burden.

Why can't we recommend Debian do that?  As far as I know, that's
exactly what every other distro does.  It's not entirely clear what
problem we're trying to solve.

> Would it make sense to handle a coordinated point branch release at
> certain point(s) through the year?

Can you lay out what that workflow would look like considering the
main concern on the vendor side?  I'm not necessarily opposed to doing
this, but at first glance it seems rather infeasible to solve
comprehensively.

josh
