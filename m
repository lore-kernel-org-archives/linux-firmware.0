Return-Path: <SRS0=CjIC=QO=quicinc.com=quic_akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8D2C3ABCB
	for <linux-firmware@archiver.kernel.org>; Mon, 16 Sep 2024 22:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68C76C4CEC5; Mon, 16 Sep 2024 22:05:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD5F0C4CEC4
	for <linux-firmware@kernel.org>; Mon, 16 Sep 2024 22:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD5F0C4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GE2Gx8026476
	for <linux-firmware@kernel.org>; Mon, 16 Sep 2024 22:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1mIF8RvEdEc88KlRSsWpLU
	e4kV4DGIGPo53sRqekfBQ=; b=TzDjO77xIA6C5PCpwWxrCTvi9ZWxpTOQWivP2T
	FUnf3SXpnrPo5aK2CjldwoYtOwKV+yHZ10i1iJVCZmOdkxQ7gHR2K7ByUooo1MZM
	gNRzh87fiTSa4IHKYtHr6tEEMy2VSadFoeiANW/mhb0+CmxctGJCugkUuIzrxnlQ
	+UgO7qh7RjD/m33AbIVtb+BVPWpm2lqlvZ8UaDdoDli6dDg9/QI8azr5Wq6sIfoR
	J3BQLCcp+Eu/lYaxZBWmoGlWEBoBJLaFaC1rkr4u7laVa8+sH4gsKXjc4694R7cj
	S7AG01BAbzSnppeZ9y9S3ENAGThhvzTpQxlQY6dUEAdP6Rdw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4kjd9e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 16 Sep 2024 22:05:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48GM5QEG007508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 16 Sep 2024 22:05:26 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Sep 2024 15:05:24 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <quic_rajeshk@quicinc.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH] qcom: add gpu firmwares for sa8775p chipset
Date: Tue, 17 Sep 2024 03:33:16 +0530
Message-ID: <20240916220450.357752-1-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ae-C7bfhtAYAeELwO83mP-toqFmJ96AB
X-Proofpoint-ORIG-GUID: ae-C7bfhtAYAeELwO83mP-toqFmJ96AB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=863 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409160149

Add the following gpu related firmwares for SA8775P chipset:

qcom/a663_gmu.bin: v3.05.01
qcom/sa8775p/a663_zap.mbn: v0.09

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 WHENCE                    |   2 ++
 qcom/a663_gmu.bin         | Bin 0 -> 55892 bytes
 qcom/sa8775p/a663_zap.mbn | Bin 0 -> 1054680 bytes
 3 files changed, 2 insertions(+)
 create mode 100644 qcom/a663_gmu.bin
 create mode 100644 qcom/sa8775p/a663_zap.mbn

diff --git a/WHENCE b/WHENCE
index 3897121a115e..21b708f77e14 100644
--- a/WHENCE
+++ b/WHENCE
@@ -6081,6 +6081,8 @@ File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
 File: qcom/gen70500_gmu.bin
 File: qcom/gen70500_sqe.fw
 File: qcom/x1e80100/gen70500_zap.mbn
+File: qcom/a663_gmu.bin
+File: qcom/sa8775p/a663_zap.mbn
 
 Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
 
diff --git a/qcom/a663_gmu.bin b/qcom/a663_gmu.bin
new file mode 100644
index 0000000000000000000000000000000000000000..e95181528c61624c1893bfe177e4cf291b4757c2
GIT binary patch
literal 55892
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

literal 0
HcmV?d00001

diff --git a/qcom/sa8775p/a663_zap.mbn b/qcom/sa8775p/a663_zap.mbn
new file mode 100644
index 0000000000000000000000000000000000000000..e7677f894625e5ef57b6f3c1afc35ce644d4b1c1
GIT binary patch
literal 1054680
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
z0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+
z009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBly
zK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF
z5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk
z1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs
z0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZ
zfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&U
zAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C7
z2oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N
z0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+
z009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBly
zK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF
z5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk
z1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs
z0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZ
zfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&U
zAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C7
z2oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N
z0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+
z009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBly
zK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF
z5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk
z1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs
z0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZ
zfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&U
zAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C7
z2oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N
z0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+
z009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBly
zK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF
z5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk
z1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs
z0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZ
zfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&U
zAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C7
z2oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N
z0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+
z009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBly
zK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF
z5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk
z1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs
z0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZ
zfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&U
zAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C7
z2oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N
z0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+
z009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBly
zK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF
z5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk
z1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs
z0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZ
zfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&U
zAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C7
z2oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N
z0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+
z009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBly
zK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF
z5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk
z1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs
z0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZ
zfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&U
zAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C7
z2oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N
z0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+
z009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBly
zK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF
z5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk
z1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs
z0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZ
zfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&U
zAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C7
z2oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N
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
QhqCy4bltl4*gogq14apR?EnA(

literal 0
HcmV?d00001

-- 
2.45.2

