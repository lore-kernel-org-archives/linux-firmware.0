Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2687C433EF
	for <linux-firmware@archiver.kernel.org>; Wed, 29 Dec 2021 13:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE3F1C36AF0; Wed, 29 Dec 2021 13:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972B4C36AE9
	for <linux-firmware@kernel.org>; Wed, 29 Dec 2021 13:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640785316;
	bh=dzfPPjT7hSRyas9pa7YI5OXmcG0EUUM71OJrnw5yIu8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=oeNCDQNMhrKH84D2RZiwrY/dGWO6FegyOjPfT81sswnWfXKAmRTkvlAFmh1qWU3El
	 IxsGn3cmIdzG0ggcCZ87E+iD9rNJsz9+W1NkSVCxUspQ7cv/+ypHgjnq3jIZLMqGf7
	 ofVRAqOKL/bW8UrIYlsQHeZ22NWfzS1Vct+mZWNbHC+yIAUvK8lSWQZFcHKe1hjsUV
	 tSX2Av1cSQWHrkLmLEfkBLFOU3bAD8e1RGnw5hh5Tl2M7geU+av87/kACug4XYqA9F
	 qGzzioaTPcAWuDSrCJCAQ7u7WlcGqXBTSsnqVKGdqFBJdp9G5o09T5R9CSamoHDajr
	 PuKyMkEvFD+fA==
Received: by mail-io1-f48.google.com with SMTP id x6so25909342iol.13
        for <linux-firmware@kernel.org>; Wed, 29 Dec 2021 05:41:56 -0800 (PST)
X-Gm-Message-State: AOAM5325A/V/ofgPoff44N+TfNBvQKh8GqMpBmMyAq7qE/AQ65d1YYYQ
	LGns7kCgaR/p4VuH7AUX5U3uDf6YLdIHHtx5lfw=
X-Google-Smtp-Source: ABdhPJxCi/z+G0yfW22+nGEA9RjUdxuPFXmBIVx1I3OfpjuQ2fzvjL2ouwxe5NwWtua/B++cDR8MH51nB+XVWVu8k64=
X-Received: by 2002:a02:8501:: with SMTP id g1mr11802355jai.144.1640785315740;
 Wed, 29 Dec 2021 05:41:55 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 29 Dec 2021 08:41:45 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
Message-ID: <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
Subject: Re: [PULL] ath11k firmware 20211223
To: Kalle Valo <kvalo@qca.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 23, 2021 at 9:03 AM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Hi linux-firmware maintainers,
>
> here's a pull request to update ath11k firmware images. We have new hardw=
are support WCN6855 and QCN9074, but also updates to existing hardware.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit f682ecb015df087613f91872712eb6c0f6c998=
a8:
>
>   Merge https://github.com/pkshih/linux-firmware into main (2021-12-16 09=
:42:51 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git =
ath10k-20211223
>
> for you to fetch changes up to 0f161f385f3854086b4fdae2dae786ab6bd3efa5:
>
>   ath11k: WCN6855 hw2.0: add to WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILIC=
ONZ_LITE-2 (2021-12-23 12:40:55 +0200)
>
> ----------------------------------------------------------------
> Kalle Valo (5):
>       ath11k: IPQ6018 hw1.0: update to WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SI=
LICONZ-1
>       ath11k: IPQ8074 hw2.0: update to WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SI=
LICONZ-1
>       ath11k: QCN9074 hw1.0: add to WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILIC=
ONZ-1
>       ath11k: WCN6855 hw2.0: add board-2.bin and regdb.bin
>       ath11k: WCN6855 hw2.0: add to WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_S=
ILICONZ_LITE-2
>
>  WHENCE                           |   14 +-
>  ath11k/IPQ6018/hw1.0/Notice.txt  |   48 +-

These Notice files seem problematic.  They're clearly well intended,
but they have language that alludes to an agreement with Atheros and a
confidential nature to some of the files.  Specifically:

"...your use of these software
components together with the Qualcomm Atheros software (Qualcomm
Atheros software hereinafter referred to as =E2=80=9CSoftware=E2=80=9D) is
subject to the terms of your agreement from Qualcomm Atheros."

Nobody has an opportunity to agree to anything with Atheros when they
consume the files from linux-firmware.  There's also no explicit grant
of redistribution for any of these files.

Also:

"/*
 * Copyright (c) 2011 Qualcomm Technologies, Inc.
 * 2011 Qualcomm Atheros, Inc.
 * All Rights Reserved.
 * Confidential and Proprietary - Qualcomm Technologies, Inc.
 * Notifications and licenses are retained for attribution purposes only.
 */
"

Several of those are followed by "For this file....  has selected the
BSD license"  but it's unclear what file that's referring to.

I'm not comfortable pulling this with the licenses in an ambiguous
state.  Can you work with your team to clarify the text?

josh

>  ath11k/IPQ6018/hw1.0/m3_fw.b01   |  Bin 6712 -> 6712 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.b02   |  Bin 294912 -> 294912 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.mdt   |  Bin 6860 -> 6860 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b00   |  Bin 340 -> 340 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b01   |  Bin 7000 -> 7000 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b02   |  Bin 4696 -> 4696 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b03   |  Bin 2357712 -> 2557456 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b04   |  Bin 370560 -> 412192 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b05   |  Bin 175588 -> 197988 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b07   |  Bin 8936 -> 9408 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b08   |  Bin 409914 -> 452780 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.mdt   |  Bin 7340 -> 7340 bytes
>  ath11k/IPQ8074/hw2.0/Notice.txt  |   48 +-
>  ath11k/IPQ8074/hw2.0/m3_fw.b01   |  Bin 136 -> 136 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.b02   |  Bin 327680 -> 327680 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.mdt   |  Bin 284 -> 284 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b00   |  Bin 340 -> 340 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b01   |  Bin 328 -> 328 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b02   |  Bin 4696 -> 4696 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b03   |  Bin 2589264 -> 2934416 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b04   |  Bin 985504 -> 1009760 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b05   |  Bin 387076 -> 243588 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b07   |  Bin 7048 -> 9816 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b08   |  Bin 424524 -> 485768 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.mdt   |  Bin 668 -> 668 bytes
>  ath11k/QCN9074/hw1.0/Notice.txt  |  802 ++++++++++++++++++++
>  ath11k/QCN9074/hw1.0/amss.bin    |  Bin 0 -> 11897676 bytes
>  ath11k/QCN9074/hw1.0/m3.bin      |  Bin 0 -> 340108 bytes
>  ath11k/WCN6855/hw2.0/Notice.txt  | 1504 ++++++++++++++++++++++++++++++++=
++++++
>  ath11k/WCN6855/hw2.0/amss.bin    |  Bin 0 -> 4984832 bytes
>  ath11k/WCN6855/hw2.0/board-2.bin |  Bin 0 -> 721328 bytes
>  ath11k/WCN6855/hw2.0/m3.bin      |  Bin 0 -> 266684 bytes
>  ath11k/WCN6855/hw2.0/regdb.bin   |  Bin 0 -> 24310 bytes
>  35 files changed, 2382 insertions(+), 34 deletions(-)
>  create mode 100644 ath11k/QCN9074/hw1.0/Notice.txt
>  create mode 100644 ath11k/QCN9074/hw1.0/amss.bin
>  create mode 100644 ath11k/QCN9074/hw1.0/m3.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/Notice.txt
>  create mode 100644 ath11k/WCN6855/hw2.0/amss.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/board-2.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/m3.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/regdb.bin
