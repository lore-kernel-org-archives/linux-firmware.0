Return-Path: <SRS0=j1Ho=RF=opensource.cirrus.com=prvs=70121df2b6=vitalyr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4900CEDDA3
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Oct 2024 15:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0FFEC4CEC3; Wed,  9 Oct 2024 15:21:54 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98640C4CEC5
	for <linux-firmware@kernel.org>; Wed,  9 Oct 2024 15:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98640C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4994TGFt017268
	for <linux-firmware@kernel.org>; Wed, 9 Oct 2024 10:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=0z0dgpj2Me5PIc16
	GhZaQsL4aGQ/v7bna+Cy41v3H7s=; b=X9+3fsByfW/2y3r0BrnBxxSHp/D1/jps
	GsY8E+Vt4amAk7LjV56zmzVF59vlZtewZetf2IZ0ZTjtsy55v1CIIB2p6bmMgGo0
	MNfadyZkb0eFFOkZiTielRrdglJs3jvF/oF/lEQn84hqiP6GpGbhXkfUwzMvKf/e
	LKDSBZBqmHenzdoSQMSTunkDDaOAMK8FYhOrnyOGLgOXYqKYqb/Uf7TXFxOO8VV6
	a7Mz79dKQmnaRnRAxv+OqEKVOfWDKfGDUtTdHTpQaWbkpIWHfgy12A6VnvW2jsQr
	JGRdjLcJWPWzq3WUZwJGYY0picF7l5oJQoNReyVEWVN+Sj1pKIdUAg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4231vhwfyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 09 Oct 2024 10:21:45 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 16:21:43 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 9 Oct 2024 16:21:43 +0100
Received: from [198.90.188.34] (lonswws03.ad.cirrus.com [198.90.188.34])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B8ADB82024A;
	Wed,  9 Oct 2024 15:21:43 +0000 (UTC)
Message-ID: <d7909fe6-6f06-4e82-8c27-28bdcc912171@opensource.cirrus.com>
Date: Wed, 9 Oct 2024 16:21:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l41: Add firmware for Cirrus
 CS35L41 for some HP laptops
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bpqgvQYkeeEhjMiuF4Kx3hQq8MF_YGzP
X-Proofpoint-ORIG-GUID: bpqgvQYkeeEhjMiuF4Kx3hQq8MF_YGzP
X-Proofpoint-Spam-Reason: safe


Hi,

We’d like to add the firmware for the Cirrus CS35L41 smart amplifiers on 
a couple of HP laptop.
Thanks,
Vitaly

The following changes since commit 919f79f9fb5536c1928a15ac82a2e53183b213cf:

   Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04 +0000)

are available in the Git repository at:

   origin/cs35l41_snowwhite

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
