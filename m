Return-Path: <SRS0=it3Q=ZI=quicinc.com=quic_renjiang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9F9C77B7F
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Jun 2025 01:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DD46C4CEF0; Wed, 25 Jun 2025 01:43:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F724C4CEE3
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 01:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F724C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ODvA91000866
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 01:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	19mVoFLHd75LdHB2FD6lshSuVsVdd2vrvS7UN+xVoMM=; b=NOnkfvwEaRIXeTsy
	9yhxWX/esOCTvobTs8Osg+yV+o54Pwf8DDfN53iRbyOzx79+S/o5ME7K8qlfib/5
	G6XHM4n4lNL+BiGu7KzgyBNTNPZuZ0V/MjbwzJ/0n0Mv7qfC0td5B/4/S1L6SSkJ
	4H8AVGY1mrKGad2VvFt/Euspzh3TJuV4o7lKom4nHJ7u+Om8Fhxkq9nMIAdk3zJx
	gtW782b0g1UT4rMf38MMS7+bEU/2t4z8R//F9Gt7m2Z9LogCOD6B5N7pY5b26sVt
	UkUWEsRq2IiakMQ394hp6g/1dsWO6Z8muGlIIN/LqmeTKV+P/kqZnuGHgseW1kLu
	khPjpA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmqrv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 01:43:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P1hJbC011229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 25 Jun 2025 01:43:19 GMT
Received: from [10.253.36.190] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 24 Jun
 2025 18:43:17 -0700
Message-ID: <c1f08c44-174c-4da2-8ae5-9969c27404b6@quicinc.com>
Date: Wed, 25 Jun 2025 09:43:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: add the firmware binary signed with Sectools v2 for qcs615
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
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <ae4m27szjv5rp6d343l2pjxvbbcr42whxyuwq2bfvxxpq6zvjn@kmbtwbbijf7t>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TFYPtkMA73lZ1C9xEoERJiGJdf8kEM8_
X-Proofpoint-ORIG-GUID: TFYPtkMA73lZ1C9xEoERJiGJdf8kEM8_
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685b5438 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8
 a=pVIuJW2HPxwqMCTq2UYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAxMiBTYWx0ZWRfXx1MVBpjatAwY
 8XUYn2jk0990XEHptt/Ytl4UnY9RN03Mf5Ovo3twCXPO2P6R/2bP6i8qYdUlzEI0KXmAdF/XAVh
 OiykoJa4+KKHzyXKy0izMxV/zX6/B8mWKV0QG9zdbiNYeFDfHvR/yqFNGqsCjp16ZcFr6EbmAFe
 B++wtnC7kw/zn3oa+cnFurJNisMqBZ2CREr/N8Zx8LjRBQi9rbOxypTxna3b9RdBtBecoHc3haQ
 JS9JeGwVaiThS9dtsCEaptWylZyxM7nPkpdXzmctkfymsrIhnwUqmvmljjGlE5UgiI6Yveu7EJG
 nxOZAsoxQswTUmUZIEOMLK5E3VyXclmvnYtOdGfIQWkrPp1ui4fjHqms0zCtusTT52JXH2QpCe0
 4g7CEfhsit/0BREJCWRQCUkNlnokq/Abyc+hC76YDanVdV7SFXKacfXu0dLuxzXsHJPkK8/q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=664 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250012


On 6/25/2025 6:39 AM, Dmitry Baryshkov wrote:
> On Tue, Jun 24, 2025 at 05:11:37PM +0800, Renjiang Han wrote:
>> Hello
>>
>> The following changes since commit dbfe16e9e8acc74c018c39e541bdc3669b37f301:
>>
>>    Revert "qcom: Add sdx61 Foxconn vendor firmware image file" (2025-06-23
>> 12:15:33 -0400)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> video-fw-qcs615
>>
>> for you to fetch changes up to c319d6bea7a692fd9cee01d662dbbe8101e052f6:
>>
>>    qcom: venus-5.4: add the firmware binary for qcs615 (2025-06-24 14:30:27
>> +0530)
> Well... No. Existing qcom/venus-5.4/venus.mbn already supports SOC_ID
> 6007, it uses the same MBN header (6) and PSS/SHA256 signature scheme.
> Please describe actual differences.
>
> Moreover, you are trying to push a newer version of the firmware
> under the cover of providing a file with different signature. Even if
> there is a need for a different signature, original firmware should also
> be upgraded to the same version.
>
> So... NAK.

Got it. Thanks for your comment.
The qcom/venus-5.4/venus.mbn is used for both QCS615 and SC7180.
However, the TZ on QCS615 has been upgraded and now requires signing
with Sectools v2, as mandated by the updated TZ. On the other hand,
the TZ on SC7180 has not been upgraded and still requires signing with
Sectools v1.

-- 
Best Regards,
Renjiang

