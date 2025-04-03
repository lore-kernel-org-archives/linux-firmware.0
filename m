Return-Path: <SRS0=4jY3=WV=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDFEC3600C
	for <linux-firmware@archiver.kernel.org>; Thu,  3 Apr 2025 09:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16AA3C4CEE3; Thu,  3 Apr 2025 09:41:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA8D4C4CEE8;
	Thu,  3 Apr 2025 09:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA8D4C4CEE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5338FNuv025013;
	Thu, 3 Apr 2025 09:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q7zUmTyrTtx425qKb8ad3i
	aoDBWiT120+gCVfP6VMBk=; b=hpPn94ij+xN6P1xzietHwUROuJaEY9ZduyH2TO
	JwcIe1HyYQDFXfZiaXhva8camRxGDYLGZrYquvIDy6UihCSxN35pSnlh4ZvwVaAk
	ZkV1sD3PblFw7NVTtGlRspqZA/d1j6ZnNMbLmW7j8r8ujhDYhhmTJEu71a6KUaVE
	bYcwjNkPoBQ0FdXMgBADKwQzT/lVfZiXB8f08BKrfFjXx0fNVkeKv8MnItSmANDh
	VIxff1KzL2Ax6t6VhXkH5Wce8lx4I8ZhDyX0uCQamHVvXar4onbVyxkrHyW/jD3c
	vnZxQxmtFkRMbdv/LvGIaMng1Ts7ijZwFKaaTbyP+ooc06ew==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45spnp084b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 09:41:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5339fRb1002158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Apr 2025 09:41:27 GMT
Received: from [10.133.33.118] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 3 Apr 2025
 02:41:14 -0700
Message-ID: <882c9f31-96a2-4057-aab1-5d39df3f20b7@quicinc.com>
Date: Thu, 3 Apr 2025 17:41:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: <dmitry.baryshkov@oss.qualcomm.com>, <agurenko@protonmail.com>
From: Zijun Hu <quic_zijuhu@quicinc.com>
Subject: [GIT PULL] QCA: Add and update Bluetooth firmwares for WCN785x with
 USB interface
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N1NuEwQt3rLU8zNrtZAKQc0kl1yOpoU3
X-Authority-Analysis: v=2.4 cv=N/gpF39B c=1 sm=1 tr=0 ts=67ee57c8 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=q-IrZ282f3VL8_vYvi8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: N1NuEwQt3rLU8zNrtZAKQc0kl1yOpoU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_04,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=839
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030034

Hi linux-firmware maintainers

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 41a528251649772edbcb705a40e617fd14858e53:

  Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw hmt_usb_x86_0403

for you to fetch changes up to b12240420adec3089fa0bb5a09eaa0cefbd8ce76:

  QCA: Add 8 bluetooth nvm files for WCN785x btusb (2025-04-03 17:18:24
+0800)

----------------------------------------------------------------
Zijun Hu (2):
      QCA: Update WCN785x btusb firmware to 2.0.0-00790-3
      QCA: Add 8 bluetooth nvm files for WCN785x btusb

