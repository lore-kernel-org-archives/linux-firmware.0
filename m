Return-Path: <SRS0=wELy=W2=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABB0C3600C
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Apr 2025 08:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BBCAC4CEE8; Tue,  8 Apr 2025 08:58:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFBC3C4CEE5
	for <linux-firmware@kernel.org>; Tue,  8 Apr 2025 08:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DFBC3C4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382JdgR014252
	for <linux-firmware@kernel.org>; Tue, 8 Apr 2025 08:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aDfv3L2q2UB0NE+Ceo45bG
	vCmPjuOkziFtj4ej46tpM=; b=Y7b9g4XlzcRyN5sKYL8VKqGFkOQCqZhNo164CR
	fhPua22dzFwp+iQXA55Wk1aCrLgpB814hONUvvmXoWrKDbjXQgHWJf2qnYU5Xuh1
	EoB/1wuqjzPac7g8z6n9XJTx5yzQugsfqgwDoFhoMz1TSRv1zlmV/tymd/v5os4k
	7Y3/XssaNE8eJ3AKJLz3YFU/r3WNgoWfZzNIrmmuGpljtn9h8rV+GAo3bGMbdx29
	KYviuMsawqPKAyYFXCsGpfBqrZH1kvQFYe3JCYnv3fr2dO8LGT3rpn0Do3lA4eM4
	87ChLn6dTSnI3XI152kd57jiVysviWV/SnvKougsFdhHEHRQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm74ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 08 Apr 2025 08:58:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5388wsWQ031416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 8 Apr 2025 08:58:54 GMT
Received: from [10.50.45.73] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 01:58:53 -0700
Message-ID: <1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com>
Date: Tue, 8 Apr 2025 14:28:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: update firmware binary for SM8250
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -Ko7ha8pOyIsVMdnUJm_K9UIssD7gylT
X-Proofpoint-ORIG-GUID: -Ko7ha8pOyIsVMdnUJm_K9UIssD7gylT
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f4e54f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qC_FGOx9AAAA:8 a=96fHC12-hSFKV8Dk4UkA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=585 clxscore=1011 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080064

Hello,

Please pull below firmware.

The following changes since commit d864697fd38a94092b636c8030843343f265fe69:

  Merge branch 'rtl-bt' into 'main' (2025-04-01 11:24:40 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-fix-sm8250

for you to fetch changes up to e62b280a2126a30d78f9c8de482e61ddd6a37dbe:

  qcom: update firmware binary for SM8250 (2025-04-08 13:11:21 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: update firmware binary for SM8250

 WHENCE                |   2 +-
 qcom/vpu/vpu20_p4.mbn | Bin 1974884 -> 1985348 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

Thanks,
Dikshita
