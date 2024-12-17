Return-Path: <SRS0=NXUJ=TK=quicinc.com=quic_sibis@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B104E7716A
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Dec 2024 09:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C85CAC4CEDD; Tue, 17 Dec 2024 09:43:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF36CC4CED3
	for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 09:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF36CC4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH9a2o3017465;
	Tue, 17 Dec 2024 09:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xPQav+aEhNiaVB/JFlJFqhmrciu06BdW+IszkryI0nQ=; b=RvwmpkQQukoShwD5
	0AVcmIzqmWrqRhiNXOciuMEcfK3Ld7Vm+z/mliyVQKBLJoeIPO4/turu/RGHEjsq
	iIwsdRTTIm8q1CLBZDx4YCHJkJKQrWTuf1fMMYZLzkMOMPUbKxeZeDI8UHdDBskp
	pzAz7kRYvzC+ralqiE4lG9dSQlWd4uhvVvJNvd5MzebmRqACnhsQPHhXe1XOhvtf
	RkI//lCOmY+u8IbMyZnC5D66LaVpjXEgTC/Jzzm0iT6i2hJ+zPInmD4xfvgjUji5
	ZYU0P5zGfQkrYJJ7sSPColKk4lludPM4MZcQNWGmLGmCftce5Aw/u5vBMRIBvL0d
	5sA1VA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jvs81fjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:43:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9hBQX007974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:43:11 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 01:43:09 -0800
Message-ID: <4fb0d093-d00c-13cd-9dba-7393dbcf897c@quicinc.com>
Date: Tue, 17 Dec 2024 15:13:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <abickett@quicinc.com>
References: <7f156ffe-9629-17c1-47c5-97e0d0f3e1e0@quicinc.com>
 <i4ihcid3ka67rhwziue5tblahs6bwaehazq74bd5y64ybs4ahv@l6ti4xqr3yq6>
 <d169bd29-b756-f027-9f33-02106b702359@quicinc.com>
 <a3znmntnj3jliy77qffmiukdwccz75mkg5xj72yw3zxkqmjjsb@geavo66vpbpe>
 <63fe4338-43dd-e771-45fb-57a2096a1002@quicinc.com>
 <cz6nu7fuf23poqahslmnqisuiqakjzkmwvk2znvohmjrnvgfhs@wb4wkugrkgfm>
 <e02e6eb7-9af5-87a2-a7f0-248d9c7543c2@quicinc.com>
 <CAA8EJpoagdAXE7L7qG9vQCkJbJ-MnB0LaYtqAoa8yLgj91O9ug@mail.gmail.com>
Content-Language: en-US
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <CAA8EJpoagdAXE7L7qG9vQCkJbJ-MnB0LaYtqAoa8yLgj91O9ug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aMKU-nxeI_vWsaB7fIH6UeTOqFYZPn5h
X-Proofpoint-ORIG-GUID: aMKU-nxeI_vWsaB7fIH6UeTOqFYZPn5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=804 adultscore=0 malwarescore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170079



On 12/5/24 16:49, Dmitry Baryshkov wrote:
> On Thu, 5 Dec 2024 at 12:07, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>>
>>
>>
>> On 11/29/24 20:07, Dmitry Baryshkov wrote:
>>> On Tue, Oct 22, 2024 at 11:49:37AM +0530, Sibi Sankar wrote:
>>>>
>>>>
>>>> On 10/18/24 21:23, Dmitry Baryshkov wrote:
>>>>> On Fri, Oct 18, 2024 at 08:58:06PM +0530, Sibi Sankar wrote:
>>>>>>
>>>>>>
>>>>>> On 10/18/24 16:13, Dmitry Baryshkov wrote:
>>>>>>> On Fri, Oct 18, 2024 at 12:43:14PM +0530, Sibi Sankar wrote:
>>>>>>>>
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
>>>>>>>>
>>>>>>>>       Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04
>>>>>>>> +0000)
>>>>>>>>
>>>>>>>> are available in the Git repository at:
>>>>>>>>
>>>>>>>>       https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>>>> adsp-fw-x1e80100-crd
>>>>>>>
>>>>>>> Could you please clarify, why adspr.jsn doesn't declare tms/pdr_enabled?
>>>>>>> Windows firmware has it in adspr.jsn.
>>>>>>
>>>>>> Hey Dmitry,
>>>>>>
>>>>>> Can you please share what device and META you are comparing this
>>>>>> firmware against? This firmware was taken from the build source
>>>>>> without any modification.
>>>>>
>>>>> I have been looking at the Windows driver from WSU for the CRD,
>>>>> qsubsys_ext_adsp8380.cab. DriverVer = 08/27/2024,2.0.4114.4600.
>>>>>
>>>>> For the reference, I checked several last drops, they have the following
>>>>> versions of qcadsp8380.mbn:
>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00792-HAMOA-1
>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00789.1-HAMOA-1
>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00787.2-HAMOA-1
>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00784-HAMOA-1
>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00781-HAMOA-1
>>>>>
>>>>> All of them list tms/pdr_enabled in adspr.jsn
>>>>>
>>>>
>>>> Thanks for listing them. Already following up internally regarding
>>>> this discrepancy, will push out an update once it gets resolved.
>>>
>>> Sibi, this has been more than a month ago. Could you please update us on
>>> the pdr_enabled necessity? I'm asking since it's also a part of the
>>> kernel data nowadays.
>>
>> Hey Dmitry,
>>
>> Extremely sorry for the delay. I was told this is just a platform
>> specific flag that we can decide to turn on if it handles PDR.
>> Given that linux does handle PDR we can safely turn it on.
> 
> So... is there any reason why it wasn't set previously? Which
> platforms should have it in the enabled state?

We had just pushed out the firmware out without modification
but yes like you say it could have been turned on during the
initial push itself since linux supports pdr.

-Sibi

> 
