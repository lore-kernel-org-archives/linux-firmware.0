Return-Path: <SRS0=doEP=QY=quicinc.com=quic_akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84BCCDE015
	for <linux-firmware@archiver.kernel.org>; Thu, 26 Sep 2024 15:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8BC0FC4CEC6; Thu, 26 Sep 2024 15:37:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 458B1C4CEC5
	for <linux-firmware@kernel.org>; Thu, 26 Sep 2024 15:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 458B1C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48QEoN19005925;
	Thu, 26 Sep 2024 15:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=RdjI8UXy6ytGAC2Ybs0pYmRMOGab7APjoODvIZ6XuHk=; b=Wj
	y2vGEZOreKLHRVS3y1tckTB7LdACBSZF1J1jWPfJRJcBX+6/C9tTMj+bK6SLEwRR
	DzlgE+OYAMHpQyynAkvmrh3ddG41V2OV0pU8LNcTkfG4CKJnHFyUxxBKJ6rdNVyT
	276UTcrQplBv1CBZOJr5043bPiwYrl11M5Rt2cjXhNQBE8wAXC2NNZBpCqW8RDcX
	nhV4NxfVX0+IofvGP97CP0BBAmU88ohYAmksqjuGa0E0bfJJem84trideoKSkZss
	77cH+ZU1+XT88128YJlRi+objJAPqcOy2CfmYq/DS2JLSEDpysOt0Cs83s1NoqIW
	LgCwB3NxW5+yvXwwYahA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe9fuqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 15:37:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48QFb5gm016277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 15:37:05 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Sep 2024 08:37:04 -0700
Date: Thu, 26 Sep 2024 21:07:01 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <dmitry.baryshkov@linaro.org>
Subject: qcom: update gpu firmwares for qcm6490 chipset
Message-ID: <20240926153701.ymwkxr64x65b7euq@hu-akhilpo-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aoBGWCxPNNkwj7d1_xmNHCILTfdBHx3M
X-Proofpoint-GUID: aoBGWCxPNNkwj7d1_xmNHCILTfdBHx3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=321 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260108

Hi,

Add/update the gpu firmwares required for Qualcomm's QCM6490 chipset.

-Akhil

---
The following changes since commit 8306534b8a7265bee2f4323b45fd2a22a7c8b9b6:

  Merge branch '8922a' into 'main' (2024-09-23 12:36:21 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCM6490

for you to fetch changes up to 2aded3b604ae42d3f6b1c5a5873db021ec4e4207:

  qcom: update gpu firmwares for qcm6490 chipset (2024-09-26 20:47:08 +0530)

----------------------------------------------------------------
Akhil P Oommen (1):
      qcom: update gpu firmwares for qcm6490 chipset

 WHENCE                    |   1 +
 qcom/a660_gmu.bin         | Bin 55444 -> 55252 bytes
 qcom/a660_sqe.fw          | Bin 40496 -> 43292 bytes
 qcom/qcm6490/a660_zap.mbn | Bin 0 -> 1054648 bytes
 4 files changed, 1 insertion(+)
 create mode 100644 qcom/qcm6490/a660_zap.mbn
