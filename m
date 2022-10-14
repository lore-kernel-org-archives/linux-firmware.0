Return-Path: <SRS0=dWF9=2P=opensource.cirrus.com=prvs=3286497f8d=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1DAC433FE
	for <linux-firmware@archiver.kernel.org>; Fri, 14 Oct 2022 13:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 117CDC433B5; Fri, 14 Oct 2022 13:03:04 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 556B7C433C1
	for <linux-firmware@kernel.org>; Fri, 14 Oct 2022 13:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 556B7C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E6scVU019970
	for <linux-firmware@kernel.org>; Fri, 14 Oct 2022 08:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=bHaIlmgjCVwC63SXCErwGnYHOqE0PJ4fXGXOG/u17TY=;
 b=TmMtZKKw5sT507JDYA+cmogdYtIkPhCxv84wJOMqnGc5Yxfjz3kR36R2EOE2qfBZY8kH
 c5D02EAtgpVEXd5Zzrj56QN1hD6mqbTF4kJmXrt/iWJY/kmBsK+RwkS/6XOO2ldU1gpQ
 x+unsxD+/+LbUCs60wOEz9caqTV5zwzmcV1nqnHu3G8dF0S6jeCc3dE2qOTLFvbu1117
 LsqWuwf6jwCk92gJup1x1kiXRUvgl+Np2Av8LTtObfvySkgdDTDBOw/fJmak2ia9j9qM
 9jGR1+IHB/r80mFVOClNrhPgk0EqjjPXAmu3cnd+bSLMDKdHR8jWVRGGX5cK0qXeT852 /Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3k35mq03x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 14 Oct 2022 08:02:58 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Fri, 14 Oct
 2022 08:02:55 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Fri, 14 Oct 2022 08:02:55 -0500
Received: from LONN2DGDQ73 (unknown [198.90.238.211])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3AF012BA;
	Fri, 14 Oct 2022 13:02:55 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus CS35L41 for HP/Lenovo/ASUS laptops
Date: Fri, 14 Oct 2022 14:02:55 +0100
Message-ID: <003901d8dfcd$46b9c8a0$d42d59e0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_003A_01D8DFD5.A881B310"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdjfzSYqlmW7W5mLTXeo0e0bbi2UAw==
X-Proofpoint-ORIG-GUID: 37WUsJt8oCRxMucCYF3Qoy0tQw_FopYr
X-Proofpoint-GUID: 37WUsJt8oCRxMucCYF3Qoy0tQw_FopYr
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_003A_01D8DFD5.A881B310
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
 
We would like to add firmware files to support Cirrus Logic Smart Amp
CS35L41 for some HP, Lenovo and Asus Laptops.
 
Thanks,
Stefan Binding
 
The following changes since commit
49fccf689a13c0d49bc2f911247d51a4435a7eaa:
 
  Merge tag 'iwlwifi-fw-2022-13-10' of
http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
(2022-10-13 08:34:06 -0400)
 
are available in the Git repository at:
 
  https://github.com/CirrusLogic/linux-firmware for-upstream
 
for you to fetch changes up to
771968c6819101b078f41293f80415efa17d3b51:
 
  linux-firmware: Add firmware for Cirrus CS35L41 on ASUS Laptops
(2022-10-14 13:49:31 +0100)
 
----------------------------------------------------------------
Stefan Binding (3):
      linux-firmware: Add firmware for Cirrus CS35L41 on HP Laptops
      linux-firmware: Add firmware for Cirrus CS35L41 on Lenovo
Laptops
      linux-firmware: Add firmware for Cirrus CS35L41 on ASUS Laptops
 
WHENCE                                                  | 144
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++
cirrus/cs35l41-dsp1-spk-cali-103c896e-l0.bin            | Bin 0 ->
1976 bytes
cirrus/cs35l41-dsp1-spk-cali-103c896e-r0.bin            | Bin 0 ->
1976 bytes
cirrus/cs35l41-dsp1-spk-cali-103c8971.bin               | Bin 0 ->
1868 bytes
cirrus/cs35l41-dsp1-spk-cali-103c8972.bin               | Bin 0 ->
1868 bytes
cirrus/cs35l41-dsp1-spk-cali-103c8973.bin               | Bin 0 ->
1888 bytes
cirrus/cs35l41-dsp1-spk-cali-103c8975-l0.bin            | Bin 0 ->
1920 bytes
cirrus/cs35l41-dsp1-spk-cali-103c8975-r0.bin            | Bin 0 ->
1920 bytes
cirrus/cs35l41-dsp1-spk-cali-103c8981-l0.bin            | Bin 0 ->
2012 bytes
cirrus/cs35l41-dsp1-spk-cali-103c8981-l1.bin            | Bin 0 ->
1968 bytes
cirrus/cs35l41-dsp1-spk-cali-103c8981-r0.bin            | Bin 0 ->
2012 bytes
cirrus/cs35l41-dsp1-spk-cali-103c8981-r1.bin            | Bin 0 ->
1968 bytes
cirrus/cs35l41-dsp1-spk-cali-103c89c3-r0.bin            | Bin 0 ->
1972 bytes
cirrus/cs35l41-dsp1-spk-cali-103c89c3-r1.bin            | Bin 0 ->
1960 bytes
cirrus/cs35l41-dsp1-spk-cali-103c89c6-l0.bin            | Bin 0 ->
1776 bytes
cirrus/cs35l41-dsp1-spk-cali-103c89c6-r0.bin            | Bin 0 ->
1776 bytes
cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-l0.bin     | Bin 0 ->
1976 bytes
cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-r0.bin     | Bin 0 ->
1976 bytes
cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-l0.bin     | Bin 0 ->
1976 bytes
cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-r0.bin     | Bin 0 ->
1976 bytes
cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-l0.bin     | Bin 0 ->
1968 bytes
cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-r0.bin     | Bin 0 ->
1972 bytes
cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-l0.bin     | Bin 0 ->
1968 bytes
cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-r0.bin     | Bin 0 ->
1972 bytes
cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-l0.bin     | Bin 0 ->
1996 bytes
cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-r0.bin     | Bin 0 ->
1996 bytes
cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-l0.bin     | Bin 0 ->
1996 bytes
cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-r0.bin     | Bin 0 ->
1996 bytes
cirrus/cs35l41-dsp1-spk-cali-17aa22f1-l0.bin            | Bin 0 ->
1564 bytes
cirrus/cs35l41-dsp1-spk-cali-17aa22f1-r0.bin            | Bin 0 ->
1564 bytes
cirrus/cs35l41-dsp1-spk-cali-17aa22f2-l0.bin            | Bin 0 ->
1556 bytes
cirrus/cs35l41-dsp1-spk-cali-17aa22f2-r0.bin            | Bin 0 ->
1556 bytes
cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid0.bin        | Bin 0 ->
1528 bytes
cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid1.bin        | Bin 0 ->
1520 bytes
cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid0.bin        | Bin 0 ->
1528 bytes
cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid1.bin        | Bin 0 ->
1520 bytes
cirrus/cs35l41-dsp1-spk-prot-103c896e-l0.bin            | Bin 0 ->
5420 bytes
cirrus/cs35l41-dsp1-spk-prot-103c896e-r0.bin            | Bin 0 ->
5424 bytes
cirrus/cs35l41-dsp1-spk-prot-103c8971.bin               | Bin 0 ->
4904 bytes
cirrus/cs35l41-dsp1-spk-prot-103c8972.bin               | Bin 0 ->
4904 bytes
cirrus/cs35l41-dsp1-spk-prot-103c8973.bin               | Bin 0 ->
4924 bytes
cirrus/cs35l41-dsp1-spk-prot-103c8975-l0.bin            | Bin 0 ->
5364 bytes
cirrus/cs35l41-dsp1-spk-prot-103c8975-r0.bin            | Bin 0 ->
5364 bytes
cirrus/cs35l41-dsp1-spk-prot-103c8981-l0.bin            | Bin 0 ->
5456 bytes
cirrus/cs35l41-dsp1-spk-prot-103c8981-l1.bin            | Bin 0 ->
5448 bytes
cirrus/cs35l41-dsp1-spk-prot-103c8981-r0.bin            | Bin 0 ->
5456 bytes
cirrus/cs35l41-dsp1-spk-prot-103c8981-r1.bin            | Bin 0 ->
5448 bytes
cirrus/cs35l41-dsp1-spk-prot-103c89c3-r0.bin            | Bin 0 ->
5432 bytes
cirrus/cs35l41-dsp1-spk-prot-103c89c3-r1.bin            | Bin 0 ->
5404 bytes
cirrus/cs35l41-dsp1-spk-prot-103c89c6-l0.bin            | Bin 0 ->
4000 bytes
cirrus/cs35l41-dsp1-spk-prot-103c89c6-r0.bin            | Bin 0 ->
4000 bytes
cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-l0.bin     | Bin 0 ->
4920 bytes
cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-r0.bin     | Bin 0 ->
4920 bytes
cirrus/cs35l41-dsp1-spk-prot-104312af-spkid1-l0.bin     | Bin 0 ->
4920 bytes
cirrus/cs35l41-dsp1-spk-prot-104312af-spkid1-r0.bin     | Bin 0 ->
4920 bytes
cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid0-l0.bin     | Bin 0 ->
4944 bytes
cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid0-r0.bin     | Bin 0 ->
4948 bytes
cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid1-l0.bin     | Bin 0 ->
4944 bytes
cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid1-r0.bin     | Bin 0 ->
4948 bytes
cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid0-l0.bin     | Bin 0 ->
5516 bytes
cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid0-r0.bin     | Bin 0 ->
5516 bytes
cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid1-l0.bin     | Bin 0 ->
5516 bytes
cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid1-r0.bin     | Bin 0 ->
5516 bytes
cirrus/cs35l41-dsp1-spk-prot-17aa22f1-l0.bin            | Bin 0 ->
5016 bytes
cirrus/cs35l41-dsp1-spk-prot-17aa22f1-r0.bin            | Bin 0 ->
5016 bytes
cirrus/cs35l41-dsp1-spk-prot-17aa22f2-l0.bin            | Bin 0 ->
4868 bytes
cirrus/cs35l41-dsp1-spk-prot-17aa22f2-r0.bin            | Bin 0 ->
4868 bytes
cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid0-l0.bin     | Bin 0 ->
5392 bytes
cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid0-r0.bin     | Bin 0 ->
5392 bytes
cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid1-l0.bin     | Bin 0 ->
4984 bytes
cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid1-r0.bin     | Bin 0 ->
4984 bytes
cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid0-l0.bin     | Bin 0 ->
5008 bytes
cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid0-r0.bin     | Bin 0 ->
5012 bytes
cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid1-l0.bin     | Bin 0 ->
5008 bytes
cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid1-r0.bin     | Bin 0 ->
5012 bytes
cirrus/cs35l41/v6.39.0/halo_cspl_RAM_revB2_29.41.0.wmfw | Bin 0 ->
31060 bytes
cirrus/cs35l41/v6.47.0/halo_cspl_RAM_revB2_29.49.0.wmfw | Bin 0 ->
33988 bytes
cirrus/cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw | Bin 0 ->
34068 bytes
cirrus/cs35l41/v6.63.0/halo_cspl_RAM_revB2_29.65.0.wmfw | Bin 0 ->
34060 bytes
79 files changed, 144 insertions(+)
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c896e-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c896e-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8971.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8972.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8973.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8975-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8975-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-l1.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-r1.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c3-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c3-r1.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c6-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c6-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f1-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f1-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f2-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f2-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid1.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid1.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c896e-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c896e-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8971.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8972.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8973.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8975-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8975-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8981-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8981-l1.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8981-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8981-r1.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c89c3-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c89c3-r1.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c89c6-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c89c6-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104312af-spkid1-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104312af-spkid1-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid0-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid0-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid1-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid1-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid0-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid0-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid1-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid1-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa22f1-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa22f1-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa22f2-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa22f2-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid0-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid0-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid1-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid1-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid0-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid0-r0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid1-l0.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid1-r0.bin
create mode 100644
cirrus/cs35l41/v6.39.0/halo_cspl_RAM_revB2_29.41.0.wmfw
create mode 100644
cirrus/cs35l41/v6.47.0/halo_cspl_RAM_revB2_29.49.0.wmfw
create mode 100644
cirrus/cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
create mode 100755
cirrus/cs35l41/v6.63.0/halo_cspl_RAM_revB2_29.65.0.wmfw

------=_NextPart_000_003A_01D8DFD5.A881B310
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DProgId content=3DWord.Document><meta =
name=3DGenerator content=3D"Microsoft Word 15"><meta name=3DOriginator =
content=3D"Microsoft Word 15"><link rel=3DFile-List =
href=3D"cid:filelist.xml@01D8DFD5.A852B3D0"><!--[if gte mso 9]><xml>
<o:OfficeDocumentSettings>
<o:AllowPNG/>
<o:DoNotRelyOnCSS/>
</o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:WordDocument>
<w:SpellingState>Clean</w:SpellingState>
<w:GrammarState>Clean</w:GrammarState>
<w:TrackMoves/>
<w:TrackFormatting/>
<w:EnvelopeVis/>
<w:PunctuationKerning/>
<w:ValidateAgainstSchemas/>
<w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
<w:IgnoreMixedContent>false</w:IgnoreMixedContent>
<w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
<w:DoNotPromoteQF/>
<w:LidThemeOther>EN-US</w:LidThemeOther>
<w:LidThemeAsian>X-NONE</w:LidThemeAsian>
<w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
<w:Compatibility>
<w:BreakWrappedTables/>
<w:SnapToGridInCell/>
<w:WrapTextWithPunct/>
<w:UseAsianBreakRules/>
<w:DontGrowAutofit/>
<w:SplitPgBreakAndParaMark/>
<w:EnableOpenTypeKerning/>
<w:DontFlipMirrorIndents/>
<w:OverrideTableStyleHps/>
</w:Compatibility>
<m:mathPr>
<m:mathFont m:val=3D"Cambria Math"/>
<m:brkBin m:val=3D"before"/>
<m:brkBinSub m:val=3D"&#45;-"/>
<m:smallFrac m:val=3D"off"/>
<m:dispDef/>
<m:lMargin m:val=3D"0"/>
<m:rMargin m:val=3D"0"/>
<m:defJc m:val=3D"centerGroup"/>
<m:wrapIndent m:val=3D"1440"/>
<m:intLim m:val=3D"subSup"/>
<m:naryLim m:val=3D"undOvr"/>
</m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:LatentStyles DefLockedState=3D"false" DefUnhideWhenUsed=3D"false" =
DefSemiHidden=3D"false" DefQFormat=3D"false" DefPriority=3D"99" =
LatentStyleCount=3D"376">
<w:LsdException Locked=3D"false" Priority=3D"0" QFormat=3D"true" =
Name=3D"Normal"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" =
Name=3D"heading 1"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 2"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 3"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 5"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 6"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 7"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 8"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 9"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 9"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 1"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 2"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 3"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 4"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 5"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 6"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 7"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 8"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 9"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Normal Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"footnote text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"annotation text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"header"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"footer"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index heading"/>
<w:LsdException Locked=3D"false" Priority=3D"35" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"caption"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"table of figures"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"envelope address"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"envelope return"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"footnote reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"annotation reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"line number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"page number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"endnote reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"endnote text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"table of authorities"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"macro"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toa heading"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number 5"/>
<w:LsdException Locked=3D"false" Priority=3D"10" QFormat=3D"true" =
Name=3D"Title"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Closing"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Signature"/>
<w:LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Default Paragraph Font"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Message Header"/>
<w:LsdException Locked=3D"false" Priority=3D"11" QFormat=3D"true" =
Name=3D"Subtitle"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Salutation"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Date"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text First Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text First Indent 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Note Heading"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text Indent 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text Indent 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Block Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Hyperlink"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"FollowedHyperlink"/>
<w:LsdException Locked=3D"false" Priority=3D"22" QFormat=3D"true" =
Name=3D"Strong"/>
<w:LsdException Locked=3D"false" Priority=3D"20" QFormat=3D"true" =
Name=3D"Emphasis"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Document Map"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Plain Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"E-mail Signature"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Top of Form"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Bottom of Form"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Normal (Web)"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Acronym"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Address"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Cite"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Code"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Definition"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Keyboard"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Preformatted"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Sample"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Typewriter"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Variable"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Normal Table"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"annotation subject"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"No List"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Outline List 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Outline List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Outline List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Simple 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Simple 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Simple 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Classic 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Classic 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Classic 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Classic 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Colorful 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Colorful 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Colorful 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table 3D effects 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table 3D effects 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table 3D effects 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Contemporary"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Elegant"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Professional"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Subtle 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Subtle 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Web 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Web 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Web 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Balloon Text"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"Table Grid"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Theme"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Placeholder =
Text"/>
<w:LsdException Locked=3D"false" Priority=3D"1" QFormat=3D"true" =
Name=3D"No Spacing"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light =
Shading"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid =
3"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful =
List"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful =
Grid"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Revision"/>
<w:LsdException Locked=3D"false" Priority=3D"34" QFormat=3D"true" =
Name=3D"List Paragraph"/>
<w:LsdException Locked=3D"false" Priority=3D"29" QFormat=3D"true" =
Name=3D"Quote"/>
<w:LsdException Locked=3D"false" Priority=3D"30" QFormat=3D"true" =
Name=3D"Intense Quote"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"19" QFormat=3D"true" =
Name=3D"Subtle Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"21" QFormat=3D"true" =
Name=3D"Intense Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"31" QFormat=3D"true" =
Name=3D"Subtle Reference"/>
<w:LsdException Locked=3D"false" Priority=3D"32" QFormat=3D"true" =
Name=3D"Intense Reference"/>
<w:LsdException Locked=3D"false" Priority=3D"33" QFormat=3D"true" =
Name=3D"Book Title"/>
<w:LsdException Locked=3D"false" Priority=3D"37" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Bibliography"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"TOC Heading"/>
<w:LsdException Locked=3D"false" Priority=3D"41" Name=3D"Plain Table =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"42" Name=3D"Plain Table =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"43" Name=3D"Plain Table =
3"/>
<w:LsdException Locked=3D"false" Priority=3D"44" Name=3D"Plain Table =
4"/>
<w:LsdException Locked=3D"false" Priority=3D"45" Name=3D"Plain Table =
5"/>
<w:LsdException Locked=3D"false" Priority=3D"40" Name=3D"Grid Table =
Light"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Mention"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Smart Hyperlink"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Hashtag"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Unresolved Mention"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Smart Link"/>
</w:LatentStyles>
</xml><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-536869121 1107305727 33554432 0 415 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-469750017 -1073732485 9 0 511 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;
	text-underline:single;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	mso-style-noshow:yes;
	mso-style-unhide:no;
	mso-ansi-font-size:11.0pt;
	mso-bidi-font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";
	color:windowtext;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;
	mso-header-margin:36.0pt;
	mso-footer-margin:36.0pt;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 10]><style>/* Style Definitions */
table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
</style><![endif]--><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72" =
style=3D'tab-interval:36.0pt;word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span =
style=3D'font-size:11.0pt'>Hi,<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>We would like to add firmware files to =
support Cirrus Logic Smart Amp CS35L41 for some HP, <span =
class=3DGramE>Lenovo</span> and Asus =
Laptops.<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>Stefan Binding<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>The following changes since commit =
49fccf689a13c0d49bc2f911247d51a4435a7eaa:<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-spacerun:yes'>&nbsp; =
</span>Merge tag 'iwlwifi-fw-2022-13-10' of <a =
href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firm=
ware">http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmwa=
re</a> (2022-10-13 08:34:06 -0400)<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>are available in the Git repository =
at:<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-spacerun:yes'>&nbsp; =
</span><a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> =
for-upstream<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>for you to fetch changes up to =
771968c6819101b078f41293f80415efa17d3b51:<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-spacerun:yes'>&nbsp; =
</span><span class=3DSpellE>linux</span>-firmware: Add firmware for =
Cirrus CS35L41 on ASUS Laptops (2022-10-14 13:49:31 =
+0100)<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>Stefan Binding =
(3):<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
class=3DSpellE>linux</span>-firmware: Add firmware for Cirrus CS35L41 on =
HP Laptops<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
class=3DSpellE>linux</span>-firmware: Add firmware for Cirrus CS35L41 on =
Lenovo Laptops<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
class=3DSpellE>linux</span>-firmware: Add firmware for Cirrus CS35L41 on =
ASUS Laptops<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> WHENCE<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>| 144 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++<o:=
p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c896e-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1976 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c896e-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1976 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c8971.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1868 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c8972.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1868 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c8973.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>| =
Bin 0 -&gt; 1888 bytes<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c8975-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1920 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c8975-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1920 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c8981-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 2012 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c8981-l1.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1968 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c8981-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 2012 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c8981-r1.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1968 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c89c3-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1972 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c89c3-r1.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1960 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c89c6-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1776 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-103c89c6-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1776 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
1976 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
1976 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
1976 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
1976 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
1968 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
1972 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
1968 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
1972 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
1996 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
1996 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
1996 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
1996 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-17aa22f1-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1564 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-17aa22f1-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1564 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-17aa22f2-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1556 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-17aa22f2-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 1556 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>| Bin 0 -&gt; 1528 bytes<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid1.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>| Bin 0 -&gt; 1520 bytes<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span>| Bin 0 -&gt; 1528 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid1.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>| Bin 0 -&gt; 1520 bytes<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c896e-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 5420 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c896e-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 5424 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c8971.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 4904 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c8972.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 4904 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c8973.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 4924 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c8975-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 5364 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c8975-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 5364 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c8981-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 5456 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c8981-l1.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 5448 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c8981-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 5456 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c8981-r1.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 5448 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c89c3-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 5432 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c89c3-r1.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 5404 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c89c6-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 4000 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-103c89c6-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 4000 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
4920 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
4920 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-104312af-spkid1-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
4920 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-104312af-spkid1-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
4920 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid0-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
4944 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid0-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
4948 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid1-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
4944 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid1-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
4948 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid0-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
5516 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid0-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
5516 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid1-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
5516 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid1-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
5516 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-17aa22f1-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span><span style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span>| =
Bin 0 -&gt; 5016 bytes<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-17aa22f1-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 5016 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-17aa22f2-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 4868 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-17aa22f2-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; 4868 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid0-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
5392 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid0-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
5392 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid1-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
4984 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid1-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
4984 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid0-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
5008 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid0-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
5012 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid1-l0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
5008 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid1-r0.bin<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>| Bin 0 -&gt; =
5012 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41/v6.39.0/halo_cspl_RAM_revB2_29.41.0.wmfw | Bin 0 -&gt; =
31060 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41/v6.47.0/halo_cspl_RAM_revB2_29.49.0.wmfw | Bin 0 -&gt; =
33988 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw | Bin 0 -&gt; =
34068 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41/v6.63.0/halo_cspl_RAM_revB2_29.65.0.wmfw | Bin 0 -&gt; =
34060 bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> 79 files =
changed, 144 insertions(+)<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c896e-l0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c896e-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c8971.bin<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c8972.bin<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c8973.bin<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c8975-l0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c8975-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c8981-l0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c8981-l1.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c8981-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c8981-r1.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c89c3-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c89c3-r1.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c89c6-l0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-103c89c6-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-17aa22f1-l0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-17aa22f1-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-17aa22f2-l0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-17aa22f2-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid0.bin<o:p></o:p></span></font>=
</p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid1.bin<o:p></o:p></span></font>=
</p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid0.bin<o:p></o:p></span></font>=
</p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid1.bin<o:p></o:p></span></font>=
</p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c896e-l0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c896e-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c8971.bin<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c8972.bin<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c8973.bin<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c8975-l0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c8975-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c8981-l0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c8981-l1.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c8981-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c8981-r1.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c89c3-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c89c3-r1.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c89c6-l0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-103c89c6-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-104312af-spkid0-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-104312af-spkid1-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-104312af-spkid1-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid0-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid0-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid1-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-10431a8f-spkid1-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid0-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid0-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid1-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-10431e02-spkid1-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-17aa22f1-l0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-17aa22f1-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-17aa22f2-l0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-17aa22f2-r0.bin<o:p></o:p></span></font></p>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid0-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid0-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid1-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-17aa3847-spkid1-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid0-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid0-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid1-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot-17aa3855-spkid1-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41/v6.39.0/halo_cspl_RAM_revB2_29.41.0.wmfw<o:p></o:p></span>=
</font></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41/v6.47.0/halo_cspl_RAM_revB2_29.49.0.wmfw<o:p></o:p></span>=
</font></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw<o:p></o:p></span>=
</font></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100755 =
cirrus/cs35l41/v6.63.0/halo_cspl_RAM_revB2_29.65.0.wmfw<o:p></o:p></span>=
</font></p></div></body></html>
------=_NextPart_000_003A_01D8DFD5.A881B310--
