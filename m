Return-Path: <SRS0=Kj2k=S3=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11939D10DDD
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Dec 2024 09:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3CB4C4CED9; Mon,  2 Dec 2024 09:31:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BEEA2C4CED2;
	Mon,  2 Dec 2024 09:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BEEA2C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28kLbs022173;
	Mon, 2 Dec 2024 09:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=elIQGDUwuKWgIiu6wz/kpa
	OV/yPGGDEjXLG6hVU+2XQ=; b=Ic/DaqgL2Xhgvzf5yeatTQ5Z1GNSle3U82JHEU
	lAPtFqYmDdr4BQ9zdFLqQQpsxhzKODB6WnnhtcvDEfSXGia7aZW5chDAHyjQ2tBP
	2N8OxzxBayaVcRBzCz3dbaivc21XSxE7+vlibZl53IfPEykpysYUjSW/gVeO/lRK
	4+lq/tOr+aFof/T4QVQvW7oEBve1w8eGFuUT1Of0bs2JQQwu6VeBXP+SLXMYfpqq
	ALu7Ks8UHH7jU4AbnuondppJhA4GmmXtTcmY0hGBHFEsj/4tv6VlRnlYvPHClfMs
	duWocJLTrVgK7fTCHVJ3QqsA8XARYr+/cjeMvx8KOeTRvRPA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437r2mvj0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 09:31:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B29VZ2K026616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 09:31:35 GMT
Received: from [10.253.8.96] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 01:31:34 -0800
Message-ID: <5cb9ed4a-2c4e-4f6a-9277-840c25bc24c6@quicinc.com>
Date: Mon, 2 Dec 2024 17:31:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
From: quic_zijuhu <quic_zijuhu@quicinc.com>
Subject: [GIT PULL] QCA: Add and update Bluetooth WCN785x firmware to
 2.0.0-00515-2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: h3B0xr-f2E0biVBhFPvXaf8ZLkCg6pUv
X-Proofpoint-GUID: h3B0xr-f2E0biVBhFPvXaf8ZLkCg6pUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=820 clxscore=1015 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020083

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

