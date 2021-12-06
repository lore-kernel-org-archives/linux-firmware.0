Return-Path: <SRS0=Jh2j=QX=chelsio.com=rahul.lakkireddy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF7AC433F5
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Dec 2021 14:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B85BDC341C2; Mon,  6 Dec 2021 14:13:17 +0000 (UTC)
Received: from stargate.chelsio.com (stargate.chelsio.com [12.32.117.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E022C341C1;
	Mon,  6 Dec 2021 14:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E022C341C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=chelsio.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chelsio.com
Received: from localhost (scalar.blr.asicdesigners.com [10.193.185.94])
	by stargate.chelsio.com (8.14.7/8.14.7) with ESMTP id 1B6ED6WM000731;
	Mon, 6 Dec 2021 06:13:07 -0800
Date: Mon, 6 Dec 2021 19:39:33 +0530
From: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-kernel@vger.kernel.org, jwboyer@kernel.org, ramaraju@chelsio.com,
        rahul.lakkireddy@chelsio.com
Subject: pull request: linux-firmware: update cxgb4 firmware to 1.26.4.0
Message-ID: <20211206140932.GA3035@chelsio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)

Please pull the new Chelsio firmware from the following URL.

git://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Thanks,
Rahul


The following changes since commit b0e898fbaf377c99a36aac6fdeb7250003648ca4:

  linux-firmware: Update firmware file for Intel Bluetooth 9462 (2021-11-23 12:31:45 -0500)

are available in the git repository at:

  git://git.chelsio.net/pub/git/linux-firmware.git for-upstream

for you to fetch changes up to 38e72a0f98306c4ddb9608d68bf92f0caf5f1ce9:

  cxgb4: Update firmware to revision 1.26.4.0 (2021-12-06 05:07:25 -0800)

----------------------------------------------------------------
Rahul Lakkireddy (1):
      cxgb4: Update firmware to revision 1.26.4.0

 WHENCE                                         |  12 ++++++------
 cxgb4/t4fw-1.26.2.0.bin                        | Bin 570368 -> 0 bytes
 cxgb4/t4fw-1.26.4.0.bin                        | Bin 0 -> 570880 bytes
 cxgb4/{t5fw-1.26.2.0.bin => t5fw-1.26.4.0.bin} | Bin 676352 -> 676352 bytes
 cxgb4/{t6fw-1.26.2.0.bin => t6fw-1.26.4.0.bin} | Bin 729088 -> 729600 bytes
 5 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 cxgb4/t4fw-1.26.2.0.bin
 create mode 100644 cxgb4/t4fw-1.26.4.0.bin
 rename cxgb4/{t5fw-1.26.2.0.bin => t5fw-1.26.4.0.bin} (77%)
 rename cxgb4/{t6fw-1.26.2.0.bin => t6fw-1.26.4.0.bin} (64%)
