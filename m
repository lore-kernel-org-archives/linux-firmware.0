Return-Path: <SRS0=oT7t=IU=opensource.cirrus.com=prvs=8739a3522a=vitalyr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B655C4707B
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Jan 2024 19:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 390F1C433F1; Wed, 10 Jan 2024 19:02:35 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04F7AC433C7
	for <linux-firmware@kernel.org>; Wed, 10 Jan 2024 19:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04F7AC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40AHg7lY011554
	for <linux-firmware@kernel.org>; Wed, 10 Jan 2024 13:02:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=Rk47rBE9RQ83QC
	wrVhMx4FOWLVocSAarEfivK+KXqQ4=; b=b2Ms4CyOrtM9mFaw/tyKNXmnp13DyO
	qkWrTM1dqVgoF9GcPVeJU7AFzviIMvmhbRCwVjZ/tAPBX8qNODD+Cy6EOJgOEIa2
	1xvoSl2MLsJyhRz+dm1DRLFn+1GSMXGc35mR20vbmLvp0fz7Sg/ppB9c71+vurKu
	5vHyPVzL7c0LCdgafMPpZGEj0mHU3Mr4/5+VGCwVAPpR2vGmC7sHPbSfbNTTAznB
	/K2/U84M6lNr2DUYBMZDV8PksQ5h4EPga85JCjyjX+ZYrZo6u3M62tJ5Vr2rUf0f
	ZBzroN4Mj400kl/HvY1Y90qFdSY7Rl0KuT8P5Afsq5ra9TsESwy8g5dw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vf552nxrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 10 Jan 2024 13:02:32 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 10 Jan
 2024 19:02:30 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Wed, 10 Jan 2024 19:02:30 +0000
Received: from [198.61.65.157] (unknown [198.61.65.157])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 78921474;
	Wed, 10 Jan 2024 19:02:30 +0000 (UTC)
Message-ID: <cd4c4d75-87c4-4d9d-b849-ef3aca596283@opensource.cirrus.com>
Date: Wed, 10 Jan 2024 19:02:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: Add CS35L41 firmware for Legion Slim
 7 Gen 8 laptops
Organization: Cirrus Logic
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XSWaWltsK9LjjX89mv-wCtSfu5ldfYQd
X-Proofpoint-GUID: XSWaWltsK9LjjX89mv-wCtSfu5ldfYQd
X-Proofpoint-Spam-Reason: safe

We would like to merge the firmware for Legion Slim 7 Gen 8 laptops
using Cirrus Logic CS35L41 amps on I2C bus.

Thanks,
Vitaly

The following changes since commit 323d51ed5b64519e5cffdd51e39c48919b3f3381:

   Merge branch 'robot/patch-0-1704834007' into 'main' (2024-01-10 
12:46:22 +0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ cs35l41_legion7g8

for you to fetch changes up to 2b6dd0c8d9b4273b805943921842774ac71538fe:

   cirrus: Add CS35L41 firmware for Legion Slim 7 Gen 8 laptops 
(2024-01-10 17:12:03 +0000)

----------------------------------------------------------------
Vitaly Rodionov (1):
       cirrus: Add CS35L41 firmware for Legion Slim 7 Gen 8 laptops

  WHENCE                                             |  40 
+++++++++++++++++++++
  .../cs35l41-dsp1-spk-cali-17aa38b4-spkid0-l0.bin   | Bin 0 -> 1536 bytes
  .../cs35l41-dsp1-spk-cali-17aa38b4-spkid0-r0.bin   | Bin 0 -> 1536 bytes
  .../cs35l41-dsp1-spk-prot-17aa38b4-spkid0-l0.bin   | Bin 0 -> 5464 bytes
  .../cs35l41-dsp1-spk-prot-17aa38b4-spkid0-r0.bin   | Bin 0 -> 5464 bytes
  .../cs35l41-dsp1-spk-prot-17aa38b4-spkid1-l0.bin   | Bin 0 -> 5476 bytes
  .../cs35l41-dsp1-spk-prot-17aa38b4-spkid1-r0.bin   | Bin 0 -> 5476 bytes
  7 files changed, 40 insertions(+)
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa38b4-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa38b4-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa38b4-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa38b4-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa38b4-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa38b4-spkid1-r0.bin
