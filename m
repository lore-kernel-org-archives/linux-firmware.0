Return-Path: <SRS0=041a=52=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE5CCED63D
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 18:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBF03C19422; Tue, 18 Nov 2025 18:50:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D3E8C116D0
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 18:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D3E8C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIH7oLK2664787
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 18:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YO+Un1DzeI2vTctdsSWX1ZF92yAEKtjpFds2ETlJu9o=; b=W6xAhruqqEJuc4cK
	M64UFnW3zrfngWeapSatY/bheUtEPEUDg3A52p3aprMmcFNC+CJmhPk9CUq9Z190
	7kGO3FgooztWM4MSLPTNutxjr2d3QdqI0CJbqaInfk2iyIb6blg9HHmHqYp+Giso
	aaLMHtWcULP22eTqnxrIiFqGrlp3EIfXyqQ0m3jQUuRWH6/ESiWLQAQyzLdljo80
	IMna4efZWb3YfSfwqDxp1tUhmFfBPYBIwYylKrN81aed8x7jUpXvATduYxvc6Rpk
	pMgGOWnYxJSIDtX4csM+2+IKL6vfs8b305FDF44Be7abE6TjBMq9hHRqOD3L5N0K
	hxlLnQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjk9hq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 18:50:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2954d676f9dso46847405ad.0
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 10:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763491808; x=1764096608; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YO+Un1DzeI2vTctdsSWX1ZF92yAEKtjpFds2ETlJu9o=;
        b=U6NcoI4HSQ4QuTbEoVPtzSppmCdKBd4bXpd444fE7oM4jZfGYZ9DCbqyII3XuDQP5A
         l1Ij98u2MKJyuCHKvqhA3SYuA6lW9NjMjwSfNiPc1fTeTIpRI9T/erz24pXLdU2ER0jA
         BdVlxwg4tOn+AdUSjTubr6ky6clhYniNIbwPueuFrAffsKbVDxyURC6425hwWPfxQgas
         iLhvMvkemLmd0kVT8o6JruGu6T2YTjnG6T3qjBTKPxQcBWAluxMSVcIz5WMNd0Jyk+XF
         iKibYd/4M5dG1BLpdUvqtlpi0jpk4BFgp6lfgSymU81rPaCJta9donm9l5H7JiyWGMup
         oXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763491808; x=1764096608;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO+Un1DzeI2vTctdsSWX1ZF92yAEKtjpFds2ETlJu9o=;
        b=eBU3+MGWNtqJs8Vx2xsF7smrT5pOCiiYiuzlPpkjXg5g/+Q8EfuF5Fvwm5p4LQ71jz
         S+7Ker61D16jTkBMdSggiI9PMG37FMqbxTEsbqxZVlAZPjdvNGFB0LOrXPsw/qhHJ/Dd
         0nv9TjGsosTEDN3CV5vMd8kS3vB3TyseUjLwKqB9Y3qUkQ3/zp5m7MnyYOF49InpS9Vi
         tkMsMdQPO71d2r9faVoJ5KWH8zrkHnxLA8PIM4SSpgy40dxNBgUCX4hqeERjE9IQLsLW
         NyzV6Z76kbuELuOWzMV3S8uvuMXVXy/QWpeCJGrxff1h6H/jxaQiETMHdADd66X7YQW4
         oDHA==
X-Gm-Message-State: AOJu0Ywf4/GMx8OGcqdk4uEcrMFELkKsINOhaubgxRT7WgEc051jYqnp
	HCnRxzhgMkwI5IT01rxOTBNKTbpmJYptambkN+niBDrqz8z8to7yXGD7y9z9HbR8S13LQPs5t5b
	lKUoTD0Og3fVuZwneQL1CaDiVrsIaEkMJmeaeW9YNO/b2SGBkv9yfP0IIFzEWWjE=
X-Gm-Gg: ASbGncsUhbqf5kG7/VbvJnYBlkPbRMhrSTM0R1q99E09RlNgiOijt+DFg8duJVoNyO4
	3nZN1cRbxFdzd+C2CYYTtXaH7Ci7Z+SQiE7XOiQHukebk6ftEVzLSkV8WkYGSNY2AKF8GH+cDeO
	ADycRuMpT+dAhqc+Oj7z6o694ewSz2FHDUzwYDtj+xmutasDTgSCsGpTLocWnLA8JtM9EqjsZqw
	E4nQK8z5QItN96/3yjUYUfby9VmJhqogREDdX05iF7cmi3PmG0PqjjKID75VDerei5lcq+yDY9G
	/9V1VVcn42r9jee1E0S8JI52UP/b31mFRLBpym5IoxnU4awtaqwIAi4iXncHO2I3y+1sk5mGK8T
	gXJEGHPrF1R85TqPHZ0FkwkYK3dnkNfuCc4TTsy0+EA==
X-Received: by 2002:a17:903:2405:b0:298:481c:cbd4 with SMTP id d9443c01a7336-2986a6ec993mr177206305ad.26.1763491807724;
        Tue, 18 Nov 2025 10:50:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkE93LPUbSwZL8X95TcMe4SNdV996YkGpVlXo93YbVJX1dAt+R51QJo2pGqwdJDHCkJD2INA==
X-Received: by 2002:a17:903:2405:b0:298:481c:cbd4 with SMTP id d9443c01a7336-2986a6ec993mr177206005ad.26.1763491807096;
        Tue, 18 Nov 2025 10:50:07 -0800 (PST)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245ecdsm181383575ad.32.2025.11.18.10.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:50:06 -0800 (PST)
Message-ID: <2b6b8cc3-ece6-485d-8295-e7fa039f5093@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 00:20:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
References: <384a6882-c95a-499c-9bcb-35af092118be@oss.qualcomm.com>
 <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com>
 <ypeyd37oonsm55cenq5xl4lpxtdyhuqlt2nlgweottnwagujjr@v54m5ki367wl>
 <c5de392e-9c65-4021-b7e7-3a81329f170a@oss.qualcomm.com>
 <CAO9ioeVYMOR_+QdkQk6YM0YdH0Hvi+TjmUfQ6-X7=nLfnG9JbQ@mail.gmail.com>
 <3a84fa28-e4a8-4875-b655-293011d3ce63@oss.qualcomm.com>
 <tqpvpnh7f2gbkhw733aux44vzfcd6fd5i4e55zxidj6rl7jafh@6y7776gkbgyf>
 <217efcc4-2b34-4c57-bdda-16adc064a5ed@oss.qualcomm.com>
 <lxldmx2ulavqsijroufa6btxf67t2bocjovnjzxeeqbdd35ri3@dhouz4i7so42>
 <d3646263-0ffe-4a16-9baf-81202d481ea8@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <d3646263-0ffe-4a16-9baf-81202d481ea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0NBT7tlAiLw8-iLLnO4OtJ2rLjaJRQAQ
X-Proofpoint-GUID: 0NBT7tlAiLw8-iLLnO4OtJ2rLjaJRQAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE1MSBTYWx0ZWRfX9wmxRq7dDNTX
 3aXByGdZw2+/GJFQ0mGeVTnOuMvr/sNrJ3WcYyTIC74eoPJ2dBb/2sC9Nmftivcc1u8Lmkc3Cij
 jCBsxfb6ZZYray0QdcccC/VpM0IY4R/Lr90D9KL3ohy1ySAIbfsTC7gtUYO0p2g03eeU9fwTSKc
 bhxuym8cX87II8M3qidvdNShMZ3Yrtk8Toxyr7gA4CzGGDHVXHv1qOyaStbnDdSrwyrTSEUw15e
 oUmL3Qe2SycjyKE3LjrOzbevpz2Oho6NuPltkv46KnSB4ZS5UMDl/u+CVlVSQZXDtBKdj5/bCXZ
 CQ8BPeFbtnG7UOWKNqCzDkQibl7YdOZ3nb0W6vbjQqpypvG03nT9w7P6i82B2gcxisrBK5q6vwW
 4bLFebaYVOFQDpzk/WQi7K7C4/KPBA==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691cbfe0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=EeYTMgbBGXZ06Cks2awA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180151



On 11/18/2025 11:40 PM, Venkata Kota wrote:
> 
> 
> On 11/18/2025 11:26 PM, Dmitry Baryshkov wrote:
>> On Tue, Nov 18, 2025 at 09:20:23PM +0530, Venkata Kota wrote:
>>>
>>>
>>> On 11/18/2025 9:04 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Nov 18, 2025 at 08:05:04PM +0530, Venkata Kota wrote:
>>>>>
>>>>>
>>>>> On 11/18/2025 7:56 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, 18 Nov 2025 at 16:21, Venkata Kota
>>>>>> <venkata.kota@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 11/18/2025 4:28 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Tue, Nov 18, 2025 at 10:24:03AM +0530, Venkata Kota wrote:
>>>>>>>>> The following changes since commit 
>>>>>>>>> 53adb2085ca81337df2db20b96898b1980e310ff:
>>>>>>>>>
>>>>>>>>>       Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 
>>>>>>>>> 03:16:11 +0000)
>>>>>>>>>
>>>>>>>>> are available in the Git repository at:
>>>>>>>>>
>>>>>>>>>       https://git.codelinaro.org/clo/linux-kernel/linux- 
>>>>>>>>> firmware.git
>>>>>>>>> dsp-fw-kaanapali
>>>>>>>>>
>>>>>>>>> for you to fetch changes up to 
>>>>>>>>> d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:
>>>>>>>>>
>>>>>>>>>       qcom: update ADSP, CDSP firmware for kaanapali platform 
>>>>>>>>> (2025-11-18
>>>>>>>>> 10:20:00 +0530)
>>>>>>>>>
>>>>>>>>> ----------------------------------------------------------------
>>>>>>>>> Venkata Kota (1):
>>>>>>>>>           qcom: update ADSP, CDSP firmware for kaanapali platform
>>>>>>>>>
>>>>>>>>>      WHENCE                      |   4 ++--
>>>>>>>>>      qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
>>>>>>>>>      qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
>>>>>>>>>      qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
>>>>>>>>>      qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
>>>>>>>>>      5 files changed, 2 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> Should these files be covered by LICENSE.qcom or LICENSE.qcom-2?
>>>>>>> The files should be covered under LICENSE.qcom-2 Made the change 
>>>>>>> to the
>>>>>>> WHENCE file to reflect the same as below
>>>>>>> The following changes since commit 
>>>>>>> 53adb2085ca81337df2db20b96898b1980e310ff:
>>>>>>>
>>>>>>>       Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 
>>>>>>> 03:16:11 +0000)
>>>>>>>
>>>>>>> are available in the Git repository at:
>>>>>>>
>>>>>>>       https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>>> dsp-fw-kaanapali
>>>>>>>
>>>>>>> for you to fetch changes up to 
>>>>>>> db069c95dcc16ea84dacb80488464e843ea252cc:
>>>>>>
>>>>>> You've silently changed the licence without mentioning anything in 
>>>>>> the
>>>>>> commit message. That's a no-go.
>>>>> <Noted> Made the change to the commit message accordingly.>
>>>>
>>>> Could you please add a word about it to the commit subject too? 
>>>> ('update
>>>> firmware for kaanapali platform, change the licence')
>>> Updated. Please Review.>
>>
>> Now, why do we have two groups for kaanapali there? One with soccp and
>> another one which you have just added.
> I am not sure about soccp FW. DSP team does not track that firmware. Do 
> you suggest to have all of these close by. I was not aware of soccp and 
> just add Kaanapali fw below the rest of the DSP FW.>
SOCCP is for RISC-V and the DSP FW is for the ADSP and CDSP.>>>>>>>
>>>>>>>       qcom: update ADSP, CDSP firmware for kaanapali platform 
>>>>>>> (2025-11-18
>>>>>>> 19:45:11 +0530)
>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

