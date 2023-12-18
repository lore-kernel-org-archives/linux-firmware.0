Return-Path: <SRS0=/jT/=H5=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8864FC35274
	for <linux-firmware@archiver.kernel.org>; Mon, 18 Dec 2023 07:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55058C433C9; Mon, 18 Dec 2023 07:57:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47A50C433C7
	for <linux-firmware@kernel.org>; Mon, 18 Dec 2023 07:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 47A50C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BI7sqbX032215
	for <linux-firmware@kernel.org>; Mon, 18 Dec 2023 07:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:to:from:subject:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=PG4n9ONvvW148rJayJaW
	xUYddo5/AEkyfDWwa1NlOMk=; b=NDa30ms7y+FR8znjOcRSDwgRadd+Dyu6AE+g
	vtdMlFp8fvAeS0YMNCFdLlghOz5l2FB1yyTNIB8SGupz+MVMuBnxDKX3dZRTQ+83
	nicQQY0/xM06b4z5FUUDzg3kZKaqcCW72pcwYP3SG/Xx6Fdz9JSZp8/w5rZ6wTN0
	krRLG51R+Aq3FXgtaDjOuAw8gAbygrq+XuKrDH9b7s0RFd3CsAIfTaM+guk0nExK
	AJYniJ/bS4EeuIUEoSVzTBCDcCMGcuCzn2M/iho5ERdjNQ3QbHArnm7TTsW3X+qY
	RT4VKS1S6WEn6RvGadMBjtDasI6qKDbDWhjmH4ZLxlr3nuL6Ug==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v2j2dg0bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 18 Dec 2023 07:57:18 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BI7vHvC011648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 18 Dec 2023 07:57:17 GMT
Received: from [10.253.33.75] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 17 Dec
 2023 23:57:16 -0800
Message-ID: <19245276-da9e-43b4-9936-56e76d82da00@quicinc.com>
Date: Mon, 18 Dec 2023 15:57:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
From: quic_zijuhu <quic_zijuhu@quicinc.com>
Subject: QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00629
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tYnDpHCl4a-run8lgaB5qmv0kg74ac_t
X-Proofpoint-GUID: tYnDpHCl4a-run8lgaB5qmv0kg74ac_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=487
 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312180056

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.

The following changes since commit
c156e6be6d4a0a2290e7059bc74fb0612aa19693:

   Merge branch 'robot/pr-0-1702625169' into 'main' (Fri Dec 15 12:16:57 2023 +0000)

are available in the Git repository at:

   https://github.com/zijun-hu/qca_btfw

for you to fetch changes up to adb26935b5440c5f4cdb6d3f174c4fdf59b56fef:
----------------------------------------------------------------
Zijun Hu (2):
        QCA: Add bluetooth firmware nvm files for QCA2066 (Mon Dec 18 14:55:12 2023 +0800)
        QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00629 (Mon Dec 18 14:41:55 2023 +0800)
