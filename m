Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1D1C433F5
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Mar 2022 12:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4252BC340F6; Wed,  9 Mar 2022 12:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A758C340F3
	for <linux-firmware@kernel.org>; Wed,  9 Mar 2022 12:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646828917;
	bh=LHAIB28Kz3tNaYpxdWarxfSrRGCmeqElibWd2WIzOys=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TzMcVxnl+zskvXgWuPvR+EXDnMqL5n8MWfXRrr83lsZuw4+jzSfhlV+k2qvcSa+Ik
	 9yYZXNA51C0Jy5rC4UJ53Z6nP9FnUUDnJ3iEEcvMGDrUjliWRpK2Brxsqqs+Px461J
	 A6Vbwz6t4O7dykF44NTrw9OC7FZAjaqsroSfudFNqNmzFXKksf1DSRpTTv3hsClx5G
	 k20J6mCTeRe1nFAKEwVV7Q5cKjj/Mfv7zjc1wXCNHmhmJxYTIN7NAGGuaj3QHKe+dN
	 +oELvlqPJ2skW/+nyFS89vFrgHEM72rOhhE4rPCHX7uTT7NJmdo3lK9Lb4ZQ78s6Vw
	 5fFDRFJ/5WL0w==
Received: by mail-il1-f170.google.com with SMTP id j12so1374947ils.0
        for <linux-firmware@kernel.org>; Wed, 09 Mar 2022 04:28:37 -0800 (PST)
X-Gm-Message-State: AOAM532hC/G1p5Wu7fmdWJRclUQymwehdyUL9vkWacQeHDXgtN291McP
	21nyIWsu3VCZBoqu35NIrf7UuGmssH0GI7bxz04=
X-Google-Smtp-Source: ABdhPJzG2p3OSIkkJVGwKtr2MBYB5qyILPfU4tzVnDLbVWmtOONDKP0tu+TM623kHFkvrhjx7973lHhN2S7cgqAQ1Zc=
X-Received: by 2002:a05:6e02:1688:b0:2c6:4a85:a1bf with SMTP id
 f8-20020a056e02168800b002c64a85a1bfmr10991305ila.243.1646828916333; Wed, 09
 Mar 2022 04:28:36 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR02MB4567574A7FBBA13037C4283692089@BYAPR02MB4567.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4567574A7FBBA13037C4283692089@BYAPR02MB4567.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Mar 2022 07:28:25 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7UGLCSvTuDdxKUU65sV8GG1JjoMSAeLuJGo6Afq9xE6w@mail.gmail.com>
Message-ID: <CA+5PVA7UGLCSvTuDdxKUU65sV8GG1JjoMSAeLuJGo6Afq9xE6w@mail.gmail.com>
Subject: Re: [PULL] ath10k & ath11k firmware 20220307
To: Kalle Valo <kvalo@qca.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 7, 2022 at 12:37 PM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Hi,
>
> Here is a small pull request to use "File:" on all ath10k and ath11k notice.txt files and add support for
> WCN6855 hw2.0 and hw2.1 hardware families. Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit f011ccb490f952ea35e9ce4d73ca9b7d0d2453c3:
>
>   linux-firmware: add firmware for MT7986 (2022-03-04 08:43:26 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20220307
>
> for you to fetch changes up to e8bc0db413b4ab7f8e540ffa17991ff61252de9c:
>
>   ath11k: add links for WCN6855 hw2.1 (2022-03-07 19:18:22 +0200)
>
> ----------------------------------------------------------------
> Kalle Valo (4):
>       ath10k/ath11k: mark notice.txt as "File:"
>       ath11k: WCN6855 hw2.0: add board-2.bin and regdb.bin
>       ath11k: WCN6855 hw2.0: add WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>       ath11k: add links for WCN6855 hw2.1

Pulled and pushed out.  Thank you for working with me on this.

josh

>
>  WHENCE                           |   46 +-
>  ath11k/WCN6855/hw2.0/Notice.txt  | 3658 ++++++++++++++++++++++++++++++++++++++
>  ath11k/WCN6855/hw2.0/amss.bin    |  Bin 0 -> 4972544 bytes
>  ath11k/WCN6855/hw2.0/board-2.bin |  Bin 0 -> 1322820 bytes
>  ath11k/WCN6855/hw2.0/m3.bin      |  Bin 0 -> 266684 bytes
>  ath11k/WCN6855/hw2.0/regdb.bin   |  Bin 0 -> 24310 bytes
>  6 files changed, 3686 insertions(+), 18 deletions(-)
>  create mode 100644 ath11k/WCN6855/hw2.0/Notice.txt
>  create mode 100644 ath11k/WCN6855/hw2.0/amss.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/board-2.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/m3.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/regdb.bin
