Return-Path: <SRS0=kg6i=DY=chelsio.com=rahul.lakkireddy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0040C001DB
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Aug 2023 15:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A05B1C433C8; Mon,  7 Aug 2023 15:05:37 +0000 (UTC)
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BDE90C433C7;
	Mon,  7 Aug 2023 15:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BDE90C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=chelsio.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chelsio.com
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4RKKPh1sX4z7tVc;
	Mon,  7 Aug 2023 15:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chelsio.com; h=
	content-disposition:content-type:content-type:mime-version
	:message-id:subject:subject:from:from:date:date:received
	:received:received; s=mr01; t=1691420726; x=1694012727; bh=kI5MP
	69iBa6cLoIh+BRtC0HvlKLI0Kv4MN7Oqj7TiT0=; b=BAViq3QbfCJgGSJRre8+u
	J7OgvD+UmGywSbZ2obFdMR2sdUUE0MuuI8WVAlkD39yfSK7dZuZEtVTuplgLg6hc
	Bg0l5/UtoERBSKwqN4x6Cf1dFYC3I75WZCyHsAH5deLNnUec8c0bJYg9AsvNmBEp
	KFaxaJL9lJR5gh68mbIWbjIxtCBZqw2ylJrAd7ynwKSi52/emP2E7v2w3ZQzB2UV
	Ew6qdccP1T1s9YRr0+k/XTitHy+CvtgPZr3HGsoiSDJ4BBLTou5nqTFPCSk+aakD
	SEyH3bjwBIsZza6LZB+fZpym6uA6V/BLmkDNEeLx0cXlum2CEx9bMmBceiaF5+9y
	w==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id 4wGAoa0JItkF; Mon,  7 Aug 2023 15:05:26 +0000 (UTC)
Received: from stargate.chelsio.com (stargate.chelsio.com [12.32.117.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by 013.lax.mailroute.net (Postfix) with ESMTPS id 4RKKPd5f4nz7tVb;
	Mon,  7 Aug 2023 15:05:25 +0000 (UTC)
Received: from localhost (arunbr.asicdesigners.com [10.193.177.142] (may be forged))
	by stargate.chelsio.com (8.14.7/8.14.7) with ESMTP id 377F5Mkk012003;
	Mon, 7 Aug 2023 08:05:23 -0700
Date: Mon, 7 Aug 2023 20:35:21 +0530
From: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-kernel@vger.kernel.org, jwboyer@kernel.org, ramaraju@chelsio.com,
        rahul.lakkireddy@chelsio.com
Subject: pull request: linux-firmware: update cxgb4 firmware to 1.27.4.0
Message-ID: <ZNEIMX97ze8lEz9Y@chelsio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please pull the new Chelsio firmware from the following URL.

  http://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Thanks,
Rahul


The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191a8ddb5:

  Merge branch 'rb3-update' of https://github.com/lumag/linux-firmware (2023-08-04 06:33:54 -0400)

are available in the Git repository at:

  http://git.chelsio.net/pub/git/linux-firmware.git for-upstream

for you to fetch changes up to 06fa7dd2046343ecac54b75b9541cffd6dcc64ae:

  cxgb4: Update firmware to revision 1.27.4.0 (2023-08-07 12:32:53 +0000)

----------------------------------------------------------------
Rahul Lakkireddy (1):
      cxgb4: Update firmware to revision 1.27.4.0

 WHENCE                                         |  12 ++++++------
 cxgb4/{t4fw-1.27.3.0.bin => t4fw-1.27.4.0.bin} | Bin 570880 -> 570880 bytes
 cxgb4/{t5fw-1.27.3.0.bin => t5fw-1.27.4.0.bin} | Bin 678912 -> 678912 bytes
 cxgb4/{t6fw-1.27.3.0.bin => t6fw-1.27.4.0.bin} | Bin 730624 -> 730624 bytes
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename cxgb4/{t4fw-1.27.3.0.bin => t4fw-1.27.4.0.bin} (99%)
 rename cxgb4/{t5fw-1.27.3.0.bin => t5fw-1.27.4.0.bin} (60%)
 rename cxgb4/{t6fw-1.27.3.0.bin => t6fw-1.27.4.0.bin} (76%)
