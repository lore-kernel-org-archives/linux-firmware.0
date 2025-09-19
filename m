Return-Path: <SRS0=mbKe=36=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B353CAC592
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Sep 2025 06:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FFE9C4CEF7; Fri, 19 Sep 2025 06:48:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C919C4CEF1
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 06:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C919C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J1GBgT007556
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 06:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BzoUrrgazw/6+TmgoWz7ZwxBxvWN0/jMZGS9QrLeGiU=; b=N/hjeAbJOYiC+LIb
	a8NSeBRttZGK/YyKisuxob5d4a4veCPY6lp7N3LsSJr/p1jvelnAAwiGLayPpQNZ
	6jHAWw0fEihyYh3iXugYKimSIqdugs9SLNKoujapakKpAaD2L8HBJp90wJLrIeUM
	QUEfGWp3shR9NfFEjG2H/IzNb1TXsZWzU9mXgN8me9H/y6uxvbpHmiHuyRg98w77
	uDgQeEn6RvycTSkyGEajp20yjw15L33/KfmqZb27zFCVTquuOTCS6VmmTBFsk9Bt
	+HlZObTzm/b/yxUKZ36P6IxgcsJK+Ab/6W/X0zD8vhwy89gQwk6rpG6ZLf6qgnmr
	bZTpJg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebeuu12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 06:48:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58J6mk6R020038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 06:48:46 GMT
Received: from [10.50.32.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 18 Sep
 2025 23:48:44 -0700
Message-ID: <0e449b29-9a6e-d611-706f-bee8829a2df4@quicinc.com>
Date: Fri, 19 Sep 2025 12:18:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
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
 <sg2txjdr4ugybqk4bvqokt4ebrt3uf4rdeut2n4qrqjdne2ifl@hlbbk5xruspq>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <sg2txjdr4ugybqk4bvqokt4ebrt3uf4rdeut2n4qrqjdne2ifl@hlbbk5xruspq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a82_cFfUdjGneZVj-7ci0udYyWkRbfAa
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68ccfcce cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8
 a=dREKOsiMCRGMQMwcPOUA:9 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: a82_cFfUdjGneZVj-7ci0udYyWkRbfAa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX1U5wAQXaP6cS
 bEtxkriTk+Im+4mNxWx84Rr0q7xGd61s9ilvk48rNTO/SYJ6+8epkpIv4p2U/Ej3Byf3ciWkNY4
 9NdaCVJPvEkoP355MR/RJURfbAM/iF/f/gK3O9vobX6dznWsRWzfr3zM2UrXNJFtyn6DMV9cXhQ
 yBAxdHelxT980MpPkWj9ilNuroSulbn7vZOfbU8c34Ks/l3EaNwslBwpCwkYr2kaWVXzUgLulkp
 zgzSN2wV160CiRaZ6862GUq9nRAhdkoJtYv+Sx8xD0qX4gajL+rnyMlliN7HAj9pX1WNSmoVdOd
 SgWJaWtvCDVMPbWhDDJCGJiTtIlcvxV0uMi7SjRHqo4KxCGeefFY4qfXqGZZitv41r6QUwpqhb1
 ScG31H5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074



On 9/18/2025 5:54 PM, Dmitry Baryshkov wrote:
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
> 
> I'd say, if there is a need to distinguish something in future, then
> that something-else firmware should get a suffix. Unless we want to
> establish a rule to have the _sN suffix all the time and rename all the
> firmware to follow that rule.

Currently we have named the firmware as vpu30_p4.mbn (kailua)
vpu30_p4_s6.mbn (Monaco with mbn header v6), So i was following the same
convention for qcm6490 firmware as well.

So if/when SM7550 is added upstream which is the same architecture as
qcm6490, but doesn't need MBN v6 header, the corresponding firmware could
be added as vpu20_p1_gen2.mbn.

Thanks,
Dikshita

> 
