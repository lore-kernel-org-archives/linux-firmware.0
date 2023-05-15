Return-Path: <SRS0=fWlx=BE=opensource.cirrus.com=prvs=049912dfdb=vitalyr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D466EC77B7D
	for <linux-firmware@archiver.kernel.org>; Mon, 15 May 2023 10:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8FBA1C433EF; Mon, 15 May 2023 10:16:50 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2325C433D2
	for <linux-firmware@kernel.org>; Mon, 15 May 2023 10:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2325C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34F7RF2A029444
	for <linux-firmware@kernel.org>; Mon, 15 May 2023 05:16:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=PODMain02222019;
 bh=dveh45zpaN8KJyYTyFFMgPRuREuQdkqwyoI11GthWOA=;
 b=Zr1XKtqIamvE4sEEl6SW1LVQCaD46Sm6Dg7gbSzdOESKHRYKJn7MYOYbK3dGx2qayzv4
 YU90dAtTG8FIoz1jyikv4yKHHEiS/9SH+nwxqyssIiZcZ3cLgLx4WmyI95ri2VCYFCxl
 iR+ytB1vZq7r9LPxZijlJELweophRU4g+WXmOvUow5VHVOKepzbGfQQknqDYj8FFSS+r
 wJh2kyH3wEe0nZIiLleAFU7eyII0BbKZVaE3tyLF2CIbT3GTUXnkb7ZHTNeFVJXduU9Q
 MQphQFZhxpmf0NAx1FdkbkWCgQaNYr0nXquC5hEbVuIbxzQjXxzSiuVkrpCLSA8S+l3f vg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qj6ymtpmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 15 May 2023 05:16:47 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 15 May
 2023 05:16:46 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 15 May 2023 05:16:46 -0500
Received: from [198.61.64.73] (unknown [198.61.64.73])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 178FD45;
	Mon, 15 May 2023 10:16:46 +0000 (UTC)
Message-ID: <ed062e9b-e301-46e4-419b-8fc91cf2cba8@opensource.cirrus.com>
Date: Mon, 15 May 2023 11:16:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: [PULL linux-firmware] Add firmware for Lenovo ThinkPad P1 Gen 6 and
 HP G10 series laptops
Organization: Cirrus Logic
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MaGdfaOuLjhO1WThkuuO-r9e_P_l9MF4
X-Proofpoint-ORIG-GUID: MaGdfaOuLjhO1WThkuuO-r9e_P_l9MF4
X-Proofpoint-Spam-Reason: safe

Hello,

We would like to add firmware to support CirrusLogic smart amplifier CS35L41

for  Lenovo ThinkPad P1 Gen 6 and HP G10 series laptops.

Please, let me know if there are any problems.

Thanks,

Vitaly


The following changes since commit 8451c2b1d529dc1a49328ac9235d3cf5bb8a8fcb:

   mt76xx: Move the old Mediatek WiFi firmware to mediatek (2023-04-18 
08:14:08 -0400)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware.git main

for you to fetch changes up to fe5abf9dddde7db0350e08e819496f792e5f0c89:

   cirrus: Add firmware and tuning files for HP G10 series laptops 
(2023-05-15 10:52:41 +0100)

----------------------------------------------------------------
Vitaly Rodionov (2):
       cirrus: Add firmware and tuning files for Lenovo ThinkPad P1 Gen 6
       cirrus: Add firmware and tuning files for HP G10 series laptops

  WHENCE                                              |  82 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  cirrus/cs35l41-dsp1-spk-cali-103c8b26.bin           | Bin 0 -> 1868 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin           | Bin 0 -> 1868 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin           | Bin 0 -> 1892 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin           | Bin 0 -> 1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin           | Bin 0 -> 1868 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin           | Bin 0 -> 1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin        | Bin 0 -> 1964 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin        | Bin 0 -> 1968 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin        | Bin 0 -> 1964 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin        | Bin 0 -> 1968 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b74.bin           | Bin 0 -> 1868 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin        | Bin 0 -> 1952 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin        | Bin 0 -> 1952 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin           | Bin 0 -> 1856 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin | Bin 0 -> 1592 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin | Bin 0 -> 1592 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin | Bin 0 -> 1608 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin | Bin 0 -> 1608 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b26.bin           | Bin 0 -> 4816 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b42.bin           | Bin 0 -> 4816 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b43.bin           | Bin 0 -> 4840 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b44.bin           | Bin 0 -> 4928 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b45.bin           | Bin 0 -> 4820 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b47.bin           | Bin 0 -> 4920 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b63-l0.bin        | Bin 0 -> 5408 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b63-l1.bin        | Bin 0 -> 5448 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b63-r0.bin        | Bin 0 -> 5408 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b63-r1.bin        | Bin 0 -> 5448 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b74.bin           | Bin 0 -> 4900 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r0.bin        | Bin 0 -> 5416 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r1.bin        | Bin 0 -> 5388 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin           | Bin 0 -> 4816 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin | Bin 0 -> 4908 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-r0.bin | Bin 0 -> 4908 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-l0.bin | Bin 0 -> 4924 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-r0.bin | Bin 0 -> 4876 bytes
  37 files changed, 82 insertions(+)
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b26.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b74.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b26.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b42.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b43.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b44.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b45.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b47.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b74.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-r0.bin

