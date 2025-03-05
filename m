Return-Path: <SRS0=uePg=VY=opensource.cirrus.com=prvs=215955c388=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF4DC19F32
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Mar 2025 17:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39386C4CEE2; Wed,  5 Mar 2025 17:13:53 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2245C4CEE0
	for <linux-firmware@kernel.org>; Wed,  5 Mar 2025 17:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2245C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5256w5dH026460
	for <linux-firmware@kernel.org>; Wed, 5 Mar 2025 11:13:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=tqHz9QLRlYpLxM2A
	tDy7yBLiAwY1AZnaMWLg4FAwoHw=; b=OgwWli+1q26IZhuM749X2YRa1yYgrUte
	WPezYI82sWpYhu0+upHU+BL3C5acCvLR3w5oA4v6yXfqGLXsReF5vWSM+2Jxyxkb
	IUTTUpFxbAZ89vt40m8M2YjtHOjEQpxP//7toYdpFycVssMQafeM9cgCOdHRVk3u
	hrzp0VODThp0ra0FUxuthpWuVvnBTodL9WSTcLhOlGgG+en0Q+6yPzPegj0Tjx+B
	WsxjI+M3CFzHpzQwPJpNeymz94OH/DWNrM+z7e0PDYuQxJg4uWth3dnbucfl5rJ7
	Kir6nB6VBSxDnvsLgvMgmJrpvsyReIzkVHLRB8Mq81sFHXaREJ8OVA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 456e8nsb4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 05 Mar 2025 11:13:45 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Mar
 2025 17:13:43 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 17:13:43 +0000
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7408782025A;
	Wed,  5 Mar 2025 17:13:43 +0000 (UTC)
Message-ID: <1a7faf63-f11a-478b-96da-c6acba5f3f1b@opensource.cirrus.com>
Date: Wed, 5 Mar 2025 17:13:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for various ASUS laptops
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DpWs+H/+ c=1 sm=1 tr=0 ts=67c88649 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=6AFbASJac4HRoJmUKbgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: x2e3YFNzY-q2iVnOIjPcYdTNpW8JxSIP
X-Proofpoint-ORIG-GUID: x2e3YFNzY-q2iVnOIjPcYdTNpW8JxSIP
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp CS35L41 for various ASUS laptops.

Thanks,

Stefan Binding

The following changes since commit a3e1417a176de3f1cda1c504d6d060ff990c914b:

  Merge branch 'robot/patch-0-1741163658' into 'main' (2025-03-05 12:42:06 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250305

for you to fetch changes up to 8fa4a471d210c5a5e3cc020d3f7477b6893b8dbd:

  cirrus: cs35l41: Add firmware and tuning for ASUS Consumer laptops (2025-03-05 17:11:29 +0000)

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
 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-l0.bin | Bin 0 -> 4908 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-r0.bin | Bin 0 -> 4908 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-l0.bin | Bin 0 -> 4908 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-r0.bin | Bin 0 -> 4908 bytes
 25 files changed, 111 insertions(+)
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
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-r0.bin

