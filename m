Return-Path: <SRS0=5XD9=ZK=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B616DC77B7F
	for <linux-firmware@archiver.kernel.org>; Fri, 27 Jun 2025 11:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76AE8C4CEEB; Fri, 27 Jun 2025 11:29:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77371C4CEE3
	for <linux-firmware@kernel.org>; Fri, 27 Jun 2025 11:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 77371C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DDcb009844
	for <linux-firmware@kernel.org>; Fri, 27 Jun 2025 11:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wHROaY2aenK6gUB5HB9IE1
	1idFu6/COUZgf8Z0QhRio=; b=UIQymeimRt0pZZO+1+BWRuWiNb6VJGB4ZI4xdj
	G2VCZpDgktxOkMKfFvt7qnbSxrc4X+GRycr/NNtEniaTT+UbqM8Dqotw93uodvOb
	3xPNhLxX9tf6B50UCyRGkl2sYzfGJ4pn3FNxaL5GD8CBCxj4gCQtdPA/Tg7ZgOQS
	8tX9IcNA7CCQdv4EmC0k/KDqRUph0lk5OdAgkCBhbTh/hAFwEodKIdVdmxIHGhKx
	2uaIX5bXBS39DV0oE3ytP2+RwM89RmrVK/vnYVkJLP9IeVZYVrlU/C3XeD9KYu0Z
	PEfDhYZAi0r2V9/uAoCvmkAyUebk0WP7bZjA90BRSY+fLkgg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fgcfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 27 Jun 2025 11:29:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RBTZ9b017342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 27 Jun 2025 11:29:36 GMT
Received: from [10.50.47.15] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 27 Jun
 2025 04:29:35 -0700
Message-ID: <ac8e04be-8354-ac81-307a-be95211ff32a@quicinc.com>
Date: Fri, 27 Jun 2025 16:59:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: update firmware binary for SM8550
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA5NCBTYWx0ZWRfXwlqxgaWjkrkw
 yM2jXaUS2tR+7QUWIG9ykbuec0r2Oknh3DjjxbnpP2VLZuw3giV1U8MEKU1MqDA4GF6gNish0Cq
 NCWMI8A3IXzKlRzTjwn4bTYsA1VkkcH4QmybDrFQyVWgOa6oO943c9i6zihCj6S63or3i38/HNE
 aexEEJqrkCqLZc0lIkN8sNXhL2DjppMbIinNejY0ZAxK5swRQi6blVndl9n4fkZOanxwQvm5+Cy
 fuK07OQzdttjMWzXHcS/niBWQ4fwGiQ4noKPVECrWGzhADAf7gzulrZYnJoxZLd032/qSZmbj63
 27tLLNCJHukHaYEsTT1250DJE+fmJqVRGJ6GhUdIGsAg9GpvCz5c49kZaIi8NlAflJYeHTeSNDt
 myY9l/yP91pUHKMCYyorLa/hVJBIZXoFfY0hsRhR8s37t9IwfszAT8XXSOxg34TGg4Ew2y2W
X-Proofpoint-ORIG-GUID: zo2Fk6gy42BXi4BHl_zmxRfB-zNi6m6f
X-Proofpoint-GUID: zo2Fk6gy42BXi4BHl_zmxRfB-zNi6m6f
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685e80a1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8
 a=GHKcT7S6Aweq4HWiYBUA:9 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=662
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270094

Hi,

The following changes since commit b27862c732f56f6c47940be08296c58df06e43cc:

  Merge branch 'amd-staging' into 'main' (2025-06-27 02:05:56 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-fix-sm8550

for you to fetch changes up to ebbcfe361cbf40149b463255d950afba43d45a3b:

  qcom: update firmware binary for SM8550 (2025-06-27 15:03:31 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: update firmware binary for SM8550

 WHENCE                |   2 +-
 qcom/vpu/vpu30_p4.mbn | Bin 2306664 -> 2318952 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)


Thanks,
Dikshita
