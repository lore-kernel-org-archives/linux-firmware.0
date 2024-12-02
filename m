Return-Path: <SRS0=Kj2k=S3=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804D1D10DCF
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Dec 2024 09:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F732C4CEDA; Mon,  2 Dec 2024 09:13:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EAB6C4CED9;
	Mon,  2 Dec 2024 09:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4EAB6C4CED9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1Nv6Gt025674;
	Mon, 2 Dec 2024 09:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	elIQGDUwuKWgIiu6wz/kpaOV/yPGGDEjXLG6hVU+2XQ=; b=W5sCsQEaGtQvTwqV
	BPZ4fiSFlLN2oISjJikiWmxvoy78qWJx/MoMp7VM22bC72yizByTUweRU2t2RfgJ
	n/lYL064z7bbX0leh0m+4huy9DpKCD+ZDYQCwtWCi35jssT6Iwm2QFDzpC2ymqdD
	cDI7+UDE34k6u7981YxXShv64RKjs+2M+W0F6HPDN8Ot2gcdUYtVecDYCRkl2ptz
	nh5GZgpGKjcYd+9u7NEj5X9RGRNV4N4dq3/Cq5tE+rQqlYzVvN/Y4hVKzV7yWSNu
	qCdI9A22LQgHYLhDr/cqq+8ikIJexwX1m4sDCqbpEM+jREsIkdNvtRjF6cYQw5V3
	Fr8zzg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437uvjv3xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 09:13:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B29D5qh008921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 09:13:05 GMT
Received: from [10.253.8.96] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 01:13:04 -0800
Message-ID: <ea966b5f-d2c1-4b09-a4c2-e492d371e3ed@quicinc.com>
Date: Mon, 2 Dec 2024 17:13:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [GIT PULL] QCA: Add and update Bluetooth WCN785x firmware to
 2.0.0-00515-2
From: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
References: <50a3038f-2a77-4576-ae83-aee68735f2c4@quicinc.com>
Content-Language: en-US
In-Reply-To: <50a3038f-2a77-4576-ae83-aee68735f2c4@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qrsYG5yslwb9Rh2Rwa41pAVIm6ij9-Ox
X-Proofpoint-ORIG-GUID: qrsYG5yslwb9Rh2Rwa41pAVIm6ij9-Ox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=846 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020081

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 7c3031c18ab851792c49f594a4d43200d55a7943:

  Merge branch 'robot/pr-0-1732634796' into 'main' (2024-11-26 16:12:19
+0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw

for you to fetch changes up to 7f116580d9060feaedaed55eb65c63eeba59341f:

  QCA: Add Bluetooth nvm files for WCN785x (2024-12-02 17:05:12 +0800)

----------------------------------------------------------------
Zijun Hu (2):
      QCA: Update Bluetooth WCN785x firmware to 2.0.0-00515-2
      QCA: Add Bluetooth nvm files for WCN785x
