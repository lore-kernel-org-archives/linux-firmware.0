Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D462ECA0EE4
	for <linux-firmware@archiver.kernel.org>; Wed, 20 Aug 2025 16:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7193C16AAE; Wed, 20 Aug 2025 16:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09F8C116C6;
	Wed, 20 Aug 2025 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755706641;
	bh=t+ycOb5iNlE3oQujrJjZp9WkbI6MVMq0bnMqM9b7LRo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=paPpanP+6j6Id2XAQw+l1Ns/fBw8uqCODHLS07VZOP4anZjsKxmN9dCWD++x+wraI
	 RYDwIyP3j9cxaeNkR521mN0qJcD7jLGEpNYitPxmFVbm7RLysSjhliawQcwHVtff40
	 1LsKtml83GDX1A1EdsY8erWB9VID5hlrpMKHhjljHz0B1RVHkvAqWSDLkD/AUURw97
	 3m2pGfFJfSNLfrDMujwok/XYtuGJL/n90ZgHyPOqeG7ru74CaB0A8jG30BA3rF7EZr
	 mjjmfEh4z/HujqX4+vJ9osqb9BpxqR6uOh+y/SH0Bw2nVi78qHT7pXZAFkDZmCLRFM
	 4Z8m9E+9k/SEg==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e94eec0de32so61665276.0;
        Wed, 20 Aug 2025 09:17:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0bs+URE7aGQrSDYaHqm2VcgGvqBA9hyFFkMe4IJGmWpDuXy0cEk1pmxnzZOII4/9ceA5YAmPu1g==@kernel.org
X-Gm-Message-State: AOJu0YyIYT7mkOrrjuqtduqsIWoiiiuYfa21ah52lip/98IDYKvbw7Z9
	97ZfHqfBkXQJ8jaOcu3YNiO6BUrJd0VBlsl29UJXWtDey1ZsvQY8wL6nJchrW7kuregHPXo5/ah
	PIhQTFu68F4/onlF3v9+4wMtx2s3Q8Ww=
X-Google-Smtp-Source: AGHT+IEIvxy4pkBjmIrsNlC8iA7B1npTls4qyfPoYOP3dde7/lkDCFEZHzVAICwtTDSEfLDZEszUUaKvJvkzNr8ObbM=
X-Received: by 2002:a05:6902:430c:b0:e94:e1e5:37f4 with SMTP id
 3f1490d57ef6-e94f6707983mr3154446276.50.1755706640799; Wed, 20 Aug 2025
 09:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <323382be-397d-4df6-976a-89319fe97202@oss.qualcomm.com>
In-Reply-To: <323382be-397d-4df6-976a-89319fe97202@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 20 Aug 2025 12:17:09 -0400
X-Gmail-Original-Message-ID: <CA+5PVA53_O+TmvHcJM-7xLaE5wwtELJE-oX8f=WZFnA+ZZSRGA@mail.gmail.com>
X-Gm-Features: Ac12FXzHSnPFBjD5SgC0DQxSz5oP68mLKNVoc6XNbXGuiE3XiYL4ENWc4kWi5wk
Message-ID: <CA+5PVA53_O+TmvHcJM-7xLaE5wwtELJE-oX8f=WZFnA+ZZSRGA@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath11k firmware ath-20250820
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 11:24=E2=80=AFAM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> Hi,
> Here is a new pull request for ath11k firmware.
>
> This adds an alternative firmware for WCN6855 that is part of NFA765,
> optimized for IoT applications.
>
> Please let me know if there are any problems.
>
> Thanks,
> /jeff
>
> ---
>
> The following changes since commit 5dcaa87d4035f437acb9d8817d88b269322698=
63:
>
>   Merge branch 'robot/pr-0-1755692386' into 'main' (2025-08-20 13:19:30 +=
0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250820

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/656

josh

>
> for you to fetch changes up to 71b945d2190cbaf6bebe8c1a8b0b41a71d65ec31:
>
>   ath11k: WCN6855 hw2.0@nfa765: add to WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V=
2_SILICONZ_IOE-1 (2025-08-20 08:01:38 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath11k: WCN6855 hw2.0@nfa765: add to WLAN.HSP.1.1-04685-QCAHSPSWPL_=
V1_V2_SILICONZ_IOE-1
>
>  WHENCE                                 |    4 +
>  ath11k/WCN6855/hw2.0/nfa765/Notice.txt | 3658 ++++++++++++++++++++++++++=
++++++
>  ath11k/WCN6855/hw2.0/nfa765/amss.bin   |  Bin 0 -> 5005312 bytes
>  ath11k/WCN6855/hw2.0/nfa765/m3.bin     |  Bin 0 -> 266684 bytes
>  4 files changed, 3662 insertions(+)
>  create mode 100644 ath11k/WCN6855/hw2.0/nfa765/Notice.txt
>  create mode 100644 ath11k/WCN6855/hw2.0/nfa765/amss.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/nfa765/m3.bin
