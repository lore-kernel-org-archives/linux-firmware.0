Return-Path: <SRS0=8Nga=V5=quicinc.com=quic_akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E18C282DE
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Mar 2025 21:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DAD4C4CEED; Mon, 10 Mar 2025 21:26:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3189C4CEE5
	for <linux-firmware@kernel.org>; Mon, 10 Mar 2025 21:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3189C4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AL6bPr011461;
	Mon, 10 Mar 2025 21:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tIw4QbFer3N9e1fBnWNwok
	+i2nalkRmlhLMVYoOU7oE=; b=DQCpBFy18agHnRPCixCgCVYnX5wCWcbWj6vJ1Q
	r+G24BJfB382L2pWlm3D4AjlUFlAMOC2KyyDbbNSvpuqkXRqBV/1hd549YjU/SAn
	uuwqswSd1+Z2dg6/75e2lCe0F9USl16tgupVag68ooI0WNw3jt5BjHlEPUp0Qxh/
	z1b58cQqFdq363V9zsC+WD/XXtQoRpRgovNE+yVXUTduh3uv5Ps3Tt7PwR8xffVu
	suH72UqxypJwejvbd2nJO+hXuOlznhz0eaoH0AAAqSWXfgzil/HygadQWJIMKq/k
	OLTYcBRo2gkYu2S81El5GwE01M7lA84XeRKkz8m0zjz7L8PA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eype4qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 21:26:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52ALQ5H0018449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 21:26:05 GMT
Received: from [10.216.23.206] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Mar
 2025 14:26:03 -0700
Message-ID: <3c83ecf5-2536-4fe5-bf01-08d6f9d12d82@quicinc.com>
Date: Tue, 11 Mar 2025 02:56:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: qcom: Update gpu firmwares for QCS8300 chipset
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=A9yWP7WG c=1 sm=1 tr=0 ts=67cf58ed cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qC_FGOx9AAAA:8 a=_idI4Ui2MrMa44MylkoA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: HWlrIf1PWwn-8mWIDkPPVm6bdg61u3Ad
X-Proofpoint-GUID: HWlrIf1PWwn-8mWIDkPPVm6bdg61u3Ad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=404
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100163

Hi,

Add/update the gpu firmwares required for Qualcomm's QCS8300 chipset.

-Akhil

---
The following changes since commit 11c4e60f95736ebd7fd98be5f54287d204c71bfd:

  Merge branch 'amd-staging' into 'main' (2025-03-10 17:46:53 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
gpu-fw-QCS8300

for you to fetch changes up to fe52903ce2a8c3be254b34b20b9dae76aadf19d8:

  qcom: Update gpu firmwares for qcs8300 chipset (2025-03-11 02:39:02 +0530)

----------------------------------------------------------------
Rajesh Kemisetti (1):
      qcom: Update gpu firmwares for qcs8300 chipset

 WHENCE                    |   2 ++
 qcom/a623_gmu.bin         | Bin 0 -> 51544 bytes
 qcom/a650_sqe.fw          | Bin 31804 -> 31964 bytes
 qcom/qcs8300/a623_zap.mbn | Bin 0 -> 1054364 bytes
 4 files changed, 2 insertions(+)
 create mode 100644 qcom/a623_gmu.bin
 create mode 100644 qcom/qcs8300/a623_zap.mbn
