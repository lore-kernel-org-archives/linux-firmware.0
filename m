Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7919CD2C544
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Oct 2024 12:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61F08C4CECD; Tue, 22 Oct 2024 12:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47475C4CEE6
	for <linux-firmware@kernel.org>; Tue, 22 Oct 2024 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729599599;
	bh=wKnVb1J40X+cb0ktgF8FgbFB3d24SFSL19LhUuQartE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NAnaH6LAOgnXa1OfhOiFeGimbi/hdIfI//2wTSXgQfbjKpoP33g6p2bsw9xhyiYtI
	 3lgayuEBNJxpPWAmlxHvzFbhx0Dpj1k9qhmSROJKWxvoDIgxbjlVRdTGtxDPBYpFvs
	 8lvNQf+tzxSiWrQ55zsd5xmuz7RGN+wm31hzZ9rnNdeC04LJrHbs5fgadioCOm/kqw
	 Hk2Gj3BlqCDzutPCS5Th4GkTdDWH0r9ep6iCLzXPNo+0DVCVbdXtDQvjDbFHuRGS6g
	 kebSQB2G+AMExuXCP4ffGlB79Lz8KtAMY8yS10ZQ/kjiPmMv7ZLO1b4q71GXCo4Arf
	 z6jGU84XfHDug==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e314136467so48857257b3.0
        for <linux-firmware@kernel.org>; Tue, 22 Oct 2024 05:19:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YxtgChevSAAThihuk6YlsHZv7vmIED0q0aed3kuxgSr1y8Z4vzK
	7+jP1Ryd/YGQVXlVlmWqZq84ElW4XeUj0lafjhwY69S4xbIF5gzr3VqGveGWED2nFLnijrZQT2D
	HyOP3JPqNwsykEJKPlWt1Xscq9jo=
X-Google-Smtp-Source: AGHT+IHZczNLAtXF5lmow8n+wMtrxoXeDjWy3F2cr2srOA/N6w5Y/udokY6EPEVN3AKVEE2b+qhJEp4R9wOZ9E9jvUU=
X-Received: by 2002:a05:690c:6802:b0:64b:1eb2:3dd4 with SMTP id
 00721157ae682-6e7d47cce23mr25751097b3.8.1729599598489; Tue, 22 Oct 2024
 05:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <56dd4ed2-a4a2-4d9d-b23b-2a817fca1f94@quicinc.com>
In-Reply-To: <56dd4ed2-a4a2-4d9d-b23b-2a817fca1f94@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 22 Oct 2024 08:19:47 -0400
X-Gmail-Original-Message-ID: <CA+5PVA65e_3w-gh-ZQPS8PDzxyPNZ_NNFcp7TcMhWi0pNO-x+g@mail.gmail.com>
Message-ID: <CA+5PVA65e_3w-gh-ZQPS8PDzxyPNZ_NNFcp7TcMhWi0pNO-x+g@mail.gmail.com>
Subject: Re: check_whence.py: Add function to get listing of files
To: Vivek Puar <quic_vpuar@quicinc.com>, Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 6:22=E2=80=AFAM Vivek Puar <quic_vpuar@quicinc.com>=
 wrote:
>
> Hi,
>
> Please find below git pull request to update check_whence.py file.
>
>
> The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b2755570955=
58:
>
>    Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17
> 15:40:04 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/vivpuar/linux-firmware
>
> for you to fetch changes up to 95c238e821c95749b50f24f9b6fed080417daadf:
>
>    check_whence.py: Add function to get listing of files (2024-10-18
> 15:19:04 +0530)
>
> ----------------------------------------------------------------
> Vivek Puar (1):
>        check_whence.py: Add function to get listing of files

This doesn't apply cleanly any longer.  Can you rebase it?

josh

>
>   check_whence.py | 33 ++++++++++++++++++++++++---------
>   1 file changed, 24 insertions(+), 9 deletions(-)
>
>
> Regards,
>
> Vivek
>
