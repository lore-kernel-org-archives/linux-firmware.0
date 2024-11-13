Return-Path: <SRS0=sdSI=SI=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAEAD41C03
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 06:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE31AC4CED5; Wed, 13 Nov 2024 06:14:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E862EC4CECD
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 06:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E862EC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMStIu017641;
	Wed, 13 Nov 2024 06:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSh3yKdsHgIfrwE2F5cMD2VcxgoubYOGXZyguuEtZ4g=; b=J5e8QMHl+XqvKBgk
	dM1JLrCeVF83J0fyZnymIx8iamVPF4/ZlVWAdhQ3vmYW2WmftozAkP/lKkbKfLvH
	FeWnf9tLv/hbn40FZD4seRlwh/RtV5Mw1AJB9yRmZug0r0DbR0XM95jYUB2gPUaD
	RjyVBSMuXrLOCvYcrAbycbUht7lJZP0dlhj7LFMOktRUr6ihVgNyWad1L+h7lhAW
	bs4pYTkIAAVvT+l6QGIq88ewKL6mbab1oa7PELPL6beGmsLZfc6nfZOum3XMr/Xt
	Ez4ONhAJIBJY4zYWN5TzgyMF/mpt9I6/0woGZe6NuugqN2/xUAYXw2FhC8sSMmgn
	IERk+A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t1189rf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 06:14:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD6ENlP027792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 06:14:23 GMT
Received: from [10.50.46.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 22:14:21 -0800
Message-ID: <2bab11a5-ad3b-d9c4-f3ca-f077a0a3ceaf@quicinc.com>
Date: Wed, 13 Nov 2024 11:44:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: update venus firmware file for SC7280
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>
References: <6353f092-9816-8221-1233-c423767320ac@quicinc.com>
 <25xjjmnyg55hs7mqnqtk6tae26lr2r33qfon6rfimnonqzoitv@3bcpd4ybqqtk>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <25xjjmnyg55hs7mqnqtk6tae26lr2r33qfon6rfimnonqzoitv@3bcpd4ybqqtk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KRb-i3j3zKp1H5Y-HGoETrS4Oh4_C-Eo
X-Proofpoint-GUID: KRb-i3j3zKp1H5Y-HGoETrS4Oh4_C-Eo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=874 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130054



On 11/13/2024 11:15 AM, Dmitry Baryshkov wrote:
> On Wed, Nov 13, 2024 at 09:54:51AM +0530, Dikshita Agarwal wrote:
>> Hello,
>>
>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
>>
>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> video-fw-update-SC7280
>>
>> for you to fetch changes up to e95e9e07a7983f9e0e12fe9a6c185cf5b07fe2f8:
>>
>>   qcom: update venus firmware file for SC7280 (2024-11-13 09:48:13 +0530)
>>
>> ----------------------------------------------------------------
>> Dikshita Agarwal (1):
>>       qcom: update venus firmware file for SC7280
> 
> Commit log says: "Update WHENCE version string to match with updated fw
> version string.", however there is no WHENCE update.
> 
Oh, Seems missed to add that in the change.
I have updated the commit with WHENCE file now.

The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:

  Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-update-SC7280

for you to fetch changes up to aeede7afb7a186b62f9e1f959c33fd5f2dea0f7a:

  qcom: update venus firmware file for SC7280 (2024-11-13 11:40:36 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: update venus firmware file for SC7280

 WHENCE                |   2 +-
 qcom/vpu/vpu20_p1.mbn | Bin 2031620 -> 2026452 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

Thanks,
Dikshita
> 
>>
>>  qcom/vpu/vpu20_p1.mbn | Bin 2031620 -> 2026452 bytes
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>
>> Thanks,
>> Dikshita
>>
> 
