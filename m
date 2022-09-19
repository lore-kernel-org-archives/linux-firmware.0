Return-Path: <SRS0=vbd4=ZW=chelsio.com=rahul.lakkireddy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CC7ECAAA1
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Sep 2022 21:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C0CAC433D6; Mon, 19 Sep 2022 21:47:46 +0000 (UTC)
Received: from stargate.chelsio.com (stargate.chelsio.com [12.32.117.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7072C433C1;
	Mon, 19 Sep 2022 21:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7072C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=chelsio.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chelsio.com
Received: from localhost (divyakrishna.asicdesigners.com [10.193.177.136] (may be forged))
	by stargate.chelsio.com (8.14.7/8.14.7) with ESMTP id 28JLlYgS031685;
	Mon, 19 Sep 2022 14:47:35 -0700
Date: Tue, 20 Sep 2022 03:17:33 +0530
From: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-kernel@vger.kernel.org, jwboyer@kernel.org,
        rahul.lakkireddy@chelsio.com
Subject: pull request: linux-firmware: update cxgb4 firmware to 1.27.0.0
Message-ID: <YyjjdfpfEG89h8cw@chelsio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please pull the new Chelsio firmware from the following URL

http://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Thanks,
Rahul

The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:

  amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)

are available in the Git repository at:

  http://git.chelsio.net/pub/git/linux-firmware.git for-upstream

for you to fetch changes up to e6e48db2f8509578902d767b2d05a536b117256e:

  cxgb4: Update firmware to revision 1.27.0.0 (2022-09-19 20:35:56 +0000)

----------------------------------------------------------------
Rahul Lakkireddy (1):
      cxgb4: Update firmware to revision 1.27.0.0

 WHENCE                                         |  12 ++++++------
 cxgb4/{t4fw-1.26.6.0.bin => t4fw-1.27.0.0.bin} | Bin 570880 -> 570880 bytes
 cxgb4/{t5fw-1.26.6.0.bin => t5fw-1.27.0.0.bin} | Bin 676352 -> 677376 bytes
 cxgb4/{t6fw-1.26.6.0.bin => t6fw-1.27.0.0.bin} | Bin 729600 -> 729600 bytes
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename cxgb4/{t4fw-1.26.6.0.bin => t4fw-1.27.0.0.bin} (79%)
 rename cxgb4/{t5fw-1.26.6.0.bin => t5fw-1.27.0.0.bin} (77%)
 rename cxgb4/{t6fw-1.26.6.0.bin => t6fw-1.27.0.0.bin} (71%)
