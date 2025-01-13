Return-Path: <SRS0=egra=UF=quicinc.com=quic_vivesahu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18750E7719F
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Jan 2025 12:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DDA5CC4CEDD; Mon, 13 Jan 2025 12:49:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEA8CC4CED6
	for <linux-firmware@kernel.org>; Mon, 13 Jan 2025 12:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EEA8CC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D7MaXe019769;
	Mon, 13 Jan 2025 12:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HBtAR0wHIPU+4ggaQqSzmH
	V2hwV0RwZRmltJiKagws8=; b=ICMykcKX+58fXYY8/G800RFuMdv3ci2PUcuJDc
	RitxheamgqCHQG5v+cDIjTI58imOAhpJa/VZ6dSGOJ5zLg/nEUYbSSzT0Xt746lY
	Bs8OxvjsL/BEasUSvFzXAJgg3TWvFUVXdIB4KxuC1YTfMFejT8S8vfhWeqYZYLTh
	5iKGnmvxB5fJzI7VlTZayx0NVz9IBXQNWyaf+ZFNneb2YW1fB6D/BdHi12h1EVaR
	1BwokwQ9OMakmI4ZtXMTAe1SFAMpgMltUAxgDl464caKTbf3a61S4BSfzTccTsLK
	61J3YjQYuQmmE/UKL4x9JLV8m8SSYPymFfmtccGIAGDpeuHg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444xcxs50n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:49:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DCnIca011477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:49:18 GMT
Received: from [10.218.12.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 04:49:17 -0800
Message-ID: <57fe5525-8383-4737-ba60-6c9c0c6997f0@quicinc.com>
Date: Mon, 13 Jan 2025 18:19:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <quic_janathot@quicin.com>
From: Vivek Sahu <quic_vivesahu@quicinc.com>
Subject: QCA: Update firmware files for BT chip WCN6856
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TxM5uD8ULBeKtHTDI5va_4UFnw7ciy01
X-Proofpoint-GUID: TxM5uD8ULBeKtHTDI5va_4UFnw7ciy01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=925
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130107

Hi Team,

Please include firmware bins for WCN6856.

Major contributions : Bug Fixes/Stability.

Snapshot of pull request is as below, let me know if anything is missing.

--------------------------------------------------------------------
The following changes since commit 
ff68bad967033e2973d3a82e5b160813b1d43488:

   qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650 
(2025-01-10 16:33:04 +0530)

are available in the Git repository at:

https://github.com/vivesahu-qcom/bt_hsp_fw.git for/master

for you to fetch changes up to ff68bad967033e2973d3a82e5b160813b1d43488:

   qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650 
(2025-01-10 16:33:04 +0530)

----------------------------------------------------------------


Thanks and regards,

Vivek K Sahu

