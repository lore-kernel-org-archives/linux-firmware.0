Return-Path: <SRS0=Egvm=5B=chelsio.com=rahul.lakkireddy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913B8C46467
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Jan 2023 10:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59100C433F0; Wed,  4 Jan 2023 10:09:52 +0000 (UTC)
Received: from stargate.chelsio.com (unknown [12.32.117.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7D03C433D2;
	Wed,  4 Jan 2023 10:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A7D03C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=chelsio.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chelsio.com
Received: from localhost (raina-lt.asicdesigners.com [10.193.177.176] (may be forged))
	by stargate.chelsio.com (8.14.7/8.14.7) with ESMTP id 304A9GXG016296;
	Wed, 4 Jan 2023 02:09:28 -0800
Date: Wed, 4 Jan 2023 15:39:16 +0530
From: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-kernel@vger.kernel.org, jwboyer@kernel.org,
        rahul.lakkireddy@chelsio.com
Subject: pull request: linux-firmware: update cxgb4 firmware to 1.27.1.0
Message-ID: <Y7VQTMD97rHTqsBo@chelsio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please pull the new Chelsio firmware from the following URL.

  http://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Thanks,
Rahul


The following changes since commit 52261d0329b1a2e414ee394aae3c5ca36283730f:

  Merge https://github.com/pkshih/linux-firmware (2022-12-16 07:10:10 -0500)

are available in the Git repository at:

  http://git.chelsio.net/pub/git/linux-firmware.git for-upstream

for you to fetch changes up to 52e62d6af5c56b82ef49db415b12c8cfe4faf756:

  cxgb4: Update firmware to revision 1.27.1.0 (2023-01-04 09:14:46 +0000)

----------------------------------------------------------------
Rahul Lakkireddy (1):
      cxgb4: Update firmware to revision 1.27.1.0

 WHENCE                                         |  12 ++++++------
 cxgb4/{t4fw-1.27.0.0.bin => t4fw-1.27.1.0.bin} | Bin 570880 -> 570880 bytes
 cxgb4/t5fw-1.27.0.0.bin                        | Bin 677376 -> 0 bytes
 cxgb4/t5fw-1.27.1.0.bin                        | Bin 0 -> 678400 bytes
 cxgb4/{t6fw-1.27.0.0.bin => t6fw-1.27.1.0.bin} | Bin 729600 -> 730112 bytes
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename cxgb4/{t4fw-1.27.0.0.bin => t4fw-1.27.1.0.bin} (73%)
 delete mode 100644 cxgb4/t5fw-1.27.0.0.bin
 create mode 100644 cxgb4/t5fw-1.27.1.0.bin
 rename cxgb4/{t6fw-1.27.0.0.bin => t6fw-1.27.1.0.bin} (54%)
