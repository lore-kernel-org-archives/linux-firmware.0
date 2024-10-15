Return-Path: <SRS0=5C8Z=RL=opensource.cirrus.com=prvs=70187b8f35=vitalyr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F86ACFC267
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Oct 2024 05:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75862C4CEC7; Tue, 15 Oct 2024 05:18:01 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4563FC4CECD
	for <linux-firmware@kernel.org>; Tue, 15 Oct 2024 05:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4563FC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F4Ovbn010598
	for <linux-firmware@kernel.org>; Tue, 15 Oct 2024 00:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=skkge7X21FFjs5uv
	KTcsb9CKvVmjwzQkN4zivFmouGI=; b=W0jTiSrfD7X81HhU2niwzM5z4IguzbLc
	iwW/gDhvYujDMYUPOzv6uLyo0sl9RtPI/I3GdqKTTPy1LlxPP02i/DDWQRMcQRdy
	D459wocIL4sDc1EWVw39u5STELIV9nfeiJxtml5Q/iA1zpNjim2M5FXwQlgSjlsk
	0bf69uJ/fH/2P69rdmc0honCkGJBawjT/FXqjtXpUlKjAdLFtiUcgKaaCTjJZ+UB
	Fgg7zBjpxJ18KW34FtiasLjmcfRxL1vLQt1hsYFZtOjuWH0B0stfzlbU99uZixdH
	KCS6gM627T0/pzOLZMS8cuYImjnN9T1hcCeLM3NvliRioesmPBRmEg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 427nhk2sc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 15 Oct 2024 00:17:58 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 06:17:56 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 15 Oct 2024 06:17:56 +0100
Received: from [198.90.188.34] (lonswws03.ad.cirrus.com [198.90.188.34])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8D033820248;
	Tue, 15 Oct 2024 05:17:56 +0000 (UTC)
Message-ID: <3b8e87de-a74e-45a9-9b2c-b5f94dcc2bb8@opensource.cirrus.com>
Date: Tue, 15 Oct 2024 06:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: [PULL v2 linux-firmware] cirrus: cs35l41: Add firmware for Cirrus
 CS35L41 for some HP laptops
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OtrAu9peFteKelcJbNAVxzaae8e8SE7k
X-Proofpoint-ORIG-GUID: OtrAu9peFteKelcJbNAVxzaae8e8SE7k
X-Proofpoint-Spam-Reason: safe


Hi,

We’d like to add the firmware for the Cirrus CS35L41 smart amplifiers on 
a couple of HP laptop.
Thanks,
Vitaly

Changes in v2:
Fixed GitHub repo URL

The following changes since commit 919f79f9fb5536c1928a15ac82a2e53183b213cf:

   Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/cs35l41_snowwhite

for you to fetch changes up to 72884e091e2e1a0842b5c11572aa4187de0b1d33:

   linux-firmware: Add firmware for Cirrus CS35L41 (2024-10-09 16:08:14 
+0100)

----------------------------------------------------------------
Vitaly Rodionov (1):
       linux-firmware: Add firmware for Cirrus CS35L41

  WHENCE                                              |  10 ++++++++++
  cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid0-l0.bin | Bin 0 -> 4080 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin | Bin 0 -> 4088 bytes
  3 files changed, 10 insertions(+)
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
