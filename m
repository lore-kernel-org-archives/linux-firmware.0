Return-Path: <SRS0=hl9n=C7=opensource.cirrus.com=prvs=25581653a8=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCC6C0015E
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Jul 2023 13:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E445C433C8; Thu, 13 Jul 2023 13:05:50 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34831C433C7
	for <linux-firmware@kernel.org>; Thu, 13 Jul 2023 13:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34831C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36DBHdqg010512
	for <linux-firmware@kernel.org>; Thu, 13 Jul 2023 08:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=T76rhh2VyvjLWB
	EzOf3/bJDYxLm67dptxBRPofKo2Ts=; b=f3QMJiqddSArSNwCV6br9G5sjSs3p3
	hElHQ2d3aupABcyXoRbJoXqsVEYEFXD6HSO8Deyto1xW3s34lm90YRk9AFS77Gdi
	3rwFePK7LkdCWO2F8GyOzGtR2GKm4DrixEnNcHr8MHEiHwo0CgY67KPukGi1ha4X
	c1LdJmHZIQgPCbwtCXjBzS8IRABts7io1ALUFgisP5+uxlwmNSBNR/KIAfzz8vu9
	xZqyCjCRqURNbJkVggCVb3TMUQzy6eyfw1LheND2mJouqm4kFbhJRC4pXCFKp1o2
	zYCqKVGwYdWX2vPkg60o95O1mxhDDjL1HjzJtFgIG6Wcf/+zz+zdUI5Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rrtepu8vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 13 Jul 2023 08:05:40 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 13 Jul
 2023 14:05:38 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Thu, 13 Jul 2023 14:05:38 +0100
Received: from [198.61.65.132] (LONN2DGDQ73.ad.cirrus.com [198.61.65.132])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 34B593560;
	Thu, 13 Jul 2023 13:05:38 +0000 (UTC)
Message-ID: <3955b414-261d-c42e-9609-ba7b2aea0949@opensource.cirrus.com>
Date: Thu, 13 Jul 2023 14:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for ASUS ROG 2023 Laptops
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: j3YUIGgBl7-CeUVMhGBXJa-KKSJfESfS
X-Proofpoint-ORIG-GUID: j3YUIGgBl7-CeUVMhGBXJa-KKSJfESfS
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for ASUS ROG 2023 Laptops.

Thanks,

Stefan Binding


The following changes since commit ee91452dac5abfc4c5b9827cf55e701d8c0ca678:

   Makefile, copy-firmware: support xz/zstd compressed firmware 
(2023-06-25 12:18:57 -0400)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware for-upstream

for you to fetch changes up to 1a76e8bb646c08784ad4504d2722ff19c07181fd:

   cirrus: Add CS35L41 firmware for ASUS ROG 2023 Models (2023-07-13 
13:56:15 +0100)

----------------------------------------------------------------
Stefan Binding (1):
       cirrus: Add CS35L41 firmware for ASUS ROG 2023 Models

  WHENCE                                                  | 169 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-l0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-r0.bin     | Bin 0 -> 
1872 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-l0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-r0.bin     | Bin 0 -> 
1872 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-l0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-r0.bin     | Bin 0 -> 
1872 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-l0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-r0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431473-l0.bin            | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431473-r0.bin            | Bin 0 -> 
1872 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431483-l0.bin            | Bin 0 -> 
1868 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431483-r0.bin            | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-l0.bin     | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-r0.bin     | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-l0.bin     | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-r0.bin     | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin     | Bin 0 -> 
1904 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin     | Bin 0 -> 
1904 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-l0.bin     | Bin 0 -> 
1908 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin     | Bin 0 -> 
1908 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-l0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-r0.bin     | Bin 0 -> 
1872 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-l0.bin     | Bin 0 -> 
1872 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-r0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-l0.bin     | Bin 0 -> 
1900 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-r0.bin     | Bin 0 -> 
1900 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-l0.bin     | Bin 0 -> 
1900 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-r0.bin     | Bin 0 -> 
1900 bytes
  cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-l0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-r0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-l0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-r0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-l0.bin     | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-r0.bin     | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-l0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-r0.bin     | Bin 0 -> 
1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-l0.bin     | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-r0.bin     | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-l0.bin     | Bin 0 -> 
1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-r0.bin     | Bin 0 -> 
1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-l0.bin     | Bin 0 -> 
1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-r0.bin     | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-l0.bin     | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-r0.bin     | Bin 0 -> 
1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-l0.bin     | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-r0.bin     | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-l0.bin     | Bin 0 -> 
1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-r0.bin     | Bin 0 -> 
1884 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-l0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-r0.bin     | Bin 0 -> 
4644 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431433-spkid1-l0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431433-spkid1-r0.bin     | Bin 0 -> 
4644 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-l0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-r0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-l0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-r0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431473-l0.bin            | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431473-r0.bin            | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431483-l0.bin            | Bin 0 -> 
4644 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431483-r0.bin            | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-l0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-r0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-l0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-r0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-l0.bin     | Bin 0 -> 
4680 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-r0.bin     | Bin 0 -> 
4676 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-l0.bin     | Bin 0 -> 
4680 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-r0.bin     | Bin 0 -> 
4676 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-l0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-r0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-l0.bin     | Bin 0 -> 
4644 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-r0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-l0.bin     | Bin 0 -> 
5072 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-r0.bin     | Bin 0 -> 
5072 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-l0.bin     | Bin 0 -> 
5072 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-r0.bin     | Bin 0 -> 
5072 bytes
  cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-l0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-r0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-l0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-r0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-l0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-r0.bin     | Bin 0 -> 
4656 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-l0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-r0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-l0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-r0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-l0.bin     | Bin 0 -> 
4656 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-r0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-l0.bin     | Bin 0 -> 
4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-r0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-l0.bin     | Bin 0 -> 
4656 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-r0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-l0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-r0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-l0.bin     | Bin 0 -> 
4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-r0.bin     | Bin 0 -> 
4656 bytes
  cirrus/cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.wmfw | Bin 0 -> 
34100 bytes
  98 files changed, 169 insertions(+)
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431473-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431473-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431483-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431483-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431433-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431433-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431473-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431473-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431483-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431483-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.wmfw

