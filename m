Return-Path: <SRS0=tLei=VZ=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A10C19F32
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Mar 2025 03:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92579C4CEE7; Thu,  6 Mar 2025 03:31:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7511FC4CED1;
	Thu,  6 Mar 2025 03:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7511FC4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525LVxXN023662;
	Thu, 6 Mar 2025 03:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Nq9c7PXO1mDGf0LFI81Cdd
	LrW+Ql+WnuXDH0QPjGapY=; b=cKbc5dqudX8R2qby3VOzfPCyxbIihpuSPcfknG
	rGaHYezcEuDxKifxTVgnKawVWah2jYFnlrcX4FhgRBHY5F4L2/QCnPPw1ebXJ0Eb
	yJJuhzI+GufA8/Xa0Y662f0LNdNhtRJbcE0hhvbU2Wd+t72w++a4v3ofCdOt3GUh
	tpSuc/CrTJlC3NOulzZsv2jGG9+IIzjwc/0jQt7HTv2wCqL1gs8wf/bLAIGMgaxp
	Segrr857fn0+mJFagnrE9O3LXkGAVvyb0fm9E+vPAvqq34o3EoKjscfI7nR63X4y
	gTAxp4Nz/WX3KI87uQMlMRNx/AyVV1lmTxwMZTarF6T0bNJw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t7n1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 03:31:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5263VKUn022582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 03:31:20 GMT
Received: from [10.133.33.63] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 19:31:19 -0800
Message-ID: <2085b56d-318b-439f-832f-a31113dd07f5@quicinc.com>
Date: Thu, 6 Mar 2025 11:31:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
From: Zijun Hu <quic_zijuhu@quicinc.com>
Subject: [GIT PULL v2] QCA: Add and update Bluetooth firmwares for WCN685x and
 QCA2066
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=I/ufRMgg c=1 sm=1 tr=0 ts=67c91709 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=q-IrZ282f3VL8_vYvi8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 24mXpdDhKez4Ykt2UtNZ8EGRyge1tckq
X-Proofpoint-ORIG-GUID: 24mXpdDhKez4Ykt2UtNZ8EGRyge1tckq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_02,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=899 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060021

Hi linux-firmware maintainers

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 41a528251649772edbcb705a40e617fd14858e53:

  Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw qca_btfw_0305-1

for you to fetch changes up to b011c42ad704a6fe03c38793972e9b48057ed1aa:

  QCA: Add Bluetooth firmwares for QCA2066 with USB transport
(2025-03-06 11:15:39 +0800)

----------------------------------------------------------------
Zijun Hu (4):
      QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00653
      QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00653
      QCA: Add two bluetooth firmware nvm files for QCA2066
      QCA: Add Bluetooth firmwares for QCA2066 with USB transport

