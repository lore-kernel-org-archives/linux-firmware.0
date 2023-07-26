Return-Path: <SRS0=490k=DM=opensource.cirrus.com=prvs=2571cfa33f=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E1FC0015E
	for <linux-firmware@archiver.kernel.org>; Wed, 26 Jul 2023 14:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12E21C433C8; Wed, 26 Jul 2023 14:09:09 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B2A78C433C7
	for <linux-firmware@kernel.org>; Wed, 26 Jul 2023 14:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B2A78C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36Q4sVLl002385
	for <linux-firmware@kernel.org>; Wed, 26 Jul 2023 09:09:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=5hZB2dFFzzCWA7
	sOyavKFKoShqfpileiiJAdNqojBtA=; b=WhCDxkuUoxLkL6c+ItucPebt5DHV59
	f9pJ8ntNe6rBhqrT6FH78np0CRRhKCkCHDiIZf/5RUWJi0xBOQ1fQMvTNHM2u4Yr
	GBd2GZtKbBMeBj2Cg/9d462YIwtrre4yeZhBsrTinaRw9xVtiiEkNxQxUIO9LVM4
	KJBFg3W6EkedgnxuePD4JhxBdaYZFM+uKgCZxt8L2O8In8CEExnPgR3cQJtOnD8W
	awyWHwt2ryMYihbSupH51hkmZKdWkUfx51TU2wqykt5MyxCBsNZhbrF/jZcuClB/
	5qeaX4g1LqUXx57XIiKc05C+XPJYkF0J58MMONWFzvvwwajRHa6Vu+wg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s2q710uym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 26 Jul 2023 09:09:03 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 26 Jul
 2023 15:09:01 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Wed, 26 Jul 2023 15:09:01 +0100
Received: from [198.61.65.141] (LONN2DGDQ73.ad.cirrus.com [198.61.65.141])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6E8D745;
	Wed, 26 Jul 2023 14:09:01 +0000 (UTC)
Message-ID: <2f6fb9b0-fae9-ec5b-0448-2ee900c1b8a5@opensource.cirrus.com>
Date: Wed, 26 Jul 2023 15:09:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for Dell Oasis
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _i9ZfjbkZDdi5jOUIkynD46w0AISxIlc
X-Proofpoint-ORIG-GUID: _i9ZfjbkZDdi5jOUIkynD46w0AISxIlc
X-Proofpoint-Spam-Reason: safe

Hi,

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 for Dell Oasis Laptops.

Thanks,

Stefan Binding

The following changes since commit c7824580d310809b55f95626b4b46954911be820:

   Merge branch 'v2.0.21961' of 
https://github.com/yunfei-mtk/linux_fw_10bit (2023-07-24 08:30:51 -0400)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware for-upstream

for you to fetch changes up to c8424cf03def7777a4a83b8305d1af7b1321ab62:

   cirrus: Add CS35L41 firmware for Dell Oasis Models (2023-07-26 
13:43:05 +0100)

----------------------------------------------------------------
Stefan Binding (1):
       cirrus: Add CS35L41 firmware for Dell Oasis Models

  WHENCE                                           |  42 
++++++++++++++++++++++++++++++++++++++++++
  cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin | Bin 0 -> 1824 bytes
  cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin | Bin 0 -> 1824 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin | Bin 0 -> 3980 bytes
  cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin | Bin 0 -> 3980 bytes
  5 files changed, 42 insertions(+)
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin

diff --git a/WHENCE b/WHENCE
index c94afe7b..e76a9111 100644
--- a/WHENCE
+++ b/WHENCE
@@ -6447,6 +6447,48 @@ File: cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin
  File: cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin
  Link: cirrus/cs35l41-dsp1-spk-prot-103c8c26.bin -> 
cs35l41-dsp1-spk-prot-103c8b45.bin
  Link: cirrus/cs35l41-dsp1-spk-cali-103c8c26.bin -> 
cs35l41-dsp1-spk-cali-103c8b45.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cbd.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cbd.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cbe.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cbe.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cbf.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cbf.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cc1.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cc1.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cc2.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cc2.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cc3.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cc3.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cc4.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cc4.wmfw -> 
cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
+File: cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+File: cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+File: cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+File: cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cbe-spkid0.bin -> 
cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cbe-spkid0.bin -> 
cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cbe-spkid1.bin -> 
cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cbe-spkid1.bin -> 
cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0.bin -> 
cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cbf-spkid0.bin -> 
cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1.bin -> 
cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cbf-spkid1.bin -> 
cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0.bin -> 
cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cc1-spkid0.bin -> 
cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1.bin -> 
cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cc1-spkid1.bin -> 
cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cc2-spkid0.bin -> 
cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cc2-spkid0.bin -> 
cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cc2-spkid1.bin -> 
cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cc2-spkid1.bin -> 
cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0.bin -> 
cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cc3-spkid0.bin -> 
cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1.bin -> 
cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cc3-spkid1.bin -> 
cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0.bin -> 
cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cc4-spkid0.bin -> 
cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
+Link: cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1.bin -> 
cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
+Link: cirrus/cs35l41-dsp1-spk-cali-10280cc4-spkid1.bin -> 
cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin

  License: Redistributable. See LICENSE.cirrus for details.

diff --git a/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin 
b/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
new file mode 100644
index 00000000..251d3ce4
Binary files /dev/null and 
b/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin differ
diff --git a/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin 
b/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
new file mode 100644
index 00000000..251d3ce4
Binary files /dev/null and 
b/cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin differ
diff --git a/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin 
b/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
new file mode 100644
index 00000000..4878c68b
Binary files /dev/null and 
b/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin differ
diff --git a/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin 
b/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
new file mode 100644
index 00000000..4878c68b
Binary files /dev/null and 
b/cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin differ

