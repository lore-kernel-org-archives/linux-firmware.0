Return-Path: <SRS0=mbKe=36=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE7BCAC59A
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Sep 2025 06:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92D4AC4CEF1; Fri, 19 Sep 2025 06:56:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CE1CC4CEF0
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 06:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0CE1CC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J6jWH3029503
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 06:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s6f/Xc02hXXK8j1O1HYj2P+4kV+fUzdtiJef0OsEIw4=; b=VzRu8ZlHvLnADkGh
	4ikMRV1mdEDao8tnC+BzZ9LV94KQI49GaFP0DzF6rijeDC7LDuw5WGpwbaIz1Rbl
	9zsrBGwzAQI/PskHT8mSCglAtMmIcZpFbuNCFZ+0ddswvIl4ST7Wy/TWADi+KBE6
	3QMWlzNeMX/WuW2XCufMyWVnoMieOK+5GLVEkN1uz+5LzymjkrD3cTaMOmDnQo9N
	gLfEWNMBIAvG7kNPjRpVUmwCOR598Yqm5qlKdmiNXicUl3y5SwQ3pELoaT59ef+B
	lMhTudQgAEYyxYFyZdUdNn6vW/XLhv1Bxgn/muyxyqRmhN19oibiU/YLkIrhJ5vW
	1nOCvA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy11a5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 06:56:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58J6u8Zw003130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 06:56:08 GMT
Received: from [10.50.32.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 18 Sep
 2025 23:56:06 -0700
Message-ID: <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
Date: Fri, 19 Sep 2025 12:26:03 +0530
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
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Hp3xq7uC4NFeCEnt3kt-uQtAR1cDkah1
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68ccfe89 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8
 a=NEAV23lmAAAA:8 a=cLkgMab7CydXjIhGkhcA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: Hp3xq7uC4NFeCEnt3kt-uQtAR1cDkah1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyXR9M7MkzQB1
 JVa2OUfhvvRzXnaIZ8EZQ1D72fBqoMnkYK9aq2EtkbyNYn2tmt5Om7LALaLo4m6A+MIZBYJkXAr
 TwWvHe06skYipgaTppaGD6FrVGXXOQPq9nPzrzsaeN/4o9ZJ72ahZzu498ZtFYl3ioB16XTl11c
 CX4gtfI2lvv9MAWL4BWg596vyep0JNiylFn2O4T1x7G7LJQJX23kqufmkDltkuxm9mSwloV1H4j
 cQKioaBssGRrOw58nRiEOH3Dv2k4lESM94OWaSYOHu2shoWGxZtFm/clWLXpOP1FpLhgkuLp31C
 PUCnQidzbUF8XA0ysnh1m2eO8Ex7q3R8gti/Cyq50V8FFlYXIvtveO718IdHhMHZQ5yuJYJO4OT
 nQ0r9ZI+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202



On 9/18/2025 5:47 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 18, 2025 at 10:39:20AM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 9/15/2025 8:08 PM, Dmitry Baryshkov wrote:
>>> On Mon, Sep 15, 2025 at 06:27:57PM +0530, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
>>>>>>
>>>>>>
>>>>>> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
>>>>>>>>
>>>>>>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
>>>>>>>>
>>>>>>>> are available in the Git repository at:
>>>>>>>>
>>>>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>>>> video-fw-qcm6490-update
>>>>>>>>
>>>>>>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
>>>>>>>>
>>>>>>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
>>>>>>>> +0530)
>>>>>>>
>>>>>>> From the commit log:
>>>>>>>
>>>>>>>> Fix the firmware binary name to reflect the correct sectool being used
>>>>>>>> for signing. Also update the version to add some recent fixes.
>>>>>>>
>>>>>>> Using different sectoosl isn't a determining factor. It's the security
>>>>>>> profile and thus different MBN header versions.
>>>>>>>
>>>>>>> However, why is it important here? We have added vpu30_p4_s6 for the
>>>>>>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
>>>>>>> v7). Do we have such an issue with vpu20_p1_gen2?
>>>>>>
>>>>>> its the same case here, qcm6490 also required MBN header v6.
>>>>>
>>>>> But why do we need to mention that it's v6?
>>>>
>>>> we need this to be able to distinguish from the firmware binaries which
>>>> doesn't need v6 header, we are following the same for other SOCs as well.
>>>
>>> Do we have anything to distinguish from?
>>
>> As of now, we don't. But in future if a new firmware is needed for the same
>> hardware generation which doesn't need MBN header v6, how would be distinguish?
>>
>> So either we keep the name with _v6 now or change it later when a new
>> firmware is uploaded which doesn't need v6.
>>
>>>
>>>>>>> Last, but not least, is this firmware used at all? The venus driver uses
>>>>>>> qcom/vpu-2.0/venus.mbn, which points to the old (non-gen2) file.
>>>>>>
>>>>>> its used here
>>>>>> https://github.com/qualcomm-linux/video-driver/blob/video.qclinux.0.0/platform/qcm6490/src/msm_vidc_qcm6490.c#L2423
>>>>>
>>>>> Hmm, why is it using a firmware file different from the upstream venus
>>>>> driver?
>>>>>
>>>>
>>>> qcm6490 uses gen2 based firmware while sc7280 (venus) uses gen1 based firmware.
>>>
>>> This doesn't make sense, QCM6490 and SC7280 are the same thing.
>>
>> yes, they are same hardware, while it is one of those fortunate hardware
>> generation which have the implementation in both gen1 and gen2 firmware
>> interfaces. Board qcm6490 enables video with gen2 variant, while sc7280
>> uses gen1.
> 
> What does it mean? There is no board-level difference nor SoC-level
> difference.
> 
>> Given that they are same hardware, we use the same bindings.
> 
> Now consider the OEM having the fused device and OEM-signed binary. How
> would it work? Will venus work if it's a gen2 firmware? No. Will your
> driver work if it's gen1 firmware? Also no. You can't randomly change
> the firmware interface in the middle of the platform lifecycle without
> providing a back-compatibiltiy.

I understand your concern. To clarify, we are not removing support for the
existing Gen1 firmware, so backward compatibility remains intact.

We are simply adding support for Gen2 firmware for this architecture. As a
result, QCM6490 will support both Gen1 firmware (with the Venus driver) and
Gen2 firmware (via Qualcomm's video driver [1]).

Additionally, as part of our plan to transition all Venus-supported targets
to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 firmware
to maintain backward compatibility.

[1]: https://github.com/qualcomm-linux/video-driver

Thanks,
Dikshita
> 
