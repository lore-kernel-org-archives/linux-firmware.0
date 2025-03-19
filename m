Return-Path: <SRS0=+zm6=WG=quicinc.com=quic_ekangupt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9562C35FFC
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Mar 2025 15:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B41D4C4CEE8; Wed, 19 Mar 2025 15:40:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C003C4CEE4
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 15:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C003C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JE7mJb026896;
	Wed, 19 Mar 2025 15:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uzV3xvJYRKZyYwwS3nYtn4
	fUG/DpQEWBb+bqmfRsLe0=; b=HWoawr2zNsxHRIOpnfgRYLreqx0i8fUzWc1auT
	DZp2SyQ8L4Mdyp15h+iyfw/3DABmAXcAwj3U+75C0waCZT4qRXs+oqwZqI8zhf/l
	MRnkdQXFsYh79UcOjzSKBSj3vjYUfMftOcO7d+Y32npxee58qu5qLZTOhe6/r4oa
	ujwyK7i+MGycCl9e/qyl+rV985eCW3Fq+pWVcVuIVB3ZgpUKd1gb72MAE+O+V/x1
	DiJShB+w/qfQKxd9YPF41aCE0CEXU6JcF9FsH9MdY0WKN/CKmUJxMoP9MQGM2xek
	5R0IJBH/+17Nj1QiE6ihcE7bgLUjFOELthQSU41QNOH9WrCw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f91t423h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 15:40:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52JFedvV011392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 15:40:39 GMT
Received: from [10.216.33.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Mar
 2025 08:40:37 -0700
Message-ID: <01872bb9-682e-4069-919d-3812c7bf3226@quicinc.com>
Date: Wed, 19 Mar 2025 21:10:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "Bharath Kumar (QUIC)" <quic_bkumar@quicinc.com>,
        "Chenna Kesava Raju
 (QUIC)" <quic_chennak@quicinc.com>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        <dmitry.baryshkov@oss.qualcomm.com>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
Subject: qcom: Add DSP firmware for QCS8300 platform
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Rxh0_DlBhWPKKMaQTVE2FWcHe8Gb_aS-
X-Authority-Analysis: v=2.4 cv=Xrz6OUF9 c=1 sm=1 tr=0 ts=67dae578 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qC_FGOx9AAAA:8 a=_vmhtuJHJGQ_viuv8wUA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: Rxh0_DlBhWPKKMaQTVE2FWcHe8Gb_aS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=481 clxscore=1015 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190106

The following changes since commit 430633ec9398a44575ed86f92e36541d5feebdd6:

  Merge branch 'robot/patch-1-1742367326' into 'main' (2025-03-19 11:10:14 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw-qcs8300

for you to fetch changes up to bd50c4979e4edd2f23b40c9dace8f9c05c807bb0:

  qcom: Add DSP firmware for QCS8300 platform (2025-03-19 21:03:57 +0530)

----------------------------------------------------------------
Ekansh Gupta (1):
      qcom: Add DSP firmware for QCS8300 platform

 WHENCE                  |   9 +++++++++
 qcom/qcs8300/adsp.mbn   | Bin 0 -> 6643712 bytes
 qcom/qcs8300/adspr.jsn  |  22 ++++++++++++++++++++++
 qcom/qcs8300/adspua.jsn |  29 +++++++++++++++++++++++++++++
 qcom/qcs8300/cdsp0.mbn  | Bin 0 -> 3084288 bytes
 qcom/qcs8300/cdspr.jsn  |  22 ++++++++++++++++++++++
 qcom/qcs8300/gpdsp0.mbn | Bin 0 -> 5832704 bytes
 7 files changed, 82 insertions(+)
 create mode 100644 qcom/qcs8300/adsp.mbn
 create mode 100644 qcom/qcs8300/adspr.jsn
 create mode 100644 qcom/qcs8300/adspua.jsn
 create mode 100644 qcom/qcs8300/cdsp0.mbn
 create mode 100644 qcom/qcs8300/cdspr.jsn
 create mode 100644 qcom/qcs8300/gpdsp0.mbn

