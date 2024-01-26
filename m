Return-Path: <SRS0=YDLy=JE=opensource.cirrus.com=prvs=8755fd102d=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C55C47422
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Jan 2024 11:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E546C43390; Fri, 26 Jan 2024 11:35:07 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EE54C433C7
	for <linux-firmware@kernel.org>; Fri, 26 Jan 2024 11:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4EE54C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40Q7iesG027762
	for <linux-firmware@kernel.org>; Fri, 26 Jan 2024 05:34:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=YSknMhO0AINtT4
	5I6XpUg88MaXAVz3JIkxQ7umrGOJw=; b=qNdoaJsYcyjLREWqYmxrEIaf4UKWbV
	Hfft5CMyV5fVxZd22FVtsHwJOmK6Z+rrdcCV39Q2Tx4xeRQKnPUcZJ6rm6h/bkyS
	mHRe4qi0E1lu+ujuHTwq/upMMgGNSuc+YVHaFIF+hhxlCi/uNm5kIEUCxNSXnYu9
	ZwnYHDpIvoxn0KQGnVq5+Rm94VC7oweinzpFDtuXlb6sQ4nUzCm4oORIixRAmF/A
	17ILDUAtFw+vLsE5pVuvaVJw4ZrojaFKkSKcUU25a28F4VKIXTj2+HgWEIwrmngj
	pN/mVyBd618Nk4zEbnRxPZinh7hjnAnEM+82S2HqgX1L0l38QewwLyuQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9unvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 26 Jan 2024 05:34:57 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 11:34:56 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Fri, 26 Jan 2024 11:34:56 +0000
Received: from [198.61.65.232] (LONN2DGDQ73.ad.cirrus.com [198.61.65.232])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 16D6B820243;
	Fri, 26 Jan 2024 11:34:56 +0000 (UTC)
Message-ID: <9ea61a5b-17c1-4c7c-8560-cbd9fe7678f4@opensource.cirrus.com>
Date: Fri, 26 Jan 2024 11:34:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for HP Laptops
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qwFQsXX6rZWqkhtG6kGCfsYAfec83F4a
X-Proofpoint-ORIG-GUID: qwFQsXX6rZWqkhtG6kGCfsYAfec83F4a
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for various HP Consumer laptops.

Thanks,

Stefan Binding

The following changes since commit 0c40df810685c15141413cee5bea7233e1db43fb:

   Merge branch 'consistent-file-spacing' into 'main' (2024-01-24 
16:42:17 +0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware/ hp_fw_nodsd

for you to fetch changes up to 9f4771365348f41a7cfae9469d47fffc1869aa10:

   linux-firmware: Add firmware for Cirrus CS35L41 on HP Consumer 
Laptops (2024-01-26 11:11:42 +0000)

----------------------------------------------------------------
Stefan Binding (1):
       linux-firmware: Add firmware for Cirrus CS35L41 on HP Consumer 
Laptops

  WHENCE                                                  | 416 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
  cirrus/cs35l41-dsp1-spk-cali-103c89e7-l0.bin            | Bin 0 -> 
1880 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c89e7-r0.bin            | Bin 0 -> 
1880 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-l0.bin     | Bin 0 -> 
1896 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-r0.bin     | Bin 0 -> 
1900 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-l0.bin     | Bin 0 -> 
1900 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-r0.bin     | Bin 0 -> 
1900 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-l0.bin     | Bin 0 -> 
1776 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-r0.bin     | Bin 0 -> 
1776 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-l0.bin     | Bin 0 -> 
1780 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-r0.bin     | Bin 0 -> 
1780 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-l0.bin     | Bin 0 -> 
1796 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-r0.bin     | Bin 0 -> 
1796 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-l0.bin     | Bin 0 -> 
1800 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-r0.bin     | Bin 0 -> 
1800 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-l0.bin     | Bin 0 -> 
1788 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-r0.bin     | Bin 0 -> 
1788 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-l0.bin     | Bin 0 -> 
1792 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-r0.bin     | Bin 0 -> 
1792 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l0.bin            | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l1.bin            | Bin 0 -> 
1892 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r0.bin            | Bin 0 -> 
1892 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r1.bin            | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-l0.bin     | Bin 0 -> 
1916 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-r0.bin     | Bin 0 -> 
1916 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-l0.bin     | Bin 0 -> 
1904 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-r0.bin     | Bin 0 -> 
1908 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-l0.bin     | Bin 0 -> 
1892 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-r0.bin     | Bin 0 -> 
1892 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-l0.bin     | Bin 0 -> 
1892 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-r0.bin     | Bin 0 -> 
1892 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-l0.bin     | Bin 0 -> 
1864 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-r0.bin     | Bin 0 -> 
1864 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-l0.bin     | Bin 0 -> 
1864 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-r0.bin     | Bin 0 -> 
1864 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-l0.bin     | Bin 0 -> 
1940 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-r0.bin     | Bin 0 -> 
1940 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-l0.bin     | Bin 0 -> 
1940 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-r0.bin     | Bin 0 -> 
1940 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-l0.bin     | Bin 0 -> 
1936 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-r0.bin     | Bin 0 -> 
1936 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-l0.bin     | Bin 0 -> 
1932 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-r0.bin     | Bin 0 -> 
1932 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-l0.bin     | Bin 0 -> 
1928 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-r0.bin     | Bin 0 -> 
1928 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-l0.bin     | Bin 0 -> 
1924 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-r0.bin     | Bin 0 -> 
1924 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-l0.bin     | Bin 0 -> 
1920 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-r0.bin     | Bin 0 -> 
1916 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-l0.bin     | Bin 0 -> 
1916 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-r0.bin     | Bin 0 -> 
1916 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cdd-spkid0.bin        | Bin 0 -> 
1892 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid0.bin        | Bin 0 -> 
1892 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid1.bin        | Bin 0 -> 
1892 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8d01-l0.bin            | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-103c8d01-l1.bin            | Bin 0 -> 
1888 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c89e7-l0.bin            | Bin 0 -> 
5328 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c89e7-r0.bin            | Bin 0 -> 
5328 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid0-l0.bin     | Bin 0 -> 
4672 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid0-r0.bin     | Bin 0 -> 
4672 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid1-l0.bin     | Bin 0 -> 
4672 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid1-r0.bin     | Bin 0 -> 
4672 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid0-l0.bin     | Bin 0 -> 
3936 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid0-r0.bin     | Bin 0 -> 
3936 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid1-l0.bin     | Bin 0 -> 
3940 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid1-r0.bin     | Bin 0 -> 
3940 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid0-l0.bin     | Bin 0 -> 
3956 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid0-r0.bin     | Bin 0 -> 
3956 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid1-l0.bin     | Bin 0 -> 
3960 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid1-r0.bin     | Bin 0 -> 
3960 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid0-l0.bin     | Bin 0 -> 
3948 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid0-r0.bin     | Bin 0 -> 
3948 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid1-l0.bin     | Bin 0 -> 
3952 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid1-r0.bin     | Bin 0 -> 
3952 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a6e-l0.bin            | Bin 0 -> 
4312 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a6e-l1.bin            | Bin 0 -> 
4268 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a6e-r0.bin            | Bin 0 -> 
4316 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8a6e-r1.bin            | Bin 0 -> 
4360 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid0-l0.bin     | Bin 0 -> 
4184 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid0-r0.bin     | Bin 0 -> 
4184 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid1-l0.bin     | Bin 0 -> 
4088 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid1-r0.bin     | Bin 0 -> 
4084 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid0-l0.bin     | Bin 0 -> 
4712 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid0-r0.bin     | Bin 0 -> 
4712 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid1-l0.bin     | Bin 0 -> 
4712 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid1-r0.bin     | Bin 0 -> 
4712 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid0-l0.bin     | Bin 0 -> 
4684 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid0-r0.bin     | Bin 0 -> 
4684 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid1-l0.bin     | Bin 0 -> 
4684 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid1-r0.bin     | Bin 0 -> 
4684 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid0-l0.bin     | Bin 0 -> 
4160 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid0-r0.bin     | Bin 0 -> 
4160 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid1-l0.bin     | Bin 0 -> 
4160 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid1-r0.bin     | Bin 0 -> 
4160 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid0-l0.bin     | Bin 0 -> 
4156 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid0-r0.bin     | Bin 0 -> 
4156 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid1-l0.bin     | Bin 0 -> 
4152 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid1-r0.bin     | Bin 0 -> 
4152 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid0-l0.bin     | Bin 0 -> 
4716 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid0-r0.bin     | Bin 0 -> 
4716 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid1-l0.bin     | Bin 0 -> 
4712 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid1-r0.bin     | Bin 0 -> 
4712 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid0-l0.bin     | Bin 0 -> 
4708 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid0-r0.bin     | Bin 0 -> 
4708 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid1-l0.bin     | Bin 0 -> 
4708 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid1-r0.bin     | Bin 0 -> 
4708 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8cdd-spkid0.bin        | Bin 0 -> 
4056 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8cde-spkid0.bin        | Bin 0 -> 
4060 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8cde-spkid1.bin        | Bin 0 -> 
4056 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8d01-l0.bin            | Bin 0 -> 
4052 bytes
  cirrus/cs35l41-dsp1-spk-prot-103c8d01-l1.bin            | Bin 0 -> 
4052 bytes
  cirrus/cs35l41/v6.56.0/halo_cspl_RAM_revB2_29.58.0.wmfw | Bin 0 -> 
33664 bytes
  cirrus/cs35l41/v6.68.0/halo_cspl_RAM_revB2_29.70.0.wmfw | Bin 0 -> 
33868 bytes
  113 files changed, 415 insertions(+), 1 deletion(-)
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89e7-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89e7-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cdd-spkid0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8d01-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8d01-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c89e7-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c89e7-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a6e-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a6e-l1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a6e-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a6e-r1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cdd-spkid0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cde-spkid0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cde-spkid1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d01-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d01-l1.bin
  create mode 100755 cirrus/cs35l41/v6.56.0/halo_cspl_RAM_revB2_29.58.0.wmfw
  create mode 100755 cirrus/cs35l41/v6.68.0/halo_cspl_RAM_revB2_29.70.0.wmfw

