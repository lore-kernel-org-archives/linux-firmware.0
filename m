Return-Path: <SRS0=TlPf=XH=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC13C369AB
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Apr 2025 10:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C81FCC4CEED; Mon, 21 Apr 2025 10:41:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 760F1C4CEE4
	for <linux-firmware@kernel.org>; Mon, 21 Apr 2025 10:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 760F1C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L9KF0G018145
	for <linux-firmware@kernel.org>; Mon, 21 Apr 2025 10:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Deohfn5eQwXEt72OEY/eg6
	Nb/BiJ9Uk3x6wk2tX/RWA=; b=j7DK4Oy87oNOb+Gd1tZFqrs08qIFAakRiQPs50
	/LPrj8mWCT0MpuzxqZVOUmF7sC14VvM7kirSf0NYnv4BwHbTXyZjmkUOozMvoU4G
	ORSrarYSXQsS1NxBLK8w7i++abnVoEuXfsXxP0g7UqTPO4KZBCHdw0oua8FfwqhR
	qWhtC/W/WjBaQ952U+ByURt6+y+Z3pWDoUjay+ZXZ6HHGtrodVW50M8KMl+JpuL1
	x/knjZd0yIkjVK5HPziAyvf6+gHvzopheVgTF9Y3AiNQ6MeflGFMXkVpVT3ZbQ4P
	TIErClTskNp3YCPhaiahflviR3nNgiVMhtwQHuHjxAaO0mXA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416qv44j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 21 Apr 2025 10:41:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53LAfF92004044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 21 Apr 2025 10:41:15 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Apr
 2025 03:41:13 -0700
Message-ID: <103648c2-c630-40fc-476e-4b68530baf37@quicinc.com>
Date: Mon, 21 Apr 2025 16:11:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: add hfi gen2 based video firmware binary for qcm6490
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=680620cb cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qC_FGOx9AAAA:8 a=JttHePY_oO0195LXDusA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: N-MYr-6_A5pQw-VkdJqsjfvK2AFtDuEw
X-Proofpoint-ORIG-GUID: N-MYr-6_A5pQw-VkdJqsjfvK2AFtDuEw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=613 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210081

Hi,

The following changes since commit 5aa42075d00c58da1596c22679879267d2505737:

  Merge branch 'amd-staging' into 'main' (2025-04-19 18:16:40 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video_fw_gen2_qcm6490

for you to fetch changes up to 51b35ac23ee7ca7ccea70afeb66840ee204ee185:

  qcom: vpu: add video firmware binary for qcm6490 (2025-04-21 15:13:09 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: add video firmware binary for qcm6490

 WHENCE                     |   4 ++++
 qcom/vpu/vpu20_p1_gen2.mbn | Bin 0 -> 2036328 bytes
 2 files changed, 4 insertions(+)
 create mode 100644 qcom/vpu/vpu20_p1_gen2.mbn
