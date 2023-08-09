Return-Path: <SRS0=ccOq=D2=opensource.cirrus.com=prvs=3585fcd417=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E2DC04A94
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Aug 2023 15:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46D02C433D9; Wed,  9 Aug 2023 15:08:49 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC305C433CA
	for <linux-firmware@kernel.org>; Wed,  9 Aug 2023 15:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BC305C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 379BTUxr015936
	for <linux-firmware@kernel.org>; Wed, 9 Aug 2023 10:08:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=JDOwr4JBbLdkso
	b+hgno6a1UNHI3jlADk2CTIaO19QM=; b=WQWGWFSeAFlsJJf9FmSF1Ur0Atgh6I
	0EALa0amdBpEcXlgubfLZVx0HpmB+FGcyj4/MNLvX5Cu47LSPdfAFhxTesCyGAE8
	h7/Y8SfGtlyXAJ9Gqu6cWJDDlgGr9exmT2iF81aU0bwxp80gtzGKK+uocPM6OjAo
	ZOBldJXcIlefVtdlCVR3Xd7WsyCBU31LeqSOttJZ2TYOSbfxD+rcMJMBX11QIU3j
	4R1DC5fHv5FKGirFxmaxIGjeqcZCDcdouSTpbIUcMotEchOx9g2juWYq6tY6Pti0
	RZrhOAAOJwbYQquQ+DZ+bbfXXqA38cbvehbqxf7j8y7g0+PQE0rP3G4Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vtakyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 09 Aug 2023 10:08:46 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 9 Aug
 2023 16:08:44 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Wed, 9 Aug 2023 16:08:44 +0100
Received: from [198.61.64.197] (LONN2DGDQ73.ad.cirrus.com [198.61.64.197])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 48B8D475;
	Wed,  9 Aug 2023 15:08:44 +0000 (UTC)
Message-ID: <ffe87e89-0128-5b3e-153f-642239de6796@opensource.cirrus.com>
Date: Wed, 9 Aug 2023 16:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for HP G11 Laptops
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: d7Lw0ahEPz_n-EgNKLjrxOzCDaokyeYj
X-Proofpoint-ORIG-GUID: d7Lw0ahEPz_n-EgNKLjrxOzCDaokyeYj
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for HP G11 Laptops.

Thanks,

Stefan Binding

The following changes since commit 253cc179d849fc82489773b2b553a49858d8725f:

   amdgpu: Update DMCUB for DCN314 & Yellow Carp (2023-07-31 11:22:02 -0400)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware for-upstream

for you to fetch changes up to 980373f5874787b7d98a204feabdccc971c42dc0:

   cirrus: Add CS35L41 firmware for HP G11 models (2023-08-09 15:57:54 
+0100)

----------------------------------------------------------------
Stefan Binding (1):
       cirrus: Add CS35L41 firmware for HP G11 models

  WHENCE                                                  |  29 
+++++++++++++++++++++++++++++
  cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin               | Bin 0 -> 
1932 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin               | Bin 0 -> 
1940 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin               | Bin 0 -> 
1932 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin               | Bin 0 -> 
1932 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c46.bin               | Bin 0 -> 
4872 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c47.bin               | Bin 0 -> 
4884 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c48.bin               | Bin 0 -> 
4988 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c49.bin               | Bin 0 -> 
4988 bytes
  cirrus/cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw | Bin 0 -> 
34200 bytes
  10 files changed, 29 insertions(+)
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c46.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c47.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c48.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c49.bin
  create mode 100755 cirrus/cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw

