Return-Path: <SRS0=j60s=53=oss.qualcomm.com=vikash.garodia@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C00CF3972
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Nov 2025 17:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77796C113D0; Wed, 19 Nov 2025 17:13:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DB2DC4CEF5
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 17:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DB2DC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJFkCpT2437954
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 17:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C72VKuN0pDw9WGZwrEj8VgV7VWvGRAP2nEFdAZ8Qr6A=; b=HzoN1favvWCVCGje
	TP3cCQIZVBf9H9SZWg8ySP2nEsJt1AW8FqKMV/uYxaRpdddw4Hc+jjWuk9UREmwj
	yFEa5PbkVV/DBpPHN/HkGHv0ssYT58kudcWyowKKIRmD1+HrKjUrjkhf/JDJnzAd
	YIHnjSXo3i/pDRiezT6mgC5MTAqrfuO8XYRgY1lPIoxaxb1Z/9UPlQ2dI724pc7j
	6KfAV+i3YUlFADP6wgSPQjdAuGbs3Z3ZCUuhyAsx4fRULRH9floAMeb2tHluX17X
	TWtjiALF8OqV+qfzwNgXd8bPCI/rWbXWvfFz+RyFVZU1BLnfbzC63G7v4i2M91k7
	diD8Og==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah7ant5vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 17:13:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9ef46df43so6907588b3a.1
        for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 09:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763572399; x=1764177199; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C72VKuN0pDw9WGZwrEj8VgV7VWvGRAP2nEFdAZ8Qr6A=;
        b=Kd2OSzAB5Q41Jo6cpoM3a5A90Z4gH9V6CCox2Hk9+SPKMhh5ZruBCYXvHRc27Y/qqk
         eFEswnDHjz31mv+4ajOh/I4SWjUZMN0GLvM2eEF8WXPSyaBamIKXy/vyY0UCQ69e0k/s
         V79KBLmbxWJuQOHGIimYFZasIe5FknPrTkioG3a+AjqFOd7RzmBCAIIO/HOzE24eTyYp
         lO6S0yjMywjOcYGN3MvOPwtCg7N959csNt7n//p0gwtaXZroUQ6ZDesdt1qM3SHK9WW2
         tBtINk6349a6KbI1dr8m1SLYSgc/d10NpVdEqv2Io69JKsAUT87lKVXNhz9CqYHv0j3T
         COMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572399; x=1764177199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C72VKuN0pDw9WGZwrEj8VgV7VWvGRAP2nEFdAZ8Qr6A=;
        b=ZmqtKDEpFJkco8MmJHYr0UdfS1oWRTEL/FWAB0/OXi9OPRUtelg9wy3DE9FC0MT4NA
         2pSEa1UvcwyhPjr8cYNFjw+E284PGSX+XbJPrMldWJllNNgr6diuadhUMjNVJQXfJfKm
         jqPNY2g8X+uKDQUfNB9dlkLcOWnujHEC+OVaHlR00rsQ6btReDmr2r9H5yD6WNVE2rKC
         CMyVxihSIJpA44jjidbyl4spMfLczIUV3zy9gfZG3XJfmIOjOl4z+tuzePrxON3D1iHS
         poX7Ds1ynQJ2SVh1sbc6VvNdOkuC7mYWUgpy4H1pCgTSqT9iksg/2HJPwYsiwKOTFR/0
         4DCw==
X-Forwarded-Encrypted: i=1; AJvYcCUoM7EdU6Wvvf70qXD8dcreqlz+/Gt/R3QNdt/quQX9VBQkBc9B/jQVmxnL7Q41NxNf/RCA/I1NEl63Q72YJQ==@kernel.org
X-Gm-Message-State: AOJu0YynZ9bNAbbgE/4IfDSyO7ItL4NRe5CIf1I44MwmlVrao9xeKCkR
	j4M1LHOfbmkpwYNUxEOIVB3/8DKXG9S9LRSYJaQozq81SHPSj2jo8yrXrn/M5ToARZWshePZ6hD
	nAI0+I1G5v72Skn5yUq8Bf8Mwb2oRwHNpbJ3MkqzGEgrjxe+lHbHZx2VZVA1yqEY=
X-Gm-Gg: ASbGncvfmqUAoxbOua6L0BvXNOszKsPO+R8GTnhyQUOII1m7isu7oFAhAWvCw8XF9n0
	fW/rWU4gDZWbWajgKeKH9W7fpfzXUR84JhyVY8Rxz6BEUwZY8HXxeSpUTzwoWX8g1vu3U74HrMJ
	uaT5VkoM2A7Jj9Kb95wJKkoZaxJETGUcUGBaDV58F0zxcpR5HbmwJdqcwGoE+45hop80bMN5oxF
	y2Di5QI1EEnQyQ3RjjCPC4+RP8bwYSnj7p/SqJUoSxPOnxoBdbE+tNDubgyE1c2WWubsA0KqR+N
	By+iuIaVLhhEiA1HN6CdgSsjQLbdVWktu0h3QEV7lQyHiNdx5gofOK0JNs91TSlJ7hRCClUzRIX
	Cx0jbYxAdSRDgcNwl4U0qVAT19rS/MDBRQnbdVya6DA==
X-Received: by 2002:a05:6a20:12c3:b0:35d:53dc:cb57 with SMTP id adf61e73a8af0-3613b646228mr252066637.49.1763572399202;
        Wed, 19 Nov 2025 09:13:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK3PgFTL3Vu9E4DDiB1qOc6CK31tiQZVrHQ2AaHqdL1A7YehJiyswA/PH7EhvhLNhC2a5sjg==
X-Received: by 2002:a05:6a20:12c3:b0:35d:53dc:cb57 with SMTP id adf61e73a8af0-3613b646228mr252027637.49.1763572398694;
        Wed, 19 Nov 2025 09:13:18 -0800 (PST)
Received: from [10.206.101.67] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92772e7f2sm20049209b3a.57.2025.11.19.09.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 09:13:18 -0800 (PST)
Message-ID: <1db4c5a7-74f8-44e3-bb56-cf075e4391bc@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 22:43:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: update firmware binary for v5.4
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Renjiang Han <renjiang.han@oss.qualcomm.com>, linux-firmware@kernel.org,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
 <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
 <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
 <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
 <iznnjuldjlzscbasoxxwgemtd37pemtpo37dw2q7fj3pfct5y3@iepxxugydewz>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <iznnjuldjlzscbasoxxwgemtd37pemtpo37dw2q7fj3pfct5y3@iepxxugydewz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzNiBTYWx0ZWRfX3Da85bv2ZYJX
 /JhaMo1yoNUyI4za1H1hc95GO9AzOgvZiABnP2cpb4+als1DTLVQgRrKNaFIQRZa5l7JeDIqMzr
 0Ve2UDzyZ1Fx57ryekzTMwlhlsWaZMr2jcZHTKK0/U7J3YSWQgY5qO9+7viyxEm7OOX8iPEtb0u
 vSW6kIvKT9XzYaMJpF60mLN8YnwZhBUiwL4kT5kMMQye36xSD0Gn80MmdLcI0x5N17dM1DLC8zc
 x1xTKzpjOFdBmyYo8Ys45DlKYvM7Um8SdByq/zJjtB6+36Yaee6lS1BJu1yYsjh5UsnPD32O4t2
 lYml0Jj9JdAh1eMD3nbdIUvLbsmEAQIOGuLYu8pb/eH5RwUiW6kWSNffXvwbvPL8TDvtSMAYNSa
 j6LUUhaB6KnFqgrzaY1IM9nhlQgwYw==
X-Proofpoint-GUID: u3MPL2zsl2dymwW_u-E6WrHcmG6loCZy
X-Authority-Analysis: v=2.4 cv=a7k9NESF c=1 sm=1 tr=0 ts=691dfab0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=nsgESh4x3MF99DOxuO8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: u3MPL2zsl2dymwW_u-E6WrHcmG6loCZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190136


On 11/19/2025 10:10 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 19, 2025 at 09:49:17PM +0530, Vikash Garodia wrote:
>>
>> On 11/19/2025 8:22 PM, Dmitry Baryshkov wrote:
>>> On Wed, Nov 19, 2025 at 07:57:30PM +0530, Vikash Garodia wrote:
>>>> Hello Dmitry,
>>>>
>>>> On 11/19/2025 4:55 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Nov 19, 2025 at 05:39:43PM +0800, Renjiang Han wrote:
>>>> qcs615 while venus.mbn would continue on sc7280, but then we wanted to use
>>>> same bins for sc7180 and qcs615.
>>>
>>> What is the status of the current venus-5.4/venus.mbn file? Does it work
>>> AS IS on Talos EVK that is being in process of upstreaming and on QCS615
>>> ADP AIR aka RIDE boards?
>>
>> @Renjiang ?
>>
>>>
>>>> S2 variant can be produced now by re-signing this venus.mbn itself. To
>>>> achieve this part, there were some elf alignment fixes, which is done with
>>>> this bin to make it re-signable with any vendor specific #.
>>>
>>> I thought that this already happened for VIDEO.VE.5.4-00060-PROD-1. What
>>> is the difference between it and the new one?
>>>
>>
>> VIDEO.VE.5.4-00060-PROD-1 had ELF 4k alignment issue [1].
> 
> Commit 891a8d4fdfef ("qcom: venus-5.4: update firmware binary for sc7180
> and qcs615") left me in assumption that at that point the
> qcom/venus-5.4/venus.mbn has been working on QCS615. Is my assumption
> incorrect?

Both #60 and #62 works on QCS615, while if any OEM tries to resign #60 
with a different signature, they would not be able to do that with #60, 
while they can do that now with #62 with the ELF alignment fixed.
> 
>> 0x34 % 0x1000 is not equal to 0x0 % 0x1000. This part is fixed in #62.
>>
>> [1]RuntimeError: Program Header's Offset, 0x00000034, and Virtual Address,
>> 0x00000000, are not congruent modulo the Alignment, 0x00001000. (Offset %
>> Alignment) must equal (Virtual Address % Alignment).
> 

