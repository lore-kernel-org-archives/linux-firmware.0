Return-Path: <SRS0=cyIP=NW=quicinc.com=quic_jhugo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29BDC2BA1A
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Jun 2024 16:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A58B1C2BD10; Thu, 20 Jun 2024 16:06:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 989FAC4AF09
	for <linux-firmware@kernel.org>; Thu, 20 Jun 2024 16:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 989FAC4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KDlwJx024058;
	Thu, 20 Jun 2024 16:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K3000WvjgrpqLR0dCmcFzL
	28D00wldqQkvX1iF1E8lE=; b=mK5tb3h9GydhXvk55nUahn32lmrEkRJ+UQTz67
	jNWekBbqVru6No6Kb4QS6w3+4KEkCpnut5uYAOq5dUJULuDTtVd6YWiQM+1yFbQX
	ybKXTh0Mb2LoGkWH39NksRSleyDBhhGaa6NWUuwM0FpNyy+TIXn9Zs5JLC+PCK/C
	Se6ZUXxukQWakujxhSrv8q+EFqPuvaq3cafFhfE5VcBucBmDlhX6UuTBdfcvDImX
	MO8mm/YND1mYhqB+L/CrmVifxpiTPqVWJfk3Unax3DiZDG+Cc+5hEfNOUj8YchRa
	2JRnlDm75uCusbFkM0MspiQTnL1luFRKusWNHVv8hzBhhgpw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvnmh8c8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 16:06:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KG6HQl030709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 16:06:17 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 09:06:17 -0700
Message-ID: <1c0d33f8-6cd7-e7f1-b130-09b6279cd4bd@quicinc.com>
Date: Thu, 20 Jun 2024 10:06:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <linux-arm-msm@vger.kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PULL]: Add firmware for Qualcomm AIC100
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GiZm2X1Ap2fORtA-nKYgmePCrd5KimnR
X-Proofpoint-GUID: GiZm2X1Ap2fORtA-nKYgmePCrd5KimnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 mlxlogscore=822
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200116

The following changes since commit a34a7ad5014c2b833c6a2c0f89357f98a0bddab0:

   Merge branch 'upstream' into 'main' (2024-06-18 11:34:55 +0000)

are available in the Git repository at:

   https://github.com/quic-jhugo/linux-firmware aic100_1_15_4_0

for you to fetch changes up to 335a6a3769201aca271c7265b43a092b4a616aa0:

   qcom: Add AIC100 firmware files (2024-06-20 09:48:59 -0600)

----------------------------------------------------------------
Jeffrey Hugo (1):
       qcom: Add AIC100 firmware files

  WHENCE               |  12 ++++++++++++
  qcom/aic100/fw1.bin  | Bin 0 -> 1571360 bytes
  qcom/aic100/fw10.bin | Bin 0 -> 249439 bytes
  qcom/aic100/fw2.bin  | Bin 0 -> 771016 bytes
  qcom/aic100/fw5.bin  | Bin 0 -> 24576 bytes
  qcom/aic100/fw9.bin  | Bin 0 -> 750416 bytes
  qcom/aic100/sbl.bin  | Bin 0 -> 805808 bytes
  7 files changed, 12 insertions(+)
  create mode 100644 qcom/aic100/fw1.bin
  create mode 100644 qcom/aic100/fw10.bin
  create mode 100644 qcom/aic100/fw2.bin
  create mode 100644 qcom/aic100/fw5.bin
  create mode 100644 qcom/aic100/fw9.bin
  create mode 100644 qcom/aic100/sbl.bin
