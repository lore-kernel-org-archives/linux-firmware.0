Return-Path: <SRS0=/0NN=QP=quicinc.com=quic_akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F674CAC5A2
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Sep 2024 21:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A0BAC4CECE; Tue, 17 Sep 2024 21:03:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54305C4CEC5
	for <linux-firmware@kernel.org>; Tue, 17 Sep 2024 21:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54305C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HJhXJb007900;
	Tue, 17 Sep 2024 21:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=xbP/3dC44ccvd3dBnrG7OAbepRGPIGeEwWVGA3y9dJU=; b=V4
	PcKwuuuWL8+d2QY2UQFHY+0Xxzg9eFNir7w5fUA+TlofPaH1XwBUZKIM/a2j4mgE
	1cxoe4sTEe8NgUMq7GdzUrncwkQVp+8kO/f6+MdNIh98//PbQxAUtwWOo5ThEU37
	qAPz2BhXpk4Y/HYBkYcnufi4+bnLB4s4GtNB0/ZDfVdS/5DjXq+b7CaGBjViJydH
	7tJF1p2qYlyiSn1DWt/s1sjjVXpDk1QgF/8Gpfc91JB1Ja5VHWSG5DEXfSw2L3z9
	KoKWczpW7fpog1+RWsHZ7VvfZ29oPbWHXEC+jDv9zHgIo1nNX9mDPkSu9g8LWKc/
	JcczjDpJLIjuL+CKUUYA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hf01m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 21:03:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48HL3RIG010354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 21:03:27 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Sep 2024 14:03:26 -0700
Date: Wed, 18 Sep 2024 02:33:23 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <dmitry.baryshkov@linaro.org>
Subject: qcom: add gpu firmwares for sa8775p chipset
Message-ID: <20240917210323.tkzmi53qbm7jse4n@hu-akhilpo-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: t4WrHRdUSbeHv7_eUPHUExKa0S6XBN4-
X-Proofpoint-GUID: t4WrHRdUSbeHv7_eUPHUExKa0S6XBN4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 mlxlogscore=314 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409170149

Hi,

The following changes since commit 6c88d9b8253b8ec6df701a551a56438ea2e5bacf:

  Merge branch 'amd-staging' into 'main' (2024-09-13 20:28:50 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-SA8775p

for you to fetch changes up to 43c971bcd74d9793140a8fbbcc805204cb797f96:

  qcom: add gpu firmwares for sa8775p chipset (2024-09-17 11:57:51 +0530)

----------------------------------------------------------------
Akhil P Oommen (1):
      qcom: add gpu firmwares for sa8775p chipset

 WHENCE                    |   2 ++
 qcom/a663_gmu.bin         | Bin 0 -> 55892 bytes
 qcom/sa8775p/a663_zap.mbn | Bin 0 -> 1054680 bytes
 3 files changed, 2 insertions(+)
 create mode 100644 qcom/a663_gmu.bin
 create mode 100644 qcom/sa8775p/a663_zap.mbn

 regards,
 Akhil
