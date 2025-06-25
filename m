Return-Path: <SRS0=it3Q=ZI=quicinc.com=quic_renjiang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1010C77B7C
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Jun 2025 02:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B150C4CEF1; Wed, 25 Jun 2025 02:00:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01583C4CEF0
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 02:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01583C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OErHZO022133
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 02:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+NlcZrMyJhCnN+wB5CLgZOVCCglFr9ceeQu4S0Mdzo=; b=b3NIRr175xIJ8Me6
	RQCpDv3gXDeiAJ43s+qQpTOAJAygFOgI0lhn+fah56xXarfhXt63lbULEe2zfIqF
	DahRGcTHn1wvutmFipyeVe/OzXJdqmTluv7+MQl4sHb+Alh2FiQW+E9sNw9fTcs6
	WiTj/8kcV685XS2w2pnvCH+VvOAWBGKya3lwTAoiT7BjznbT6X7alMegVKx8L6sZ
	uxGYqud4dnu/CPRC/+D5mWpNZOLxpw5dSr1pvppMrPPIfesZ8GuoG9Z6Dx9Hv+Mm
	Kz5e6xEJ9Eol+OQYWHz2uxr1KVyOudAXQWoIjAYltUmZt3ub0Q/vU9qRbKHr6wSc
	A8Lf9g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwvd8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 02:00:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P20Gii013541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 02:00:16 GMT
Received: from [10.253.36.190] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 24 Jun
 2025 19:00:14 -0700
Message-ID: <344a13e0-47e1-47ec-bc36-e5b576e1565c@quicinc.com>
Date: Wed, 25 Jun 2025 10:00:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: add the firmware binary signed with Sectools v2 for qcs615
From: Renjiang Han <quic_renjiang@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        "Dikshita Agarwal (QUIC)"
	<quic_dikshita@quicinc.com>,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        <quic_tingweiz@quicinc.com>, <quic_wangaow@quicinc.com>
References: <8db66c86-3624-4e7b-a0de-91895d423214@quicinc.com>
 <ae4m27szjv5rp6d343l2pjxvbbcr42whxyuwq2bfvxxpq6zvjn@kmbtwbbijf7t>
 <c1f08c44-174c-4da2-8ae5-9969c27404b6@quicinc.com>
Content-Language: en-US
In-Reply-To: <c1f08c44-174c-4da2-8ae5-9969c27404b6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4SUnaiwSj9fNpeuYIyrzKfmpezPKi5y9
X-Proofpoint-ORIG-GUID: 4SUnaiwSj9fNpeuYIyrzKfmpezPKi5y9
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685b5834 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8
 a=bCKZ8QgJnY1ZR2K2PsAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAxNSBTYWx0ZWRfXx5VdKVlLFUV9
 xqNocssW9gTtjUeRvgw2M+Fh7yyVYAv1nvZk30ojLukAtrQ/CKQ0UJ9lWl0nBQg+FOXV2WXlJqK
 VnhyysgXkxbLGYuH1YigoJh6wmZnzCNoNX17qLX3BsGVnLH2Kv5k6D8qNZjD+73Zt3MgNZpK6lK
 sV96CLpEI2Oh/isXndV2SXFa4ANGoIR5jYDmsvXF0ZjweX64mmxKmaxEk+DiTgvNp9zLWMUGcDU
 FjkboXkcp5/XdxdJNrooT9n/G2BMIYIzqPvJgqNpGpa7Gzrdh2Kog4UZa2om1g2jv/hCp89xhm1
 EBPSAu05xMiRWW4ee1iKI2nX9ZcAunUUmPlDzIAC50FX7HiIc5BRQPaZvuiFspu+3T+vuBDefjy
 tRDfntsCjbY/fmpCr7GHNFX2EsfsP4elm+jNsovm/s6Q9KpO+yTfyy3tswcAK5gk1e/i550X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=773 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250015


On 6/25/2025 9:43 AM, Renjiang Han wrote:
>
> On 6/25/2025 6:39 AM, Dmitry Baryshkov wrote:
>> On Tue, Jun 24, 2025 at 05:11:37PM +0800, Renjiang Han wrote:
>>> Hello
>>>
>>> The following changes since commit 
>>> dbfe16e9e8acc74c018c39e541bdc3669b37f301:
>>>
>>>    Revert "qcom: Add sdx61 Foxconn vendor firmware image file" 
>>> (2025-06-23
>>> 12:15:33 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>> https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>> video-fw-qcs615
>>>
>>> for you to fetch changes up to 
>>> c319d6bea7a692fd9cee01d662dbbe8101e052f6:
>>>
>>>    qcom: venus-5.4: add the firmware binary for qcs615 (2025-06-24 
>>> 14:30:27
>>> +0530)
>> Well... No. Existing qcom/venus-5.4/venus.mbn already supports SOC_ID
>> 6007, it uses the same MBN header (6) and PSS/SHA256 signature scheme.
>> Please describe actual differences.
>>
>> Moreover, you are trying to push a newer version of the firmware
>> under the cover of providing a file with different signature. Even if
>> there is a need for a different signature, original firmware should also
>> be upgraded to the same version.
>>
>> So... NAK.
>
> Got it. Thanks for your comment.
> The qcom/venus-5.4/venus.mbn is used for both QCS615 and SC7180.
> However, the TZ on QCS615 has been upgraded and now requires signing
> with Sectools v2, as mandated by the updated TZ. On the other hand,
> the TZ on SC7180 has not been upgraded and still requires signing with
> Sectools v1.
>
Also, if the firmware on QCS615 is still signed with Sectools v1,
the venus.mbn will be signed with the wrong PK hash in the build,
which leads to image loading failure on secure devices.

-- 
Best Regards,
Renjiang

