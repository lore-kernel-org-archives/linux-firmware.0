Return-Path: <SRS0=EYJX=R4=quicinc.com=quic_akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32B5E6F06D
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Nov 2024 16:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB9E2C4CED1; Fri,  1 Nov 2024 16:10:01 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D931C4CECD
	for <linux-firmware@kernel.org>; Fri,  1 Nov 2024 16:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D931C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1CUscf002298;
	Fri, 1 Nov 2024 16:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=jtfu9zqwxeQ+fq/jBDjUDIyY1OYZn3KnNQB3DGkcJt8=; b=g4
	MFlN08H8h/u6BKDhc+iFInPFCrZf5SAcE2NNef8+YylxfvOnSQ18rAS22/O1rHMZ
	fGGXKtu/KZ4xGV4XakN03db35GwBwSVN+3Qjxc1q7UJZGLxNGKwyY/4ZRgE8TXz+
	7bk8orWJR3ayZKBQtcLcexPmRqJKQ1wl2OSfjFJ0ouxhV2SOR82frFCIUDOUikGs
	JSbWJ7rAOv+imMs7Vkn5nn80WYeFqLmkbxy8gd9I2PNxHz/Dwg6Awreu4rlDVHRK
	1xN4WUkfWu3Z7ujKuqWPGST0J8dvd3jRauFrfCt2HD25wC60Mjq3zGun+1ppX+kp
	ChUVzCYMHvfwWNJTRvPA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmn5fv12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 16:09:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1G9wpw027471
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 16:09:58 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 1 Nov 2024 09:09:56 -0700
Date: Fri, 1 Nov 2024 21:39:53 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <dmitry.baryshkov@linaro.org>
Subject: qcom: update gpu firmwares for QCS615 chipset
Message-ID: <20241101160953.6yxes4h37ip34kj5@hu-akhilpo-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZbhP3F5dC21p8CdV2CXY1H_WlivVvjpZ
X-Proofpoint-GUID: ZbhP3F5dC21p8CdV2CXY1H_WlivVvjpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=248
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010117

Hi,

Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.

-Akhil

---
The following changes since commit 3cdc52d83e478e189669697eb244d48b592d1652:

  Merge branch 'robot/pr-0-1730397728' into 'main' (2024-10-31 18:19:48 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCS615

for you to fetch changes up to f4f5689fe58fe324193bf4fa014496b0ff062f87:

  qcom: update gpu firmwares for qcs615 chipset (2024-11-01 20:50:54 +0530)

----------------------------------------------------------------
Akhil P Oommen (1):
      qcom: update gpu firmwares for qcs615 chipset

 WHENCE                   |   1 +
 qcom/qcs615/a612_zap.mbn | Bin 0 -> 14256 bytes
 2 files changed, 1 insertion(+)
 create mode 100644 qcom/qcs615/a612_zap.mbn
