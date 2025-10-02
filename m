Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7483ECAC5B8
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Oct 2025 12:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47E0AC4CEFE; Thu,  2 Oct 2025 12:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322CFC4CEFD
	for <linux-firmware@kernel.org>; Thu,  2 Oct 2025 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759407612;
	bh=Y7jTm+85/7nAfcInpacHOy8DrxPNu/FEhP0iLuM26c0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=QvljaZLGiF7mkOuCBDYqddp57WR0I/UZRgztzoFbcgta0IdWotPxib669nTVsyGrU
	 cv4EpqfCZ4/kRZhRuDyaaLWCI7rnzdYFIyZRNhpfrMXjAcdgU9xvlLlTqTv7/L6qJd
	 KZz5Nr8WNwGp7xwckw/O1BqpXfPzHQgOlSa4COKKDMRG2CekJdFStOzgWBQNnA/2B4
	 Xe0PB23sdqJrMVJ+fGrWEU+/CP8hIGyEWithDSKIZT6UlYkNydGZ9rvg4uVkuT5vkC
	 Wm9pzRkhwcd3CFTg2qnhgdLAswDw8sIL3dRF7xbOaxRxkk94mKm/0Ig3nWlfGl+YG3
	 f7Z96/E4e6hIg==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63470a6f339so1069973d50.0
        for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 05:20:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5pyZ5Cvypzmf9NGOgOsnFl4mLoj8FJBEB9iA6obqIqAoSQ0BWZGVjds+ZJq6p5hCLQ386A4uzDSUW9fK3+A==@kernel.org
X-Gm-Message-State: AOJu0YwLSqoU1sEr9IS0/agjRWFpqI3k9zcQfzEI/+i68frok6uuxz0o
	fB67bBbW1vYOvwynxAUInAHrhvDPbZ03ey2jsGlIpsLu4Cw7sEvurd4jfQ0jHjHn8Lw/EfevBLl
	qbh983bandTVr5f6TfH4zUijCW1jD0r4=
X-Google-Smtp-Source: AGHT+IHYIcqJvu9/Sb80lTMurA6Aj6BiTahl1p/YKToA/HuKw+qsia8JgR8iUWmwygZHBf+8Z9V6S1RnZmE/ozlRo5c=
X-Received: by 2002:a53:dac1:0:b0:635:4ed0:5760 with SMTP id
 956f58d0204a3-63b700a615fmr6065993d50.46.1759407611403; Thu, 02 Oct 2025
 05:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <bbd5acf0-e985-1f55-052d-8d3ecf0aa910@oss.qualcomm.com> <e2wyi33p42lsq5f6ihuw54k5q6czbt2en5ocijswypjgw52dbg@wz6x2fojxvoa>
In-Reply-To: <e2wyi33p42lsq5f6ihuw54k5q6czbt2en5ocijswypjgw52dbg@wz6x2fojxvoa>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 2 Oct 2025 08:19:59 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6gN4M7gchGXPoswHmv7h0NiZ_n063r1GOGGVAujdDbKQ@mail.gmail.com>
X-Gm-Features: AS18NWDdFNMtkIQYho6eKxQDgCyqxinuvfEkhaDwPXtqqARPcZkipTacSbvdgZQ
Message-ID: <CA+5PVA6gN4M7gchGXPoswHmv7h0NiZ_n063r1GOGGVAujdDbKQ@mail.gmail.com>
Subject: Re: add video firmware for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mario Limonciello <superm1@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, linux-firmware@kernel.org, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 8:48=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Oct 01, 2025 at 06:36:11PM +0530, Dikshita Agarwal wrote:
> > Hi,
> >
> > The following changes since commit ed924f6db3c973f941fd6c6317c0d52664e8=
3e5a:
> >
> >   Merge branch 'robot/pr-0-1759253351' into 'main' (2025-09-30 17:36:46=
 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > video-fw-kaanapali
> >
> > for you to fetch changes up to 7c2d4d41e96fdddfa360c0740e8a8ee9b5efb572=
:
> >
> >   qcom: vpu: add video firmware for Kaanapali (2025-10-01 18:32:02 +053=
0)
>
> +Link: qcom/vpu/vpu40_p2.mbn -> vpu40_p2_s7.mbn
>
> Can we please drop that link? FWIW the driver for that platform is not
> yet merged.

This got merged yesterday.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/717

josh
