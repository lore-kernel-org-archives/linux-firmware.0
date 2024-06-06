Return-Path: <SRS0=QTZ6=NI=opensource.cirrus.com=prvs=388799c159=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B1DC25B75
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Jun 2024 13:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A931C32786; Thu,  6 Jun 2024 13:48:08 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8B45C2BD10
	for <linux-firmware@kernel.org>; Thu,  6 Jun 2024 13:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C8B45C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456Djtep030886
	for <linux-firmware@kernel.org>; Thu, 6 Jun 2024 08:48:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=v3tAaSjwHRY7vOyH
	L3MOQUU+VxN4W6Tfqe43Qeqi0Uk=; b=KRkuXjiqVt1sHchcj96AZNnS1MAxOlFd
	7E4x1sClTs9z/00EjUJnZHq0JpHIqWVi9nvuBFSP7oUfD0ou9ofcIECFuVRCstWh
	xBR3EfDCbQ8u1VjCzDrSDzdpEpMonk/m3RYqOWjvF9SYzPSY3I89vSVfxcLMmukJ
	LZchkjXO6zsnfnr5eG/8qowgu49lAWX06h7PWNiTwoaVMIOe+0TzM6FRzfH9f/F5
	LRUNTDcZJYeUEpoj2TrZrZPSvKlu11/Xiq7rVSdJPLk/WDU/x7YZiM6ZkydfCpE2
	nK/EHIUg1gUO8wKrCHB+LpCjrcY+z29DwqXJuvwxpdgiI4COjse97w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yg02hn7v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 06 Jun 2024 08:48:01 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 14:48:00 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 6 Jun 2024 14:48:00 +0100
Received: from [198.61.65.119] (LONN2DGDQ73.ad.cirrus.com [198.61.65.119])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 19B10820249;
	Thu,  6 Jun 2024 13:48:00 +0000 (UTC)
Message-ID: <643c03aa-12dd-4e02-9086-e139d7671adf@opensource.cirrus.com>
Date: Thu, 6 Jun 2024 14:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for Lenovo Thinkbooks
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5AS6N0dTwBMma69sYpMMTOYxFG4DSodX
X-Proofpoint-ORIG-GUID: 5AS6N0dTwBMma69sYpMMTOYxFG4DSodX
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for Lenovo Thinkbook 13X Gen 4 and Lenovo Thinkbook 16P Gen 5.

Thanks,

Stefan Binding

The following changes since commit 22643bb4fb5e2693fa67cfca1f133d650bcf16be:

   Merge branch 'amd-staging' into 'main' (2024-06-04 18:18:52 +0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ 2024-06-06

for you to fetch changes up to 7f194335c1872ab7c68c17cac41e7070d0e8ae41:

   linux-firmware: Add firmware for Lenovo Thinkbooks (2024-06-06 
14:18:56 +0100)

----------------------------------------------------------------
Stefan Binding (1):
       linux-firmware: Add firmware for Lenovo Thinkbooks

  WHENCE                                              |  16 ++++++++++++++++
  cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin | Bin 0 -> 5396 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin | Bin 0 -> 4280 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin | Bin 0 -> 5396 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin | Bin 0 -> 4280 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin | Bin 0 -> 5396 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin | Bin 0 -> 4360 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin | Bin 0 -> 5396 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin | Bin 0 -> 4360 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin | Bin 0 -> 5496 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin | Bin 0 -> 5496 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin | Bin 0 -> 5544 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin | Bin 0 -> 5544 bytes
  13 files changed, 16 insertions(+)
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin

