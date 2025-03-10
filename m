Return-Path: <SRS0=8Nga=V5=quicinc.com=quic_akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F064EC28B30
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Mar 2025 21:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C019EC4CEF0; Mon, 10 Mar 2025 21:31:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D109CC4CEE5
	for <linux-firmware@kernel.org>; Mon, 10 Mar 2025 21:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D109CC4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AKJdw8029281;
	Mon, 10 Mar 2025 21:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d1+PpruXB87sClZpkM9XisfbGHbuQAQ4U/veDgZDetA=; b=KQipg41JaKhUC0Wg
	LvUjAuCAEl9EM2/s/ipBXeqKBX1YfbdnAJ/QEfNWfokLMxB51jTFk8mhmB4KLU2m
	p1veG8VwUoNmnb6J4IgH24Q6W0ifdq2q7NLLTKHw/X3rz4Qc4IrQmZXiwfkJHp8x
	py9wIcv8kCenLdSLLD+u7ooMrUxCMy34KCe83oZG99JQMhDXlYY7kTcRqZRTEGbY
	f3thohgxknsUIMSwigHPjmAycVzbyGHspA9ztSFUhmEzrjFhfk7eSX4/f0j+qv6+
	xP0xq/ayCdrzwmHsCihNI+8T+81tvhIAqPAlZBooIGP5G/ESQdbeELM/PnHvL3uc
	GNOLOA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f6ae9gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 21:31:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52ALVZUf018337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 21:31:35 GMT
Received: from [10.216.23.206] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Mar
 2025 14:31:33 -0700
Message-ID: <fe88e76a-0f6a-4d21-b3b5-bf5d76b1f872@quicinc.com>
Date: Tue, 11 Mar 2025 03:01:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [RESEND] qcom: Update gpu firmwares for QCS8300 chipset
Content-Language: en-US
References: <3c83ecf5-2536-4fe5-bf01-08d6f9d12d82@quicinc.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3c83ecf5-2536-4fe5-bf01-08d6f9d12d82@quicinc.com>
X-Forwarded-Message-Id: <3c83ecf5-2536-4fe5-bf01-08d6f9d12d82@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WsDRMcfv c=1 sm=1 tr=0 ts=67cf5a37 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qC_FGOx9AAAA:8 a=_idI4Ui2MrMa44MylkoA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: lHl1i5n0ALusenxhYpyyed_RQj5ePjbE
X-Proofpoint-ORIG-GUID: lHl1i5n0ALusenxhYpyyed_RQj5ePjbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=516 clxscore=1011
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100163

Hi,

Add/update the gpu firmwares required for Qualcomm's QCS8300 chipset.

-Akhil

---
The following changes since commit 11c4e60f95736ebd7fd98be5f54287d204c71bfd:

  Merge branch 'amd-staging' into 'main' (2025-03-10 17:46:53 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCS8300

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
