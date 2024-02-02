Return-Path: <SRS0=IPmu=JL=opensource.cirrus.com=prvs=97625aa8a4=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BE0C48291
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 15:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46A03C43390; Fri,  2 Feb 2024 15:22:48 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3CDBC433F1
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 15:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3CDBC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41268DCj013552
	for <linux-firmware@kernel.org>; Fri, 2 Feb 2024 09:22:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=9HTTZuy5D593dX
	eRzqukh4qDaSfrGh/9nNvqhuTtaAk=; b=LQzJgJGK8ZynBYXsbHAsjqcsqZLeMt
	Ps9uq9bvdgR15m2IZFIU+My5HYA/7WiXK2/YWGzxSZRnJMcbXlNhbchxGd7U/j9O
	O7Jgecx764nx8XXsQ97SG4DzzxiJ8wVNCyZjDo3sTu1DJq3o7HabOa9zKV4+hpfH
	79LmlQ53DYYqBqKaflZLKbtX3Bid3rojc/68y/vygOtoUaevtgJohUPtcnTNvsSy
	Iu2jGgmIilPzCsfj27+vyZW1SZAELDBpH0qoKlsvgcY3ENcEtvNMxhWIkUmoGCDN
	ojPnUWB/S+C7wC5eEX00M5iMkmBMJW9LnbJiD+njOU31BQ6s3rXqSRog==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w0pwx0nbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 02 Feb 2024 09:22:39 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 15:22:38 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Fri, 2 Feb 2024 15:22:38 +0000
Received: from [198.90.238.164] (LONN2DGDQ73.ad.cirrus.com [198.90.238.164])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 21F1C820246;
	Fri,  2 Feb 2024 15:22:38 +0000 (UTC)
Message-ID: <6688576e-64dd-4638-b8e3-4ef09c84d8de@opensource.cirrus.com>
Date: Fri, 2 Feb 2024 15:22:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Correct issues to CS35L41 firmware and
 tuning for HP laptops
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nyswmuY14APz_q722qz0qjGp7yydm6El
X-Proofpoint-ORIG-GUID: nyswmuY14APz_q722qz0qjGp7yydm6El
X-Proofpoint-Spam-Reason: safe

We would like to make some corrections to some issues with CS35L41 
firmware for HP laptops.
Patch 1 corrects symlinks for a couple of HP laptops.
Patch 2 removes firmware and tuning for a couple of laptops which are 
not longer required.

Thanks,

Stefan

The following changes since commit 3677750467cb8286c59462e490df23d8462a84f9:

   Merge branch 'robot/patch-0-1706798549' into 'main' (2024-02-01 
20:46:31 +0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ hp_fw_fix

for you to fetch changes up to 1cf931df1c390227c02594b61edebca6cf77a2f4:

   linux-firmware: Remove 2 HP laptops using CS35L41 Audio Firmware 
(2024-02-02 15:17:12 +0000)

----------------------------------------------------------------
Stefan Binding (2):
       linux-firmware: Fix filenames for some CS35L41 firmwares for HP
       linux-firmware: Remove 2 HP laptops using CS35L41 Audio Firmware

  WHENCE                                       |  28 
++++------------------------
  cirrus/cs35l41-dsp1-spk-cali-103c8d01-l0.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8d01-l1.bin | Bin 1888 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8d01-l0.bin | Bin 4052 -> 0 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8d01-l1.bin | Bin 4052 -> 0 bytes
  5 files changed, 4 insertions(+), 24 deletions(-)
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8d01-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8d01-l1.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d01-l0.bin
  delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d01-l1.bin

