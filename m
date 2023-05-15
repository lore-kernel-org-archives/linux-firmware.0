Return-Path: <SRS0=fWlx=BE=opensource.cirrus.com=prvs=049912dfdb=vitalyr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181A4C77B75
	for <linux-firmware@archiver.kernel.org>; Mon, 15 May 2023 15:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DEEBDC433EF; Mon, 15 May 2023 15:29:16 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 667FCC433D2
	for <linux-firmware@kernel.org>; Mon, 15 May 2023 15:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 667FCC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34F2ni9C012887
	for <linux-firmware@kernel.org>; Mon, 15 May 2023 10:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=PODMain02222019;
 bh=6Zp2krCMB1GLVWoo0kIoo43JjZJY7gpkp1Nh84vAyAE=;
 b=H72W6lUCie1tPq3MzHb8PMhEK08xyV7ZXmloT/YLP3ewdvdN2DRBM6aECaPwKzj9cMXf
 YrpCK/p0N0J/1daFzV9iGLeSi5ccgThXZFUf2JWQPG6JDqgGZCsHBk+xHtha09Y8w/S9
 iD+R/Sh0tKm223bVQWkoZnEvwpoQLHodoDiPRLbpgkDqyoRNbvGkL0U1G2PNjo1RfRvo
 sHHIkbAs6v5g4AL8bu5HsMdfSwpDYYv4l2zwY8HS0HdS+KAlvsrPfs143vU6J2RbBQfN
 vPKQ7HIs/uIb2pHoC+h+Zm0OPwIFEgF4f4HeREYJRc+vR/8XdTWEfaxEreRpU+RYageK Xw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qj6ymu2yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 15 May 2023 10:29:13 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 15 May
 2023 10:29:05 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 15 May 2023 10:29:05 -0500
Received: from [198.61.64.73] (unknown [198.61.64.73])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5689945;
	Mon, 15 May 2023 15:29:05 +0000 (UTC)
Message-ID: <218e5f67-02b4-7eee-e999-8ef1815b3bfc@opensource.cirrus.com>
Date: Mon, 15 May 2023 16:29:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: [PULL v2 linux-firmware] Add firmware for Lenovo ThinkPad P1 Gen 6
 and HP G10 series laptops
Organization: Cirrus Logic
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xmq1NEdZa6vMbavHnOakTABRZPVW1MDI
X-Proofpoint-ORIG-GUID: xmq1NEdZa6vMbavHnOakTABRZPVW1MDI
X-Proofpoint-Spam-Reason: safe

Hello,

Sorry, mistake is now corrected. make check - no errors. Please, see 
pull request below.

Changes since version 1:

  - removed extra files

  - added missing firmware files

  - links corrected

Thanks,
Vitaly

The following changes since commit 8451c2b1d529dc1a49328ac9235d3cf5bb8a8fcb:

   mt76xx: Move the old Mediatek WiFi firmware to mediatek (2023-04-18 
08:14:08 -0400)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware.git main

for you to fetch changes up to cc628d657e2d516bef3e0955042df07e5a35eb16:

   cirrus: Add firmware and tuning files for HP G10 series laptops 
(2023-05-15 16:19:11 +0100)

----------------------------------------------------------------
Vitaly Rodionov (2):
       cirrus: Add firmware and tuning files for Lenovo ThinkPad P1 Gen 6
       cirrus: Add firmware and tuning files for HP G10 series laptops

  WHENCE                                             |  86 
+++++++++++++++++++++
  cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin          | Bin 0 -> 1868 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin          | Bin 0 -> 1892 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin          | Bin 0 -> 1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin          | Bin 0 -> 1868 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin          | Bin 0 -> 1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin       | Bin 0 -> 1964 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin       | Bin 0 -> 1968 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin       | Bin 0 -> 1964 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin       | Bin 0 -> 1968 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin       | Bin 0 -> 1952 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin       | Bin 0 -> 1952 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin          | Bin 0 -> 1856 bytes
  .../cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin   | Bin 0 -> 1592 bytes
  .../cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin   | Bin 0 -> 1592 bytes
  .../cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin   | Bin 0 -> 1608 bytes
  .../cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin   | Bin 0 -> 1608 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b42.bin          | Bin 0 -> 4816 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b43.bin          | Bin 0 -> 4840 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b44.bin          | Bin 0 -> 4928 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b45.bin          | Bin 0 -> 4820 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b47.bin          | Bin 0 -> 4920 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b63-l0.bin       | Bin 0 -> 5408 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b63-l1.bin       | Bin 0 -> 5448 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b63-r0.bin       | Bin 0 -> 5408 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b63-r1.bin       | Bin 0 -> 5448 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r0.bin       | Bin 0 -> 5416 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r1.bin       | Bin 0 -> 5388 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin          | Bin 0 -> 4816 bytes
  .../cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin   | Bin 0 -> 4908 bytes
  .../cs35l41-dsp1-spk-prot-17aa2316-spkid0-r0.bin   | Bin 0 -> 4908 bytes
  .../cs35l41-dsp1-spk-prot-17aa2316-spkid1-l0.bin   | Bin 0 -> 4924 bytes
  .../cs35l41-dsp1-spk-prot-17aa2316-spkid1-r0.bin   | Bin 0 -> 4876 bytes
  33 files changed, 86 insertions(+)
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b42.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b43.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b44.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b45.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b47.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-r0.bin

