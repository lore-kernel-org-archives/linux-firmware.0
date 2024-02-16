Return-Path: <SRS0=Bfs6=JZ=opensource.cirrus.com=prvs=9776c197b6=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2087C48260
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Feb 2024 16:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87BF6C43390; Fri, 16 Feb 2024 16:19:21 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C249C433C7
	for <linux-firmware@kernel.org>; Fri, 16 Feb 2024 16:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C249C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41G6kiDP028331
	for <linux-firmware@kernel.org>; Fri, 16 Feb 2024 10:19:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=BLgmEDG3fcQch6
	M5Jm4dD+0L/oWzqEtFpHUjkV+rY+Q=; b=J5pPnJdFsLX1Yok64jUKwG8MzXUdPf
	Tm/wHqnfJvbzjAYFzBQhxIbSxt00k9oyS7VmWTW9UpKNRJelZcU6JsWrpoAA8yc5
	CA9O+PZ1cE9n+2bjiU83/+D11AFX/98pI5f39SfEOSNtqqyo5li1d94Xo2jcG3YI
	bXawHnrZE4nOH5E5LXyc/K3MZyEGjFwx5EC1CWgdDmqCrD3QRKSka1pARoHSOirH
	ajeLbYGX4Phv9lfkdOL/3PKoGx699Fjv+ySBAoKmCdaHdSAliOjrE38di5N/Y1lb
	4bj2M0zA9w1jHbdgozNum8Uch9RnZHqn8XVO+JplNsUmuTddoL8tDL2w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w67e279sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 16 Feb 2024 10:19:19 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 16 Feb
 2024 16:19:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 16 Feb 2024 16:19:16 +0000
Received: from [198.61.64.235] (LONN2DGDQ73.ad.cirrus.com [198.61.64.235])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C09AA820242;
	Fri, 16 Feb 2024 16:19:16 +0000 (UTC)
Message-ID: <b8e9a2a8-1524-4358-9e23-27875a4b3243@opensource.cirrus.com>
Date: Fri, 16 Feb 2024 16:19:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for Lenovo Legion 7i gen7 laptop (16IAX7)
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: whniHYHZrH3k5vQI4qk8YQ8yRLSU14U2
X-Proofpoint-GUID: whniHYHZrH3k5vQI4qk8YQ8yRLSU14U2
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for Lenovo Legion 7i gen7 laptop (16IAX7)

Thanks,

Stefan Binding

The following changes since commit f0e2f70ceb682d38604d88343dfc7f80cc46a694:

   Merge branch 'robot/patch-0-1708082607' into 'main' (2024-02-16 
11:29:57 +0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ Lenovo16IAX7

for you to fetch changes up to d9fa75944debb977e635a302a1ccd94932fe7cea:

   linux-firmware: Add CS35L41 firmware for Lenovo Legion 7i gen7 laptop 
(16IAX7) (2024-02-16 14:26:27 +0000)

----------------------------------------------------------------
Stefan Binding (1):
       linux-firmware: Add CS35L41 firmware for Lenovo Legion 7i gen7 
laptop (16IAX7)

  WHENCE                                       |   5 +++++
  cirrus/cs35l41-dsp1-spk-cali-17aa386f.bin    | Bin 0 -> 1580 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa386f-l0.bin | Bin 0 -> 4808 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa386f-r0.bin | Bin 0 -> 4812 bytes
  4 files changed, 5 insertions(+)
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa386f.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa386f-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa386f-r0.bin

