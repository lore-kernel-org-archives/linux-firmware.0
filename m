Return-Path: <SRS0=DSbX=XK=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91097C369AB
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Apr 2025 10:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57AC2C4CEEB; Thu, 24 Apr 2025 10:18:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71339C4CEE4
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 10:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 71339C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F68M013221
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 10:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Lh9l0iXsnzWOVZIKaL0349
	MDgBvRkQXrJ88Sm7IS9bQ=; b=VCmr1At6YdO9XYipuDxil/U/+jIvWbV3qWOZfA
	OzLlfM0fAUD/QB1XbxDAo8jKJE0LWv+9YFzLLuHp3YOV4X3xkCWXLEdEcGs90hCe
	iS/cuSM4S0hB0qekvz6wpunUw5cj9W/p8fT72mCUKW0a/XqC33dYmrWuW0tyOPIo
	tvO0EWWyMt99vycYZBt332ZuZ41fq8z3GYKDr5+DGB1V6/RYoYMbDAdhZCIdVUp1
	r1Pu+h1yZIo9Yqs61qqikvxSb2JJyOB+qoqZY9BlDjFic1WRTWrcTAETa6/Z3iIH
	o88Q7YVOlGZ28HQGAzo1UhAmCWm8t8YbORFGgbb6CR56rgAA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2d5cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 10:18:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OAISGv011290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 10:18:28 GMT
Received: from [10.50.32.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 03:18:27 -0700
Message-ID: <798a8c89-d977-603f-43a6-ea836d3f459f@quicinc.com>
Date: Thu, 24 Apr 2025 15:48:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: update video firmware binary for SA8775p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mYLAaCeuFNPXjY3ib2GIKKrmZQMRt4kM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OCBTYWx0ZWRfXwO9dchlfEg4k KgE1C2AzJyjhejZ8UGr1uOjLNnxHfKxRI32CG+9gcEr+wB6w3ywBiw0AvGKBMlQ4JjAhD6ieuf3 mYJ1v2VbkYEvR7pmGGT4sBfToAedT1Te3iLT5de62HL1J+dkX9GDNxqlZPC9WHnXg1vY9PmoIK0
 StHAldh0LHWWoJy6jzTGdZ8+55vJhPJh/AgBPwyjXD2Uuzdu9jOgnYAKDMY0ktHm+0mpjcMQo4m 6l/cb3mj4iKP/QLk/i55zmMEmQHcslLHk1cHncmk/VbBCffXYC1N3xWi0NqKYC+1Ji6Y6TSY3rA uMpXD9rJJ30o40yAyauAZEpwegV8ZLGTMF4QNPbVD8W+ywD63CuVhCnHXNIoug4fMgOndeIVSDH
 De6i6GHQvwdKyHCoC0G1HotP3IbKha85QWvg4FGalnQRnjmGTipH1N99cMPO+AmJkMy12xsF
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a0ff5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qC_FGOx9AAAA:8 a=CFZLmFb7OP-UuBmBegwA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: mYLAaCeuFNPXjY3ib2GIKKrmZQMRt4kM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=489 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240068

Hi,

The following changes since commit c67433231cbd8bcf90b5563bed22fc7a62bbc2bc:

  Merge branch 'robot/pr-0-1745441634' into 'main' (2025-04-23 23:24:26 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-SA8775p-16MB

for you to fetch changes up to ef226c72835b1f8521e855f5a12640b8991d1ef1:

  qcom: vpu: update video firmware binary for SA8775p (2025-04-24 15:07:18
+0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: update video firmware binary for SA8775p

WHENCE                        |   4 ++++
qcom/vpu/vpu30_p4_s6_16mb.mbn | Bin 0 -> 2311988 bytes
2 files changed, 4 insertions(+)
create mode 100644 qcom/vpu/vpu30_p4_s6_16mb.mbn

Thanks,
Dikshita
