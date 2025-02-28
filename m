Return-Path: <SRS0=F03m=VT=opensource.cirrus.com=prvs=215418e695=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406A7C19776
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Feb 2025 14:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 062D1C4CEE2; Fri, 28 Feb 2025 14:53:43 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0BAEC4CED6
	for <linux-firmware@kernel.org>; Fri, 28 Feb 2025 14:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0BAEC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SBbdop005331;
	Fri, 28 Feb 2025 08:53:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=YVuAtX1AJWMOmq41
	ei65DOBvpMrhvUZW+vZBQUrFHeo=; b=CB9e1KLSlHQ0o1H3lWJpLb3iCNqE7Mdd
	KYKoGtVeqQGwUHl+uEN4WGaTQAXr43gUYHO6rN9O/J6O0j46W9zO9+MQaDmiKyM2
	TUJ2xbMLZW+lvuvg6QyUMkTGo0HOwgv8ruuyTfl51a7kiOD8tCh0YUjfIdZ3u86w
	hTjm0ikO6UfZiGusTBk6wC1EJlofaYN6rDnFnvnDCnsj/vaDD1uvqzVxw4boiDYs
	P+d8wFSxeZ4EgDkbECDCwYoPGuf5J6EjpCvzlVF6j18eMh0IO8EOnEUXknjcpYws
	rm6h0Yh7tHfyZgUJjTNuoMY4/Tayu357vXbHOQKCUvwuY5ElzEa7AQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 451pspy3x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 08:53:25 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 28 Feb
 2025 14:53:23 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 14:53:23 +0000
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 610FF82025A;
	Fri, 28 Feb 2025 14:53:23 +0000 (UTC)
Message-ID: <13a0e18f-323f-4f7d-98de-3ee8fc0fda6d@opensource.cirrus.com>
Date: Fri, 28 Feb 2025 14:53:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>, <andrealmeid@igalia.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for Stream Deck
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vcCrQdD2CKe50A_yHnAkWGsOja6UBFhx
X-Proofpoint-ORIG-GUID: vcCrQdD2CKe50A_yHnAkWGsOja6UBFhx
X-Authority-Analysis: v=2.4 cv=U8ZoDfru c=1 sm=1 tr=0 ts=67c1cde5 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=Hw2n6SHsUfdtRzWQ0f8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp CS35L41 for Steam Deck.

Thanks,

Stefan Binding


The following changes since commit 30f36b8b90531c5a88ea02fac3f94a1a32145a77:

  Merge branch 'robot/pr-0-1740611615' into 'main' (2025-02-27 21:05:07 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250228

for you to fetch changes up to 90e90cd14622776421294246ed55b1a26b4e9166:

  cirrus: cs35l41: Add firmware and tunings for CS35L41 driver for Steam Deck (2025-02-28 14:31:47 +0000)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Add firmware and tunings for CS35L41 driver for Steam Deck

 WHENCE                                                  |   5 ++++-
 cirrus/cs35l41-dsp1-spk-prot-vlv1776.bin                | Bin 0 -> 5104 bytes
 cirrus/cs35l41/v6.51.0/halo_cspl_RAM_revB2_29.53.0.wmfw | Bin 0 -> 34236 bytes
 3 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-vlv1776.bin
 create mode 100644 cirrus/cs35l41/v6.51.0/halo_cspl_RAM_revB2_29.53.0.wmfw

