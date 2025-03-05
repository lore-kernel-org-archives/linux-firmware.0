Return-Path: <SRS0=y7OR=VY=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72544C19F32
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Mar 2025 11:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3074EC4CEE2; Wed,  5 Mar 2025 11:02:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F7E9C4CEE8;
	Wed,  5 Mar 2025 11:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F7E9C4CEE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NAAtN025311;
	Wed, 5 Mar 2025 11:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=akXIZR4E7Rh622zu5dnu+F
	YFH2BmiFbn9LrOZ4Ek9Rg=; b=I7QlN5T3alhuX0UkMSmtLBPv20kREFPGJCF1jk
	mphwQng45m7XoSa5qCc83rZz4Zb4JSqh1JM1IshoqnOlLFW9gk1YO5OMNx5tcEKg
	rANMRhK7HDQkWp35rCsG+BM/dLjt1DsXfiFFxjesjVuX+8PkI8AUhYiJbHHYvDZh
	XOpwkN1MoGmJOtGrFXWu5tx4+ZSihQtzE6sDZAGEq49DX5SicxjFXy1oQ0dr9+Qr
	Ztg6pWCkSgUzhDGsfC9fgHFa1sYiVILyhkec/W/kaRBCHH8KUu9LHfGtr5P7QrOA
	zU2b7FOQro94520sheW9a68xczA28ekJObXhsyNE1trZsuDA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p9352ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 11:02:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525B2f9I003917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 11:02:41 GMT
Received: from [10.133.33.51] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 03:02:40 -0800
Message-ID: <01571886-3cfe-4aa7-baf7-d474ba093b6c@quicinc.com>
Date: Wed, 5 Mar 2025 19:02:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
From: Zijun Hu <quic_zijuhu@quicinc.com>
Subject: [GIT PULL] QCA: Add and update Bluetooth firmwares for WCN685x and
 QCA2066
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Me2Wu4/f c=1 sm=1 tr=0 ts=67c82f52 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=q-IrZ282f3VL8_vYvi8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: y5xRp75vtH9sR___T_Ze_wM4yJFb-xYG
X-Proofpoint-ORIG-GUID: y5xRp75vtH9sR___T_Ze_wM4yJFb-xYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=900 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050089

Hi linux-firmware maintainers

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 41a528251649772edbcb705a40e617fd14858e53:

  Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw qca_btfw_0305

for you to fetch changes up to 16906ee494a2c7c26477c29deaf1349b4c1751ed:

  QCA: Add Bluetooth firmwares for QCA2066 with USB transport
(2025-03-05 18:16:33 +0800)

----------------------------------------------------------------
Zijun Hu (4):
      QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00653
      QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00653
      QCA: Add two bluetooth firmware nvm files for QCA2066
      QCA: Add Bluetooth firmwares for QCA2066 with USB transport

