Return-Path: <SRS0=Sjdv=PM=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079ABC52D7B
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Aug 2024 06:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C33F7C4AF0B; Tue, 13 Aug 2024 06:10:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8975FC4AF09
	for <linux-firmware@kernel.org>; Tue, 13 Aug 2024 06:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8975FC4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D4Ge4j006270
	for <linux-firmware@kernel.org>; Tue, 13 Aug 2024 06:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=APsbUD0A8Wsh2tyE2ihrNf
	lVdvW3Q7OjY3IE74MuJMc=; b=CA39ae3hOJyQGY35FNtf9QTC0dKEpI9j6VThBc
	YAzAod5GEwZyO82maW9mj1XBcjXvfavTicmffDRbFD5TpREzrxaGwkeg0IbCqZrn
	oerPRjcTd0RaKPzJU2fNSo+Y6UTU4fUhLuaMusab5czNXNJb9gJg+59wm+5vREDV
	vlv94Ej2PeK7ijB1LC4/QFxM7Z+nPRDcR0xhQShRCscIqwgN/EqwkSLBNzwBUamF
	wgNDJnRY+jnOLbH5iWR4+R+HE4Zwo9TVQob/SiFZ+TES2I/smsuN6Aeh02kgGtWL
	CKuc8J9jwrkz2Jgj94qaSsiicj/11pj7qyY7mC7wqa7JkqhQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18xxeaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 13 Aug 2024 06:10:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47D6ANcJ020433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 13 Aug 2024 06:10:23 GMT
Received: from [10.216.47.3] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 Aug
 2024 23:10:22 -0700
Message-ID: <876a7bad-70ac-8daf-671f-80bf84bdaef3@quicinc.com>
Date: Tue, 13 Aug 2024 11:40:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: add video firmware for sa8775p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Y9VX0gyNRAXaqX6P1Kchqx_WLZwREDg7
X-Proofpoint-ORIG-GUID: Y9VX0gyNRAXaqX6P1Kchqx_WLZwREDg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=551
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130042

Hello,

The following changes since commit 594600762910b4bbe8a88d0dc6495521366c880c:

  Merge branch 'vpu' into 'main' (2024-08-09 13:02:09 +0000)

are available in the git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-SA8775p

for you to fetch changes up to a55d7a750828688e2c215e01bdf22a2516f9cd4a:

  qcom: vpu: add video firmware for sa8775p (2024-08-13 11:28:02 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: add video firmware for sa8775p

 WHENCE                   |   4 ++++
 qcom/vpu/vpu30_p4_s6.mbn | Bin 0 -> 2300692 bytes
 2 files changed, 4 insertions(+)
 create mode 100644 qcom/vpu/vpu30_p4_s6.mbn

Thanks,
Dikshita
