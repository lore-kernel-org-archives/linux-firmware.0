Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40377C7619A
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Apr 2023 13:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E371C433D2; Wed,  5 Apr 2023 13:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16A3C4339B;
	Wed,  5 Apr 2023 13:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680700042;
	bh=eojnZ+619reRyomwmVs8vREEIzlo6k9P3SdC5DMxjlY=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=cH37xRhZtRoGCDAn+OIlFyFPUSS3JD2vkBsg3cb6CVX3N7UyNys3B0+zfY+Bv5/UE
	 unIYyWUM+de1MWLDt3Yxu61NCvi5V63QuoU0dPF14UcRfdnCKDl+K84Wi+GRCqXKfF
	 ljm2hkxheTk62z0WrCmC5dUiDFeU3xmwxL07XEOJ5vR+X0vI708rh2IsOPXz2gJlYe
	 DNp1N0q5NIR8AGTHBBpUKt2xoEmPlH8h4xMHtGHEIDJ1RGsWLVYKwyfz/ZjVbDZhd4
	 63qfq9ZO+yqYiDY8SI2z8A3Ky+ADl+xhTIXp3WnyGj/Cbp5Yc953VQEdcVodJ+3i2o
	 BY1T/WgcoixCw==
From: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, ath11k@lists.infradead.org
Subject: [PULL linux-firmware] ath10k & ath11k firmware 20230405
Date: Wed, 05 Apr 2023 16:07:17 +0300
Message-ID: <87cz4ia35m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here's a pull request for ath10k and ath11k. For ath10k we have lots of
board file updates in multiple hardware families. For ath11k we have new
firmware branches for QCN9074, IPQ6018 and IPQ8074. WCN6750 also got a
firmware update and WCN6855 has board file updates.

Please let me know if there are any problems.

Kalle


The following changes since commit 2e92a49f90f73c8edc44b25c6e669d5e70893c90:

  nvidia: update Tu10x and Tu11x signed firmware to support newer Turing HW (2023-04-04 08:03:53 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20230405

for you to fetch changes up to d1dc30480fef478b06827a428970ef5d763ed76e:

  ath11k: WCN6855 hw2.0: update board-2.bin (2023-04-05 15:56:21 +0300)

----------------------------------------------------------------
Kalle Valo (12):
      ath10k: QCA4019 hw1.0: update board-2.bin
      ath10k: QCA6174 hw3.0: update board-2.bin
      ath10k: QCA9888 hw2.0: update board-2.bin
      ath10k: QCA9984 hw1.0: update board-2.bin
      ath10k: QCA99X0 hw2.0: update board-2.bin
      ath11k: IPQ6018 hw1.0: update board-2.bin
      ath11k: IPQ6018 hw1.0: update to WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
      ath11k: IPQ8074 hw2.0: update board-2.bin
      ath11k: IPQ8074 hw2.0: update to WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
      ath11k: QCN9074 hw1.0: update to WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
      ath11k: WCN6750 hw1.0: update to WLAN.MSL.1.0.1-01160-QCAMSLSWPLZ-1
      ath11k: WCN6855 hw2.0: update board-2.bin

 WHENCE                           |   8 +++----
 ath10k/QCA4019/hw1.0/board-2.bin | Bin 1154076 -> 1798148 bytes
 ath10k/QCA6174/hw3.0/board-2.bin | Bin 731852 -> 740076 bytes
 ath10k/QCA9888/hw2.0/board-2.bin | Bin 145684 -> 206444 bytes
 ath10k/QCA9984/hw1.0/board-2.bin | Bin 220528 -> 281312 bytes
 ath10k/QCA99X0/hw2.0/board-2.bin | Bin 157680 -> 169824 bytes
 ath11k/IPQ6018/hw1.0/board-2.bin | Bin 787208 -> 787208 bytes
 ath11k/IPQ6018/hw1.0/m3_fw.b01   | Bin 6712 -> 6712 bytes
 ath11k/IPQ6018/hw1.0/m3_fw.b02   | Bin 294912 -> 294912 bytes
 ath11k/IPQ6018/hw1.0/m3_fw.mdt   | Bin 6860 -> 6860 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b00   | Bin 340 -> 340 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b01   | Bin 7000 -> 7000 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b02   | Bin 4696 -> 4696 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b03   | Bin 2557136 -> 2602320 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b04   | Bin 412064 -> 386016 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b05   | Bin 198052 -> 202532 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b07   | Bin 9416 -> 9912 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b08   | Bin 453364 -> 464564 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.mdt   | Bin 7340 -> 7340 bytes
 ath11k/IPQ8074/hw2.0/board-2.bin | Bin 1311380 -> 1311380 bytes
 ath11k/IPQ8074/hw2.0/m3_fw.b01   | Bin 136 -> 136 bytes
 ath11k/IPQ8074/hw2.0/m3_fw.b02   | Bin 327680 -> 327680 bytes
 ath11k/IPQ8074/hw2.0/m3_fw.mdt   | Bin 284 -> 284 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b00   | Bin 340 -> 340 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b01   | Bin 328 -> 328 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b02   | Bin 4696 -> 4696 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b03   | Bin 2934864 -> 2978704 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b04   | Bin 1009888 -> 982944 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b05   | Bin 243652 -> 248260 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b07   | Bin 9816 -> 10112 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b08   | Bin 486546 -> 504104 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.mdt   | Bin 668 -> 668 bytes
 ath11k/QCN9074/hw1.0/amss.bin    | Bin 11905872 -> 3963336 bytes
 ath11k/QCN9074/hw1.0/m3.bin      | Bin 340108 -> 340108 bytes
 ath11k/WCN6750/hw1.0/Notice.txt  |  48 ++++++++++++++++++++++++++++-----------
 ath11k/WCN6750/hw1.0/wpss.b00    | Bin 340 -> 340 bytes
 ath11k/WCN6750/hw1.0/wpss.b01    | Bin 6848 -> 6848 bytes
 ath11k/WCN6750/hw1.0/wpss.b02    | Bin 10300 -> 10300 bytes
 ath11k/WCN6750/hw1.0/wpss.b03    | Bin 4096 -> 4096 bytes
 ath11k/WCN6750/hw1.0/wpss.b04    | Bin 5783231 -> 5819999 bytes
 ath11k/WCN6750/hw1.0/wpss.b05    | Bin 175236 -> 164332 bytes
 ath11k/WCN6750/hw1.0/wpss.b06    | Bin 266684 -> 266684 bytes
 ath11k/WCN6750/hw1.0/wpss.b07    | Bin 1176368 -> 1176368 bytes
 ath11k/WCN6750/hw1.0/wpss.mdt    | Bin 7188 -> 7188 bytes
 ath11k/WCN6855/hw2.0/board-2.bin | Bin 6158196 -> 6278772 bytes
 45 files changed, 39 insertions(+), 17 deletions(-)
