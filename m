Return-Path: <SRS0=3wck=6E=oss.qualcomm.com=yushan.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E85D116EA
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Nov 2025 09:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCCC0C113D0; Fri, 28 Nov 2025 09:21:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1DCBC4CEF1
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 09:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1DCBC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8OPJ03124492
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 09:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MhvcNVQnRW3k7Dh/Twwykk+W2D0w4kX9ahzYdMyhgQ=; b=cR6KNjrpwwvm+96A
	GSR87Fqa1Ocy49BVuEQRZSXwG+WXKnu5xRgqg1XVOo8ghxsiDu1mtcENm+JoG2z/
	FygoFaCJwyKsz1FZ/UL0plCvN2W3N2cbKcqai3PD5dSwSHPmKGUlJWLqxPHxASRs
	7xuEthRhFAD4mvnKCCXWM8MgvYCycp4/W3+W0mu10ZGtAu7z3ymgLmOmfVkNp7Ij
	vwLTn1Vr6RlGiRf9P8FekFY9gy7EgcGEPrQlgVHJMYZeV1mT8b5ZkEaH56Xn3msG
	yVsGq6MY7vWVEEzjpC2ftEqfpZNVgALuMTFtRTHNrpUKJHTtNiviEkWb5kofOsdt
	e/aGeA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq58ugp71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 09:21:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3439fe6229aso1384347a91.1
        for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 01:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764321678; x=1764926478; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MhvcNVQnRW3k7Dh/Twwykk+W2D0w4kX9ahzYdMyhgQ=;
        b=ixSN0+7DKf7HlzbFVusZ64m+8mjFpqXucH+nKIDiNBmbBChegONv33wP20QeX5j0aZ
         GW7UdBGTpOhHLO/fZ53q4o4hb/WRsEDyrOZPXqWjNBEv5ngEME/fpofKQqjeiR8LxEuG
         rvC2q6t622eQQIV0sN3QSJbR3gleQqOJoZ6jm34jONxSYKlRvyjYIRui2W+0YxRwW+5C
         9gQhFaXrQb0R7zHkS/68e1mnmvExjpGFNFhe0JG2ARwqXpVWueV6/z80k0JWPZ/V9UEb
         NX+SKREQhuM5Wx90eVOBvf/TvCOZjbPG7e09bcBYY77K8tDOD3uzrCGALMhvG4qDFjCS
         6N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764321678; x=1764926478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MhvcNVQnRW3k7Dh/Twwykk+W2D0w4kX9ahzYdMyhgQ=;
        b=guB3ZnHerJxlBNkMFDzWRUwUr7a3olBmPObWY1Df/jtqC6Qe3fq3WWU2JkMsOa1n9D
         1XnrMHpdVCSly08k2EXv374K9Y/mnLRXDXroXL1D3yW84/drsFgItscUu0gnN+EyIYSO
         7vEcUwVioaXKyb0+7AUTYW2ZSUDBiddiQtcjtvOkKikB8YZsSCfGyarzPo1sRL7bDxxm
         o7ujtdlXV8VGthpt91e8JN0+heuTXjDJbeORYJF6xYK7gEstHlfy8AmfdpPpxpggVyP0
         5hRSCEcYaIGrnlQYwzaoENAwsow3vqDryHyu866yAlrXL41eBImfz7yxbYxo18sflBbW
         QIIQ==
X-Gm-Message-State: AOJu0YwhQ23y9yinqd7sofkE9fIJMTTIiK/7RApLs5vZpXxej4kWnyb0
	lFxRiwJgGXaz2owVqA+rrSfvd66h8P+DtDUS0DAA/XF/j63gsnfK21jXK7dCR4+0q6cLKxYIpWi
	Kcj5KqvHzU3EG642NQl+FIHmgeuuRfkmIfdBY5iNo9YLLEX6NXkJsPlX9D2fVP/NeWIHB/x8=
X-Gm-Gg: ASbGncvpg3O3QOACi4a0y0wlOczKFJrpR38MPjMnRG6SZnjdf9VJTLSeh9G3tt+K27/
	MKl7OAI2+/wFSUNv6inPOKltIbwqe0UWUeANHQkz/mwfDRej8oslmoSay6UXHhQRS+pYXyq7jdM
	VxffRSsfcoR11Z2lF7QKV9x+6UyqSao7ARtOpf3J2GHdei1uTmrvU4tx5AzFW936OT5mBXLt/yt
	4MGyuB41wMOQVbfG0kKmqFtNZ6J/dXMmBvPYpU5l7xVgp41qYKtBB02z9TyzajFHgAFXrJiXLPa
	BL5BgAprBoSH9/c8yqSiT5wzDZn6TGl3qgkFSqGEoijnl0Z2/AovFsLgPHYXcF44s/la59U5AeH
	hLGbsryRp0bZv2HHe/GpzVc0pWlke+PRzVRmP+P+MtsCv8RuMpWiZvS1fyk/db7F53JAdUKFygg
	t0
X-Received: by 2002:a17:90b:4d11:b0:340:bfcd:6af9 with SMTP id 98e67ed59e1d1-347331a7104mr24883601a91.3.1764321678246;
        Fri, 28 Nov 2025 01:21:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZjZnd9tS8s7KDrXNgQFp5UTfLxMGg/Wl9dvudeNdTMrWz3UBh49i5ybvuTOhJduTn5aO6GA==
X-Received: by 2002:a17:90b:4d11:b0:340:bfcd:6af9 with SMTP id 98e67ed59e1d1-347331a7104mr24883584a91.3.1764321677728;
        Fri, 28 Nov 2025 01:21:17 -0800 (PST)
Received: from [10.133.33.47] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be509d5723dsm4051769a12.30.2025.11.28.01.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 01:21:17 -0800 (PST)
Message-ID: <c9671d47-5770-48dc-9d1c-91c2fd2fd83c@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 17:21:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add ADSP firmware for x1e80100 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <f1482155-eeff-4885-a3a9-088d53377fbe@oss.qualcomm.com>
 <nlwzgaiyiehrtyeepghkpigkfemy426burylmu47akkiohkv3e@k6nk7uxrbobd>
Content-Language: en-US
From: Yushan Li <yushan.li@oss.qualcomm.com>
In-Reply-To: <nlwzgaiyiehrtyeepghkpigkfemy426burylmu47akkiohkv3e@k6nk7uxrbobd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1yNxhVFREaQvw9EXGUGq-7UzjkAsPW5B
X-Authority-Analysis: v=2.4 cv=UKvQ3Sfy c=1 sm=1 tr=0 ts=6929698f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=QaAnIQJ52uf54HIHeuIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2NyBTYWx0ZWRfX3MoQ/JnyL/C8
 VhpjK4OUcQkGb2VrA6mMiORMvrdTNOQjuwNc0QoE4/vHheLO0ooibkl9nxBYZra4UhHVoG+HGVt
 guO9YJkiSm6QBCVSMULEDa00Y3eyEzFhRdA9S1WlQp7qVXel28WZLnyJPJXw2BYogG9M3wjuxOO
 6W9TupcIvQK7P/neDnaY/PQoB6oYW4iwFg7bt0uwKgJ6gl5eud3izSM4ZAeY0tV4VArwaC1vXKJ
 Vdh7TsiFMDdqW9bk007S9nVobSvTPVMSNYAwD22U2D1I2Mv4PmJ+y8jrWCEVV4/1XEW/E5TtZLx
 kfFb/dzYcOfu9dugaRJv2z+7BXOh5IQBnft6lu/oxnw/e4XZOvU7Q5mPzJKqDpHFT4WY8t5uGDV
 IQWJTQ3xFWhnntWux8cGBsFpsIRLqg==
X-Proofpoint-ORIG-GUID: 1yNxhVFREaQvw9EXGUGq-7UzjkAsPW5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280067


On 11/27/2025 8:48 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 27, 2025 at 03:35:09PM +0800, Yushan Li wrote:
>> The following changes since commit 23568a4b942079631c9378011aa0a9b29de19370:
>>
>>    Merge branch 'intel/guc-v70540' into 'main' (2025-11-25 18:40:29 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> x1e80100-adsp-1126
>>
>> for you to fetch changes up to 63cbc5f5f40326f5c361f4e0575ffb1564d7f471:
>>
>>    qcom: add ADSP firmware for x1e80100 platform (2025-11-27 14:08:00 +0800)
> You can't say that you 'add' them if you are replacing existing files.
>
> Also you are siliently changing the licence for those files, this is a
> no-go. Please briefly mention this in the commit subject and explain in
> the commit message.
Thanks for the feedback. I've updated the commit and sent a new pull 
request.
>> ----------------------------------------------------------------
>> Yushan Li (1):
>>        qcom: add ADSP firmware for x1e80100 platform
>>
>>   WHENCE                     |  14 +++++++-------
>>   qcom/x1e80100/adsp.mbn     | Bin 22235528 -> 22452664 bytes
>>   qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
>>   3 files changed, 7 insertions(+), 7 deletions(-)
>>
