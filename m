Return-Path: <SRS0=eHbr=3F=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB16CA0EFA
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Aug 2025 11:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DFF98C116B1; Mon, 25 Aug 2025 11:16:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC55BC113D0
	for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 11:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC55BC113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8VgFH022786;
	Mon, 25 Aug 2025 11:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0YG8qADxrZ2vEHSB/nlzNz
	0b7SfDLHNo76x/WF3vpIw=; b=Rb/+IgPutituL4RS3B/oBzywER+MNayP5uuaEt
	QBt9f4pWKiONi/S/OeLRA2KFFrf2GuUsmFCL+sCvzkvzwg7L0pEyeDJ4woR+cDym
	Y7EQeSHcVNOmfqaIG3pYj4u67zLwO6ZgrobDGw1gcygMEjqwHs3V5K0JMUJjxJtF
	CiMmyxRZ3NXrPZmmJf40tnBxMCsKX2nL74qbbPLpzb+onElsWqaSPYP3QSvS7Fht
	CIXU9+qxhHsi3Ju+3jrml2qDPk2Z9nepdoAApHm6XTtCXqp7aN85iRxVDtJLkFwW
	c0St60b1EJE81hItnEmwiURgixFB9WCIuJ4W4mUjgcoD98tA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unmtcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 11:16:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57PBGmDG016158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 11:16:48 GMT
Received: from [10.50.27.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 25 Aug
 2025 04:16:46 -0700
Message-ID: <089a2122-0e4d-6a7f-5a03-885a5c67e3a6@quicinc.com>
Date: Mon, 25 Aug 2025 16:46:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Reorder VPU firmware entries in WHENCE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BcS9flzBZlDGsNXZmhvNhxzruvMsLy3L
X-Proofpoint-ORIG-GUID: BcS9flzBZlDGsNXZmhvNhxzruvMsLy3L
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ac4621 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8
 a=V2ryXtRmwIweCXSpTTEA:9 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX7SASby8JrLeU
 7G0Y8UOKF9oRyt+BPXUPUYYAf85bM1GSwozkdBniCwFrPwQYloaND68jmQGdVjfFtf7UbDeb/9o
 QIxYWG/ok1y5zmgGowUCWU4AXyl9tWPQuFjGrkbRw4ZOzRnVj9tPO6LEaPs+fBM7+V22VeOhOxj
 9t4Yvoem+FwIJzOP4np6z074GRbApUYzujCY6yAGi4yJXspdMqqR4UFKcsrPCV7gCQzhYSIcz6W
 UvpnmhON2EJftR3+s/+Dzdh/FnDXouLh/kc4QtuJPDFNSJzTvrPnY8ljZZaIdRu1CK3/Pxnf3kA
 d3GduW6IXw/Lfz7rLzB1S4oTo5wvESy+lRyVJJZl82pwrVepByccKon+FU9RLc/I9HA23Ul24Ku
 hCzSUoxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

Hi,

The following changes since commit ffaf66fcc58457e8920d430d7d1e28ef4707fe64:

  Merge branch 'amd-staging' into 'main' (2025-08-25 03:33:12 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
reorder-video-fw-name

for you to fetch changes up to 04ee01e56d787607342d8168dd2f2500a4787714:

  firmware: qcom: Reorder VPU firmware entries in WHENCE (2025-08-25
16:43:24 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      firmware: qcom: Reorder VPU firmware entries in WHENCE

 WHENCE | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

Thanks,
Dikshita
