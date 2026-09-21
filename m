Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704B0C982ED
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Sep 2026 19:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 425021F0089C; Mon, 21 Sep 2026 19:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3741F00898
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790019589;
	bh=TlEfKXCg5rHiDJTVNsbZVHr7bZvcSttFpXBa5Vfys1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc;
	b=fXCi+50g/p6esnKbXrT5l4yOjkyme47lIAOq0dB5cRkLF2KIs6GzFdtPXYLVK8yGT
	 hHCJQER3efnQMbY8TgYuYm9QGDH/WzeDtOnrG+wGe9AHVpPxCtVAk3ngSIV8dz9jrp
	 bQ9To2081tZyhZ5jugatQkysS+2w37QcjrWvu4JIJp63BbTlPGKyxwavLnTdbtVnaW
	 Fobv3CAi54ZHj1NKCFrLGnndnW+Mr30RevnGWUeNG7jeflM7bdpHwAyTx/NwLQTtYF
	 Lcr+p8PmwO+jDPFrJkDAY6Jmds34hq1xguy4oOr4f1u5In14Njq6J8i+MjJNzCNGgf
	 CVDfgj4SLPxxw==
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab19125so3440382d50.2
        for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 12:39:49 -0700 (PDT)
X-Gm-Message-State: AFuF++nl/A75vJa8fP/NDjjieyvD0OpcYRld1LfdTKPH3vNTO7Hs0slO
	rD1HPdUU8e9yl+6USsD9ZsVMpjdQk8LjUMfhaA6LCTLB2sOs9sjzXy5jHBSSr5jFRP/aYHB57P9
	3PB/oLiwoNNlnLSmWpfSDeockfQZIfyo=
X-Received: by 2002:a05:690e:1408:b0:671:70d2:5290 with SMTP id
 956f58d0204a3-6718227eb94mr3905390d50.83.1790019588512; Mon, 21 Sep 2026
 12:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <3c89c245-3a4f-46f0-93eb-a138f10a1ef2@oss.qualcomm.com>
In-Reply-To: <3c89c245-3a4f-46f0-93eb-a138f10a1ef2@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 21 Sep 2026 15:39:37 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4BCQm8yVav7Tcxjyo61jyHpk+W4QbsR2JB+GZAxGpzhQ@mail.gmail.com>
X-Gm-Features: AcwNN1UJvQ-v6KBYcktupCrDFyB4cuYBhh0oniY8Yx8HTq1Dje0_HKhmeUNPLNQ
Message-ID: <CA+5PVA4BCQm8yVav7Tcxjyo61jyHpk+W4QbsR2JB+GZAxGpzhQ@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260921
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1270

josh

On Mon, Sep 21, 2026 at 2:58=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
>
> For ath10k and ath11k there are no changes.
>
> For ath12k there are two board updates:
> QCC2072 hw1.0: Add initial support for CQ2390 targeted for IOT platforms
> WCN7850 hw2.0: Add support for board-ids 0x201 & 0x202
>
> Please let me know if there are any problems.
>
> Thanks,
> /jeff
>
> ----------------------------------------------------------------
>
> The following changes since commit 2b8daaf611fbade74f26a5b58ec1defe6a02f5=
e0:
>
>   Merge branch 'qcom-fw-version-diff' into 'main' (2026-09-19 17:16:57 +0=
000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20260921
>
> for you to fetch changes up to e88807ffbf0fce50130cf1f7475acfb8ba365c12:
>
>   ath12k: WCN7850 hw2.0: update board-2.bin (2026-09-21 11:50:36 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (2):
>       ath12k: QCC2072 hw1.0: update board-2.bin
>       ath12k: WCN7850 hw2.0: update board-2.bin
>
>  ath12k/QCC2072/hw1.0/board-2.bin | Bin 401232 -> 526720 bytes
>  ath12k/WCN7850/hw2.0/board-2.bin | Bin 2253964 -> 2431852 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
