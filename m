Return-Path: <SRS0=UAI4=32=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD62CAC598
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Sep 2025 10:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05CE5C4CEF5; Mon, 15 Sep 2025 10:10:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E251AC4CEF1
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 10:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E251AC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8Ffj1027151
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 10:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e+7wpKOf0zBFg5ka8R+M4+
	z0GfnhJYleqAN6XqmXpyk=; b=ADu5GiGbnSCgLIbr9lpGK6XDaYEm4KHWGbMFDI
	7dV8s9imbnz7AozCZZgv5o3HqotQliOxSvZqIbb2Pcb93c2NFE31YkGmKreSTr9l
	YTEYMLjF4gH9WJJL+nInRipHz7TJBLxHF1YZRsPidfOl+rGclKdykgrd5njQ4s4m
	JsZkVuqemRvtkfkdCgJxMxD4aV7HNCYLANbzCk9LeERCZOwDlsCAkHb8xuQ6n+1K
	gGZRHjcBN+YTEDQTyOSw4kFDxgloRxlnqlg8cXK/RQut52f4kORg9p/i+0d1iWGp
	L7c+/EBbVTg/idH5REvdbrFglH6qQEpvBOzGeziEd7AbH51A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072mgt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 10:10:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58FAAY99008819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 10:10:34 GMT
Received: from [10.50.6.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 15 Sep
 2025 03:10:33 -0700
Message-ID: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
Date: Mon, 15 Sep 2025 15:40:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: qcom: vpu: fix the firmware binary name for qcm6490
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX6EX/e7B7eHWE
 GyIuMn+5nlgSg3sXxTYiqfCLru4qs/IV9RUg2Gca07qasdPbWBU7oTYtBNjlEwyHSy45SQBKW6i
 fm8J3pgVqVRz878H6WaPbGH3ejig1Gk7CSjN+cORvvYBmI/y6toUr2f7WJvPJvn1AnflkLg3Dxs
 xJ8inGiDwNGWgxoSxEx/G/dhyP73jkZSCnw/+akPMevw50L0+NEi6kt+6CoyYZaWuA+Vy9UT4A6
 9BfUxxpa8JvMVUmfq5APN2IpO+ABnoguXXytuhI6N4cZCss3EcmnFzgH+D8e/MDZ0yZhkYuYBTV
 676RSQoqBucPJrZ1noURJZ3Sj9WJGsozYk3tZkAKldxzHj0pVEa4qFkz948QTn8kPj4cdW6MDBw
 ELmQaaXS
X-Proofpoint-GUID: P-ZjwUcVrqv_ZYhKCscPacn_2wdtnQ9N
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c7e61b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8
 a=wKGTahcfOsQ4PjogmfQA:9 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: P-ZjwUcVrqv_ZYhKCscPacn_2wdtnQ9N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025

Hi,

The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:

  Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-qcm6490-update

for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:

  qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
+0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: fix the firmware binary name for qcm6490

 WHENCE                                               |   4 ++--
 qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_s6_gen2.mbn} | Bin 2036328 ->
2031844 bytes
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_s6_gen2.mbn} (73%)


Thanks,
Dikshita
