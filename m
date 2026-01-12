Return-Path: <SRS0=WwDY=7R=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060BFD25030
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jan 2026 06:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB030C19422; Mon, 12 Jan 2026 06:27:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE7B3C116D0
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE7B3C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMcOiI165707
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hLKsXciUEgyPqPI4U1L0MHmgun3y85GTF9fmNrb7uEI=; b=h/ljCVMMXCbYJu4U
	KKH2gF8ndnroJqXE8TrZEaIdmKxLNXBJmYk4CkDMnz2rGxhgOhKim77iG8og1ujT
	cEPm5vweh9/Kwkbw17TtiyPwpkcZR9KtDVolL/4M6uqJC/FLkchwGxYvltFtSRPz
	SG/of06CvRA6iMrrXa6xc7lZ1MO+1DeT6N4JYjwpQvUrILbGCTue/tt6CTVlO/Zz
	zq6X1l/NLs8/SXNX/wvQjDHYFVr2wg6SFar/uOSE6Em728u254dmZnhLYhHmI3Hs
	uA1PadsYwO0tc/c9BJWGb/2kdLE5CMga1xJ3ofhBxt19rGmv7yQ6Q1J+1/VikuAf
	oFPexQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kysu6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:27:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81d9b88caf2so2006830b3a.1
        for <linux-firmware@kernel.org>; Sun, 11 Jan 2026 22:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768199241; x=1768804041; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hLKsXciUEgyPqPI4U1L0MHmgun3y85GTF9fmNrb7uEI=;
        b=NSVn4D3Jq1zGlvq8TGoY2Xa2udncGPNYhxJLBCoORxu0yLp35w7OsQ45QEULqlrn4b
         yhsuxGSsR9J2AAinkhtAcjbKd+9k2tU/EQITYTx0SGJFaOc/oLMAhFIgYIpAVCO/nLGf
         s8E/2f3niZ66JA+86iXbMWUnLx+SodenxZPXYmZVStmOlsd4elpQNjMLE8/3pV7YRQm3
         Af0lfAuaFy2iY/k/JIzKuYVgYE2qoWRxqZnKoAKeNbJKeUCe68/u8WEoWObwatDpHHj0
         Ia5mWJADQVKnKjaEOAXPYjoFA+/t+lJPiWoEtMeDjR1fouK+v4f3en4NOGjzVYlk1IQi
         xlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768199241; x=1768804041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLKsXciUEgyPqPI4U1L0MHmgun3y85GTF9fmNrb7uEI=;
        b=cOM5T/UkjrEvIBDtRiya86Zx7Jt7Q9wiBrVMsHDAlSyR0NlwnkcD/AJf2KGHFIrl9s
         aVAFf1pl2f/35A5EQa5uCav274pasR922yjCYmhuu24izDEFSlJqcf1wBNqs3D7uhWYI
         4e0NEHbj0/BTXnypb1Od3ZHy91pChAI+eNacyrqEOlxavZzlgy1syJ4OatZpPIsdkRrE
         mz/Llo0yKD1GnWeLBwtRExZPzMuBGCB4LdUbRaIf5nFjRJrE4yycbrZYEeTr6fGNQV1m
         PYN4xuLzVQPJORlTVlG4xBQkQkx2L8TpmpsaRkrL0IWNYGIvXgEEmn2+eDt+iQN0xnKM
         ZXDg==
X-Gm-Message-State: AOJu0YyYdsC4tp7tAgukedjRPVQKwMdwNtXbB+flIVIdsC5y9huH7N2E
	nCdjAg5RKpMaMgNqkNcPOBFxz+rvQFhYlI9NH9CT7DFwJOn7o0/foi1HTsZvgBIWcnw/KX7x0Zk
	M14GJc5be8j3pa2GgTx5iNkKrnclR/LCbO9tNNV3PoT+lmlnjD/wVDqTlkgslecM=
X-Gm-Gg: AY/fxX5m56hnlhlJUFyl8miyBiAnR5yUP8yHGLVMqj5nuCDzZk1vdf5tbitSzbdHPHM
	vSw0/Js1TnWKS5bUoXm5QtSl9IVrpt9M1aZsjij210K7U55emWPAXdCy269Kgg2pUy6LGsXloI1
	4w2Z0bFFKtgt0c+wHWMiXRRZvLO+C22hp4m1cGZLtiLRThFyZJ6rQmxj3RkYbgGnF1GPgDf/ET9
	7TCSmYfQZfZxAoWPHJ2e2UyaLdxNuwkAQIfATOqTb9u5xIf4Qg1rFvMkKGlsTo4uzL8vftp6XGY
	LjecesQBqOpUoGskKBoVw5b2lhpVcKwOZN5kPRxxpmdawBbWXinB4OZrdzJLYjBd0Av8uMDNY5c
	45TjqJN4BOuq/anSn0RuOhtI4lfwy/6E7s8yn1g==
X-Received: by 2002:a05:6a20:3d0c:b0:389:8e23:f43b with SMTP id adf61e73a8af0-3898fa1fef0mr14751599637.69.1768199241468;
        Sun, 11 Jan 2026 22:27:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwDLCc768T1Qf75LvYKG4fpEFWX3s+UfhvFGkJesg8pEMUlydUlyxj8nXoRK34pXtqI5TRvw==
X-Received: by 2002:a05:6a20:3d0c:b0:389:8e23:f43b with SMTP id adf61e73a8af0-3898fa1fef0mr14751583637.69.1768199241015;
        Sun, 11 Jan 2026 22:27:21 -0800 (PST)
Received: from [10.204.86.35] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6af48a75sm5425890a91.1.2026.01.11.22.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 22:27:20 -0800 (PST)
Message-ID: <17e8440a-23f9-4ce1-8218-d792866ad2fd@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:57:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update ADSP firmware for qcm6490 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <89b5d0b8-9928-40ca-b8eb-f40080b6f3be@oss.qualcomm.com>
 <CAO9ioeUTNWu7YirxV-qnU3q9ot=Z1UYZug2Q4ArQBd+smQ+0mw@mail.gmail.com>
 <162744c4-4624-4371-84d7-3db767b40989@oss.qualcomm.com>
 <jkfd6edfz6lfvhz7ilma3ece2np4p6ybijgystonmoau2zrzdz@rm2odyjbopr6>
 <0fb734a0-3681-4288-b73d-afd269ac8b27@oss.qualcomm.com>
 <CAO9ioeWuyiiCF5Lr8OWnJzik4jtiO9s15rDzZRGqry3VcK=NVA@mail.gmail.com>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <CAO9ioeWuyiiCF5Lr8OWnJzik4jtiO9s15rDzZRGqry3VcK=NVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: StrQ5SE8fP2q13UFAv_Ilpb9a_BJYCHN
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964944a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=DvPgMQzywaONBxpd1poA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: StrQ5SE8fP2q13UFAv_Ilpb9a_BJYCHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0OCBTYWx0ZWRfX4rQpPSFnoa+z
 S5H0tySaXroBftFgkPfqa8uGIbn8sLj7k8bTkYxFj5DfpCWSREyFISpRkLMjfXXuGoB1k4AFaMt
 O9NTHp7b7ElEpJe4e22drL+/oDuIvVhPxv7/3ps55oPFko16O859VXFdWMT5VX7Tj4XCwpEFETX
 a4DLn698YKBcHCFwZM3XhmvVQ3Cgwgwi7lw2F++D9aHxC8qDg/BTyeu0Pvp8PanVHQ8GzN6H6cs
 BHt50WmBC600vuoYiIFFKMmkhstWSjgcwXH2T+XCR9Aew8fgkFinWC3TDPxHlGOwaWNvxiZLcis
 OM0+Us7UTcb/s+pNdYOC4UJIwxRDVTMQ2ewDex6vVfpnyZzenrsL2nvXjYWfugWxpgN3DGlJwiB
 cFG0tjNfOC47VAPBhWH2kqm8UoeMYjvYHc887BBlRBFc1XJHQmfWlzS+vpYNBpA7NeOxRoWx641
 kXE/8rQ2vhUaR5SLHIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120048



On 1/12/2026 11:40 AM, Dmitry Baryshkov wrote:
> On Mon, 12 Jan 2026 at 08:09, Venkata Kota
> <venkata.kota@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 1/12/2026 11:35 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 12, 2026 at 11:18:29AM +0530, Venkata Kota wrote:
>>>>
>>>>
>>>> On 1/12/2026 11:14 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, 12 Jan 2026 at 07:42, Venkata Kota
>>>>> <venkata.kota@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> The following changes since commit fd6473795fc677b981a076e12ff10044d3e5dfa3:
>>>>>>
>>>>>>       Merge branch 'main' into 'main' (2026-01-10 20:55:47 +0000)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>       https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>> dspfw-kodiak
>>>>>>
>>>>>> for you to fetch changes up to 1ddcf07a2c4859c6914660a077c5649dc4dab281:
>>>>>>
>>>>>>       qcom: Update DSP firmware for QCM6490 platform (2026-01-12 10:42:59
>>>>>> +0530)
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>> Venkata Kota (1):
>>>>>>           qcom: Update DSP firmware for QCM6490 platform
>>>>>>
>>>>>>      WHENCE                |   2 +-
>>>>>>      qcom/qcm6490/adsp.mbn | Bin 12693084 -> 12095036 bytes
>>>>>>      2 files changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> "Update adsp, cdsp firmware for Qualcomm QCM6490 platform."
>>>>>
>>>>> Where is the CDSP firmware?
>>>> There is only ADSP update. Corrected the message to reflect the same.>
>>>
>>> Please send new pull request so that it can be picked up by the robot.
>>>
>>> BTW: is there any changelog associated with those DSP files?
>> There are few ADSP fixes. Should we capture them in the commit message
>> going forward?>
> 
> Ideally yes, in some form. Let users know how critical is to update
> the firmware.
Noted. Going Forward, for subsequent releases to upstream, we would 
update the information in some format. >
> 

