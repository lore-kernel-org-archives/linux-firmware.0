Return-Path: <SRS0=egra=UF=quicinc.com=quic_vivesahu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D83E7719E
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Jan 2025 10:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5090BC4CEDD; Mon, 13 Jan 2025 10:28:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BD6BC4CED6
	for <linux-firmware@kernel.org>; Mon, 13 Jan 2025 10:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BD6BC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D4Wuod008543;
	Mon, 13 Jan 2025 10:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5ICYrEeMZ3Ai9AFRvbT0CE
	XennN5jJTAJvWcq+CeLww=; b=ZZ8p26z6q6D776UdgJuFYh4UR8in1mH8YcLfPw
	4ESueXOZpMjhN19cVKGAR2+xFZAB88j6uRAD6BypVT49Rdkwp+UGuNqrfI86VVo2
	SIem2j2lkYL4s8pvSJJ3thAsJfRaycrcE47wqukBUNImxuM8OTHKhTMXVGDd5SI1
	AKlhFNVEbmcN3bsezoepdkZkN8F29S1HEOj4ykURdhhHaJtK9ODJqVPxUk3TU2Nt
	ZXtBlwX3Mf3mZZlt6+n/C8oYipiM8mVZE6cPuEuISbNzatWSPOalhzykOe+h1482
	lBUqtG9hZH8sSaHURWf7143dQNISCJxoQ5bNH+nMvYiT6EIw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444uw6gt88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:28:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DASHl4016915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:28:17 GMT
Received: from [10.218.12.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 02:28:16 -0800
Message-ID: <88e8d87d-2b98-41e0-9146-916ebaf9dfcb@quicinc.com>
Date: Mon, 13 Jan 2025 15:58:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
From: Vivek Sahu <quic_vivesahu@quicinc.com>
Subject: QCA: Update firmware files for BT chip WCN6856
CC: <quic_janathot@quicin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HDn1Ga7GpOGusO-Htcm2JLx-IS5WMHmd
X-Proofpoint-ORIG-GUID: HDn1Ga7GpOGusO-Htcm2JLx-IS5WMHmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=925
 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130088

Hi Team,

Please include firmware bins for WCN6750.

Major contributions : Bug Fixes/Stability.

Snapshot of pull request is as below, let me know if anything is missing.

--------------------------------------------------------------------
The following changes since commit ff68bad967033e2973d3a82e5b160813b1d43488:

   qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650 
(2025-01-10 16:33:04 +0530)

are available in the Git repository at:

   https://github.com/vivesahu-qcom/bt_hsp_fw.git for/master

for you to fetch changes up to ff68bad967033e2973d3a82e5b160813b1d43488:

   qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650 
(2025-01-10 16:33:04 +0530)

----------------------------------------------------------------


Thanks and regards,

Vivek K Sahu

