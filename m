Return-Path: <SRS0=BhDf=35=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA30CAC597
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Sep 2025 05:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 619F9C4CEF0; Thu, 18 Sep 2025 05:09:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FE37C4CEE7
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 05:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FE37C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3trST029779
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 05:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2bpK1l+Zyo6ftKp/vmOpl/JHYs+Unzzf2i9B5IVHqf8=; b=OKgecZ4P4Jyg2PVV
	MBDF8grYIPLX966K6TjhHp/t5tWyna5ABT91vBzd9x38+8999Q64PyXd3Vq/iuDu
	bvUKaTwLqLj/vnfBqcAK2XLpl59y+kEWSmp1aoFONFL2zFYiPgKDfP1vKrJpF2tV
	ThOCaDTfMViyqPSU2EKvR49AgSMegP5I7cuvfIk99mhViiL4xEB92xfs/tcRtRuO
	aqoi15R9p348Tm7i5gLV0uvJH8jI4Kh6P9fgTr6FsLvTlL+FQ3QIrOpZP6+Bp+hx
	056Xk9KIHK2qkbtAj74dHgLJnUfcq8SUWqdaz48UTEgpSJlhtifMJzNZDlbT+THq
	da9JdA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0vxhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 05:09:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58I59idi010961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 05:09:44 GMT
Received: from [10.50.3.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 17 Sep
 2025 22:09:42 -0700
Message-ID: <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
Date: Thu, 18 Sep 2025 10:39:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7a31nY0MuLAgNu443l_YecO63qk20mxk
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cb9419 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8
 a=NEAV23lmAAAA:8 a=6E-2ukh-oILIvdWJshsA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 7a31nY0MuLAgNu443l_YecO63qk20mxk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8XB0pswJbDp0
 B09LgX8WoCADqZ6L6sJlrLZA8GctCfU+JYYTJJGHIWfx6miyqJ/51upCsBNJYEhLY3BYloH5RKf
 f5guTnlBd9tnH8DRABCjPQqrYZzboXnJu1UKLxddUqk9CFYt/yyNpp1j0IFF/3kIAN9DYtTzDup
 T2qtxxfCx15HeCna92MzYLuu9ViVpi9n5zDJj4gdblaHPXcl9dS9G7HPF9EHaG8vswbtQVYVsf2
 0fkR0c5OI5qhR+v6iTb3Q/do4gGFftkBW3q1UH18TkR4JfitqhLdb+zGRGkm8g7kZEzmxMsW/gb
 VFdRo+PQnjmCo5CPROMSfYqKLb79WtkpsCbs3Bu2uzuetyJ6t7ZBd3t6qjj7KdFRjNiA1hzWzYh
 mVqGsqkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202



On 9/15/2025 8:08 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 06:27:57PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
>>> On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
>>>>>> Hi,
>>>>>>
>>>>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
>>>>>>
>>>>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>> video-fw-qcm6490-update
>>>>>>
>>>>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
>>>>>>
>>>>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
>>>>>> +0530)
>>>>>
>>>>> From the commit log:
>>>>>
>>>>>> Fix the firmware binary name to reflect the correct sectool being used
>>>>>> for signing. Also update the version to add some recent fixes.
>>>>>
>>>>> Using different sectoosl isn't a determining factor. It's the security
>>>>> profile and thus different MBN header versions.
>>>>>
>>>>> However, why is it important here? We have added vpu30_p4_s6 for the
>>>>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
>>>>> v7). Do we have such an issue with vpu20_p1_gen2?
>>>>
>>>> its the same case here, qcm6490 also required MBN header v6.
>>>
>>> But why do we need to mention that it's v6?
>>
>> we need this to be able to distinguish from the firmware binaries which
>> doesn't need v6 header, we are following the same for other SOCs as well.
> 
> Do we have anything to distinguish from?

As of now, we don't. But in future if a new firmware is needed for the same
hardware generation which doesn't need MBN header v6, how would be distinguish?

So either we keep the name with _v6 now or change it later when a new
firmware is uploaded which doesn't need v6.

> 
>>>>> Last, but not least, is this firmware used at all? The venus driver uses
>>>>> qcom/vpu-2.0/venus.mbn, which points to the old (non-gen2) file.
>>>>
>>>> its used here
>>>> https://github.com/qualcomm-linux/video-driver/blob/video.qclinux.0.0/platform/qcm6490/src/msm_vidc_qcm6490.c#L2423
>>>
>>> Hmm, why is it using a firmware file different from the upstream venus
>>> driver?
>>>
>>
>> qcm6490 uses gen2 based firmware while sc7280 (venus) uses gen1 based firmware.
> 
> This doesn't make sense, QCM6490 and SC7280 are the same thing.

yes, they are same hardware, while it is one of those fortunate hardware
generation which have the implementation in both gen1 and gen2 firmware
interfaces. Board qcm6490 enables video with gen2 variant, while sc7280
uses gen1. Given that they are same hardware, we use the same bindings.

Thanks,
Dikshita



> 
