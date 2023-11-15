Return-Path: <SRS0=be3m=G4=opensource.cirrus.com=prvs=66833364fe=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC8AC072A2
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Nov 2023 15:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13141C433C8; Wed, 15 Nov 2023 15:56:33 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 988F3C433C7
	for <linux-firmware@kernel.org>; Wed, 15 Nov 2023 15:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 988F3C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AF9x15G006914
	for <linux-firmware@kernel.org>; Wed, 15 Nov 2023 09:56:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=Gk9JQ9MkY9QY1t
	bdwmO8XvFDPc9AekUnX5LHeOVGZnc=; b=KB061rib/0cWUgRSH8meV4sK6hEjHE
	ZLEwJElR4R8DiB0Q6YBFdDbioJ1SrwMJyXhxK7dNIrMPpbxboiepHZ0yJaAeJJFA
	njRl07TLttukgvIPq60ispGI2lNcSyPwpEwoKgMMOQsPYDp4Hn8jfi0e8TrWkxRz
	KcaoL5HdhDHSehslIUWWHpMSf+cu0XBD2D8nsfcZrnOlR9W+OW9nD0zu9lcc8gxo
	8dOq40GpXVMdj7GtsmwURxtzAqWYWfaCR55z3WPc1LlMODV0F5gZWIocy9WDFIUs
	HGXe+FSLFpVDQ6LJ/lOgNXRgUSnyfccXtsHr5/6H+oEI45HFr0mvE19A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ua7w2mvs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 15 Nov 2023 09:56:24 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 15 Nov
 2023 15:56:22 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Wed, 15 Nov 2023 15:56:21 +0000
Received: from [198.61.64.123] (LONN2DGDQ73.ad.cirrus.com [198.61.64.123])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D3EC715A1;
	Wed, 15 Nov 2023 15:56:21 +0000 (UTC)
Message-ID: <a51cfb2b-9df3-66fd-3fb1-1deffd6250f0@opensource.cirrus.com>
Date: Wed, 15 Nov 2023 15:56:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for HP and ASUS laptops
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gu1UJUNC_9Yc0bYiyUBcwOB1d-Ycome-
X-Proofpoint-GUID: gu1UJUNC_9Yc0bYiyUBcwOB1d-Ycome-
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for various HP and ASUS laptops.

Thanks,

Stefan Binding


The following changes since commit b72eeb603950f39f320c8113e56d69cbcfe2cb44:

   Merge branch 'mlimonci/robot-pr-improvements' into 'main' (2023-11-14 
12:40:38 +0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ for-upstream

for you to fetch changes up to 4f498d09a4a6a905f231a52f33886f8a5d22d5de:

   linux-firmware: Add firmware for Cirrus CS35L41 on HP G11 Laptops 
(2023-11-15 15:46:38 +0000)

----------------------------------------------------------------
Stefan Binding (2):
       linux-firmware: Add firmware for Cirrus CS35L41 on 2024 ASUS 
Zenbook Laptops
       linux-firmware: Add firmware for Cirrus CS35L41 on HP G11 Laptops

  WHENCE                                              |  58 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  cirrus/cs35l41-dsp1-spk-cali-103c8ca4.bin           | Bin 0 -> 1988 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l0.bin        | Bin 0 -> 2048 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l1.bin        | Bin 0 -> 2052 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r0.bin        | Bin 0 -> 2048 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r1.bin        | Bin 0 -> 2052 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-l0.bin | Bin 0 -> 2044 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-r0.bin | Bin 0 -> 2048 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-l0.bin | Bin 0 -> 2048 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-r0.bin | Bin 0 -> 2048 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-l0.bin | Bin 0 -> 1936 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-r0.bin | Bin 0 -> 1932 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-l0.bin | Bin 0 -> 1936 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-r0.bin | Bin 0 -> 1932 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-l0.bin | Bin 0 -> 1936 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-r0.bin | Bin 0 -> 1936 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-l0.bin | Bin 0 -> 1944 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-r0.bin | Bin 0 -> 1944 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-l0.bin | Bin 0 -> 1944 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-r0.bin | Bin 0 -> 1944 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-l0.bin | Bin 0 -> 1944 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-r0.bin | Bin 0 -> 1944 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8ca4.bin           | Bin 0 -> 5360 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8cf5-l0.bin        | Bin 0 -> 5460 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8cf5-l1.bin        | Bin 0 -> 5412 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8cf5-r0.bin        | Bin 0 -> 5460 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8cf5-r1.bin        | Bin 0 -> 5412 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-l0.bin | Bin 0 -> 5248 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-r0.bin | Bin 0 -> 5252 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-l0.bin | Bin 0 -> 5276 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-r0.bin | Bin 0 -> 5276 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-l0.bin | Bin 0 -> 4716 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-r0.bin | Bin 0 -> 4716 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-l0.bin | Bin 0 -> 4716 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-r0.bin | Bin 0 -> 4716 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid0-l0.bin | Bin 0 -> 4728 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid0-r0.bin | Bin 0 -> 4728 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid1-l0.bin | Bin 0 -> 4736 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid1-r0.bin | Bin 0 -> 4736 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-l0.bin | Bin 0 -> 5340 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-r0.bin | Bin 0 -> 5340 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-l0.bin | Bin 0 -> 5340 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-r0.bin | Bin 0 -> 5340 bytes
  43 files changed, 58 insertions(+)
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8ca4.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8ca4.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cf5-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cf5-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cf5-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cf5-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c33-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-r0.bin

