Return-Path: <SRS0=gWRW=H5=opensource.cirrus.com=prvs=7716b2c674=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE32C35274
	for <linux-firmware@archiver.kernel.org>; Mon, 18 Dec 2023 16:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82C43C433C9; Mon, 18 Dec 2023 16:53:34 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F075FC433C8
	for <linux-firmware@kernel.org>; Mon, 18 Dec 2023 16:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F075FC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BI6mGpF005953
	for <linux-firmware@kernel.org>; Mon, 18 Dec 2023 10:53:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=0CtVaMkyj1OKFU
	ojBC/5sDKeyTUDOy7LVl2qdNu6H1U=; b=b14Vbn2nnG5IJBl2a/+YQt/sLpYxd2
	24N3R3LdhpFRfCU/5M3oI5ArwiYMJJfHXTRhePMwV6g2EJS9UIcl0lrhtsy/6/TK
	E6aF+MZEwNnsA5lUWeEmN4W+tiJ7GDkvtovwBa2IPwAXQ17Z0WBJbmwwcBxjivfn
	sHVGW+sz6sSO1j/WmEvYeUgGu1Gj0GIRLtIJZCRM/QA2QcTlasYkaupnOzrJqXCv
	Nlnd7vcZVSpOopAf3yN1jRsG6f7GGVQbUmrcq+iDccBHgHd5NHYfkaJruJiPCbRp
	8CD8A0KNNWfKfBql7BbegV8OB0AbjlQHSvImbbS7vAu5Z56lHVGMvIAA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3v196nay9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 18 Dec 2023 10:53:07 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Dec
 2023 16:53:06 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 18 Dec 2023 16:53:05 +0000
Received: from [198.61.64.132] (LONN2DGDQ73.ad.cirrus.com [198.61.64.132])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DB8FD468;
	Mon, 18 Dec 2023 16:53:05 +0000 (UTC)
Message-ID: <32b7fab2-ef5d-4ae3-8d81-c1143419d36f@opensource.cirrus.com>
Date: Mon, 18 Dec 2023 16:53:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for ASUS Zenbook 2022/2023 laptops
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 72ZNZsizTup-bbCTBQEeauiH96clNUVm
X-Proofpoint-GUID: 72ZNZsizTup-bbCTBQEeauiH96clNUVm
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for ASUS Zenbook 2022/2023 laptops.

Thanks,

Stefan Binding

The following changes since commit c156e6be6d4a0a2290e7059bc74fb0612aa19693:

   Merge branch 'robot/pr-0-1702625169' into 'main' (2023-12-15 12:16:57 
+0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ for-upstream

for you to fetch changes up to 4471d9c47a3d05bbea9a369ae8c63bdd95bb773e:

   cirrus: Add CS35L41 firmware and tunings for ASUS Zenbook 2023 Models 
(2023-12-18 16:44:19 +0000)

----------------------------------------------------------------
Stefan Binding (2):
       cirrus: Add CS35L41 firmware and tunings for ASUS Zenbook 2022 Models
       cirrus: Add CS35L41 firmware and tunings for ASUS Zenbook 2023 Models

  WHENCE                                              |  72 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-l0.bin | Bin 0 -> 1936 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-r0.bin | Bin 0 -> 1936 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-l0.bin | Bin 0 -> 1944 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-r0.bin | Bin 0 -> 1944 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-l0.bin | Bin 0 -> 2024 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-r0.bin | Bin 0 -> 2024 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-l0.bin | Bin 0 -> 2024 bytes
  cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-r0.bin | Bin 0 -> 2024 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-l0.bin | Bin 0 -> 1964 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-r0.bin | Bin 0 -> 1968 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-l0.bin | Bin 0 -> 1964 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-r0.bin | Bin 0 -> 1968 bytes
  cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-l0.bin | Bin 0 -> 1928 bytes
  cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-r0.bin | Bin 0 -> 1928 bytes
  cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-l0.bin | Bin 0 -> 1928 bytes
  cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-r0.bin | Bin 0 -> 1928 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-l0.bin | Bin 0 -> 2024 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-r0.bin | Bin 0 -> 2020 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-l0.bin | Bin 0 -> 2024 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-r0.bin | Bin 0 -> 2020 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431ee2-l0.bin        | Bin 0 -> 1944 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431ee2-r0.bin        | Bin 0 -> 1948 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f1f-l0.bin        | Bin 0 -> 1984 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f1f-r0.bin        | Bin 0 -> 1984 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-l0.bin | Bin 0 -> 1924 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-r0.bin | Bin 0 -> 1924 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-l0.bin | Bin 0 -> 1924 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-r0.bin | Bin 0 -> 1924 bytes
  cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid0-l0.bin | Bin 0 -> 4728 bytes
  cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid0-r0.bin | Bin 0 -> 4728 bytes
  cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid1-l0.bin | Bin 0 -> 4736 bytes
  cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid1-r0.bin | Bin 0 -> 4736 bytes
  cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid0-l0.bin | Bin 0 -> 5492 bytes
  cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid0-r0.bin | Bin 0 -> 5204 bytes
  cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid1-l0.bin | Bin 0 -> 5492 bytes
  cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid1-r0.bin | Bin 0 -> 5204 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431863-spkid0-l0.bin | Bin 0 -> 4756 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431863-spkid0-r0.bin | Bin 0 -> 4760 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431863-spkid1-l0.bin | Bin 0 -> 4756 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431863-spkid1-r0.bin | Bin 0 -> 4760 bytes
  cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid0-l0.bin | Bin 0 -> 4720 bytes
  cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid0-r0.bin | Bin 0 -> 4720 bytes
  cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid1-l0.bin | Bin 0 -> 4720 bytes
  cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid1-r0.bin | Bin 0 -> 4720 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid0-l0.bin | Bin 0 -> 5024 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid0-r0.bin | Bin 0 -> 5020 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid1-l0.bin | Bin 0 -> 5024 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid1-r0.bin | Bin 0 -> 5020 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431ee2-l0.bin        | Bin 0 -> 4920 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431ee2-r0.bin        | Bin 0 -> 4924 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431f1f-l0.bin        | Bin 0 -> 4860 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431f1f-r0.bin        | Bin 0 -> 4860 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid0-l0.bin | Bin 0 -> 5284 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid0-r0.bin | Bin 0 -> 4996 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid1-l0.bin | Bin 0 -> 5284 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid1-r0.bin | Bin 0 -> 4996 bytes
  57 files changed, 72 insertions(+)
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431ee2-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431ee2-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f1f-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f1f-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431863-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431863-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431863-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431863-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid1-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431ee2-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431ee2-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431f1f-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431f1f-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid1-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid1-r0.bin

