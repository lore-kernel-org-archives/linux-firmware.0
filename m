Return-Path: <SRS0=dPk2=IE=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6FEC3DA6E
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Dec 2023 08:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 540CDC433C9; Mon, 25 Dec 2023 08:34:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 480CFC433C8
	for <linux-firmware@kernel.org>; Mon, 25 Dec 2023 08:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 480CFC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BP8QpQN006021
	for <linux-firmware@kernel.org>; Mon, 25 Dec 2023 08:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:to:from:subject:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=9Bjv2lo/zX2nmgZF2Ial
	Kz5AGq1RrPiubc0N1LEiLgM=; b=ZxaLB1P4j3wovCb4BQ6aXa9ZYRK6FJp4X/SL
	/UGhw44LA8nWxVgrPIw1C0MxGzZCiHUUCqMmlaw2SmZfWr6SiTxmratTwHaZrXWn
	5uGya0VdzZResYZlUaIZwGMi+JyxaMOpDLcHBBgoern7Et2nHBGKQ9Ykxo9sfxYw
	2jTN609ddaWcieij6X9+22+qrmy/QeRv/CIHKtIgps7DxNUl22DiI9zQyek7xCjs
	an9dN7wpTyXWOTnrSKKzHBt9ytBSuM9wh2cnU23xeTVhA9Xh/e4srFFeYWSfPhp1
	FrB4voMDbSFTH1wlrA11xmOVcz/bCQqmckq/YKgtFbVO8ZNi3A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v5pjbka2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 25 Dec 2023 08:34:22 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BP8YLaG026837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 25 Dec 2023 08:34:21 GMT
Received: from [10.253.76.212] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 25 Dec
 2023 00:34:20 -0800
Message-ID: <02a60c43-9077-4387-934d-71885ead1eeb@quicinc.com>
Date: Mon, 25 Dec 2023 16:33:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
From: quic_zijuhu <quic_zijuhu@quicinc.com>
Subject: Update QCA2066 Bluetooth firmware to 2.1.0-00629 request-pull
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Cyla4B_T1E-huVhA7X--HaEZmieJaYcx
X-Proofpoint-ORIG-GUID: Cyla4B_T1E-huVhA7X--HaEZmieJaYcx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=591 mlxscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312250064

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.

The following changes since commit c156e6be6d4a0a2290e7059bc74fb0612aa19693:

  Merge branch 'robot/pr-0-1702625169' into 'main' (2023-12-15 12:16:57 +0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw

for you to fetch changes up to adb26935b5440c5f4cdb6d3f174c4fdf59b56fef:

  QCA: Add bluetooth firmware nvm files for QCA2066 (2023-12-18 15:01:25 +0800)

----------------------------------------------------------------
Zijun Hu (2):
      QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00629
      QCA: Add bluetooth firmware nvm files for QCA2066
