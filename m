Return-Path: <SRS0=PkGb=ML=opensource.cirrus.com=prvs=2858ed503d=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5337C04FFE
	for <linux-firmware@archiver.kernel.org>; Wed,  8 May 2024 15:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D606C2BD11; Wed,  8 May 2024 15:35:34 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CB29C2BD10
	for <linux-firmware@kernel.org>; Wed,  8 May 2024 15:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9CB29C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448EK2ms014228
	for <linux-firmware@kernel.org>; Wed, 8 May 2024 10:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=Rak1eMikKl1aVA
	m3WNcm4qoNb5wjO3k9x4lTMObneVc=; b=Y+vPyL6YVAcTasmIU3OAwwd7wc9GKk
	HyEExmjV0mKObMDQ0Bp834OS90YUFuFKP99ZDjPEH1HCRf46dkNRooU+TOB73Xz8
	kqP8IXsAYs4yrJDyqS0crcsHzCUqzqXoQ5hWmoErBREnQF+nYo+cWM6IOwvmy3Jz
	peS5bKeHsQYb9sYKDT4CiV0B8TKhyBtDINqgOwWV0FQQ+GEoIt+G/113X2tjz9CE
	Pd5jlOwhCEMFCn2o1FAo4xLLM7wXjHenRvZnDM7oF9zZBzViyMtRyi23eBzbsF8E
	YEdrJAWfKeuU7fPdm59kE6kT7Kor67pZ+7Hd8zyTLYZT25kgch+FNEeQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xyshes6cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 08 May 2024 10:35:26 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 16:35:24 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Wed, 8 May 2024 16:35:24 +0100
Received: from [198.61.65.12] (LONN2DGDQ73.ad.cirrus.com [198.61.65.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3FADB820249;
	Wed,  8 May 2024 15:35:24 +0000 (UTC)
Message-ID: <04b84db4-8d51-4527-b393-d8a9b8cbee48@opensource.cirrus.com>
Date: Wed, 8 May 2024 16:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add and update firmware for Cirrus Smart Amp
 CS35L41 for HP and Asus laptops
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DpTfBjVrEIGZ7b8xVMILmfTC2vSBj0Hf
X-Proofpoint-ORIG-GUID: DpTfBjVrEIGZ7b8xVMILmfTC2vSBj0Hf
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for an Asus laptop, as well as updating firmware for a HP laptop.

Thanks,

Stefan Binding

The following changes since commit b93493c01691104b9a9b612f9e161702418d10a3:

   Merge branch 'robot/pr-0-1714981108' into 'main' (2024-05-06 10:53:59 
+0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ 2024-05-08

for you to fetch changes up to a43af4a3458d824b17c8bcadf8ee011629491d41:

   linux-firmware: Add CS35L41 HDA Firmware for Asus HN7306 (2024-05-08 
15:37:35 +0100)

----------------------------------------------------------------
Stefan Binding (2):
       linux-firmware: Update firmware tuning for HP Consumer Laptop
       linux-firmware: Add CS35L41 HDA Firmware for Asus HN7306

  WHENCE                                              |   5 +++++
  cirrus/cs35l41-dsp1-spk-prot-103c8cde-spkid0.bin    | Bin 4060 -> 4068 
bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8cde-spkid1.bin    | Bin 4056 -> 4064 
bytes
  cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid0-l0.bin | Bin 0 -> 4552 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid0-r0.bin | Bin 0 -> 4552 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid1-l0.bin | Bin 0 -> 4552 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid1-r0.bin | Bin 0 -> 4552 bytes
  7 files changed, 5 insertions(+)
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid1-r0.bin

