Return-Path: <SRS0=Xp7Y=54=oss.qualcomm.com=renjiang.han@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BD4CF857E
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Nov 2025 10:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30A36C116B1; Thu, 20 Nov 2025 10:28:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31417C4CEF1
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 10:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31417C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK9hR8a473505
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 10:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzSSib42ajbjZ6KFHfh6yOnotFHHqiaEHw50Zlutr9w=; b=RzoUlZH2l8aJTxET
	kstfUsrPa4UHdF5oP9gYENuNnlg9oHxJ0DJjl57fn1yQxdCPbPE+PsMXpti4mJdQ
	1EFx0maO2ELrCpOgcB6eMuzAhX4HprwwWhzWoOx8RuBLqneh5uPE3goUoN2pNzHi
	VpAxo+4+Jom1D032pwrO0K3uqf2J2r1yQfV8TVblR/zR7H2UOryPBVcWrftya+pw
	d9b5dbyNSU2ndh3UrrYnrMjuMFZLUYOmN4enR2aGk4Ws6GiqQCA2rYaWnAhCaHwo
	Wx7dnXMFdiQ8H+LNbl0GGjQBWopI9JU6m774MdkLzFoU5fAwSr4CVU8EIb7iAI60
	RBp7sw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj0kw04kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 10:28:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so1789097b3a.2
        for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 02:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763634512; x=1764239312; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EzSSib42ajbjZ6KFHfh6yOnotFHHqiaEHw50Zlutr9w=;
        b=AtpuH/vXWmY5U7xtEuDEtQVfP6+fozyhV/kZRNG01dU8ADCj33MwTYmtXn+B2cWCC3
         TtStoW8h+E9qMpj1mTbjSVEDCtn06yGK9PBOav4DX+PyhUboAzUPi8FjFPmVgAOz0GLs
         WRYEQNWzI5K8vD7BfjzOY3gTs5nglmkoClTxIOOQjynjGdkNSrZvhvipAbzErnYSJnUF
         96Yi1RqREIbNCXMQhYyPEsTcJ1rSFeZIvGo3dZWYDEKKUyt7a+SVnLMm8Vql+3LWc4oS
         A4MaUhWTD7reVSEO0Ix/Y8l6On5xN4PIKk3F3HWLNjJG1coN09Nq4fDhnC4DrhoL2cXl
         /nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763634512; x=1764239312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzSSib42ajbjZ6KFHfh6yOnotFHHqiaEHw50Zlutr9w=;
        b=TcKEVu2vaZAsoLqCoTMhdtX20xk4Mwk48nU9nFaB6otFL273DDzlWaUhJ5RprUkQd7
         Ye9iN1Auk+qX4yiIgHQvLY8TP/jPr9GuzsxGtDIhRP/fhwDupGtNIw8AnofA30p/haX9
         Y2uN+KZi2zGmQ9QJtAJg9oAh6dUa5ns9mefVYfhGIELgS2qgVHqr22UlrXothtVA8V34
         jQTkcd+f5dGqdsNT5cqpw17J/3i4BqhLtKE5hFxuGkv+UhUGupbNsZttXKBXZXjpUB1G
         8loVGUZt5ije3KIQGIK6yGQFdYSeDZwVVfIMxoDMWm2EmWrIm7WksEqKaW1mKRjEwVaB
         VQUg==
X-Gm-Message-State: AOJu0YwunMLUX07GqSEs9Ii3rQl0vTXBAuSN7I0oRTZ1QVPZpz7drY7X
	U/ojkj18hYTboL4CyC8E4GA37Eqh2Y2O6/4Vlp+fcxCG89ly1O7Dg0zUZVL9+NAkr5Dh14ZLcDy
	DHK6xncQBYTuz+IJuLs3jBdeXhi4IjMgvF3Ww+7FStKP3KPVxjhmuv8lLoyB8oZo=
X-Gm-Gg: ASbGncuGWj2YJ2KePa7GozfMDc+HDM8qY6lSssFduoIHnvkfXipBwjig+XeO2Mj5jK+
	fkN+e0/sBNKUPKpAISIrrTCylAJpK+Yoi8QwUaJInoJXrXiy5jQ7zTM8K5jvGjolDx54vKfDrM+
	Vz8Fx3A1j32hJ/Tf5WFhu4myOOlomhLeD95YQtFaQDw+8OhibUAOf3O6wDG1FmV9VU1KlSWlxsp
	UTmwnSYbxQgDF5IqsNdwCrj9ZJcRB1THhIfcsEGS5BgOmHzp3HaIUOaZk8hNDX2bU1bb/zwQBP9
	Fn/JB5Qi5Rnh/e8BKyXDbdjXzmGWZdcIwJtqAYVcWqRCyck6A/D9mRrRyrmfVxDgIzP6HjNz00r
	R3uX4vmIA0t7g+L/WKWU2uEBVlxroNnz7NGb/OcIgtxsudqKeXp+BY33nVtVDvNZ2ana3TBSUrv
	v+XwU6oA==
X-Received: by 2002:a05:6a21:328f:b0:344:8ef7:7a03 with SMTP id adf61e73a8af0-3613b659940mr4005082637.56.1763634511883;
        Thu, 20 Nov 2025 02:28:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6WRQ7KPRoONCvOwV+VLbhleogSDqfhbXoQPVy4op1DYWeG/pmVe+eBl88RIWzU9ch0LGL9w==
X-Received: by 2002:a05:6a21:328f:b0:344:8ef7:7a03 with SMTP id adf61e73a8af0-3613b659940mr4005055637.56.1763634511370;
        Thu, 20 Nov 2025 02:28:31 -0800 (PST)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c418e4f989sm2064183b3a.11.2025.11.20.02.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 02:28:30 -0800 (PST)
Message-ID: <d80357e8-8790-4997-a562-b4b6f7f48aee@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 18:28:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: update firmware binary for v5.4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
 <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
 <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
 <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WeUBqkhX c=1 sm=1 tr=0 ts=691eed50 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=xatnYXvhpa4-NhwV8hoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 5PaONXYYabxc8rHlyd_Os2be-V8nrkba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2NCBTYWx0ZWRfX4ffBUqFwd+Wb
 9EM8QuCxWA8CVFVRmH9eOK1EU14fFhoE0m4uKcdxcBjaed8w9KwWTFzO2onzc8IT9AJNlr0gcUO
 YD1h8wyCgZup7zsISZow8Y2zroELfBbKHLHcYCEt6Si2uri+L1TiyTTPzotSKByAvFqiOHcr3IG
 OQgMboDdZ3p7pfx/Hl/VPkPGYRlFexlSlZLaDbJSoJSws+oIpaZF/DCqy0AUL4GP5Mgm0XGBs2v
 d+tBA9uYlpp6xOfeTYP+x407yjIEtm5nheY39KYDh96D7iuPC68cYe2k3f8Qflv1pB/r1obQJ8p
 3c9hwYs/dfE+2ErGikZShhlBMBnRhSPplV3SoW89Dpau8q19g5Y/V8187J1fwTZxTsO7G+0T3RF
 Uiqf0DDBfQHgxw36EOhu5VYTXtlX6A==
X-Proofpoint-ORIG-GUID: 5PaONXYYabxc8rHlyd_Os2be-V8nrkba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200064


On 11/20/2025 12:19 AM, Vikash Garodia wrote:
>
> On 11/19/2025 8:22 PM, Dmitry Baryshkov wrote:
>> On Wed, Nov 19, 2025 at 07:57:30PM +0530, Vikash Garodia wrote:
>>> Hello Dmitry,
>>>
>>> On 11/19/2025 4:55 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Nov 19, 2025 at 05:39:43PM +0800, Renjiang Han wrote:
>>>>> Hi
>>>>>
>>>>> The following changes since commit 
>>>>> 6fc940781a013ad837ed8fea326d2b897467bbc3:
>>>>>
>>>>>     Merge branch 'robot/patch-0-1762826844' into 'main' 
>>>>> (2025-11-11 12:02:02
>>>>> +0000)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>> https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>> update-video-fw-sm6150
>>>>>
>>>>> for you to fetch changes up to 
>>>>> 0a6f987b7b07a6fec2d4fd42ac4473c0523d3af6:
>>>>>
>>>>>     qcom: venus-5.4: update firmware binary for v5.4 (2025-11-19 
>>>>> 15:04:09
>>>>> +0530)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Renjiang Han (1):
>>>>>         qcom: venus-5.4: update firmware binary for v5.4
>>>>>
>>>>>    WHENCE                      |   6 +-----
>>>>>    qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
>>>>
>>>> And this firmware file is also going to work on SC7180, correct?
>>>
>>> Yes, we have got this validated on SC7180 as well.
>>
>> Thanks for the confirmation.
>>
>>>
>>>>
>>>>>    qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
>>>>
>>>> Vikash, Dikshita, could you please comment, what is going on here?
>>>>
>>>> We have added venus_s6.mbn, then dropped it, saying that a normal
>>>> venus.mbn can be used on QCS615. Then Renjiang added venus_s2.mbn
>>>> (why?). Mario merged it despite my NAK, but that's a separate topic.
>>>> Now we are dropping it again.
>>>>
>>>> The firmware is the ABI between userspace and the kernel. We can't
>>>> randomly add and remove files here.
>>>>
>>>> Which file names are / were in use by the upstream kernel? I tried 
>>>> hard,
>>>> but I couldn't find any mention of venus_s2.mbn in any of the patches
>>>> on the linux-arm-msm mailing list.
>>>
>>> venus_s2.mbn is not used anywhere. It was earlier planned to be used on
>>
>> Ack, please split into two commits, each having a proper explanation.
>> Please make sure that in future we don't add completely unused files.
>>
>
> Ack
Sure, I'll re-submit fw change with two commits.
>
>>> qcs615 while venus.mbn would continue on sc7280, but then we wanted 
>>> to use
>>> same bins for sc7180 and qcs615.
>>
>> What is the status of the current venus-5.4/venus.mbn file? Does it work
>> AS IS on Talos EVK that is being in process of upstreaming and on QCS615
>> ADP AIR aka RIDE boards?
>
> @Renjiang ?
It is fine on ADP AIR platform. I am asking wangao to borrow EVK 
platform to verify it.
>
>>
>>> S2 variant can be produced now by re-signing this venus.mbn itself. To
>>> achieve this part, there were some elf alignment fixes, which is 
>>> done with
>>> this bin to make it re-signable with any vendor specific #.
>>
>> I thought that this already happened for VIDEO.VE.5.4-00060-PROD-1. What
>> is the difference between it and the new one?
>>
>
> VIDEO.VE.5.4-00060-PROD-1 had ELF 4k alignment issue [1].
>
> 0x34 % 0x1000 is not equal to 0x0 % 0x1000. This part is fixed in #62.
>
> [1]RuntimeError: Program Header's Offset, 0x00000034, and Virtual 
> Address, 0x00000000, are not congruent modulo the Alignment, 
> 0x00001000. (Offset % Alignment) must equal (Virtual Address % 
> Alignment).
>
> Regards,
> Vikash
