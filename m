Return-Path: <SRS0=oK2B=SI=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37ECD597DC
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 03:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2400C4CECF; Wed, 13 Nov 2024 03:52:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D66EC4CECD;
	Wed, 13 Nov 2024 03:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D66EC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRc8o029745;
	Wed, 13 Nov 2024 03:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ATiYuf3K8Yk+8y/r3SI1lB
	eSYWGLXPn+N5KmgWT0Z2Y=; b=fEJYwJqJ94M96cjbNiG6k6DH2vInuFYiuns/Xq
	uAP2GFnIuQuRqtHNEQq5K0rzu24mjQIqF2vPv4MtsEkmMugQyie0zjXt/FMlSkCd
	1OmhEtppx4ucVJMFfFOWx3ZkNL7eWcpEa0aIvcY6CUnR2B8VmLoWlu1BaC5ZY8rO
	Y2OUpWVw7MfKuuLoLC9t4vbCnqQkbRcjkyvx/7JKiVqJL7LQ0Vu+xRrI1uJJ2T1J
	TFzkRySLcnARKbQWtJUgIZvR2F3Hhj4QElNVnMXCSVvqCOJPvnqqeQEbLkhHqvIy
	vZ9lUW5IKipTv5+FG3dX9cNZizJPSphTboazW94cIImc55qw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0469fhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 03:52:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD3qaEt009186
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 03:52:36 GMT
Received: from [10.253.78.176] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 19:52:35 -0800
Message-ID: <50a3038f-2a77-4576-ae83-aee68735f2c4@quicinc.com>
Date: Wed, 13 Nov 2024 11:52:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
From: quic_zijuhu <quic_zijuhu@quicinc.com>
Subject: [GIT PULL] QCA: Add 22 bluetooth firmware nvm files for QCA2066
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: A_DoIDWFXmRY34ZzMhxuzBGhuLYe568V
X-Proofpoint-ORIG-GUID: A_DoIDWFXmRY34ZzMhxuzBGhuLYe568V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=933 impostorscore=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130033

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:

  Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw

for you to fetch changes up to 77a11ffc5a0aaaadc870793d02f6c6781ee9f598:

  QCA: Add 22 bluetooth firmware nvm files for QCA2066 (2024-11-13
11:36:07 +0800)

----------------------------------------------------------------
Zijun Hu (1):
      QCA: Add 22 bluetooth firmware nvm files for QCA2066

