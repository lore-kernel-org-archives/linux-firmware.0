Return-Path: <SRS0=dTyL=IU=opensource.cirrus.com=prvs=873957a137=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294FDC4707C
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Jan 2024 14:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD0C8C43390; Wed, 10 Jan 2024 14:55:40 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 947DFC433C7
	for <linux-firmware@kernel.org>; Wed, 10 Jan 2024 14:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 947DFC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40A72W6u013023
	for <linux-firmware@kernel.org>; Wed, 10 Jan 2024 08:55:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=o2fjUxFxPyZlpL
	Py37nCoMcSD8TQWkLscaumSgIkuyY=; b=QJW0gJ5o8EEFRpgnlMsZFoereO5hRg
	Nf/uroauu6fTlbByblQvIuNLb8DBuwW5WwD7Cr139MWc8VqeHMnc3W2JSKrPYYzh
	WlD3JmkiOlVDXWM1MYLW7WDX/EtP0yljji2Pc8EhZzPB7cypjfuk1w3L7G59Pvo0
	6MOazdQqQRZvctrkSL26lXHAsIKutGCH7FufErkHpcTR7qb3mlucnnpMBJZeofKa
	4IeOGvAYLhIF34qCAA6e72ddzO9ldCJ+GB6Xl5xICSiscgGB1ouN1/9VLpKMQUVk
	CLI+zfy/dEezOK8NF9Qvjs59k40MEB19i/KN3VN2fDv/JkVWBe+I7qJg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vf552njeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 10 Jan 2024 08:55:38 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 10 Jan
 2024 14:55:36 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.13) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 10 Jan 2024 14:55:36 +0000
Received: from [198.61.65.232] (LONN2DGDQ73.ad.cirrus.com [198.61.65.232])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 03BCB83155A;
	Wed, 10 Jan 2024 14:55:35 +0000 (UTC)
Message-ID: <9078e155-4d59-4529-8595-f4297f2aeab6@opensource.cirrus.com>
Date: Wed, 10 Jan 2024 14:55:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for Dell systems
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GGKyXhL0XKD9eX71fUfrSCTK5V8meKNi
X-Proofpoint-GUID: GGKyXhL0XKD9eX71fUfrSCTK5V8meKNi
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for various Dell systems.

Thanks,

Stefan Binding

The following changes since commit 323d51ed5b64519e5cffdd51e39c48919b3f3381:

   Merge branch 'robot/patch-0-1704834007' into 'main' (2024-01-10 
12:46:22 +0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ dell_fw

for you to fetch changes up to d4b77b4fdaa3ea00bf26822f38f05fb3fe62bdff:

   linux-firmware: Add firmware for Cirrus CS35L41 for various Dell 
laptops (2024-01-10 13:17:16 +0000)

----------------------------------------------------------------
Stefan Binding (1):
       linux-firmware: Add firmware for Cirrus CS35L41 for various Dell 
laptops

  WHENCE                                                  |  41 
+++++++++++++++++++++++++++++++++++++++++
  cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid0.bin        | Bin 0 -> 
1920 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid1.bin        | Bin 0 -> 
1920 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-l0.bin     | Bin 0 -> 
1924 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-r0.bin     | Bin 0 -> 
1924 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-l0.bin     | Bin 0 -> 
1924 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-r0.bin     | Bin 0 -> 
1924 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280beb-l0.bin            | Bin 0 -> 
2232 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280beb-r0.bin            | Bin 0 -> 
2232 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l0.bin     | Bin 0 -> 
1912 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l1.bin     | Bin 0 -> 
1908 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r0.bin     | Bin 0 -> 
1912 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r1.bin     | Bin 0 -> 
1908 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l0.bin     | Bin 0 -> 
1912 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l1.bin     | Bin 0 -> 
1912 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r0.bin     | Bin 0 -> 
1912 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r1.bin     | Bin 0 -> 
1912 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280b27-spkid0.bin        | Bin 0 -> 
4896 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280b27-spkid1.bin        | Bin 0 -> 
5012 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid0-l0.bin     | Bin 0 -> 
5284 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid0-r0.bin     | Bin 0 -> 
5284 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid1-l0.bin     | Bin 0 -> 
5284 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid1-r0.bin     | Bin 0 -> 
5280 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280beb-l0.bin            | Bin 0 -> 
5456 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280beb-r0.bin            | Bin 0 -> 
5456 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-l0.bin     | Bin 0 -> 
4684 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-l1.bin     | Bin 0 -> 
4684 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-r0.bin     | Bin 0 -> 
4684 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-r1.bin     | Bin 0 -> 
4684 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-l0.bin     | Bin 0 -> 
4688 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-l1.bin     | Bin 0 -> 
4684 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-r0.bin     | Bin 0 -> 
4688 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-r1.bin     | Bin 0 -> 
4684 bytes
  cirrus/cs35l41/v6.80.0/halo_cspl_RAM_revB2_29.82.0.wmfw | Bin 0 -> 
34100 bytes
  34 files changed, 41 insertions(+)
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280beb-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280beb-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280b27-spkid0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280b27-spkid1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280b28-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280beb-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280beb-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid0-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280c4d-spkid1-r1.bin
  create mode 100755 cirrus/cs35l41/v6.80.0/halo_cspl_RAM_revB2_29.82.0.wmfw

