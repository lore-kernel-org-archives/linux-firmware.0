Return-Path: <SRS0=Wdkt=JS=opensource.cirrus.com=prvs=9769893da0=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808DDC4828F
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Feb 2024 14:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 310E7C43390; Fri,  9 Feb 2024 14:43:21 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19173C433C7
	for <linux-firmware@kernel.org>; Fri,  9 Feb 2024 14:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 19173C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 419BeHOY000486
	for <linux-firmware@kernel.org>; Fri, 9 Feb 2024 08:43:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=rtPGb+bt20asJQ
	tkxCKdf8BGGrLl0a7CZIcNKBa8DYU=; b=JEWFoRpEVjg+Ddnj57OX8umV0CjItN
	EEYzhdF5OCsHrOuN5PrltEHzTG8wDbecBNftEt8QqSAd4f8EBUAItHLiSaqbiuHc
	xGAHjIEJrcXzYyMcijy0vo0VSfXNkw0xr07DNWsuGY3Kd8Lnq10eO/9XmFTOmm/t
	0/kvso0edHKYjZSW2TYdyxaWPTRdlpDTGgK3vPHYDybAR90VN5rWM9MAGXsq5hKs
	uEd2dMmxhkLvt5VP15pHYhh8WH9S3Ktqt4tiF/uFBKPe65PiO0FmTvMauaN52kZ5
	LQAFdkw1W9/yH3/Xw5Pxo4TTnHt+wfaDB6GqpCPVhfSdSmTUJYs9PTrw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w46p7b6jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Feb 2024 08:43:18 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 14:43:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 9 Feb 2024 14:43:16 +0000
Received: from [198.90.238.186] (unknown [198.90.238.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7288D820243;
	Fri,  9 Feb 2024 14:43:16 +0000 (UTC)
Message-ID: <f49de145-d78e-4283-aff2-9074e4df67e6@opensource.cirrus.com>
Date: Fri, 9 Feb 2024 14:43:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add CS35L41 firmware for additional ASUS
 Zenbook 2023 models
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3rlCrLouQb9qbJeFg85qzX1R4Zu3u2fp
X-Proofpoint-GUID: 3rlCrLouQb9qbJeFg85qzX1R4Zu3u2fp
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for 3 ASUS Zenbook 2023 models.

Thanks,

Stefan Binding

The following changes since commit fbef4d381e3d0143427e1a8c924be8e738c0fc2d:

   Merge branch 'main' into 'main' (2024-02-08 12:24:01 +0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ asus_zenbook_2023

for you to fetch changes up to 4cccf3f90e98a6f5ec8fbe7c7b89b598ab605dd9:

   linux-firmware: Add CS35L41 firmware for additional ASUS Zenbook 2023 
models (2024-02-09 14:38:07 +0000)

----------------------------------------------------------------
Stefan Binding (1):
       linux-firmware: Add CS35L41 firmware for additional ASUS Zenbook 
2023 models

  WHENCE | 30 ++++++++++++++++++++++++++++++
  1 file changed, 30 insertions(+)

