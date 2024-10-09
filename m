Return-Path: <SRS0=dx7S=RF=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE1CCED628
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Oct 2024 08:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 333E0C4CEC5; Wed,  9 Oct 2024 08:30:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12902C4CECE;
	Wed,  9 Oct 2024 08:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12902C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4997sLJi024259;
	Wed, 9 Oct 2024 08:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OWaGDk0q9Qj3wEVUPuqCS7
	HF8xrNFQwG3p75ciKO15s=; b=MCpGyOP0gV0Be5zZ6MsUSc+73YNvq5Ki/2Xqzg
	o5gzcGtXB3BVRhBt30ZIWkgVeHe+a3GIcVJNEA6AUGlozJYB/5I2OnGOcMfJCRV0
	tQzwj2O5nx/Tx1nLN+WG92CevXdGb5ckaQ+jjhQloda2Jyuhtqrzf3GwwKXSYnX4
	CK7iU2Vk/I6MBrFWhWdPWoOgF0k+kaI7WkyoVOITW2CoY70Zbx4/K/XOVjCsifD8
	efwC0axVXxRwcs5Zg0qotDQTSi9VFMFkDnJD63Xwefb461zUXFn6Pasc/bWEXxGE
	1jFA73+1S4VZttV20Qj5obwAVhOxx6Cf/1gl3jHSxFuiixzw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4258pssxmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 08:30:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4998UbUf007628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 08:30:37 GMT
Received: from [10.253.10.136] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 01:30:36 -0700
Message-ID: <17161839-07cf-4167-be99-220ff23b17bc@quicinc.com>
Date: Wed, 9 Oct 2024 16:30:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
From: quic_zijuhu <quic_zijuhu@quicinc.com>
Subject: [GIT PULL] QCA: Add Bluetooth firmwares for WCN785x with UART
 transport
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8zwQs36TnsdDTo7WUTYrvo5JHQ7I_15g
X-Proofpoint-ORIG-GUID: 8zwQs36TnsdDTo7WUTYrvo5JHQ7I_15g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxlogscore=913 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090054

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 919f79f9fb5536c1928a15ac82a2e53183b213cf:

  Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04 +0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw

for you to fetch changes up to 2a8ffa36567f300041c6d6d509b897a4fcc42916:

  QCA: Add Bluetooth firmwares for WCN785x with UART transport
(2024-10-09 16:01:30 +0800)

----------------------------------------------------------------
Zijun Hu (1):
      QCA: Add Bluetooth firmwares for WCN785x with UART transport

