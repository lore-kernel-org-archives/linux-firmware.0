Return-Path: <SRS0=EYJX=R4=quicinc.com=quic_akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C25FE6F06C
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Nov 2024 16:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52749C4CECD; Fri,  1 Nov 2024 16:22:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2947BC4CED2
	for <linux-firmware@kernel.org>; Fri,  1 Nov 2024 16:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2947BC4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A188Lb8027251;
	Fri, 1 Nov 2024 16:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4kCz+e7Y018aQ/6xFAjm+l
	N3qqbB+lamZPAYoWV8E1I=; b=IpC/0eZN19zVRICgcqs2jDWT4dNDyEiXR/mCpz
	vyXTYOjRB4oQ/vJZxkZ5hNOS8cG0cdj73x1RsSU8J74TVkjMUgvIBAqvApUiJmnq
	oX0xW1rXkVz+yULEqV2XAvWcsbKnB1RDZc0c8ChFieR1azDps6dMmPQMaThhljlL
	Atop0HAPnAYmcGCJsG9LwDv39RHZ+VUby/vDxioC3y/KZDYyoord0J0uSLU/zY6x
	FLDmoHYmcPZMAYdKJo24xkX7wcQ+YnL6LsN5f9oRpGjOIiJs2LSqb9JwR4/KJMlc
	xBEhbpe+HZc+KgZQpCMVxP2H1DleLfQ4nrDBm/hqsQTa77jw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42mu7c9hra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 16:22:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1GMrOv002926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 16:22:53 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 09:22:52 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 1 Nov 2024 21:52:24 +0530
Subject: [PATCH] qcom: Add link for QCS6490 GPU firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241101-qcs6490-firmware-v1-1-9bdb81ee3b89@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAD8AJWcC/x3MPQqAMAxA4atIZguNVEWvIg41pprBvxRUEO9uc
 fyG9x6IrMIR2uwB5VOibGsC5hnQ7NeJjYzJUNjCIVo0B8XKNdYE0eXyyoZKHrBuXEWeIGW7cpD
 7X3b9+35dgnaEYgAAAA==
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730478172; l=847;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=OdulRRMv6dJZPFCFrs4PlhFT+2t03iubP42kRuew8/c=;
 b=JrQUjoABo+WvcnqRMxGLi8gnfO8yadr8dsBMPkH+QK6xPEa30dI1UQj5o1anQsNSunB3TPGVf
 uwvdyuH+RYqARQUj53pfj8Bl0OkmGcW/NElO0yyMo+WnsdlqYtywxo8
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ldMXohnrwusTp7xNwGxhG153-730Ve1U
X-Proofpoint-ORIG-GUID: ldMXohnrwusTp7xNwGxhG153-730Ve1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=763 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010119

Create a symlink between qcom/qcm6490/a660_zap.mbn and
qcom/qcs6490/a660_zap.mbn.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index ff5b05f4ed01..ea8c2fc70b1f 100644
--- a/WHENCE
+++ b/WHENCE
@@ -6188,6 +6188,7 @@ File: qcom/sm8250/a650_zap.mbn
 File: qcom/a660_gmu.bin
 File: qcom/a660_sqe.fw
 File: qcom/qcm6490/a660_zap.mbn
+Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
 File: qcom/a702_sqe.fw
 File: qcom/leia_pfp_470.fw
 File: qcom/leia_pm4_470.fw

---
base-commit: 3cdc52d83e478e189669697eb244d48b592d1652
change-id: 20241101-qcs6490-firmware-c5eb17946cac

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>

