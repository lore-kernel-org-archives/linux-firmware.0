Return-Path: <SRS0=+0ZJ=2G=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08047C83F26
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Jul 2025 08:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3746C4CEF6; Fri, 25 Jul 2025 08:55:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DA75C4CEE7
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 08:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9DA75C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8SWbv018081
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 08:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3jBPz5f/b9l8z1J+giNPvj
	wrUiswCS8FLiiKlAbZh00=; b=HIkhXguGYLgdNwDDcsiRsx31SUWuZYDS8rkx3r
	w1u84U1WEV4tSo54PFDxhLUOnmdi1ubjn6C4kpLL8Pm5iQ0+ClV2xuwNJ5HjdIRw
	ZcDxVneVMNQ6a3LbwQ9jksT3ujln6qHE1Vv+y08kkCCtvkbl2EjlLS96odbaYu4y
	3DIQMMFlzOiETu9M9njy0XO/tSnCzg2nJNw944m7pJjwzH53wPUPyxmMbTHBTnSB
	PZd0gIfyk34YD57qutiHlWtsHIGxulRmZRXheqFMnHmhQz5tb61xxf9P7IkEYZkE
	bGn9xkC6ldm75BffC9CvE0CwemfIjOVsdd6n5RIUhi4wGJJw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2s1en9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 08:55:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56P8t2m2015689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 08:55:02 GMT
Received: from [10.50.61.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 25 Jul
 2025 01:55:00 -0700
Message-ID: <060c5bc3-8e18-e7ee-2c97-695b198f7b7a@quicinc.com>
Date: Fri, 25 Jul 2025 14:24:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: qcom: Add firmware binary for SM8750
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: S6SdH9Pyqu5ehxbE8Moa6Nq2tPbWnDC1
X-Authority-Analysis: v=2.4 cv=IZyHWXqa c=1 sm=1 tr=0 ts=68834667 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8
 a=jbkJ8aI3qE1Ofz_b-3cA:9 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: S6SdH9Pyqu5ehxbE8Moa6Nq2tPbWnDC1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3NSBTYWx0ZWRfXzYx1w5+ABKuS
 Up+J/P/QfQwSeiViQUhcG0eRL8E+yMREe1yb+HoN89IqBKbGF8uWuj5QVteflHJTT9iDROAaII9
 IuswaBcMKLw+13XUUMM1FmnDqb3DB9Ivr+5SNbLbBwBwCtCugcCTkbDKDLSNP6Egj0rDuLwQZr5
 ugMgsOxQ8NY4g1pldd1LA+HEpsZ1qt1MHGSfNMkbYTlW3xlTslM8hbwtelEaRc7weIObM79X0Xe
 BxCqL0z0a+SNGoJz7J9jKfx2AfA37KZl7pw8/+0jLALEMcGXhBJmYAHuVEiT/MLwuTgcBbSC7Io
 1YfyoghI36ajlqpcHFYOk0p+BrRlhn0JjMA1ItGOcq8n9MfuTTKse5zmN9FetUBOL349Jq7AI8O
 D/NhUbrM/MkEx5BQkRe8x0HwSDsKo9ZMk9fGmuVMEeQgVAAEf61umK8jgzvwIaW/jZzuGqdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 mlxlogscore=636 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250075

Hi,

The following changes since commit 25ea3ecfb5418e5674137a5442727128e23061fe:

  Merge branch 'amd-staging' into 'main' (2025-07-24 22:34:03 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-sm8750

for you to fetch changes up to 530f283206034b20ed791ef379f4394ca21fe63d:

  qcom: Add firmware binary for SM8750. (2025-07-25 11:04:59 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: Add firmware binary for SM8750.

 WHENCE                |   4 ++++
 qcom/vpu/vpu35_p4.mbn | Bin 0 -> 2409160 bytes
 2 files changed, 4 insertions(+)
 create mode 100644 qcom/vpu/vpu35_p4.mbn


Thanks,
Dikshita
