Return-Path: <SRS0=/pC4=UX=quicinc.com=quic_janathot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EABC0218D
	for <linux-firmware@archiver.kernel.org>; Fri, 31 Jan 2025 11:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A706C4CEE1; Fri, 31 Jan 2025 11:06:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E26EAC4CED1
	for <linux-firmware@kernel.org>; Fri, 31 Jan 2025 11:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E26EAC4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V87e8t024120
	for <linux-firmware@kernel.org>; Fri, 31 Jan 2025 11:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mecTVYL7+uPTLbl1n8kblx
	N6KzET6/ojffeYfmhgiEY=; b=IqCwK/vues0h6XBaVoxGJdfl7jDBcnnze/mMJZ
	rfdYJRLLfMEoSjxQptyrrT7Ybnkm7K8NRZbRixQZ1oBum5aZVdajZo6Bn+K3MTqI
	LOtaO6TqR5gu1ODAD9i0DItJiP7nBodyBQjZLteZbqCcrk5u4RjEoZ5D2i1lcKlt
	DH6wBhC7u8VWu+Jg067FSpL+XSyrgovRHFzXuZGF0b6qgLPxtGim2sblCe6QhTfI
	9tpJF0sLLQaekgXv4M7RgFUIImMQU+/xK1h6h4SWhwfMO3ywrfT1kKFJOJwzPGV0
	hBaKX6JFc42ipfldyjlBqzS61WpLU1cS40UWZmQPuH0hfNXA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gtr0rbwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 31 Jan 2025 11:06:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50VB6Exp009358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 31 Jan 2025 11:06:14 GMT
Received: from [10.219.0.139] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 Jan
 2025 03:06:12 -0800
Message-ID: <19b2224b-ff94-419e-9af6-a9f16cf2803f@quicinc.com>
Date: Fri, 31 Jan 2025 16:36:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
From: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Subject: qca: Update Bluetooth WCN6750 1.1.0-00476 firmware to 1.1.3-00069
CC: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        Vivek Sahu
	<quic_vivesahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PcRoy2MadbDH7UggM6pq3BdzLB9FCtrM
X-Proofpoint-GUID: PcRoy2MadbDH7UggM6pq3BdzLB9FCtrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1011 mlxlogscore=668
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310084

Hi linux-firmware maintainers,

Here's a pull request for bluetooth firmware. Please let me know if you 
have any problems.

The following changes since commit 97cf368b19e641f25f35d0603869305cf17497dd:

   qca: Update Bluetooth WCN6750 1.1.0-00476 firmware to 1.1.3-00069 
(2025-01-31 16:14:42 +0530)

   Merge branch 'parallel' into 'main'

are available in the Git repository at:

   https://github.com/quicjathot/bt_msl_fw_1.1.3_00069.git HEAD

for you to fetch changes up to 7db7f79e5fe92e3fbb6ca29e9dc02fc3ddc61efc:

   qca: Update Bluetooth WCN6750 1.1.0-00476 firmware to 1.1.3-00069 
(2025-01-31 16:14:42 +0530)

----------------------------------------------------------------

Janaki Ramaiah Thota (1):

qca: Update Bluetooth WCN6750 1.1.0-00476 firmware to 1.1.3-00069

Thanks,
Janakiram
