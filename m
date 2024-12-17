Return-Path: <SRS0=E6pF=TK=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A824E7716A
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Dec 2024 06:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36059C4CED6; Tue, 17 Dec 2024 06:10:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60C83C4CED3
	for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 06:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60C83C4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH2weKo015524;
	Tue, 17 Dec 2024 06:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w6dZuvoUCPl4DbuINLIVvp
	4nNatqWLZ1Vo/T89hFqGA=; b=iAx2UpN8yauNdVsZGsVKKTVxaXawleNya+y6cU
	pkeLiRLgWiCJmVIxGv+V7QQL9Tz2HgHHubYzamTRnHqAMFxkQVjAXPTuZ7Sjz82s
	nAWhsrDIvz7z+1f2YOiZdGAbbmtH1jCubDJeGWwraES14JgeoATnPtR8ti4W1EUT
	sOJEegJZXaedeDkfmnCno9q9k4jvfAmCwNGKorCJGeu1vYIbilkPn9VL2UbDic59
	keS5b2mMAEiYLNCtIqptpbuP07347+mf8nmPYmINre8IlCe73UF70qwpJkgkfCMJ
	qMInKOZqonSxTbMJPM9lo6w+p1xKn3RCFQ0Gn2URvwkpfhSQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k1060c34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:10:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH6A2Rr030562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:10:02 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 22:10:01 -0800
Message-ID: <6e0ae91f-7233-ca54-953e-734a71d76e22@quicinc.com>
Date: Tue, 17 Dec 2024 11:39:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: update firmware binary for sc7180 and qcs615
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 176wjNAnSV6a-GTakYeeCXhGzMoOjH9Y
X-Proofpoint-ORIG-GUID: 176wjNAnSV6a-GTakYeeCXhGzMoOjH9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=523
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170048

Hi Josh,

Please pull below change, and as discussed, skipped creating symlink for now.

The following changes since commit d4033141873bbbc79c954dfcea502726ee278c5e:

  Merge branch 'robot/pr-0-1734347915' into 'main' (2024-12-16 12:38:57 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-SC7180-QCS615

for you to fetch changes up to 07479dbb62054d362a206e71c2e4cb52181c81d4:

  qcom: venus-5.4: update firmware binary for sc7180 and qcs615 (2024-12-17
11:36:00 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: venus-5.4: update firmware binary for sc7180 and qcs615

 WHENCE                      |   2 +-
 qcom/venus-5.4/venus.mbn    | Bin 922240 -> 922216 bytes
 qcom/venus-5.4/venus_s6.mbn | Bin 922240 -> 0 bytes
 3 files changed, 1 insertion(+), 1 deletion(-)
 delete mode 100644 qcom/venus-5.4/venus_s6.mbn

Thanks,
Dikshita
