Return-Path: <SRS0=erAt=NB=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B75C25B78
	for <linux-firmware@archiver.kernel.org>; Thu, 30 May 2024 08:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28F40C32786; Thu, 30 May 2024 08:50:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28E0FC2BBFC
	for <linux-firmware@kernel.org>; Thu, 30 May 2024 08:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28E0FC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TKccN6022931
	for <linux-firmware@kernel.org>; Thu, 30 May 2024 08:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aWz257P6Evml7NP2bdCCej
	yvIOLhu+0nHfFca9LewQQ=; b=gFTfay2R5JIpenAfKoONYUTUPak/GXOu4W1Kg8
	J57Hm+FbJRsdSw9P6ERx4ZGzihnfZfEIb4G24co0sla1zfnJgMWMrf6dTQ79bYHV
	A/RdHn2kYh00cYvKqCKtyK/xHucn3A6Tps9bHhD4x5AWB4cnL8TekNei4LnUa0h4
	/cVxZUDeo7Wu81M/2x21Y59MS3aaLV9C7brxr9PhtDdbFBqMRGKI5hXQJWlSJ0TA
	UnxkxQQFKqpLtzD/HJmVu5ZwR1W+Q8iKXP1ZAutAT/sMJ0ZjodT9kqt8zH7sN4PB
	E61kZnp88GscSmwB4uo2gM62n3/vFBjcCe+C4DYSsfLL2QeQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0xbgc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 30 May 2024 08:50:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44U8oOX6026593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 30 May 2024 08:50:24 GMT
Received: from [10.253.76.164] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 May
 2024 01:50:23 -0700
Message-ID: <c419baba-fe67-4a20-91cc-1df3ee117505@quicinc.com>
Date: Thu, 30 May 2024 16:50:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: quic_zijuhu <quic_zijuhu@quicinc.com>
Subject: Update QCA2066 Bluetooth firmware to 2.1.0-00639 request-pull
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Zijun Hu <quic_zijuhu@quicinc.com>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: perLEIl0q2jjnIDKtnU-1xKAE82S6qAS
X-Proofpoint-ORIG-GUID: perLEIl0q2jjnIDKtnU-1xKAE82S6qAS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxlogscore=715 priorityscore=1501 clxscore=1011 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405300065

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 92d264e864cef693e8da87f31dde6e575fc9921d:

  Merge branch 'robot/patch-0-1716949439' into 'main' (2024-05-29
02:42:42 +0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw HEAD

for you to fetch changes up to 436b0a920352d13290043d9ec9e50c420ab10f92:

  QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00639 (2024-05-30
15:20:09 +0800)

----------------------------------------------------------------
Zijun Hu (1):
      QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00639
