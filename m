Return-Path: <SRS0=JXz2=PI=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BB4C3DA4A
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Aug 2024 09:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7CCAC32786; Fri,  9 Aug 2024 09:51:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C103FC32782
	for <linux-firmware@kernel.org>; Fri,  9 Aug 2024 09:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C103FC32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4797QPNB005883;
	Fri, 9 Aug 2024 09:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88vD8qOxvXQfJ0wRubpuNvlp/0wPZJH0IxxH+eInOZY=; b=CHzsW41c8PvagRZZ
	dP4fM4S27qgM1/fnJUAHHSw5Cytlm0Gokh/aLN26UoFl6MCOquj9AtxNdtgbd+Zy
	+Lwb2tbckGmKkvwTSvbkDWqq4xdsx/DL5gHaBTmYGjoKaGqt8RmoasBONMbqNphX
	leN+1cKO+Pgtf7bHcQ/gQi0WxXFIcNGinl/1n1JADTATeb6QPynuQ9a1eCHR7gc7
	A1i9LFJEx6IubGr/iqK7onZaYavQnQGi82rCnBjD82e6079QRqujFbGTczuOxLq0
	u8PuFg1vKRJT3hMeux3y9cAHvaz06cTqkUUv0aehBiWXTxAiTAVPdzCvnA09yycF
	xipHkQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40weqf8cr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 09:51:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4799pi2Q005236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Aug 2024 09:51:44 GMT
Received: from [10.216.10.180] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 02:51:42 -0700
Message-ID: <08dc4b92-5f98-8408-1111-fc3bccb03ae8@quicinc.com>
Date: Fri, 9 Aug 2024 15:21:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] qcom: update path for video firmware for vpu-1/2/3.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-firmware@kernel.org>
CC: <quic_vgarodia@quicinc.com>
References: <1723188568-20342-1-git-send-email-quic_dikshita@quicinc.com>
 <7A614880-F6AA-435F-9504-B9731773DF58@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <7A614880-F6AA-435F-9504-B9731773DF58@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aDU-gpRE8HgJGAJUwAD2-XBBFUn2Hmv9
X-Proofpoint-GUID: aDU-gpRE8HgJGAJUwAD2-XBBFUn2Hmv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_06,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090072



On 8/9/2024 1:48 PM, Dmitry Baryshkov wrote:
> On August 9, 2024 2:29:28 PM GMT+07:00, Dikshita Agarwal <quic_dikshita@quicinc.com> wrote:
>> - Rename qcom/vpu-3.0/ to qcom/vpu/ to have common sub-folder for
>>  new firmware files.
>> - Move firmware files from vpu-1.0/ and vpu-2.0/ to vpu/ with
>>  proper names for firmware binaries and provide backwards-compatible
>>  links.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>> Changes since v1:
>> - Updated firmware binary names to better names following
>>   common convention.
>> - Used Link: tag in WHENCE to create symlinks.
>>
>> WHENCE                                          |  10 ++++++----
>> qcom/{vpu-2.0/venus.mbn => vpu/vpu20_p1.mbn}    | Bin
>> qcom/{vpu-1.0/venus.mbn => vpu/vpu20_p4.mbn}    | Bin
>> qcom/{vpu-3.0/vpu30_4v.mbn => vpu/vpu30_p4.mbn} | Bin
>> 4 files changed, 6 insertions(+), 4 deletions(-)
>> rename qcom/{vpu-2.0/venus.mbn => vpu/vpu20_p1.mbn} (100%)
>> rename qcom/{vpu-1.0/venus.mbn => vpu/vpu20_p4.mbn} (100%)
>> rename qcom/{vpu-3.0/vpu30_4v.mbn => vpu/vpu30_p4.mbn} (100%)
>>
>> diff --git a/WHENCE b/WHENCE
>> index 0a737b6..edee7a9 100644
>> --- a/WHENCE
>> +++ b/WHENCE
>> @@ -5961,12 +5961,13 @@ File: qcom/venus-6.0/venus.mbn
>>
>> Version: VIDEO.VE.6.0-00049-PROD-1
>>
>> -File: qcom/vpu-1.0/venus.mbn
>> -Link: qcom/vpu-1.0/venus.mdt -> venus.mbn
>> +File: qcom/vpu/vpu20_p4.mbn
>> +Link: qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
>>
>> Version: VIDEO.VPU.1.0-00087-PROD-1
>>
>> -File: qcom/vpu-2.0/venus.mbn
>> +File: qcom/vpu/vpu20_p1.mbn
>> +Link: qcom/vpu-2.0/venus.mbn -> ../vpu/vpu20_p1.mbn
>>
>> Version: VIDEO.VPU.2.0-00049-PROD-1
>>
>> @@ -5979,7 +5980,8 @@ https://developer.qualcomm.com/hardware/dragonboard-410c/tools
>>
>> Driver: iris - Qualcomm Iris video codec accelerator
>>
>> -File: qcom/vpu-3.0/vpu30_4v.mbn
>> +File: qcom/vpu/vpu30_p4.mbn
>> +Link: qcom/vpu-3.0/vpu30_4v.mbn -> ../vpu/vpu30_p4.mbn
> 
> Since there was no linux-firmware release with qcom/vpu-3.0 subdir, can we drop this extra symlink? I don't think there is a need to be compatible with the interim git revisions.
> 
> Other than that LGTM, thank you!

Sure, will remove the link for vpu-3.0 in next revision.

Thanks,
Dikshita
> 
> 
> 
>>
>> Version: VIDEO.VPU.3.1-0076
>>
>> diff --git a/qcom/vpu-2.0/venus.mbn b/qcom/vpu/vpu20_p1.mbn
>> similarity index 100%
>> rename from qcom/vpu-2.0/venus.mbn
>> rename to qcom/vpu/vpu20_p1.mbn
>> diff --git a/qcom/vpu-1.0/venus.mbn b/qcom/vpu/vpu20_p4.mbn
>> similarity index 100%
>> rename from qcom/vpu-1.0/venus.mbn
>> rename to qcom/vpu/vpu20_p4.mbn
>> diff --git a/qcom/vpu-3.0/vpu30_4v.mbn b/qcom/vpu/vpu30_p4.mbn
>> similarity index 100%
>> rename from qcom/vpu-3.0/vpu30_4v.mbn
>> rename to qcom/vpu/vpu30_p4.mbn
> 
> 
