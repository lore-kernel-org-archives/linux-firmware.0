Return-Path: <SRS0=ytd+=55=oss.qualcomm.com=wei.deng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2418BCFC28A
	for <linux-firmware@archiver.kernel.org>; Fri, 21 Nov 2025 15:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF1DEC4CEF1; Fri, 21 Nov 2025 15:40:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3712C4CEFB
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 15:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3712C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALBXIgd2841291
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 15:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfZ4HqU2Jv/oSIs/zDTxfHoaSJfhLUKjt1z4aiYEecE=; b=B64+/oRpJOGkUepG
	TB6n9/2ooyeeGIreCDovbkjpWdth+du65rA0bgAoAslCuyI8IPP/etgi96Kg6pwt
	anonO2nT5i29k+kV154g1T52JpSillnucUl9W3AlfG92D75s0d/B4THnE4zLBhMR
	jkcxO2V+eh3p8GDgTzeBBcecAOR7xAXnsAIr/zfwvd3dWDZ86Q6WnTOspv+mztSL
	6D8Lzfddk1eiMQ0REQ/9bbt+/Is65iduWefFf3qcaJ2TEBBJk+Micns7kffdBCkY
	4g+dfnKBtPgUHHj0wH8IOJc78MFUl4KHeVIvFGuyNn2T5ObHM66uilUHUtLu8+ka
	KWPq7A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvj12d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 15:40:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3437434f75cso530211a91.1
        for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 07:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763739613; x=1764344413; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfZ4HqU2Jv/oSIs/zDTxfHoaSJfhLUKjt1z4aiYEecE=;
        b=Pigfh7uh8OCAck14DsUeRtlqlsR1lUoVLxYIP5D8oxz+l7YSuQ2ydlK7BCxftwfjKo
         dNirqFRA1/WeWgwVW0YCCGBeNGcMAYujKVqdiC1SHzoGLLHsgMbG/hJT7bI4cxS2lFTf
         /eAEa+EfkJSBC62kd1qvqwRfjF1X2yRq4Wu6zvdNaVloN20I5rKEePDNIZopDrVpfpqX
         FBRKbJ3ZcZ8epuvKSQOP7QglpsdYjRViaVWh3uCpu4UdY4AJoRRAahWYz8RzuogAwskj
         2oYKhFEzqzIruHXJCZyva87pvOniXvfdU8Ua8oTdRsfti0SBmaqRPWwOjWApJihInkr6
         dQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763739613; x=1764344413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfZ4HqU2Jv/oSIs/zDTxfHoaSJfhLUKjt1z4aiYEecE=;
        b=wdm8xbc7NbxKfJpYDm+ONOAMcgIz86/DsV5KajsQ90qS5lUIQZZYM1JVTCCFcFccaE
         GmDlZQxFALW/V7KYySGob5tAKoCo0R0EOA11x7gaanlMuPCBcbygQrkcwHKNsJhbDBKU
         Kx/ZZ4S3tgflUpO9uQBNqPA1gqkO85lbysWeDDhGR3FVgzA9Arj9qeER3IlLgBvLMsXS
         ssdArHffd27hEXgRcmnF+9jfGMJN0UQFh8jLX7aesWANSdxLe25/5xQto7MHcqz6nxgQ
         WHQX2IiO1ghLU6EJcWppZYHJ2APXNQWwusiTGBbJ7lDubuF51V566jfCc3BJBZssGl0N
         +YNw==
X-Gm-Message-State: AOJu0YwDlaTDTnnO2BE55jY85e2V4lQ7mI2cA+tLI2sJIffsKO2gUqyl
	+vT8Y7rf6KhKrpawx9ExrWhFK4NqORmMR1ryp3EpOnA1chProI8ATuqLQ21kUktzUPY6XToPGzN
	RW/btkcfO4sOFH3jHAixBeZVifkdlEPeijyPJKBnL8iMQ14XWejtk0/5ZJfMua50=
X-Gm-Gg: ASbGncso0gPx0r999+U+qhUr4k+pXaBW2iVmHIpPlAh9p16TPUsdt7GhRb7v/CoaXJf
	mnf6bFIeCkfXEr9ZkMLOv6hGQllOELITh3k/Q4v3bSDt7r+hVwPX346jP9rbTpJRGLAHmUWLy8t
	nkWIpV7PB2XouUnRhQPhRUTWw88BhdespksY/Zjz362Ze+06txb0YXSCaMDQGR5WcklcjpW8mMA
	9tpzRy0jLZ1h2NoZheaRyqkJbCqkadK8bpR0XXjVfTwEiXS9cKhrlI98unvTwJN0c+0kszuHvPi
	8wV7b471uC2JMUOzoahusMS5AOui8j4hWIqLRKZT9VA8VN7FFolM5kgdVG34Z08fSofThC4T9CK
	dPr/SnBas2H/YHLCw+LIa1a8HH/e+yjk=
X-Received: by 2002:a17:90b:1d12:b0:340:29db:6196 with SMTP id 98e67ed59e1d1-34733f2ce7bmr1908031a91.4.1763739613425;
        Fri, 21 Nov 2025 07:40:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM6qNqlfPsRphmLe/F3ql1rj3RdzNSqhV8P1uNipa7ggBBBTqM2ONoqXwA8RVIhuLR+fibow==
X-Received: by 2002:a17:90b:1d12:b0:340:29db:6196 with SMTP id 98e67ed59e1d1-34733f2ce7bmr1908001a91.4.1763739612864;
        Fri, 21 Nov 2025 07:40:12 -0800 (PST)
Received: from [10.239.96.29] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727be2fa7sm5904679a91.6.2025.11.21.07.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 07:40:12 -0800 (PST)
Message-ID: <ae7b1e56-a33d-408a-a64c-f5ed903b0487@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 23:40:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] QCA: Add Bluetooth firmware for WCN685x uart interface
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
        cheng.jiang@oss.qualcomm.com
References: <5fd2de28-2bd8-4dea-9afe-0cd7a5d9c9a5@oss.qualcomm.com>
 <ylctfzbgxpnbitgxk2mwpw6aptdzyedscbvwm4dzsew2sskdal@tlyyv5bulpzi>
 <73738c07-eca2-4065-8e3c-3bb68e8f291a@oss.qualcomm.com>
 <tcwroapnfzfi4fhrb6sa63fvljo7lxyhcldoly4as4p4g4lgfw@6lfxzplkxikb>
Content-Language: en-US
From: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <tcwroapnfzfi4fhrb6sa63fvljo7lxyhcldoly4as4p4g4lgfw@6lfxzplkxikb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t0U02mWnADv9JLE23mNlJ5Xi4A30Bd6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExNSBTYWx0ZWRfXy0fXk90LbexX
 FREjcro9VV+BseoM06uIIRgHEi3B76BC8OL0DK+AxSlxClzVY5sR2Rn8gu63V7IPP5KSzDh014s
 QpGpTB+ek7Z36rSRytszGA2ZONW7Hz2UvQ6NIL8g+ZJNDUF4hZlQIOmnv7hKeLJ6GUut82akOvf
 HjkJTYzMUSqO9RLB5pJdaAC1TAXG99RoeWHiipw+hv+QXgGXHVk+N9yGZUaUUrF/xdn0HlmdVXA
 CNcWSqRlXSogNQMMMRlfZhdmSamwfXn3kTQJwqC/k7Nqj1aJogU3UH5MWGc9bxs4/6zlY8AayxM
 GJEpVZxJfQKldPfN+Fr6VoDg0jxGbd5EGscd7MwfAkbnIgSIDdv7q9JV8XhxQ0dgQ6x0N4rEKG6
 TqoHKumHUkcOwzBJDAWqwPzxJ/p/lg==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=692087de cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=eGavl5vY26jiY3cE75wA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: t0U02mWnADv9JLE23mNlJ5Xi4A30Bd6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210115

Hi Dmitry,

Thanks for your feedback.

On 11/21/2025 7:56 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 21, 2025 at 02:50:10PM +0800, Wei Deng wrote:
>> Hi Dmitry,
>>
>> Thanks for your feedback.
>>
>> On 11/21/2025 6:29 AM, Dmitry Baryshkov wrote:
>>> On Thu, Nov 20, 2025 at 12:19:21PM +0800, Wei Deng wrote:
>>>> Hi linux-firmware maintainers,
>>>>
>>>> Here's a pull request for btqca bluetooth driver. Please let me know if
>>>> you have any problems.
>>>>
>>>> The following changes since commit 8b9fd78478acacccd0cde109b4a3550969f33bbb:
>>>>
>>>>   Merge branch 'dsp-fw-kaanapali' into 'main' (2025-11-19 07:22:57 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://github.com/WeiDeng-weiden/qca_btfw.git main
>>>>
>>>> for you to fetch changes up to 94beae96027761e69a54603605b8a9bfd7b71b3d:
>>>>
>>>>   QCA: Add Bluetooth firmware for WCN685x uart interface (2025-11-20 07:24:50 +0530)
>>>>
>>>> ----------------------------------------------------------------
>>>> Wei Deng (1):
>>>>       QCA: Add Bluetooth firmware for WCN685x uart interface
>>>
>>> Please don't strip parts of git request-pull output. I'll add it back
>>> for you:
>>>
>>>  WHENCE              |  39 +++++++++++++++++++++++++++++++++++++++
>>>  qca/wcnhpbtfw21.tlv | Bin 0 -> 152784 bytes
>>>  qca/wcnhpnv21.301   | Bin 0 -> 6876 bytes
>>>  qca/wcnhpnv21.302   | Bin 0 -> 6876 bytes
>>>  qca/wcnhpnv21.309   | Bin 0 -> 6884 bytes
>>>  qca/wcnhpnv21.b10c  | Bin 0 -> 6618 bytes
>>>  qca/wcnhpnv21.b111  | Bin 0 -> 6618 bytes
>>>  qca/wcnhpnv21.b8c   | Bin 0 -> 6610 bytes
>>>  qca/wcnhpnv21.b9f   | Bin 0 -> 6610 bytes
>>>  qca/wcnhpnv21.ba0   | Bin 0 -> 6610 bytes
>>>  qca/wcnhpnv21.ba1   | Bin 0 -> 6610 bytes
>>>  qca/wcnhpnv21.ba2   | Bin 0 -> 6610 bytes
>>>  qca/wcnhpnv21.ba3   | Bin 0 -> 6618 bytes
>>>  qca/wcnhpnv21.ba4   | Bin 0 -> 6618 bytes
>>>  qca/wcnhpnv21.baa   | Bin 0 -> 6618 bytes
>>>  qca/wcnhpnv21.bb8   | Bin 0 -> 6610 bytes
>>>  qca/wcnhpnv21.bin   | Bin 0 -> 6610 bytes
>>>  qca/wcnhpnv21g.301  | Bin 0 -> 6716 bytes
>>>  qca/wcnhpnv21g.302  | Bin 0 -> 6716 bytes
>>>  qca/wcnhpnv21g.309  | Bin 0 -> 6716 bytes
>>>  qca/wcnhpnv21g.b10c | Bin 0 -> 6458 bytes
>>>  qca/wcnhpnv21g.b111 | Bin 0 -> 6458 bytes
>>>  qca/wcnhpnv21g.b8c  | Bin 0 -> 6450 bytes
>>>  qca/wcnhpnv21g.b9f  | Bin 0 -> 6450 bytes
>>>  qca/wcnhpnv21g.ba0  | Bin 0 -> 6450 bytes
>>>  qca/wcnhpnv21g.ba1  | Bin 0 -> 6450 bytes
>>>  qca/wcnhpnv21g.ba2  | Bin 0 -> 6450 bytes
>>>  qca/wcnhpnv21g.ba3  | Bin 0 -> 6458 bytes
>>>  qca/wcnhpnv21g.ba4  | Bin 0 -> 6458 bytes
>>>  qca/wcnhpnv21g.baa  | Bin 0 -> 6458 bytes
>>>  qca/wcnhpnv21g.bb8  | Bin 0 -> 6450 bytes
>>>  qca/wcnhpnv21g.bin  | Bin 0 -> 6450 bytes
>>>
>>> And I've added it because I wanted to ask. Why are adding both files NV
>>> ramdump files with .NNN and .bNN extensions? The former ones won't be
>>> loaded by the kernel.
>>>
>>
>> Thanks for posting the complete request-pull. Uploading .NNN and .bNN 
>> files is to keep them consistent with the current UART interface NVM 
>> ramdump file, we update same files with hpnv.NNN and hpnv.bNN.
> 
> Again, what is going to load or use, for example, qca/wcnhpnv21g.309 ?

From the perspective of our kernel and WCN6855, we should load the NVM 
rampdump file ending with .bNN, such as qca/wcnhpnv21g.b10c. 

The firmware will be re-uploaded and will only include the NVM rampdump 
file ending with .bNN in the next pull.

> 

-- 
Best Regards,
Wei Deng

