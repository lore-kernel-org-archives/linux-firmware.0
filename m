Return-Path: <SRS0=5cs+=RO=quicinc.com=quic_vpuar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777A0D2FFE6
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Oct 2024 10:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 577FCC4CEC6; Fri, 18 Oct 2024 10:22:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45E63C4CEC3
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 10:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 45E63C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I4vGRt016654
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 10:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w9KgMlmJCN4K35pOop+70+
	W2cYWULgroVuqU7waHxFc=; b=TESJpbdE0Tela0tdSGuRvdm5plyF4lZvKxej1R
	Eb4wA9mxX2CroNIjT8HN9RABgANiGV2anyp+bS/kTCHLxZ5sOp7x2Z7KheSOXBNq
	Al84Ule4ljuvqTVtQJv4WkPBQiR+3CEZyed6Z8ZdEnU8RNfU32Vh/sya9C8tjXDh
	0BBsAy+JKKyAWFrvNR27XBWBRB7HlGElFIPEKxTOUieUgSaRQI9sZdEDAY9n2rV2
	28TxrFF+ikCXkp3VDXIfIg+YXlJITDHgtb/tkp8NZWTgUfiOfVZYOufvj5yRglI/
	5JkwM2GxeJNnvB9E4PcCvRZwAe3HBqnCRihdIZAVKRnvZYRA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bh3p90n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 10:22:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IAMrFp031711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 10:22:53 GMT
Received: from [10.214.230.128] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 03:22:52 -0700
Message-ID: <56dd4ed2-a4a2-4d9d-b23b-2a817fca1f94@quicinc.com>
Date: Fri, 18 Oct 2024 15:52:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
From: Vivek Puar <quic_vpuar@quicinc.com>
Subject: check_whence.py: Add function to get listing of files
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mHbqh9qkb_UtYfLbIMBWI8ijzqBr_thD
X-Proofpoint-ORIG-GUID: mHbqh9qkb_UtYfLbIMBWI8ijzqBr_thD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=621
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180066

Hi,

Please find below git pull request to update check_whence.py file.


The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:

   Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 
15:40:04 +0000)

are available in the Git repository at:

   https://github.com/vivpuar/linux-firmware

for you to fetch changes up to 95c238e821c95749b50f24f9b6fed080417daadf:

   check_whence.py: Add function to get listing of files (2024-10-18 
15:19:04 +0530)

----------------------------------------------------------------
Vivek Puar (1):
       check_whence.py: Add function to get listing of files

  check_whence.py | 33 ++++++++++++++++++++++++---------
  1 file changed, 24 insertions(+), 9 deletions(-)


Regards,

Vivek

