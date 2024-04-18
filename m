Return-Path: <SRS0=QXuG=LX=opensource.cirrus.com=prvs=1838147d1d=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362EAC04FFE
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Apr 2024 15:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F9EDC32781; Thu, 18 Apr 2024 15:53:30 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C743CC3277B
	for <linux-firmware@kernel.org>; Thu, 18 Apr 2024 15:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C743CC3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43I7R4Zp028587
	for <linux-firmware@kernel.org>; Thu, 18 Apr 2024 10:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=O2+igCvG/AQQTZ
	KIVqvsYbwjesg1jsyhNYOTs1DAWP0=; b=fDclz3xjsm6rOwCRlF1hdombAaVK6P
	eRoqCxaOpYM0OsZuQ2B0oKpbt+85qqxm8H6ecInBr4vt897bmgcy3P8WVPg2ijvw
	AQ+d6I7tDSP5keG/afzE/RDuGeZkMS8bzxibLvnzSSTjXO8aegHBHzZQSOy3VrJ7
	m2yy18BvmhrPH9Y81p5KuMvkPRLPSJkLl5/n6vidfHie7U28mt+nVTjmLre/8OkX
	InyeJpudsKhQIVoqK43DUopwNeLbWNG/0K4kfLu7T6DK38Vf7aPjX3RwV2JWV685
	lX5dsmT1RpzEr4Ovbze2LjlOvSU+5tAwAZRWm5EPRe2bYx71Gz9+/g/Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xfpfhvyf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Apr 2024 10:53:27 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Apr
 2024 16:53:25 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 18 Apr 2024 16:53:25 +0100
Received: from [198.61.64.201] (LONN2DGDQ73.ad.cirrus.com [198.61.64.201])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 92933820244;
	Thu, 18 Apr 2024 15:53:25 +0000 (UTC)
Message-ID: <70a172c1-5f65-4392-a1f3-a3f2a8befa2c@opensource.cirrus.com>
Date: Thu, 18 Apr 2024 16:53:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware, tuning parameters and fixes
 for CS35L41
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PILDaVHVmSJUMFVNyYlT7XcR2TU3o5pH
X-Proofpoint-GUID: PILDaVHVmSJUMFVNyYlT7XcR2TU3o5pH
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for Lenovo Legion Slim 7 16ARHA7.
In addition there is a fix for the firmware and tuning files names for 
104316a3.
Also add tuning parameter files for various laptops.
Tuning parameter files are loaded by the driver at the same time the 
Firmware and tuning is loaded.

Thanks,

Stefan Binding

The following changes since commit e6786998c1b5faa669d4154436232dc490079d6b:

   Merge branch 'mt7922' into 'main' (2024-04-17 11:59:01 +0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ cs35l41-various

for you to fetch changes up to dfadf5687922f239eb8b04df0e1726230098b802:

   linux-firmware: Add tuning parameter configs for CS35L41 Firmware 
(2024-04-18 16:39:54 +0100)

----------------------------------------------------------------
Stefan Binding (3):
       linux-firmware: Add CS35L41 HDA Firmware for Lenovo Legion Slim 7 
16ARHA7
       linux-firmware: Fix firmware names for Laptop SSID 104316a3
       linux-firmware: Add tuning parameter configs for CS35L41 Firmware

  WHENCE                                            | 129 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
  cirrus/cs35l41-dsp1-spk-cali-17aa3877.bin         | Bin 0 -> 1536 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa3878.bin         | Bin 0 -> 1540 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa3877-l0.bin      | Bin 0 -> 5680 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa3877-r0.bin      | Bin 0 -> 5680 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa3878-l0.bin      | Bin 0 -> 5704 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa3878-r0.bin      | Bin 0 -> 5704 bytes
  cirrus/cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg | Bin 0 -> 32 bytes
  cirrus/cs35l41/bincfgs/cs35l41-dsp1-16_5dB.bincfg | Bin 0 -> 32 bytes
  cirrus/cs35l41/bincfgs/cs35l41-dsp1-19_5dB.bincfg | Bin 0 -> 32 bytes
  10 files changed, 119 insertions(+), 10 deletions(-)
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa3877.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa3878.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3877-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3877-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3878-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3878-r0.bin
  create mode 100644 cirrus/cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
  create mode 100644 cirrus/cs35l41/bincfgs/cs35l41-dsp1-16_5dB.bincfg
  create mode 100644 cirrus/cs35l41/bincfgs/cs35l41-dsp1-19_5dB.bincfg

