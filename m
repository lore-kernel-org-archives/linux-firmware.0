Return-Path: <SRS0=bzb3=4K=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF91CCAC5BB
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Oct 2025 11:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE5EAC16AAE; Wed,  1 Oct 2025 11:45:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7C79C19421
	for <linux-firmware@kernel.org>; Wed,  1 Oct 2025 11:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A7C79C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5918hduj017910
	for <linux-firmware@kernel.org>; Wed, 1 Oct 2025 11:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RA5GMEDz9xDj1s7nx66sbiZjAnGuSs07UsjD3Kz2kA=; b=TsgtFbMkESWA9KxL
	us49HwX/cfNextIfWlROLbnLP17oVP1CqireBezwbzDbLg7clOzH59EUBTRPpnM0
	n8ltKZ/16vUjbCFwYAGLYoicNeoG1iCMCMdftL2zYiXS+XqNhfCn4yn2KCX/R1z1
	P6tAPia3mG7eP47hkmlK/Irj62fro5C3J63I3E0ohe+YElXNNtPjpBTEqt8Hc+dW
	4ZGIFmo06N5o+im2ERG2FFJjQChDwdfSmyuw+ILINfPRMiBvzmG3yNskcm2uYUCa
	rIo908u/aX+j6VdIk8AEr+27w6jm4p/TZU2FInf0dGo4exgiI1KEQlXQDmZszsn9
	APZVJA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hm5k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 01 Oct 2025 11:45:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 591BjkdR020595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 1 Oct 2025 11:45:46 GMT
Received: from [10.50.51.83] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 1 Oct
 2025 04:45:44 -0700
Message-ID: <2cb8a0cf-3fe4-2580-2c76-7169cec089a3@quicinc.com>
Date: Wed, 1 Oct 2025 17:15:34 +0530
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
References: <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <sg2txjdr4ugybqk4bvqokt4ebrt3uf4rdeut2n4qrqjdne2ifl@hlbbk5xruspq>
 <0e449b29-9a6e-d611-706f-bee8829a2df4@quicinc.com>
 <yavr2v3rbpybdn72spa7562wtbktmtkzefgzvpfhhslveml6tk@3evl5t4atuhr>
 <bfbac3e6-34ef-0049-1cf2-a6f4a7bb9f17@quicinc.com>
 <kuzmjcombgjlp2j3lesotcvlsdvxharaw2hxdvxtgkan2aaaco@245ykhkyhred>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <kuzmjcombgjlp2j3lesotcvlsdvxharaw2hxdvxtgkan2aaaco@245ykhkyhred>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfXyZjAZrldzMcJ
 e2AK5r8tbOJORHKu20E9muZC6UyZiW5HX0lolF/12tetKlrz0hp2Mu92sSFuuH+4YA/kxXEc9St
 OQKH2ImtL2cm5FsXSgIR4Y+L7a30FvaQeNNurBagypTsUSCK036n1GkeGNE5sAbs7NpEEdjc0ru
 +qR1SSThPpjvUD2OzBzgLIfg4h0rm8VaYf+u8quEsgiyiPipg5RzsbXCwV0OoL1n8yriF/hvtZ+
 GKutj6YDEyTSxcQ7epKyuEVe1hlTLabKZ+ubLQZlRE6vPB0e2FoKvwrvmAKQS0Vs46d7xeAnw9L
 P5hkRaaHXgRKP+h0ZikhdXPW5owXfcmP6T8e1fwf64HoeS+vT9ZcdYUwkYMRCMZYXWTmlYHR1K0
 FMZgcoeiF6AHH4odKM5qZzJEhL1tCw==
X-Proofpoint-GUID: NG4YyOncJxmmXarOpI5ElxfSr-C1CGY1
X-Proofpoint-ORIG-GUID: NG4YyOncJxmmXarOpI5ElxfSr-C1CGY1
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dd146a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8
 a=9qmRdWnYeDH8eoACn60A:9 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041



On 9/24/2025 9:49 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:12:12PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 9/19/2025 7:32 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 19, 2025 at 12:18:29PM +0530, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 9/18/2025 5:54 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Sep 18, 2025 at 10:39:20AM +0530, Dikshita Agarwal wrote:
>>>>>>
>>>>>>
>>>>>> On 9/15/2025 8:08 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Sep 15, 2025 at 06:27:57PM +0530, Dikshita Agarwal wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
>>>>>>>>>>>>
>>>>>>>>>>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
>>>>>>>>>>>>
>>>>>>>>>>>> are available in the Git repository at:
>>>>>>>>>>>>
>>>>>>>>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>>>>>>>> video-fw-qcm6490-update
>>>>>>>>>>>>
>>>>>>>>>>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
>>>>>>>>>>>>
>>>>>>>>>>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
>>>>>>>>>>>> +0530)
>>>>>>>>>>>
>>>>>>>>>>> From the commit log:
>>>>>>>>>>>
>>>>>>>>>>>> Fix the firmware binary name to reflect the correct sectool being used
>>>>>>>>>>>> for signing. Also update the version to add some recent fixes.
>>>>>>>>>>>
>>>>>>>>>>> Using different sectoosl isn't a determining factor. It's the security
>>>>>>>>>>> profile and thus different MBN header versions.
>>>>>>>>>>>
>>>>>>>>>>> However, why is it important here? We have added vpu30_p4_s6 for the
>>>>>>>>>>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
>>>>>>>>>>> v7). Do we have such an issue with vpu20_p1_gen2?
>>>>>>>>>>
>>>>>>>>>> its the same case here, qcm6490 also required MBN header v6.
>>>>>>>>>
>>>>>>>>> But why do we need to mention that it's v6?
>>>>>>>>
>>>>>>>> we need this to be able to distinguish from the firmware binaries which
>>>>>>>> doesn't need v6 header, we are following the same for other SOCs as well.
>>>>>>>
>>>>>>> Do we have anything to distinguish from?
>>>>>>
>>>>>> As of now, we don't. But in future if a new firmware is needed for the same
>>>>>> hardware generation which doesn't need MBN header v6, how would be distinguish?
>>>>>>
>>>>>> So either we keep the name with _v6 now or change it later when a new
>>>>>> firmware is uploaded which doesn't need v6.
>>>>>
>>>>> I'd say, if there is a need to distinguish something in future, then
>>>>> that something-else firmware should get a suffix. Unless we want to
>>>>> establish a rule to have the _sN suffix all the time and rename all the
>>>>> firmware to follow that rule.
>>>>
>>>> Currently we have named the firmware as vpu30_p4.mbn (kailua)
>>>
>>> V7 headers
>>>
>>>> vpu30_p4_s6.mbn (Monaco with mbn header v6), So i was following the same
>>>> convention for qcm6490 firmware as well.
>>>>
>>>> So if/when SM7550 is added upstream which is the same architecture as
>>>> qcm6490, but doesn't need MBN v6 header, the corresponding firmware could
>>>> be added as vpu20_p1_gen2.mbn.
>>>
>>> Doesn't need v6 header or will break if we use v6 header?
>>
>> yes, firmware load will fail if we use v6 header binary for SM7550.
> 
> Okay. So, we really need to add the _sN suffix to all firmware files.
> Would you please send a patch adding those (and adding all compat
> links).

Ok, I will send a patch soon to update all firmware binaries with having
_sN suffix.

Thanks,
Dikshita
> 
>>
>>>
>>>>
>>>> Thanks,
>>>> Dikshita
>>>>
>>>>>
>>>
> 
