Return-Path: <SRS0=tC6M=3A=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7865CA0EE4
	for <linux-firmware@archiver.kernel.org>; Wed, 20 Aug 2025 11:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ABC06C4CEED; Wed, 20 Aug 2025 11:55:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A02B7C4CEEB
	for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 11:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A02B7C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KABVDk004347;
	Wed, 20 Aug 2025 11:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SFNPc9Y1xIKvoj28pnPPAD
	xIlHhYEsFAG9eYocDH7FM=; b=XZOpz1lNrplihv4eJBeX7iUAsHJO/4RtAA1+SI
	nE2W3s+2I5ks+MbP2TmZ1k5hYAr4/uqQvwHSjwhkEuXSEz0oJqKa32NLQmuJCIOQ
	ZGpxxdqTZXIf6t7slIMUzEOfgjwhJHeENpBCKRIGDrUTdhg5QmO1SV7tkg6LlL6y
	bkQVIecfy32HxQj7vxTNa1pDd0ZyPyLLDXIA30mekxHGz8iKBk9uMtf61RyG8vvt
	4Mg5l+nvhD2vjLJn8HXZz28plVgbzr2splToKsRJyvTUDhcJ+yHBCZb+dIGE0y74
	fMQxEPz9d2TkaQtycOND6bbeRhnJss49qu9uWoPlEwf746rw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ahk2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 11:55:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57KBt3NL008414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 11:55:03 GMT
Received: from [10.50.10.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 20 Aug
 2025 04:55:01 -0700
Message-ID: <2ed59e7f-c8e9-7c29-b1e8-d85058a022b9@quicinc.com>
Date: Wed, 20 Aug 2025 17:24:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Add firmware binary for SM8650
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kBhGXZ3BR3suZbVEajfD0LzZnkDugMAt
X-Proofpoint-ORIG-GUID: kBhGXZ3BR3suZbVEajfD0LzZnkDugMAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXy/zQE4JuVkhi
 ki4EneGXOwlcDZq0ZmsZ3gZzpXcunlcLDkArxsTmBCrDx8fl3lLXM0C2K+6wtxFW2aNnfrOT7sB
 5/IsQcQ1u4+IPCL/Ct9y/CjVl8cqv2ZT7IDm6tdhOBzpMSg8pCCFa/9+H2TFtWZaNY+6ppakIMf
 zhHoffhj5FsKUlnG94kfZRfH7nmiQngdjsIJ1IZ8/dEkXcfGTHcIfOb+Py2ShxO30NNxk6wo0mz
 qox7YKEdStvp9luJ2lTUxkTu5RR03HVlvrfTkZsErMURf6jrgzQLnFO3iN4HotSorKLTRwFgZCN
 G3wHsECieR24m36rpMdtPoLf/LkcSxuOYNUKOWiUStiPZ/0jRXNqUkxvr6JC2N+h8ckuGD1iHY6
 WctX6ouqdrndkoDjbbcmcG/1GBR9kg==
X-Authority-Analysis: v=2.4 cv=XfbQDI55 c=1 sm=1 tr=0 ts=68a5b798 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8
 a=H4HSedL7kpsKgq4jo4AA:9 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

Hi,

The following changes since commit 697065607ca2e09fe02b0d6c7c2bf7bcc96243a5:

  Merge branch 'rtl8723-bt' into 'main' (2025-08-19 13:23:06 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-SM8650

for you to fetch changes up to ece445af91bbee49bf0d8b23c2b99b596ae6eac7:

  qcom: Add firmware binary for SM8650. (2025-08-20 17:23:16 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: Add firmware binary for SM8650.

 WHENCE                |   4 ++++
 qcom/vpu/vpu33_p4.mbn | Bin 0 -> 2343624 bytes
 2 files changed, 4 insertions(+)
 create mode 100644 qcom/vpu/vpu33_p4.mbn



Thanks,
Dikshita
