Return-Path: <SRS0=r7Hv=X2=cirrus.com=prvs=0201436fc8=vitaly.rodionov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313E0C433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 21 Jul 2022 15:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF73FC341C6; Thu, 21 Jul 2022 15:56:35 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16167C341C0
	for <linux-firmware@kernel.org>; Thu, 21 Jul 2022 15:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16167C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LCsSGq030596
	for <linux-firmware@kernel.org>; Thu, 21 Jul 2022 10:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : to : from : subject : cc : content-type :
 content-transfer-encoding; s=PODMain02222019;
 bh=SGQ4GXLSL0QWTgctiW/zSMy6iz660xrB/P4YoAl/lMQ=;
 b=BsM9Bj0FwflGf1TNogZRN4pdnFoHjNMwRJxutT5mI8stkdiO1YfnYUssoCgHwmfXVpAa
 ak1eR2fSNPozZYurkviJcnSk3aJKDBPW4o9n0V+3HJPpnui63A6DoKbF/5No2xb5toQd
 PVnTNOH63TEHFVh/8P2sN+IrjrhvSpL135sQnRapq0WUP+ueRnJFiSNBlXeyqZWQY7JZ
 R43QjoOHwj9Q8WcW0YeoB+QxszK4POAsIUgdNoRWhYvu+Eo1hckhocspL8j/DG9rfBgU
 AxDzegKM3SaH/OJ6bioY5PTdVAX61ixef/OqFM945jrw1YxPaMN1wZGse7X61ehIl4Za xw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hdxffarwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 21 Jul 2022 10:56:28 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Thu, 21 Jul
 2022 10:56:26 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Thu, 21 Jul 2022 10:56:26 -0500
Received: from [198.90.202.102] (lon-sw-dsktp002.ad.cirrus.com [198.90.202.102])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3D7A97C;
	Thu, 21 Jul 2022 15:56:26 +0000 (UTC)
Message-ID: <515183d5-eb68-f3be-e82e-de563d20c96d@cirrus.com>
Date: Thu, 21 Jul 2022 16:56:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
From: Vitaly Rodionov <vitaly.rodionov@cirrus.com>
Subject: [PULL linux-firmware] Add firmware for Cirrus CS35L41
CC: <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: iEt4vUS3_vfpnA76kbg85ivD90Oxiow9
X-Proofpoint-GUID: iEt4vUS3_vfpnA76kbg85ivD90Oxiow9
X-Proofpoint-Spam-Reason: safe

Hi,

We are adding firmware files to support Cirrus Logic smart amplifier CS35L4=
1

Please, let me know if there are any problems.

Thanks,

Vitaly

The following changes since commit dfa29317dd78f3a18f37ef8063efe9d2659e6387=
:


   WHENCE: Correct dangling symlinks (2022-07-10 09:21:51 -0400)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware.git main

for you to fetch changes up to 6383ab27f3cc36cd2428167ca7834013e2948604:

   linux-firmware: Add firmware for Cirrus CS35L41 (2022-07-21 15:36:03
+0100)

----------------------------------------------------------------
Vitaly Rodionov (1):
       linux-firmware: Add firmware for Cirrus CS35L41

  LICENSE.cirrus                    | 285
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++
  WHENCE                            |=C2=A0 16 ++++++++++
  cirrus/cs35l41-dsp1-spk-prot.bin  | Bin 0 -> 948 bytes
  cirrus/cs35l41-dsp1-spk-prot.wmfw | Bin 0 -> 34056 bytes
  4 files changed, 301 insertions(+)
  create mode 100644 LICENSE.cirrus
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot.bin
  create mode 100644 cirrus/cs35l41-dsp1-spk-prot.wmfw

This message and any attachments may contain privileged and confidential in=
formation that is intended solely for the person(s) to whom it is addressed=
. If you are not an intended recipient you must not: read; copy; distribute=
; discuss; take any action in or make any reliance upon the contents of thi=
s message; nor open or read any attachment. If you have received this messa=
ge in error, please notify us as soon as possible on the following telephon=
e number and destroy this message including any attachments. Thank you. Cir=
rus Logic International (UK) Ltd and Cirrus Logic International Semiconduct=
or Ltd are companies registered in Scotland, with registered numbers SC0898=
39 and SC495735 respectively. Our registered office is at 7B Nightingale Wa=
y, Quartermile, Edinburgh, EH3 9EG, UK. Tel: +44 (0)131 272 7000. cirrus.co=
m
