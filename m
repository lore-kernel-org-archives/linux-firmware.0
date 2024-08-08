Return-Path: <SRS0=IaRj=PH=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182C4C52D73
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Aug 2024 07:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E78BDC32782; Thu,  8 Aug 2024 07:13:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E8D1C32786;
	Thu,  8 Aug 2024 07:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0E8D1C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4781QlOX021849;
	Thu, 8 Aug 2024 07:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c4/2LjpM98CkcXN9Hmu+1S
	JnqVily0NS9fbL8enIfDA=; b=nyk5SBKESbjIBrm0adDU8bInXg2bzmcmSN6FtZ
	8XjKGsX+anW8hP9x+pzKD7kvrFFOZquVTY6UaomvG+t4ImAYNLm6bYMCPZXCD4Wq
	nDpFkkvUlgv/aGHZKD1C9nua46a3Z/uVrj2U9bczzQAba+wyTriT542wqlqADKEC
	Cvi1XKw8IaEj6Sw7LqoFhW4jBHI6R0KBnhZQ61OSvbrdeytGrKfoui6hGP03LVQd
	NzkOzEgO0dwXL+CpePRAVgeEPZeReCyMDEU1IxFuaV+oKr+1nvO1+UtI4Cp6rqVM
	jlqXM/f5eNCF6HX5DqDC6b4j/w3On5ITZBphdZHn+u71CsVg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vmc50p10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 07:13:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4787D6dO018347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 07:13:06 GMT
Received: from [10.253.37.67] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 Aug 2024
 00:13:06 -0700
Message-ID: <bed2bbfb-f3f9-4562-8a7d-0f077f0f73a2@quicinc.com>
Date: Thu, 8 Aug 2024 15:13:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
From: quic_zijuhu <quic_zijuhu@quicinc.com>
Subject: Update WCN685x 2.1 Bluetooth firmware to 2.1.0-00642 request-pull
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: osu1MYZYm5tPj9S8bJ2RD4Q58PpLYPvd
X-Proofpoint-ORIG-GUID: osu1MYZYm5tPj9S8bJ2RD4Q58PpLYPvd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_07,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=952 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080051

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit e131a437050360bf31b0ad7b69667432947acbab:

  Merge branch 'intel-20240805' into 'main' (2024-08-05 11:41:14 +0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw

for you to fetch changes up to d6e21350fd265818799a128ba76e40b3fa6e8c5b:

  QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00642 (2024-08-08
14:28:20 +0800)

----------------------------------------------------------------
Zijun Hu (1):
      QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00642
