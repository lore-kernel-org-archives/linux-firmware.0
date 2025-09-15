Return-Path: <SRS0=UAI4=32=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10155CAC597
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Sep 2025 12:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1055C4CEF5; Mon, 15 Sep 2025 12:58:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99AE2C4CEF1
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 12:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99AE2C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FlhY005788
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 12:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c9sgf4NYZWS3OpXUmD7NLsZYVFOk7FNiYIeR1M4tvNw=; b=mO+74ExkHaw6twqn
	clcSczFEk2C7sQaqEeF8wc6sPBJc4FgHg0uFw3t9XVXRgNfDAeO/50m6EK6DJH2F
	SjayzgOO2QDeTrr3OrYyQEbT0HElThcrT0jEJXKL7YPH6mcIy+oS1xfQF3jGnrIY
	39LDi8AlVC8SVO1tIIlhyI6eGDMg8ArciGTS/vMbxzL5ot4TntzaVucYjEtPO0fn
	lj16uXUSUDGilcFiNYAtVjZAMw/SRBP/CE1Z9yKvr2F/2wsK40cq9Zd8tXnH8FwF
	fqRBOM/rHZ1YCPdg9ZFSguLcse0hrqdKGTatLxi806tqAWwE281Ztu0aQjng7LPL
	GST9Xg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snmrwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 12:58:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58FCw36R010810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 12:58:03 GMT
Received: from [10.50.6.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 15 Sep
 2025 05:58:01 -0700
Message-ID: <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
Date: Mon, 15 Sep 2025 18:27:57 +0530
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
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c80d5b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8
 a=NEAV23lmAAAA:8 a=9VJIB-k5IGYPrFFuyocA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: qKJip8vuP5VVm2221yCOidCwrasGgeR3
X-Proofpoint-GUID: qKJip8vuP5VVm2221yCOidCwrasGgeR3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX3XHGsDb+Wtbx
 viTBOo53V9T+aASm2hDVp0lL3gFTuiANWWnU7ktWRvm9Eh3kKH1tfAb5dkGjJEtbRxW5vqqK9TJ
 RMl5Zur/3wW2UW9oS+gbfWfDFSgyLKCRHPlH3HPMwDV0cpgyxc2s3EpH/Gr1yX11ljorIPzLKxo
 9xaSGfMcfp4AqRAVHzZplQXUdDb7Gx13BHPAtIq6e+4we1T2mxwOcjZ1K/8vkfTHKidwfaG4A+b
 XWoDWMBJ5B+oyCo9sbPf+Nn0+qCU8SWuwlyo6r7LqUX4cEsKpjw0sZjWpwmqp/8Q9JF9ggs8pa8
 gjM5DauC7n878LJ58ugzzMkcQD0ud+01F9cLHB7nplocvy/uEL3Ad/OU4JNlh1ID5fQKhCqF5PF
 ijDcAVl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040



On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
>>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
>>>> Hi,
>>>>
>>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
>>>>
>>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> video-fw-qcm6490-update
>>>>
>>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
>>>>
>>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
>>>> +0530)
>>>
>>> From the commit log:
>>>
>>>> Fix the firmware binary name to reflect the correct sectool being used
>>>> for signing. Also update the version to add some recent fixes.
>>>
>>> Using different sectoosl isn't a determining factor. It's the security
>>> profile and thus different MBN header versions.
>>>
>>> However, why is it important here? We have added vpu30_p4_s6 for the
>>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
>>> v7). Do we have such an issue with vpu20_p1_gen2?
>>
>> its the same case here, qcm6490 also required MBN header v6.
> 
> But why do we need to mention that it's v6?

we need this to be able to distinguish from the firmware binaries which
doesn't need v6 header, we are following the same for other SOCs as well.

> 
>>
>>>
>>> Last, but not least, is this firmware used at all? The venus driver uses
>>> qcom/vpu-2.0/venus.mbn, which points to the old (non-gen2) file.
>>
>> its used here
>> https://github.com/qualcomm-linux/video-driver/blob/video.qclinux.0.0/platform/qcm6490/src/msm_vidc_qcm6490.c#L2423
> 
> Hmm, why is it using a firmware file different from the upstream venus
> driver?
> 

qcm6490 uses gen2 based firmware while sc7280 (venus) uses gen1 based firmware.

>>
>>>
>>>>
>>>> ----------------------------------------------------------------
>>>> Dikshita Agarwal (1):
>>>>       qcom: vpu: fix the firmware binary name for qcm6490
>>>>
>>>>  WHENCE                                               |   4 ++--
>>>>  qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_s6_gen2.mbn} | Bin 2036328 ->
>>>
>>> It should be vpu20_p1_gen2_s6 then.
>>
>> Ok.
>>
>>>
>>>> 2031844 bytes
>>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>>  rename qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_s6_gen2.mbn} (73%)
>>>>
>>>>
>>>> Thanks,
>>>> Dikshita
>>>
> 
