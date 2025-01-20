Return-Path: <SRS0=Q+T5=UM=quicinc.com=quic_chejiang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF95C02185
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Jan 2025 09:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0EEFC4CEE0; Mon, 20 Jan 2025 09:13:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2EA2C4CEDD;
	Mon, 20 Jan 2025 09:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2EA2C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K4sYvG007161;
	Mon, 20 Jan 2025 09:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bp7Y28JAWirZxczIz7IyXO
	qBV4bEJjZ2q3IUxeWv9O8=; b=JrU0cv+z6/qYfGixtRcmNdmPuJdHH8cLQaggUf
	MaTLrjznqNkf5R2GpWwp8M1TIxvsbQywx+JXlDvzq6tDVRc1pAIik6nZxwUYTzNB
	MM5Jt94E4Ha7YZu+Q6jP4n0hBe41/3JtEeo3sKBudvTJnuPvRmRUfiz+ZgR1KQss
	MhiVd2zSNw9cCbulbin39k7HDH1MYbuWZEqxm4DLpXOcJKKhZycLSubOmGyTAnaF
	nwjeOPZ3YD07zDbspoFrBa/MyZDkf+sm+BlJMIK8xw2rOpe4/1VvodkiuH1h/MAx
	lYNtlrfNUCPhUa2nqDf5jYS5MFmtyDvtM3R9It60mDiUVhpQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449fvj0n6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:13:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K9DjfX012929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:13:45 GMT
Received: from [10.253.10.63] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 01:13:44 -0800
Message-ID: <f8324c4c-985b-4283-922d-1f0de766fde3@quicinc.com>
Date: Mon, 20 Jan 2025 17:13:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
Subject: QCA: Add Bluetooth firmware for QCA6698 request-pull
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DRHn3HrjgjdlAKezSi-1Qcq70A3QS8m5
X-Proofpoint-GUID: DRHn3HrjgjdlAKezSi-1Qcq70A3QS8m5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 adultscore=0 spamscore=0 bulkscore=0 mlxlogscore=898 suspectscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200076

Hi linux-firmware maintainers,
 
Here's a pull request for btqca bluetooth firmware. Please let me know if you have any problems.
 
The following changes since commit a28a9226ccb8bf393b8e7dd8970a4d967c1a1d92:
 
  Merge branch 'robot/pr-0-1736646402' into 'main' (Mon Jan 13 14:30:09 2025 +0000)
 
are available in the git repository at:
 
  https://github.com/che-jiang/qca_btfw
 
for you to fetch changes up to c07a64c0f9348b1da997c944467857d73a6fa8cb:
 
  QCA: Add Bluetooth firmware for QCA6698 (Mon Jan 20 16:58:47 2025 +0800)
 
----------------------------------------------------------------
 Cheng Jiang (1):

    QCA: Add Bluetooth firmware for QCA6698

    This commit will add required Bluetooth firmware files for QCA6698
    The image version is 2.1.2-00035.

    hpbtfw21.tlv : RAM FW dump
    hpnv21.b206  : NVM dump
    hpnv21.b207  : NVM dump
    hpnv21.bin   : NVM dump

