Return-Path: <SRS0=CoZN=XS=quicinc.com=quic_akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE389C3ABAC
	for <linux-firmware@archiver.kernel.org>; Fri,  2 May 2025 15:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94AF2C4CEEE; Fri,  2 May 2025 15:09:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67841C4CEE4
	for <linux-firmware@kernel.org>; Fri,  2 May 2025 15:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67841C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DQwSw015327
	for <linux-firmware@kernel.org>; Fri, 2 May 2025 15:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=StlYATd0yznIfpI6hORvhl
	0ZrXTzhMo6XPrxManJE64=; b=kVvXgKCoXVpW1TS5Q+49RW1AxaMlhmye6JYAI0
	kI4pUZD0Af4mPryzNsIoVFOKnbudZgTeubtLMGXlz0GgyMiTLPVFUuB9i5IJ1C4X
	1OA+6R/y2Uq9GtanCuwc1dNUirHwMHm+sfQ94TYnn3o4jrr4m7RZq3XQil0OdKiJ
	U0do8CHJevXMIlWNRElvI6PaXOsYwiAedsElHdhE/xjrD4kOmUgJS/I4/nLUcPJE
	E2FaSTlrMjRW6nPHYQ6GDxFMwrNUDK7saqUfmD9axuw7t4+yIXQV7Fkg28B8nn20
	vossiEfF20fADL9RBMNtIbZQqwz3xRuH9CvkVbmRYB9sX3KQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub0m4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 02 May 2025 15:09:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542F9cms005965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 2 May 2025 15:09:38 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 2 May 2025 08:09:36 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH] qcom: Add link for SM8350 GPU firmware
Date: Fri, 2 May 2025 20:38:38 +0530
Message-ID: <20250502150913.1886723-1-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6547nqFUoIO3R-BCA60vBvIJBXTioTrq
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6814e032 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=k3x2GG8G_MvjncRea_wA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6547nqFUoIO3R-BCA60vBvIJBXTioTrq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEyMCBTYWx0ZWRfX8v0faMD6mlt4 UHqfqiSekAyy8XfjRwgh2MaKpTgZq7N6ykaJxrPG9nURuY3rGttYo1mZJOPFBdmACIQicb7RJfn EB6LO6u3n0F+NBCry/F5IaFNv1gmoPdjFauEacoe1kBcRjqrbpWuXlBd2EUUAr0WpQ0L+uBsl2f
 o2RAS3RNzya4Dtd+ciQFC8HYIaRDTPlT4mcK0Nq3G0R5OqPrl6HyN86W1ygEigE1AQDE2wvDRVO 4/75MFWyw6v/HpNBJbAqgbbxuOTmvVD3GCuLafkI21yYj4WAZ/4uJt3nz6cmfa4ABEzJdp5deiw FesgTfQ8Q8gG2AvBD3KQ7OJhDhpnCrwfYdcymKbVwrY1HFt9gm7OmhDLLLGLgzPPbtgrMmfKjsU
 xwkJYNsSGC2MNs27upMGZMds5SnNUuby0+DmvhPBQ6RIQJt8GJc0ThRR8T6XhKok5iqSmmk+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=741 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020120

Create a symlink between qcom/qcm6490/a660_zap.mbn and
qcom/sm8350/a660_zap.mbn.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 6f715d8a905d..d17b2c41174d 100644
--- a/WHENCE
+++ b/WHENCE
@@ -6468,6 +6468,7 @@ File: qcom/a660_gmu.bin
 File: qcom/a660_sqe.fw
 File: qcom/qcm6490/a660_zap.mbn
 Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
+Link: qcom/sm8350/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
 File: qcom/a702_sqe.fw
 File: qcom/leia_pfp_470.fw
 File: qcom/leia_pm4_470.fw
-- 
2.48.1

