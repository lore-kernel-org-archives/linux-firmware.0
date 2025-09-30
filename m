Return-Path: <SRS0=PEt3=4J=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613A0CCA470
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Sep 2025 19:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44FD7C4CEF7; Tue, 30 Sep 2025 19:23:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BC64C116B1
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 19:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6BC64C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC9MBX030619
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 19:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qSApEbxGkOnxtwvy6XFseI4cXbUn+x7p5gro/GIwLj0=; b=hNfHzt0pt5bVrhal
	Cl1tk7/yHCDx6thInThxiBEGAfywejzcZLzz5CO1812hk1ioEwQCdZaV+Ss3KPBJ
	IQrXY8x2p5rXpqZeuKDSRUCbkoiHw+4x/pOHIPVvfQMGT6wZKdWXKhp3c2stSWhJ
	2c/fS1nSzhRiTDq7Y1JQxtqEgNMk9W0WXABxvm44frIzmPJa+IY92lUs7n0H/R+a
	WRBUj4h4ENTQ1ie5DpGM31K/NxHhRKEzXJw4nJ44LT2ktS+zBK3/mE65fMzEhES8
	8ZXmMwliyzq2Wul/+dC16l6l4S8l6FweC6B6H0+19NWPdtmZT4w6CLipAH7CP8SS
	RG9H1w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdhycc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 19:23:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28e538b5f23so15962015ad.3
        for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 12:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759260236; x=1759865036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSApEbxGkOnxtwvy6XFseI4cXbUn+x7p5gro/GIwLj0=;
        b=NXC8iHtR0nTe1rk2UTdDX14KM+Wn65Bd9iO95s5Gw1pBJ5r7VXnhVF69kwKxhKAP/6
         siQJPXA0GfdJBcXQSSjDJI099nGdQg1q5n6qJIgo2yr3xwFjFHpFOA4L/zGr0W5/WyyF
         T2yK+NvEKtk6WsmxhU6KyC7YGUQhB8sPpu+zwP+ZEvxJVWaQZec5+Y+ovA1evgFlHjEf
         3cf+6EDt9OVie4IYee0PKEVqBZga2yU43xg72sjdqGEu4cvNDKdApeEhcrTvSVdSQzSv
         uS20/0YBuRCkZEcd1u0kzd0KmnaROgdfIJF2VJf4Vvka/IOTp1HHKQeF4uXvZeFNxLIe
         ssww==
X-Gm-Message-State: AOJu0YzF7eQLw2m+BqBvc5vvvUl019mIeFHNqezdvHjV8Xjwbj5BEHnW
	O12dPTehHcWtsv0feb+HjlCmafObHTHSD/vmn2sS7O8Vkzd+El4ujHdd2Z+kKS7d9yG0p27y2G0
	Ro8mYNX8B8JWVTG2S2Vw+QI5c1lkAvzRbJD25Y9QE5/dAkgpR6ouP1mvT9QlovnM=
X-Gm-Gg: ASbGncsNnbPPJqR/UPRlgijIJIO91ZT1ZF3RMnmRuqsxza22z94r+tVTV2zB9Q89yuh
	TQMyZMC79L7a7Yge1hY+R3liok85A3IuiCOL8uHbTnWUF/QrvXPo9wL+ywSkzMwvmKjaLmsPoFJ
	ZT/Rr/IZDxG3dWR1FyTQTVQaufB2SYMRy5ChC6OaiL3tP0PTkWrMU6HqsouR6L9EkacVcYrYjrx
	cT73kNck+mM2mD08r2/MOu4hk2JyqhXLnyNZNcnnbIB4ZiZB/G4M/FFZ1zz53ZHDJWIEB2U5k79
	r3oEl1y16p/WvxhZ6k1Vus+Xzl7j2HvXF7ukl9scCp9K7ubHNqpmuWmXsv8cZKuJhdkQW9ZKAwv
	D2w==
X-Received: by 2002:a17:902:ef09:b0:24c:cc32:788b with SMTP id d9443c01a7336-28e7f2a13b1mr9964285ad.3.1759260235782;
        Tue, 30 Sep 2025 12:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvQdcvJbc2AhjLIQbcfcUP5iesabp30bqmYCyCx8CF3UsaUQkzkkmyV4QkqqBYUfnQtsZEMg==
X-Received: by 2002:a17:902:ef09:b0:24c:cc32:788b with SMTP id d9443c01a7336-28e7f2a13b1mr9964195ad.3.1759260235293;
        Tue, 30 Sep 2025 12:23:55 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671e93asm166883785ad.57.2025.09.30.12.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 12:23:54 -0700 (PDT)
Message-ID: <9409d59e-5667-41bc-b06e-cee7ac810c0f@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 00:53:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <f86a00e7-3622-4029-894a-13b575262a36@oss.qualcomm.com>
 <l7nl2ujw47rld67b5f3ginqmrs4we6tq4ll2tjjchu4la345ji@6pud7jcem4rb>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <l7nl2ujw47rld67b5f3ginqmrs4we6tq4ll2tjjchu4la345ji@6pud7jcem4rb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EI2fGmAmPzaAdSJ6DffHWw0BEmWhBOL9
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dc2e4c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=l6Y9zc_aoRmj6qmtY68A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: EI2fGmAmPzaAdSJ6DffHWw0BEmWhBOL9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX/u4SXKOVy/xJ
 kclDP6xt5caRPB/1/mnJVf1yrVOZVAu3rz1XPXGQ58GdoHtjokwqj26KoD38ZDXKVjb8pA2B7TA
 zCG3Am3YXNy8C/W+INCxQ5RB5W7bYJ/oDxa0l8xhzzO6ACD/n/ZlsDjQ+O5m3rXTFsp96nl+uyj
 7FSxg1xyzB6FaQTIYWLKORtycbZsC6SWg0ZL8Jr2E0v+fPwBLXCNXq1XRH0PmP5uBTjqA808j6H
 TmUx4cBc+VOYiIOLOEI15cdSmpKIkEx//pA/5kHKki4+/RTp6qP7b3Klb7dd42Z7R7uhSEMStNU
 ua8xw5bttZSrLB9RoYW8lyxR8OLBSlTkmGOTA//yYGwj0Lnh1oUIoqO+452vp/jKNuQn2CM0Je0
 PrUqEh9f2U0OfDsiy+fssDYoQKFBvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036



On 10/1/2025 12:10 AM, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 10:58:16PM +0530, Venkata Kota wrote:
>> The following changes since commit 2725800a9b5c532fcd1bc6c1502cb4678463416d:
>>
>>    Merge branch 'main' into 'main' (2025-09-29 11:56:44 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-qcs8300-dspmon-163
>>
>> for you to fetch changes up to 456617792f737ca068475cbd6736bf3971b0fa4a:
>>
>>    qcom: Update DSP firmware for qcs8300 platform. (2025-09-30 22:54:40
>> +0530)
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>        qcom: Update DSP firmware for qcs8300 platform.
> 
> Nit: please drop the dot from the commit subject. It's not a sentence,
> so it's not supposed to end with the full stop.
Noted. Took care of it now>
>>
>>   WHENCE                  |   6 +++---
>>   qcom/qcs8300/adsp.mbn   | Bin 6684672 -> 6692864 bytes
>>   qcom/qcs8300/cdsp0.mbn  | Bin 3080192 -> 3096576 bytes
>>   qcom/qcs8300/gpdsp0.mbn | Bin 5873664 -> 5881856 bytes
>>   4 files changed, 3 insertions(+), 3 deletions(-)
> 

