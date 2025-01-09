Return-Path: <SRS0=pP9P=UB=opensource.cirrus.com=prvs=0104593ebc=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8C9E77197
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Jan 2025 17:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03349C4CED6; Thu,  9 Jan 2025 17:00:26 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8154C4CED2
	for <linux-firmware@kernel.org>; Thu,  9 Jan 2025 17:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8154C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094q3IV019434
	for <linux-firmware@kernel.org>; Thu, 9 Jan 2025 11:00:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Cr9F44hb1jGrthAG
	zckfNSaC+8NDurNpNDUx4d2DjmM=; b=R/OJWwfeKp4B1mJmfp+Q3SzjbMKrACEW
	cXESiQ11JAS73GGAJ+CwvEw0djea0zMNTesC7bJzbeiGkzEuXdDrxsBc+DCgH41J
	2QrVsdl89gtdfTP3Bmxf1kT+zlBGsbge4Gh/3pl0oi13ctoTgTK59drRxagHNAqR
	Kwtj8J51XpS7PU7BZRxz4et97sdK60ltu/it/6gbZCYajZGQatrG3bX7/1luzNNu
	VRC6vpJoSl+afgnJGmlkdIqNHhLlWw/lpscYp3AFnvTbfCEEiEgXYwt7xkf1DBvt
	f5h4/S9iKf/V9DM2LCvjmDiO2MR/oo/15bRl/W4kjjybZkpe//4jRw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43y392eahh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 09 Jan 2025 11:00:23 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 9 Jan
 2025 17:00:21 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 9 Jan 2025 17:00:21 +0000
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 85E30820248;
	Thu,  9 Jan 2025 17:00:21 +0000 (UTC)
Message-ID: <00392d03-71c0-4f39-81b6-f18de441a072@opensource.cirrus.com>
Date: Thu, 9 Jan 2025 17:00:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add Firmware for Ayaneo system 1f660105
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _QitoCtTVO0SRYJY2oUARAhVtAuI_54g
X-Proofpoint-ORIG-GUID: _QitoCtTVO0SRYJY2oUARAhVtAuI_54g
X-Proofpoint-Spam-Reason: safe

We would like to update firmware files for Cirrus Logic Smart Amp CS35L41 for Ayaneo system 1f660105.

Thanks,

Stefan Binding

The following changes since commit c0f414a6f71154fdbb0e88f29f64e401241ca33d:

  Merge branch 'parallel' into 'main' (2025-01-07 17:33:43 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ 2025-01-09

for you to fetch changes up to 838bf587d539ddb2d3889fec841586197dd3ee03:

  cirrus: cs35l41: Add Firmware for Ayaneo system 1f660105 (2025-01-09 16:52:26 +0000)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Add Firmware for Ayaneo system 1f660105

 WHENCE                                    |   2 ++
 cirrus/cs35l41-dsp1-spk-prot-1f660105.bin | Bin 0 -> 4760 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-1f660105.bin

