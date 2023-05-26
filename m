Return-Path: <SRS0=jhjw=BP=opensource.cirrus.com=prvs=0510524318=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EC8C77B7A
	for <linux-firmware@archiver.kernel.org>; Fri, 26 May 2023 15:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E4A9C4339B; Fri, 26 May 2023 15:16:24 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 892BCC433EF
	for <linux-firmware@kernel.org>; Fri, 26 May 2023 15:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 892BCC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34QFDDoU010689
	for <linux-firmware@kernel.org>; Fri, 26 May 2023 10:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=PODMain02222019;
 bh=29jfqdFeEApRVmRQu4idb0/wLpqvAup/epMaNOsvYnY=;
 b=WTtscyuVYQmumBST5PjxfKnzDG0jU3tBSeQ1agtJQ/Jq2LLtPVineeqe1x1Hr1CpGewZ
 7nM+5r2rX3p5dh6mDiPteik4qvFnXxWDoROt7waxAk689Og2AFhbz+P0Yz2fDG9P0eZe
 KHskh+buoSjZ7OzAM7czulw4dpT3VfyHJUNuagWs1WTQhhJTxCjZxneOCU0DflDM78tJ
 f2+/OAcuaykkQQK92gGR1E8CsZ5jFXQG4CS63bsb4Wb92lnxs80mYIdjtrfJ2MBlbETJ
 W0rhykAPd1nqIExlqVRX8ETQr7Ky2ioeHqYuKRdVt1hX/cqzd6inMrNmYof4ceK4CnuB mA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3qsde8kbd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 26 May 2023 10:16:21 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 26 May
 2023 10:16:19 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 May 2023 10:16:19 -0500
Received: from [198.61.64.26] (LONN2DGDQ73.ad.cirrus.com [198.61.64.26])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6C6D9B38;
	Fri, 26 May 2023 15:16:19 +0000 (UTC)
Message-ID: <d9869d7c-b613-87c9-f00c-f61b98b40c6d@opensource.cirrus.com>
Date: Fri, 26 May 2023 16:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for new Asus ROG Laptops
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ljSWMKyzDON2OX3wwMGAUbiG9Le4pdOm
X-Proofpoint-GUID: ljSWMKyzDON2OX3wwMGAUbiG9Le4pdOm
X-Proofpoint-Spam-Reason: safe

Hi,

We would like to add firmware files to support Cirrus Logic Smart Amp 
CS35L41 on new Asus ROG laptops.

The following changes since commit 1ba3519eab0fbc3cedf6b423ea0470461b902c1b:

   Merge branch 'dev-queue' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware (2023-05-23 
13:07:29 -0400)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware.git for-upstream

for you to fetch changes up to 403e1ee7212de8de2db6f9db3776406a39e308cb:

   cirrus: Add firmware for new Asus ROG Laptops (2023-05-26 14:30:39 +0100)

----------------------------------------------------------------
Stefan Binding (1):
       cirrus: Add firmware for new Asus ROG Laptops

  WHENCE                                              |  60 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin | Bin 0 -> 1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin | Bin 0 -> 1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin | Bin 0 -> 1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin | Bin 0 -> 1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin | Bin
  cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin | Bin
  cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin | Bin
  cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin | Bin
  cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin | Bin 0 -> 1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin | Bin 0 -> 1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin | Bin 0 -> 1876 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin | Bin 0 -> 1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin | Bin 0 -> 1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin | Bin 0 -> 1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin | Bin 0 -> 1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin | Bin 0 -> 1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin | Bin 0 -> 1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin | Bin 0 -> 1884 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin | Bin 0 -> 1888 bytes
  cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-r0.bin | Bin 0 -> 1888 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-l0.bin | Bin 0 -> 4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-r0.bin | Bin 0 -> 4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-l0.bin | Bin 0 -> 4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-r0.bin | Bin 0 -> 4656 bytes
  cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-l0.bin | Bin
  cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin | Bin
  cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin | Bin
  cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin | Bin
  cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-l0.bin | Bin 0 -> 4656 bytes
  cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-r0.bin | Bin 0 -> 4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-l0.bin | Bin 0 -> 4648 bytes
  cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-r0.bin | Bin 0 -> 4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-l0.bin | Bin 0 -> 4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-r0.bin | Bin 0 -> 4656 bytes
  cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-l0.bin | Bin 0 -> 4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-r0.bin | Bin 0 -> 4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-l0.bin | Bin 0 -> 4656 bytes
  cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-r0.bin | Bin 0 -> 4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-l0.bin | Bin 0 -> 4660 bytes
  cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-r0.bin | Bin 0 -> 4660 bytes
  41 files changed, 60 insertions(+)
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin
  mode change 100755 => 100644 
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin
  mode change 100755 => 100644 
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin
  mode change 100755 => 100644 
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin
  mode change 100755 => 100644 
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-r0.bin
  mode change 100755 => 100644 
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-l0.bin
  mode change 100755 => 100644 
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin
  mode change 100755 => 100644 
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin
  mode change 100755 => 100644 
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-r0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-l0.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-r0.bin

