Return-Path: <SRS0=fsSG=VL=quicinc.com=quic_sibis@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2364C021B1
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Feb 2025 10:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92505C4CEDD; Thu, 20 Feb 2025 10:56:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABD7AC4CED1
	for <linux-firmware@kernel.org>; Thu, 20 Feb 2025 10:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ABD7AC4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6VfRT009730;
	Thu, 20 Feb 2025 10:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	muAdJ3+lHgV0VgjB+t4PiNWpMypSGa93gTikkG5nZ4g=; b=WjTF0EdkZMnjdnz0
	RFifY0A7APyeZoE6BCYY8ePe5+G/LE1fIlW6PYSHlNWy9qxvEgGAeUL1ZNpYGUD+
	oJ2YAwJOLELWbIRvLZSgk/1FJkxXyvbJOfjVn78do7AdD/6XYQ4YnN74/uwNFAHr
	ZwB0a7j6Uc9BCGnMUkutKR8/ypZt7wMFGHihUp1odZqLayJkCTM5Y3USuZeEMJNu
	NQu13IomOBlqVPjrhE3KmWB8a07lxNcxUshl1jB8wDTDA7VaJ+dffrp2ePqJowjj
	GG8ttgebQsVx9UjOrCM2AlbVYTgM9bVuXGnpzSgeV+mPvLaSagWSQCrOeh3tx6S1
	+NFU1Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1wwss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 10:56:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KAuUlB008362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 10:56:30 GMT
Received: from [10.190.161.212] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 02:55:47 -0800
Message-ID: <ea234e73-3979-e4f5-3c35-34160aa898aa@quicinc.com>
Date: Thu, 20 Feb 2025 16:24:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <abickett@quicinc.com>
References: <63fe4338-43dd-e771-45fb-57a2096a1002@quicinc.com>
 <cz6nu7fuf23poqahslmnqisuiqakjzkmwvk2znvohmjrnvgfhs@wb4wkugrkgfm>
 <e02e6eb7-9af5-87a2-a7f0-248d9c7543c2@quicinc.com>
 <CAA8EJpoagdAXE7L7qG9vQCkJbJ-MnB0LaYtqAoa8yLgj91O9ug@mail.gmail.com>
 <4fb0d093-d00c-13cd-9dba-7393dbcf897c@quicinc.com>
 <nh2uwme4p6ytatr5mindtfryvm524nhdi5hmyvyb6w3qnmeqsc@2umcnv7g6enn>
 <b6979c75-cbc2-6f00-adee-4bb47d8b63cf@quicinc.com>
 <nxsukcd5vulgyvmlhiej2xswetbvkh2ue6lpamp44bx3vmmccb@42xufw3xwbg4>
 <20bf354a-aac9-514a-aa8a-f313e569a4cd@quicinc.com>
 <plfoqdkuuczjvnz2wcd4ewfgahtabztmfgehpnhvpdpbyrlkjn@esr2cieq62be>
 <dtu6f4nnutcufgu4n2rbbwvyywsl4sqarfstqrbl6i25kjlnvl@w33shxkpqtze>
 <67e51c53-c55a-0c19-d8d4-2447472c6815@quicinc.com>
 <CAA8EJpo8pzwBb4tRiy041su3Y9XfOnMCBpQfTyy+ONCRUdGwcA@mail.gmail.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <CAA8EJpo8pzwBb4tRiy041su3Y9XfOnMCBpQfTyy+ONCRUdGwcA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qdlzIof2QLMWs9RMUCqPXUdRR4tRuMMQ
X-Proofpoint-ORIG-GUID: qdlzIof2QLMWs9RMUCqPXUdRR4tRuMMQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200081



On 2/20/25 15:50, Dmitry Baryshkov wrote:
> On Thu, 20 Feb 2025 at 12:18, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>>
>>
>>
>> On 2/9/25 19:17, Dmitry Baryshkov wrote:
>>> On Wed, Jan 08, 2025 at 01:56:37PM +0200, Dmitry Baryshkov wrote:
>>>> On Wed, Jan 08, 2025 at 10:19:29AM +0530, Sibi Sankar wrote:
>>>>>
>>>>>
>>>>> On 1/7/25 04:12, Dmitry Baryshkov wrote:
>>>>>> On Mon, Jan 06, 2025 at 05:42:55PM +0530, Sibi Sankar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 12/17/24 16:26, Dmitry Baryshkov wrote:
>>>>>>>> On Tue, Dec 17, 2024 at 03:13:06PM +0530, Sibi Sankar wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 12/5/24 16:49, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, 5 Dec 2024 at 12:07, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 11/29/24 20:07, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On Tue, Oct 22, 2024 at 11:49:37AM +0530, Sibi Sankar wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 10/18/24 21:23, Dmitry Baryshkov wrote:
>>>>>>>>>>>>>> On Fri, Oct 18, 2024 at 08:58:06PM +0530, Sibi Sankar wrote:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On 10/18/24 16:13, Dmitry Baryshkov wrote:
>>>>>>>>>>>>>>>> On Fri, Oct 18, 2024 at 12:43:14PM +0530, Sibi Sankar wrote:
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Hello,
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>           Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04
>>>>>>>>>>>>>>>>> +0000)
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> are available in the Git repository at:
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>           https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>>>>>>>>>>>>> adsp-fw-x1e80100-crd
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Could you please clarify, why adspr.jsn doesn't declare tms/pdr_enabled?
>>>>>>>>>>>>>>>> Windows firmware has it in adspr.jsn.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Hey Dmitry,
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Can you please share what device and META you are comparing this
>>>>>>>>>>>>>>> firmware against? This firmware was taken from the build source
>>>>>>>>>>>>>>> without any modification.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I have been looking at the Windows driver from WSU for the CRD,
>>>>>>>>>>>>>> qsubsys_ext_adsp8380.cab. DriverVer = 08/27/2024,2.0.4114.4600.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> For the reference, I checked several last drops, they have the following
>>>>>>>>>>>>>> versions of qcadsp8380.mbn:
>>>>>>>>>>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00792-HAMOA-1
>>>>>>>>>>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00789.1-HAMOA-1
>>>>>>>>>>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00787.2-HAMOA-1
>>>>>>>>>>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00784-HAMOA-1
>>>>>>>>>>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00781-HAMOA-1
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> All of them list tms/pdr_enabled in adspr.jsn
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Thanks for listing them. Already following up internally regarding
>>>>>>>>>>>>> this discrepancy, will push out an update once it gets resolved.
>>>>>>>>>>>>
>>>>>>>>>>>> Sibi, this has been more than a month ago. Could you please update us on
>>>>>>>>>>>> the pdr_enabled necessity? I'm asking since it's also a part of the
>>>>>>>>>>>> kernel data nowadays.
>>>>>>>>>>>
>>>>>>>>>>> Hey Dmitry,
>>>>>>>>>>>
>>>>>>>>>>> Extremely sorry for the delay. I was told this is just a platform
>>>>>>>>>>> specific flag that we can decide to turn on if it handles PDR.
>>>>>>>>>>> Given that linux does handle PDR we can safely turn it on.
>>>>>>>>>>
>>>>>>>>>> So... is there any reason why it wasn't set previously? Which
>>>>>>>>>> platforms should have it in the enabled state?
>>>>>>>>>
>>>>>>>>> We had just pushed out the firmware out without modification
>>>>>>>>> but yes like you say it could have been turned on during the
>>>>>>>>> initial push itself since linux supports pdr.
>>>>>>>>
>>>>>>>> Pushed out where? Also could you please respond to the questions rather
>>>>>>>> than ignoring them?
>>>>>>>
>>>>>>> All SoCs that has remoterprocs booting pds can have tms/pdc enabled in
>>>>>>> linux since it has pdr support merged. The firmware that I said was
>>>>>>> pushed out was the firmware passed onto me for merge into linux-
>>>>>>> firmware. Sry I thought it was already clear, didn't mean to avoid
>>>>>>> answering any questions.
>>>>>>
>>>>>> So, should we enable the pdr_enabled for all those PDs or should we
>>>>>> ignore the flag and drop it from the configurations where it has been
>>>>>> added? The information that you are providing doesn't help me with that
>>>>>> question.
>>>>>
>>>>> Yes, we should list tms/pdr as enabled because without that I was told
>>>>> the entire Q6 would go down instead of just the pd i.e. without that
>>>>> the Q6 assumes that the platform doesn't support pd restart and tears
>>>>> down everything including the root.
>>>>
>>>> Starting from which platform? Should it be enabled for msm8996?
>>>
>>> Sibi, we haven't heard from you for a month. Should pdr_enabled be set
>>> for all platforms and all domains?
>>
>> I tried tracking this down but all we would end getting is a verbal
>> ack from people who weren't even working in qc when those SoCs were
>> out. Instead we can rely on testing it out with/without the flag
>> enabled i.e. with the flag enabled you should just see pd restart
>> without the remote processor going down as well. AFAIK the first
>> time pd was introduced was with modem and wlan on MSM8998. As for
> 
> MSM8996 / APQ8096 had PDs for ADSP and modem.

This also can be easily verified i.e. if wlan needs tqftp server
to function it means it exists as a pd else it is statically linked.

> 
>> the test procedure you can use the send_data command to trigger
>> a pdr instead of a SSR i.e. send_data 75 37 03 144 00 to trigger
>> a pdr as described in the original cover letter of pdr_interface.
>>
>> -Sibi
>>
>>>
> 
> 
> 
