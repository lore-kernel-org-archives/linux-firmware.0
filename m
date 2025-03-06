Return-Path: <SRS0=u9IA=VZ=opensource.cirrus.com=prvs=216092a9d3=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BFCC282D1
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Mar 2025 11:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A80E9C4CEE2; Thu,  6 Mar 2025 11:09:34 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 638A6C4CEE0
	for <linux-firmware@kernel.org>; Thu,  6 Mar 2025 11:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 638A6C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5260c0c8015744
	for <linux-firmware@kernel.org>; Thu, 6 Mar 2025 05:09:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=2NYEYe2B70bgk6s5
	iiUILUQy3d6/hwlyH24YSLqF32w=; b=aaOpASZBIvQVcdX/BOoKnF+qoTog3kV4
	j8pqhgfSZajIwDbEpZ3jPY7k0cI484jUzkHgPqu+VeS0KqnzsbVMujRwGs64VUrE
	py3eYx8E/CtNHVeifxlPSQbulCx+2AGq7J8AeUEIrlKQgSnR7N2wlKJ2j6xqhuLv
	Q64rjxhsCJx7+c7Hacq1wdPfqM6kzgQ49mrdXGgEorAfb2P+Eawcpd8C+g9Q5IqU
	W4l6rCCY58Hsa4MU0wEZZeuhNG7F6giL68UndKqqmfv66G9D2Mlq7Htap36VRRt5
	uoVB0DF5JoTvaDQxAKHXBPXm8szn3lsMMADxsZFmcPlZ9Vji5VTl8w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 455fyypkye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 06 Mar 2025 05:09:30 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Mar
 2025 11:09:28 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 11:09:28 +0000
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8406682026B;
	Thu,  6 Mar 2025 11:09:28 +0000 (UTC)
Message-ID: <9acb4fa7-47a8-4261-a086-e443fd6de568@opensource.cirrus.com>
Date: Thu, 6 Mar 2025 11:09:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v2 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for various ASUS laptops
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cJ8fH3jG7aHsoBXwv_f8WmI3uN7XBAvc
X-Proofpoint-ORIG-GUID: cJ8fH3jG7aHsoBXwv_f8WmI3uN7XBAvc
X-Authority-Analysis: v=2.4 cv=DaftqutW c=1 sm=1 tr=0 ts=67c9826b cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=5zvI5M580UMI48B_gKYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp CS35L41 for various ASUS laptops.
Changes from v1: Fixed missing firmware files in patch.

Thanks,

Stefan Binding


The following changes since commit a3e1417a176de3f1cda1c504d6d060ff990c914b:

  Merge branch 'robot/patch-0-1741163658' into 'main' (2025-03-05 12:42:06 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250305

for you to fetch changes up to 675b89218fe1630f5aabfe08285157deb4a06120:

  cirrus: cs35l41: Add firmware and tuning for ASUS Consumer laptops (2025-03-06 01:01:24 +0000)

----------------------------------------------------------------
Stefan Binding (2):
      cirrus: cs35l41: Add Firmware for various ASUS Commercial laptops
      cirrus: cs35l41: Add firmware and tuning for ASUS Consumer laptops

 WHENCE                                              | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-l0.bin | Bin 0 -> 4908 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-r0.bin | Bin 0 -> 4908 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-l0.bin | Bin 0 -> 4908 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-r0.bin | Bin 0 -> 4912 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-l0.bin | Bin 0 -> 4936 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-r0.bin | Bin 0 -> 4936 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-l0.bin | Bin 0 -> 4936 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-r0.bin | Bin 0 -> 4936 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431f63-l0.bin        | Bin 0 -> 3936 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431f63-r0.bin        | Bin 0 -> 3928 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin | Bin 0 -> 4432 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin | Bin 0 -> 4432 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin | Bin 0 -> 4432 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin | Bin 0 -> 4432 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin | Bin 0 -> 5220 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin | Bin 0 -> 5204 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin | Bin 0 -> 4904 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin | Bin 0 -> 4908 bytes
 cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin | Bin 0 -> 4892 bytes
 cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin | Bin 0 -> 4892 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin | Bin 0 -> 4912 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin | Bin 0 -> 2096 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin | Bin 0 -> 4916 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin | Bin 0 -> 2100 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-l0.bin | Bin 0 -> 4908 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-r0.bin | Bin 0 -> 4908 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-l0.bin | Bin 0 -> 4908 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-r0.bin | Bin 0 -> 4908 bytes
 29 files changed, 111 insertions(+)
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431f63-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431f63-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-r0.bin

