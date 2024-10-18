Return-Path: <SRS0=6wfs=RO=quicinc.com=quic_sibis@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6232D3C551
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Oct 2024 07:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7EE5AC4CEC3; Fri, 18 Oct 2024 07:14:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DAE3C4CEC5
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 07:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8DAE3C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HINIcE001599
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 07:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=43a6MprTvv7hribRboHzzm
	ZdyjTTvxoAMpaeTR3yvUg=; b=BSQ+w251WYejOzNJPXyYVgN17q17Atsc8GQLTi
	4/4iwk761JU7UzoSFHbVLYiqIl+M9or7gX/nhOju5FLMEnTvhpTwZKrBsPYQmMNf
	3KKSAciQPmVENGNJksWVa2Kgs55aS9DSbEMMqGj8vjY55paLQ5d6m2alQfGHDm63
	JrZWv3/5BOr2fIOiKGZBcATJAxRXncJCBzCU80snzpgqHX210ggBSTMfQ6gE8G2N
	j1pjpLnwPfYlXSsxyizEcph2HA+YggsfgxzTap+mPmvdK15jvFBMP71uTSI1xDM5
	w2m/ZsQN/nmCMqA11Snew6JJ9GOddQ5HdBQcHGJaWdaZg7KQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ajm5d7qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 07:14:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I7ERXL031833
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 07:14:28 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 00:14:01 -0700
Message-ID: <7f156ffe-9629-17c1-47c5-97e0d0f3e1e0@quicinc.com>
Date: Fri, 18 Oct 2024 12:43:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <abickett@quicinc.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
Subject: qcom: Add Audio firmware for X1E80100 CRD/QCPs
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Gml4EY9VgoCE7ehw4dpO0lqTKY8vAg3j
X-Proofpoint-ORIG-GUID: Gml4EY9VgoCE7ehw4dpO0lqTKY8vAg3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=440
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180044


Hello,

The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:

   Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 
15:40:04 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
adsp-fw-x1e80100-crd

for you to fetch changes up to e1ebc2c9b9956f4115853c9feb07c56957503418:

   qcom: Add Audio firmware for X1E80100 CRD/QCPs (2024-10-18 11:48:47 
+0530)

----------------------------------------------------------------
Sibi Sankar (1):
       qcom: Add Audio firmware for X1E80100 CRD/QCPs

  WHENCE                     |   7 +++++++
  qcom/x1e80100/adsp.mbn     | Bin 0 -> 22235528 bytes
  qcom/x1e80100/adsp_dtb.mbn | Bin 0 -> 73528 bytes
  qcom/x1e80100/adspr.jsn    |  22 ++++++++++++++++++++++
  qcom/x1e80100/adsps.jsn    |  22 ++++++++++++++++++++++
  qcom/x1e80100/adspua.jsn   |  29 +++++++++++++++++++++++++++++
  qcom/x1e80100/battmgr.jsn  |  22 ++++++++++++++++++++++
  7 files changed, 102 insertions(+)
  create mode 100644 qcom/x1e80100/adsp.mbn
  create mode 100644 qcom/x1e80100/adsp_dtb.mbn
  create mode 100644 qcom/x1e80100/adspr.jsn
  create mode 100644 qcom/x1e80100/adsps.jsn
  create mode 100644 qcom/x1e80100/adspua.jsn
  create mode 100644 qcom/x1e80100/battmgr.jsn

Thanks,
Sibi Sankar
