Return-Path: <SRS0=dHrD=BB=chelsio.com=rahul.lakkireddy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B186AC7EE24
	for <linux-firmware@archiver.kernel.org>; Fri, 12 May 2023 09:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77D7FC4339E; Fri, 12 May 2023 09:50:28 +0000 (UTC)
Received: from stargate.chelsio.com (stargate.chelsio.com [12.32.117.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC244C433D2;
	Fri, 12 May 2023 09:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BC244C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=chelsio.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chelsio.com
Received: from localhost (venkateshellapu.asicdesigners.com [10.193.177.158] (may be forged))
	by stargate.chelsio.com (8.14.7/8.14.7) with ESMTP id 34C9oF2c021181;
	Fri, 12 May 2023 02:50:16 -0700
Date: Fri, 12 May 2023 15:20:15 +0530
From: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-kernel@vger.kernel.org, jwboyer@kernel.org,
        rahul.lakkireddy@chelsio.com
Subject: pull request: linux-firmware: update cxgb4 firmware to 1.27.3.0
Message-ID: <ZF4L1/RVZXJKhTx0@chelsio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please pull the new Chelsio firmware from the following URL.

 http://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Thanks,
Rahul


The following changes since commit 6c9e0ed5362ff9fd74c11a2b9552a9223371f04a:

  check_whence: error on directory listed as File (2023-05-08 08:38:18 -0400)

are available in the Git repository at:

  http://git.chelsio.net/pub/git/linux-firmware.git for-upstream

for you to fetch changes up to a0146258f1b44913f763eec95168ceb1baa5f4a3:

  cxgb4: Update firmware to revision 1.27.3.0 (2023-05-12 08:55:06 +0000)

----------------------------------------------------------------
Rahul Lakkireddy (1):
      cxgb4: Update firmware to revision 1.27.3.0

 WHENCE                                         |  12 ++++++------
 cxgb4/{t4fw-1.27.1.0.bin => t4fw-1.27.3.0.bin} | Bin 570880 -> 570880 bytes
 cxgb4/{t5fw-1.27.1.0.bin => t5fw-1.27.3.0.bin} | Bin 678400 -> 678912 bytes
 cxgb4/{t6fw-1.27.1.0.bin => t6fw-1.27.3.0.bin} | Bin 730112 -> 730624 bytes
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename cxgb4/{t4fw-1.27.1.0.bin => t4fw-1.27.3.0.bin} (59%)
 rename cxgb4/{t5fw-1.27.1.0.bin => t5fw-1.27.3.0.bin} (50%)
 rename cxgb4/{t6fw-1.27.1.0.bin => t6fw-1.27.3.0.bin} (59%)
