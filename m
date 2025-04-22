Return-Path: <SRS0=PRoO=XI=quicinc.com=quic_vdadhani@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01076C369C2
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Apr 2025 10:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA5E6C4CEEA; Tue, 22 Apr 2025 10:53:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE0CAC4CEE9
	for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 10:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE0CAC4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4OYBi031585
	for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 10:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5l595TAHk+YGi5VtNMPgQO
	jGuf/xC+Y7XpqENJFfz9c=; b=lNzkthx9LmfFB3R8wZOihYNOB4RQjoMdkkyVpM
	wLkmc9tY4pVVe/5fyK0TUEnLHtG2y7/qGCCSq9jwiEj64qlr6wK1rH4a3zVC1nVJ
	4jx91q81S9NYSbTeCbRbyiZBGahR1gNzZV2gZEaokOksx6EqjI32U89fXbV7jzmJ
	JnoTahkXyNFfXb1l7oCU5pRZuUwnKWfJpEP3lv56n1zGNs2Z9SbbXTXtkuw8bRy1
	JoWUXoiqqhf/m/xRo6SrUMlgd8GR5AMxiGxhaKGyZMI7786z71+MLpp6CHKkicud
	XYzRPqsYKvi6q/QHnCyGRJHGlCoufAmdHW1eo+7XUEpVS1kg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4641hhqavm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 10:53:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53MArdvx022657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 10:53:39 GMT
Received: from [10.50.21.133] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 03:53:38 -0700
Message-ID: <3e568e90-2c9a-4e66-b6fd-6bc63c7e9aba@quicinc.com>
Date: Tue, 22 Apr 2025 16:23:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        <quic_anupkulk@quicinc.com>
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: qcom: add QUPv3 firmware for QCS9100 platform
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Fe43xI+6 c=1 sm=1 tr=0 ts=68077534 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qC_FGOx9AAAA:8 a=9dOAMtuPV7CCuX9A6QAA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 3TmZhcMx1DCyKeCwdEz6-mWQcX-L2een
X-Proofpoint-ORIG-GUID: 3TmZhcMx1DCyKeCwdEz6-mWQcX-L2een
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=494 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220082

The following changes since commit 45104fd3c5a42e8a608f234b160f3228883fca1b:

   Merge branch 'robot/patch-2-1745241474' into 'main' (2025-04-21 
13:20:06 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qupv3-fw-sa8775p

for you to fetch changes up to a940769c60a809fdc3daeb42550214f7aab35792:

   qcom: add QUPv3 firmware for QCS9100 platform (2025-04-22 16:19:20 +0530)

----------------------------------------------------------------
Viken Dadhaniya (1):
       qcom: add QUPv3 firmware for QCS9100 platform

  WHENCE                   |   7 +++++++
  qcom/sa8775p/qupv3fw.elf | Bin 0 -> 55909 bytes
  2 files changed, 7 insertions(+)
  create mode 100644 qcom/sa8775p/qupv3fw.elf
