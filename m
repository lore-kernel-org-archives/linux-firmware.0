Return-Path: <SRS0=UGWl=3O=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE5DCA100C
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Sep 2025 09:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F9C4C4CEF1; Wed,  3 Sep 2025 09:50:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6DD3C4CEF0
	for <linux-firmware@kernel.org>; Wed,  3 Sep 2025 09:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6DD3C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832AIfH018247
	for <linux-firmware@kernel.org>; Wed, 3 Sep 2025 09:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GdaIfqwWianRkyYsV/EKdY
	r5L+wUHW8OWRa9HZnH+2g=; b=gWBoPxD6Ix+Vw5++qx/sfquxYAiBVsIMQrwLeM
	+qXuuMYaf5RJ0ElnK5OSa0PuRZ/x+xKF4aWdtaDnrubTSuCFiAnbT6+UbqVuFpLK
	ERrCe5v+aGJ6Opeh7ywIKyDON+4WS9x1xivWfm43fbYviqC1M8xnDfaa5my9RMyN
	/nx3UI1qbSny2QXq2UpVlh7cNYHpdlgqxL5eBUm49soM7ZZVGjTO+w3ri4CE8I8m
	Oa6byXf5DJ7deZBHJht3P0SzNfW1UhtOFQYAURfPmobGhK7Dhp065MlvGE6NB49t
	GCR2hDRNvaaNzO6V8d7MRrPWWdfa4WZAZYuKoyAr4LADowtw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvwctbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 03 Sep 2025 09:50:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5839oJLP029674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 3 Sep 2025 09:50:19 GMT
Received: from [10.50.35.121] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 3 Sep
 2025 02:50:17 -0700
Message-ID: <13e2d56d-6cca-3929-73a7-9faf83669759@quicinc.com>
Date: Wed, 3 Sep 2025 15:20:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: update firmware binaries to fix encoder drain handling
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX8RvP7zbwYYLl
 om42mE16Y1b3TMLSwiVnOawTqqf95OP7U50zvodQPl1u2HFvo25ZBOihUTrNBWgOmhvJom5fBgm
 aAFlBlAGqdKeUbhqhhwhZT6Y6VdaPdq+MEoZArduO5d1UkQ3LCm/QNai4bYzUGEH5Uq5oLYW+Er
 GG2Pv0pqmTyljKYX/5IMbJhnRPwFrV6/pWVom24MVFvm3th+a9lL/eQOyIhq3xAwioD4K2JDKyv
 C6eU0mQc0KdOqCMTr3YU6o0t7M0p0zBLfgLdI7e8jmVcFPmg3TUNMuuXK/DukGf2SF4YQdzYkIt
 qL/t7vHWU/ep3AZcK2NvFRwAri/i7qdth0wSnSXAwGoZDRySk1bVgN4zLSzDOUb6xxIzaToOZZo
 H4wqnvIS
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b80f5b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8
 a=M9TOTVUa7obFzd3MbSkA:9 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: cqekFpKUGAMMQtyG-9mRmNh62NXgvDPY
X-Proofpoint-ORIG-GUID: cqekFpKUGAMMQtyG-9mRmNh62NXgvDPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024

Hi,

The following changes since commit c6aed39675756a72c9bce4d94f12d8feb9837950:

  Merge branch 'superm1/revert-bd28704ab16eb880acbd38c597c54314e7745814'
into 'main' (2025-09-02 16:13:45 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
vpu.3.1-encoder-fixes

for you to fetch changes up to 514c9017fcec5509bce5a575361e9b21badb54cf:

  qcom: vpu: update firmware binaries to fix encoder drain handling
(2025-09-03 13:16:03 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: update firmware binaries to fix encoder drain handling

 WHENCE                        |   6 +++---
 qcom/vpu/vpu30_p4.mbn         | Bin 2318952 -> 2323048 bytes
 qcom/vpu/vpu30_p4_s6.mbn      | Bin 2300692 -> 2315156 bytes
 qcom/vpu/vpu30_p4_s6_16mb.mbn | Bin 2311988 -> 2315172 bytes
 4 files changed, 3 insertions(+), 3 deletions(-)

Thanks,
Dikshita
