Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A63C433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 31 May 2022 16:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18BCBC3411F; Tue, 31 May 2022 16:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03287C3411D
	for <linux-firmware@kernel.org>; Tue, 31 May 2022 16:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654016169;
	bh=O7ipYc08a1ud4PjM8jqwqP/HB7ejnhs+7FiRg2RkfLU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ARiBuyJNKGzgJxTFlEh85RbXEWiAvTBEBYqj51JzXFx6PIVpDQSWsRY1Xb83VdGT1
	 LBpbaFpxD0dARTBGBpkBN3x6CqL5NLBLtrQtmHeIcavQfnsbUo60w+kD7VBykl0zoj
	 U9JWDVMO9/1RnSops7og4rVrWikJjFgdP+wSIiedWwR3Jvf8wEEaID0TDbfV34FJqY
	 k/iqr9rCl23AHjJN6k1MGgIk5zxGssd+s31tGRXjmDsgbOkaOeBcf+XIDBI97pJKSx
	 tmbYBxtaoaCizpg8iejPhaZVjMeCG9dLAO10G4vzhrLNC6srqoJvYRJvGxgTbcrXBH
	 au++AavwSQZfQ==
Received: by mail-il1-f172.google.com with SMTP id p1so3972046ilj.9
        for <linux-firmware@kernel.org>; Tue, 31 May 2022 09:56:08 -0700 (PDT)
X-Gm-Message-State: AOAM531v3Fg6JnX3VGlhyBs9hqqFXlC1QCfJhtaH+KpvlwhWEGStspNd
	I9RMT3CGuIFEehKBB8zCkrQPlWufAkj0t9xrQZ8=
X-Google-Smtp-Source: ABdhPJxW+nTmxFvqbYpDjoFa7oeGIavAu7C0DnzXXxPNcupiot1bCXCkfM4+/OZWL4MT60K33XCTLL5unppXnmNnBqQ=
X-Received: by 2002:a05:6e02:1bef:b0:2d3:c3d5:823d with SMTP id
 y15-20020a056e021bef00b002d3c3d5823dmr1602680ilv.2.1654016168137; Tue, 31 May
 2022 09:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR02MB4567904C36E83634CB0ED09292DD9@BYAPR02MB4567.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4567904C36E83634CB0ED09292DD9@BYAPR02MB4567.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 31 May 2022 12:55:57 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4UzaOXNentsgrgeqOV0N+qPpnvBmTuwDOS0fzb6bCGjQ@mail.gmail.com>
Message-ID: <CA+5PVA4UzaOXNentsgrgeqOV0N+qPpnvBmTuwDOS0fzb6bCGjQ@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220530
To: Kalle Valo <kvalo@qca.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 30, 2022 at 9:08 AM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Hi,
>
> Here's a new pull request for ath10k and ath11k. Here I'm adding a missing board file for
> WCN3990, otherwise just regular firmware and board file updates.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit 251d29004ffce3462779dbd08073a2cd8dfd2087:
>
>   amdgpu: update beige goby firmware for 22.10 (2022-05-16 15:25:38 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20220530
>
> for you to fetch changes up to 82b0ef7166e2b7f9d12e7745a2af4e4c75c1aea8:
>
>   ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9 (2022-05-30 16:01:56 +0300)
>
> ----------------------------------------------------------------
> Kalle Valo (7):
>       ath10k: WCN3990 hw1.0: add board-2.bin
>       ath10k: QCA4019 hw1.0: update board-2.bin
>       ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00157
>       ath10k: QCA9888 hw2.0: update board-2.bin
>       ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00157
>       WHENCE: ath11k: move regdb.bin before board-2.bin
>       ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9

Pulled and pushed out.

josh

>
>  WHENCE                              |  11 ++++++-----
>  ath10k/QCA4019/hw1.0/board-2.bin    | Bin 1129788 -> 1154076 bytes
>  ath10k/QCA9888/hw2.0/board-2.bin    | Bin 133540 -> 145684 bytes
>  ath10k/QCA9888/hw2.0/firmware-5.bin | Bin 693604 -> 693700 bytes
>  ath10k/QCA9984/hw1.0/firmware-5.bin | Bin 681568 -> 681672 bytes
>  ath10k/WCN3990/hw1.0/board-2.bin    | Bin 0 -> 461060 bytes
>  ath11k/WCN6855/hw2.0/amss.bin       | Bin 4972544 -> 4972544 bytes
>  7 files changed, 6 insertions(+), 5 deletions(-)
>  create mode 100644 ath10k/WCN3990/hw1.0/board-2.bin
