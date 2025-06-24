Return-Path: <SRS0=VZAp=ZH=quicinc.com=quic_renjiang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56AEC77B7C
	for <linux-firmware@archiver.kernel.org>; Tue, 24 Jun 2025 09:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C055FC4CEEF; Tue, 24 Jun 2025 09:11:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1774C4CEE3
	for <linux-firmware@kernel.org>; Tue, 24 Jun 2025 09:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1774C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8YwtG017607
	for <linux-firmware@kernel.org>; Tue, 24 Jun 2025 09:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qTgGcxxIekQgtB0Yo+m8Uy
	3KcKQ3u/xw5rwy9ATNJmM=; b=E2thfZU8kfE07AvcBmo/tb7iHS8EhkBrl9nkgx
	QD57MQQ0oedbhdnb/l3KbayJfLVb4rdx9oh+wpMdXiw8wUx0yxAN3lreBaesPwmS
	rbcL8tHBrches/EpybNHlSNxNZEELIyYEG6Amxqh+bLkx0ECjwE6lsUXHd49/nup
	7VvHa4Dxi4c4l5A9x45FIoPiUTKdIb/m8mcVUb9kDBoN1UzcvC6Q5psIz/wKldNb
	At+1BBmpB+OgPvC9K/qFdRwsHlo4JLfWV1T/wezaBLLYdNMyuAGa8UTVfTjdx9MQ
	2XmKOIBPmo0GA3k09OCXU/mdxyOZPICSKx2gKo4A1Or7AJJw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5mknk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 24 Jun 2025 09:11:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55O9Bglu007114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 24 Jun 2025 09:11:42 GMT
Received: from [10.253.36.190] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 24 Jun
 2025 02:11:40 -0700
Message-ID: <8db66c86-3624-4e7b-a0de-91895d423214@quicinc.com>
Date: Tue, 24 Jun 2025 17:11:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        "Dikshita Agarwal
 (QUIC)" <quic_dikshita@quicinc.com>,
        "Qiwei Liu (QUIC)"
	<quic_qiweil@quicinc.com>,
        <quic_tingweiz@quicinc.com>, <quic_wangaow@quicinc.com>
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: add the firmware binary signed with Sectools v2 for qcs615
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bzxrocoFIM8Ot30Q1AhQjdS-r4Rq7By3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3OCBTYWx0ZWRfX8XCX8/nuEDJQ
 BBVcxxt5puWJtmEYMBmCosg3ILUW2QnDyQwelQDTlWSBi9oxpDIfvsqOZlfgZWpOV6xrwXiylUN
 eT3ZseXpm5k9X6CbB1qE+EoRK78eA3rsOacaU47ULuvMNzzzxFazQBe5i1Zf/vv8R2BNMZl4o64
 z4feMi84gUSH/enRJwUgr2x1xb0hrMDONQeQl18mRuxqNJCYLCCj4OP/LT2XnH7jzH+hEjMeaJY
 NKloDXcv3VEsq4tdIlJuuPWbBDd4S2vNEgxoPDCl5DyesWHYPSegp+OkkjWNc0zDIjV56vte0VR
 n1g18Y4v7erxtyMPfBlDQ3b8jAsRAbZY7LKa2Zb1vcQ5uif8msK+/zfbm+iB4216YN6FvV9w0mG
 jFaWy2b2TYOICjjr+0LDuVbR6H0qkeDNUAzyh3M5yKlS7Rr7DNJjLvdJF9JrDT18lG4p9lLn
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685a6bce cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8
 a=3OqITKfWQz-S2TCWFYUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: bzxrocoFIM8Ot30Q1AhQjdS-r4Rq7By3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=511 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240078

Hello

The following changes since commit dbfe16e9e8acc74c018c39e541bdc3669b37f301:

   Revert "qcom: Add sdx61 Foxconn vendor firmware image file" 
(2025-06-23 12:15:33 -0400)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
video-fw-qcs615

for you to fetch changes up to c319d6bea7a692fd9cee01d662dbbe8101e052f6:

   qcom: venus-5.4: add the firmware binary for qcs615 (2025-06-24 
14:30:27 +0530)

----------------------------------------------------------------
Renjiang Han (1):
       qcom: venus-5.4: add the firmware binary for qcs615

  WHENCE                      |   4 ++++
  qcom/venus-5.4/venus_s2.mbn | Bin 0 -> 919008 bytes
  2 files changed, 4 insertions(+)
  create mode 100644 qcom/venus-5.4/venus_s2.mbn

-- 
Best Regards,
Renjiang

