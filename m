Return-Path: <SRS0=sdSI=SI=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5DBD42BB1
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 04:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41F5BC4CED2; Wed, 13 Nov 2024 04:25:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBB5EC4CECF
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 04:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EBB5EC4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD34801030379
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 04:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+xXUhSzaGK4Shj4Ini1HKZ
	CSGgLQBr0Px5pCD5MfvGI=; b=SNHsayf+hCT09qwAnFWmsYaRfK48D+aknYaCxI
	da6Dcrymhw7iOMH6oORn9vrZS2LIvuYNh0RpqJRli5hFuNKiICMVjsbAWcnqQv6q
	j4qQgSOPhYxjpSXXSJ4IpLxmZNqXTkd3wWCQDLThItFJsOfDHxtwgMoiM9qkGvEM
	dm0LDSUTW8xk437E1TCBPrwQznlpdM5rJN+p+v3UNJmKgEVHyafTpI7Zj+ZwseKm
	k+i4w/qPT5tpx0O+9Mibu6afQeS2RTIzBk7HwzcKe/My6BDqkYygvQefk/+mmX/0
	hY/otvb60OqQfm28jfzUO1H1JEMNvuENLf7DMEBTVAgfIZNA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vkvr85r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 04:24:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD4Ove2008070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 04:24:57 GMT
Received: from [10.50.46.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 20:24:55 -0800
Message-ID: <6353f092-9816-8221-1233-c423767320ac@quicinc.com>
Date: Wed, 13 Nov 2024 09:54:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: update venus firmware file for SC7280
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iAhynfPmR1FEwjPdHd2-uG72qEn8HAiv
X-Proofpoint-GUID: iAhynfPmR1FEwjPdHd2-uG72qEn8HAiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=606 priorityscore=1501
 bulkscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130037

Hello,

The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:

  Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-update-SC7280

for you to fetch changes up to e95e9e07a7983f9e0e12fe9a6c185cf5b07fe2f8:

  qcom: update venus firmware file for SC7280 (2024-11-13 09:48:13 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: update venus firmware file for SC7280

 qcom/vpu/vpu20_p1.mbn | Bin 2031620 -> 2026452 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

Thanks,
Dikshita

