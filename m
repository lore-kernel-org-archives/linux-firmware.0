Return-Path: <SRS0=CMxi=AD=opensource.cirrus.com=prvs=946627cd30=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FBEC77B6E
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Apr 2023 16:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0FC6C4339B; Wed, 12 Apr 2023 16:11:06 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58541C433EF
	for <linux-firmware@kernel.org>; Wed, 12 Apr 2023 16:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58541C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33C5sGEp023356
	for <linux-firmware@kernel.org>; Wed, 12 Apr 2023 11:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=PODMain02222019;
 bh=/3b4RE1sdU6Uhxs5lY4zgMZW5xgEu3WPcRXmeDeBdL8=;
 b=B74JAZJeNX8vi9mqDEIJ5/PUpdHI8tIWJcY3IpaD9kkwOkB3bEShKIRwBJ0eXPgnJNYR
 zGdgV16ufR3mrOl3rEIXFTig17GGwfu+FFdguJRplu3Jpx5QAltrTDqSkEVKQuMByFV7
 R5/5Sr4pwgH7ImjCFSkGQ0Bu2g4MfuFckx2VVIha4oSx3SHRo/BcIO85kMnKbYQ3Rd7J
 XGaaTZXoDSdZ/35AKmH1dkqwb9jsLo6EovrjxmvyptzzV5C+WqeGwht5lURKC1h94vZf
 IBpjNUkJtHXNy6790R8rCdlIZh025dSKnsCj56bs0kKgWqVTfpinQBwhMkr017rMMuL1 jw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pu4pq77h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 12 Apr 2023 11:11:04 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 12 Apr
 2023 11:11:02 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Apr 2023 11:11:02 -0500
Received: from [198.90.238.125] (unknown [198.90.238.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 588CD11D3;
	Wed, 12 Apr 2023 16:11:02 +0000 (UTC)
Message-ID: <cff63468-447a-fcd5-ec9b-249a5b37e1da@opensource.cirrus.com>
Date: Wed, 12 Apr 2023 17:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for Lenovo Z13/Z16 Gen2
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: I6YriYgFCBFUZKJeF80mLFIf8gymPQit
X-Proofpoint-ORIG-GUID: I6YriYgFCBFUZKJeF80mLFIf8gymPQit
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for Lenovo Laptops Z13/Z16 Gen2.

Thanks,

Stefan Binding

The following changes since commit 86da2ac9b4e57e9a88f8bfcb5a163a406f5c00e1:

   Merge https://github.com/pkshih/linux-firmware (2023-04-06 07:30:31 
-0400)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware.git for-upstream

for you to fetch changes up to 74afc00db84cb49768a057720c8595c04786ed20:

   linux-firmware: Add firmware for Cirrus CS35L41 on Lenovo Laptops 
(2023-04-12 16:45:03 +0100)

----------------------------------------------------------------
Stefan Binding (1):
       linux-firmware: Add firmware for Cirrus CS35L41 on Lenovo Laptops

  WHENCE | 18 ++++++++++++++++++
  1 file changed, 18 insertions(+)

