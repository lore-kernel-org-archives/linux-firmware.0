Return-Path: <SRS0=aSn8=O5=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5A0C3DA4A
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jul 2024 10:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9ABFDC32786; Mon, 29 Jul 2024 10:11:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB7FFC4AF0C;
	Mon, 29 Jul 2024 10:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB7FFC4AF0C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SNK5pP023022;
	Mon, 29 Jul 2024 10:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AGk3kAVeH1r1kyE0eE3t86
	BVQfRIK+mKvLmtS34vlIk=; b=Jol7bMdWJFNLvvDyQ7nqOZSmnWEdBAOkiQik8N
	ZuFCRrpipVTXeYFXw7ib11Xis/4w2pKzyYwpkw5MlPk+m5zy+Shv06JUe+GML5cs
	e5jiA5s5eHIvVB3aqfu+hmg0IRmhfSM2qK0np20JaFKe5WE2MFoD8RzIFPa5bpA4
	ay+m9BdaD9YHUmdWVT8ffYqnhEOsPMm/rohwJDGmZGLPQhgE5rwIkZqup6u1D/8o
	Miic+EBMMbzHU5nTgHNJ3BsgYaGr4T2xDoGrWjQN1FAqHpEfFuWKk6ywxDvlFn8h
	nqKl6CnfywEnhu4zTdPFVMJ97QgNdAvD7r5OjSOa1DDqziUw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms433rdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:11:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TAB7K9023524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:11:07 GMT
Received: from [10.253.13.112] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:11:06 -0700
Message-ID: <bb54bfc8-edc2-4e76-bead-f2a25e663ec8@quicinc.com>
Date: Mon, 29 Jul 2024 18:11:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
From: quic_zijuhu <quic_zijuhu@quicinc.com>
Subject: Update QCA2066 Bluetooth firmware to 2.1.0-00641 request-pull
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xQrCGK6mOZuQ8AqApWSEqoE5i21XFDJN
X-Proofpoint-ORIG-GUID: xQrCGK6mOZuQ8AqApWSEqoE5i21XFDJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=900 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290069

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 65c5d9b1a4808462f5e885447dae1a133c96abec:

  Merge branch 'amdgpu-20240726' into 'main' (2024-07-28 14:28:08 +0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw HEAD

for you to fetch changes up to d118dc8ad5562ac0ae0c07be748cbe35a9361b47:

  QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00641 (2024-07-29
17:41:28 +0800)

----------------------------------------------------------------
Zijun Hu (1):
      QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00641
