Return-Path: <SRS0=ewID=KL=opensource.cirrus.com=prvs=0794717e92=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5B3C54E41
	for <linux-firmware@archiver.kernel.org>; Tue,  5 Mar 2024 14:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 029D9C43390; Tue,  5 Mar 2024 14:11:02 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0D58C433C7
	for <linux-firmware@kernel.org>; Tue,  5 Mar 2024 14:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0D58C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4254qdXM002030
	for <linux-firmware@kernel.org>; Tue, 5 Mar 2024 08:10:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=Bp2QhXcpAX74hY
	DUT1unXHKb5PMphk66FNSchFfZl4o=; b=MpHVnK1dn/wBi+eSr7nIKP8MJAb1z7
	qXZqcLLgsvK7CAu7FCqLlgQycALxhIlZyoi6q6/q+KNbmbrQEMOK+zF4xxiottFO
	nfujTGUYGzhOuinuaBJuLs7ImJKZkN8qaPTTpRi5tbKTzFBpg2z2B/dWKYwCgpCV
	jjzN1WlbASjJY5gBOyloq2kxEtJN/+Kr6qZEmXtNT7F7s/p8YEXfLJPoeXfGJmX9
	n3KG0OrVCiC9z9pBuUEsepnyep5IVIgQCNwkwSewxUukIgSeiCYKiSj/6nuBw5dk
	gxGZP5wL6kmNArGvP2+WscJYffPjCmu3DpCulVYwKJZwxRrgVdnmDlsg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wm1dpb9up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 05 Mar 2024 08:10:59 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 5 Mar 2024
 14:10:53 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Tue, 5 Mar 2024 14:10:52 +0000
Received: from [198.61.64.84] (LONN2DGDQ73.ad.cirrus.com [198.61.64.84])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 71238820246;
	Tue,  5 Mar 2024 14:10:47 +0000 (UTC)
Message-ID: <f4d7b131-b62f-4bbd-ab03-946fcba36f51@opensource.cirrus.com>
Date: Tue, 5 Mar 2024 14:10:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for Thinkbook 16P laptops.
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tjZtEwxrDGcfiJzGWVubnObKWjF2ynzC
X-Proofpoint-GUID: tjZtEwxrDGcfiJzGWVubnObKWjF2ynzC
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for Lenovo Thinkbook 16P laptops.

Thanks,

Stefan Binding

The following changes since commit 5cd471e3de782d1d5ae9e96909a08d264d866842:

   Merge branch 'amd-staging' into 'main' (2024-02-29 16:44:55 +0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ thinkbook16p

for you to fetch changes up to 81ee899e6d79a8c7a052591f9ec44974b29d0876:

   linux-firmware: Add CS35L41 HDA Firmware for Lenovo Thinkbook 16P 
Laptops (2024-03-05 13:13:45 +0000)

----------------------------------------------------------------
Stefan Binding (1):
       linux-firmware: Add CS35L41 HDA Firmware for Lenovo Thinkbook 16P 
Laptops

  WHENCE                                              |  20 
++++++++++++++++++++
  cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin | Bin 0 -> 1560 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin | Bin 0 -> 1560 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin | Bin 0 -> 1560 bytes
  cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin | Bin 0 -> 1556 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-l0.bin | Bin 0 -> 5544 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-r0.bin | Bin 0 -> 5544 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-l0.bin | Bin 0 -> 5496 bytes
  cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-r0.bin | Bin 0 -> 5496 bytes
  9 files changed, 20 insertions(+)
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-r0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-l0.bin
  create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-r0.bin

