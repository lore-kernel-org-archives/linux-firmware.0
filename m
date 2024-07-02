Return-Path: <SRS0=bktJ=OC=opensource.cirrus.com=prvs=49137d2847=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CF3C3064D
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Jul 2024 15:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7BED2C4AF0A; Tue,  2 Jul 2024 15:49:01 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72C81C116B1
	for <linux-firmware@kernel.org>; Tue,  2 Jul 2024 15:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72C81C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4625xNuk008032
	for <linux-firmware@kernel.org>; Tue, 2 Jul 2024 10:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=h2wKKjhxd4UaLlYx
	5Htz1dUXGeU2lWKEnapeBTYyaLc=; b=nMPXMNnKTvBMwvbjRgt+PxT7M/Qxbaiy
	LxdMqrse/3XkEx+kICVlhBi7h3LkEhfx7RruQixm4FrAKDS96jGQd5Tn/ABjdPAy
	J4PjZrZ1gwIN0VwnoeFq/pOPO7miVOhuo2zrL3OAy4SX1/dEGA65dyOVls8zFy1H
	qd1NNYsXsoUxxBLp+FPkDYK+5JWYcUgp8UsoNhPv3INPo6aNTld0NHEMaDKooPns
	YoE4wFcEXAwMLtR9reHtniPWGw+38YfN9GNSE/2VbbUgVlT0aaHPqL8Cucwy+6OS
	K5DqMHFS8fsqLXp/kqEeD6isemTBj7QIzmii3kAPsWjaFzuIeYX7Ow==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 402fnxbu0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 02 Jul 2024 10:48:53 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 16:48:51 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 2 Jul 2024 16:48:51 +0100
Received: from [198.90.188.46] (LONNCK4V044.ad.cirrus.com [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1A650820248;
	Tue,  2 Jul 2024 15:48:51 +0000 (UTC)
Message-ID: <26f3a4f4-a081-4e8e-aae5-6db919d9c804@opensource.cirrus.com>
Date: Tue, 2 Jul 2024 16:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Update firmware for Cirrus Smart Amp CS35L41
 for various ASUS laptops
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ndcjNiNgmXKLfumPByvaDtCBLijDXsiC
X-Proofpoint-ORIG-GUID: ndcjNiNgmXKLfumPByvaDtCBLijDXsiC
X-Proofpoint-Spam-Reason: safe

We would like to update firmware files for Cirrus Logic Smart Amp CS35L41 for various ASUS laptops.

Thanks,

Stefan Binding

The following changes since commit d4fee3a21b1daba9ea99f2c341ab8f7386503e5b:

  Merge branch 'amd-isp-staging' into 'main' (2024-06-27 19:34:37 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ 2024-07-02

for you to fetch changes up to fe07c4bdd435c623fdf215bb0d94f9e6f838e164:

  cirrus: cs35l41: Update various firmware for ASUS laptops using CS35L41 (2024-07-02 16:16:00 +0100)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Update various firmware for ASUS laptops using CS35L41

 cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-l0.bin | Bin 5248 -> 5540 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid0-r0.bin | Bin 5252 -> 5532 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-l0.bin | Bin 5276 -> 5556 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431a63-spkid1-r0.bin | Bin 5276 -> 5556 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-l0.bin | Bin 4716 -> 5388 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid0-r0.bin | Bin 4716 -> 5388 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-l0.bin | Bin 4716 -> 5388 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431c03-spkid1-r0.bin | Bin 4716 -> 5388 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-l0.bin | Bin 5340 -> 5364 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid0-r0.bin | Bin 5340 -> 5364 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-l0.bin | Bin 5340 -> 5364 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431c43-spkid1-r0.bin | Bin 5340 -> 5364 bytes
 12 files changed, 0 insertions(+), 0 deletions(-)

