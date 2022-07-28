Return-Path: <SRS0=/mSl=YB=cirrus.com=prvs=120867bca9=vitaly.rodionov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9672CC04A68
	for <linux-firmware@archiver.kernel.org>; Thu, 28 Jul 2022 10:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DA56C433D7; Thu, 28 Jul 2022 10:37:50 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28D3FC433D6
	for <linux-firmware@kernel.org>; Thu, 28 Jul 2022 10:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28D3FC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26S84P7x013301
	for <linux-firmware@kernel.org>; Thu, 28 Jul 2022 05:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=PODMain02222019;
 bh=x5fo9nVw2qLbXXRY+CWoyE3ZRNaMIPXv6uj5rkBvkts=;
 b=FxZqqdcSaMjj/5zYxSiQnWEimEIQuNODRtbVcc+SoB3ToTV+/oTPN4Js70VTVwYloL2H
 U8eRM63C3utSdUpuVUrEQZUrhRjFmVAo/5Zs7T0CHwlnXKbDWBa3hvBfAFFkDDw/jC4J
 kbKmUO2YPksoxjks1pb9wmvD8ob5R3Mcv0Fn0M03QsiyzZAclTvI4PiWxrG3H3K7QhR4
 3YvbKYvr7DUa/NMd+oZ9IQhfqDv5lKCkIRy30V3haUHAUgstRbUiPhAAIyKVt2yzcury
 0WxwKgPJexO7us0B/vUeH4aiobUE1z7oR/q2zPZeI0NRzc+IJ7fxl9srUpntDVBZVtjc 9A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hgddp6csk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 28 Jul 2022 05:37:47 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Thu, 28 Jul
 2022 05:37:46 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Thu, 28 Jul 2022 05:37:46 -0500
Received: from [198.90.202.102] (lon-sw-dsktp002.ad.cirrus.com [198.90.202.102])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 24F632C5;
	Thu, 28 Jul 2022 10:37:46 +0000 (UTC)
Message-ID: <4f8ed799-7011-fe97-b606-4bcaa4e80ca3@cirrus.com>
Date: Thu, 28 Jul 2022 11:37:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
From: Vitaly Rodionov <vitaly.rodionov@cirrus.com>
Subject: [PULL v2 linux-firmware] Add firmware for Cirrus CS35L41
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: d8NiohBa1GuorxWusobduQwXdfSBp3L6
X-Proofpoint-ORIG-GUID: d8NiohBa1GuorxWusobduQwXdfSBp3L6
X-Proofpoint-Spam-Reason: safe

Hi,

We are adding firmware files to support Cirrus Logic smart amplifier
CS35L41

Please, let me know if there are any problems.

Thanks,

Vitaly

changes since version 1:

Corrected LICENSE.cirrus


The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66=
:

   amdgpu partially revert "amdgpu: update beige goby to release 22.20"
(2022-07-25 14:16:04 -0400)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware.git for-upstream

for you to fetch changes up to ec6db1824cd5b95471ff469d3ed4593b02ac58bc:

   linux-firmware: Add firmware for Cirrus CS35L41 (2022-07-28 11:26:03
+0100)

----------------------------------------------------------------
Vitaly Rodionov (1):
       linux-firmware: Add firmware for Cirrus CS35L41

  LICENSE.cirrus                    | 282
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++
  WHENCE                            |=C2=A0 16 ++++++++++
  cirrus/cs35l41-dsp1-spk-prot.bin  | Bin 0 -> 948 bytes
  cirrus/cs35l41-dsp1-spk-prot.wmfw | Bin 0 -> 34056 bytes
  4 files changed, 298 insertions(+)
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
