Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F65E77188
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Jan 2025 22:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C03A2C4CEE1; Fri, 10 Jan 2025 22:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B40C4CEDD
	for <linux-firmware@kernel.org>; Fri, 10 Jan 2025 22:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736547804;
	bh=b0q7FFR4RbxHJqvPuGB/vH1ObYaBPdeEja50+qRIHrQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=p32ahyD0lqDCTpaiKGusQ7LZHuHDsB35VljzNivCRvH9ViaWLJiE+p5x41cTKKqV8
	 NOkoho3zEbHRjQqq0YmIvXr/ZIjMYdi03atx7nSR9tMjV2lWBmnoLN8PpU6ZA5Z3gg
	 B2uzNmj7RBrgwvEAkq1N0fVzC5CiFB87KQ2PacF6O4VfJ62X+P9J8pQ/BiiYtA9jH4
	 FQXvfiIpgTKfumiWf0wLcZ4l4PJ0hDku8MYmNaaJLYD05DObRWKJI+07QY6wp/PAqa
	 e5BeuZezgm6wMKPitB0B3M2VHzMP9NFKo0/BFSYSvHR9pq4s3iokByhG9kKh81GkF8
	 081SRtpm3DGHQ==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e460717039fso3507891276.0
        for <linux-firmware@kernel.org>; Fri, 10 Jan 2025 14:23:24 -0800 (PST)
X-Gm-Message-State: AOJu0Yway/jS40ACNUipv6LrnD2ak0FqjWI6TjYTNlBrejRTK5YuF76I
	FyicRO8zf8W8/1bFhd+Z/4BYdcpHA9TfKMYeATJlSViWfoCZ9N4uW+UrcPwv7dtbogGtVPocFCX
	AMGFpzonjOkrPFFpKr1Vvl6YLa20=
X-Google-Smtp-Source: AGHT+IFTXiu1HVbvQP8GD89199WJsITtuOzhYVLPwz3Ft2seBVOmsWiAhewxGwzdg1SzbF4LljekEhv14Jk1B9DTGm4=
X-Received: by 2002:a05:690c:6707:b0:6ef:6f74:9b18 with SMTP id
 00721157ae682-6f5312a6375mr113315817b3.32.1736547803861; Fri, 10 Jan 2025
 14:23:23 -0800 (PST)
MIME-Version: 1.0
References: <002f01db637d$3bbdfc10$b339f430$@opensource.cirrus.com>
In-Reply-To: <002f01db637d$3bbdfc10$b339f430$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Jan 2025 17:23:12 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5XV+jos46Y=cbOAEdAJHxBaQC4eBcmwj0JHBkmLe09+g@mail.gmail.com>
X-Gm-Features: AbW1kvb4hMRYZxrqyXqJTC-F8OyQhNJsn9g_1Ty0HUm0OEgrfcKtlbEyJZGQJZ8
Message-ID: <CA+5PVA5XV+jos46Y=cbOAEdAJHxBaQC4eBcmwj0JHBkmLe09+g@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l56: Correct some links to
 address the correct amp instance
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 11:32=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> I=E2=80=99d like to update some links that pointed to an incorrect amplif=
ier instance.
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit 94fa58192826c8d25a517dba5d9199bca5596f=
56:
>
>
>
>   Merge branch '23.100.2.1' into 'main' (2025-01-10 12:28:18 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250110

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/403

josh

>
>
>
> for you to fetch changes up to 5e1e0ae5ff54388047a6fe6a72a6cd443edfe087:
>
>
>
>   cirrus: cs35l56: Correct some links to address the correct amp instance=
 (2025-01-10 16:25:37 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Correct some links to address the correct amp inst=
ance
>
>
>
> WHENCE | 16 ++++++++--------
>
> 1 file changed, 8 insertions(+), 8 deletions(-)
>
>
