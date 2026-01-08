Return-Path: <SRS0=Fhox=7N=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6475FD148AE
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Jan 2026 06:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42734C16AAE; Thu,  8 Jan 2026 06:34:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CB15C116C6
	for <linux-firmware@kernel.org>; Thu,  8 Jan 2026 06:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CB15C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084cA2n3672818
	for <linux-firmware@kernel.org>; Thu, 8 Jan 2026 06:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxMRCNAKq5xuuVRRuV7p9bJlKu8ZkGHFUabmLMbg6Cg=; b=Q1LS540BG7aoVYeG
	QYhmr3WH/WKznpFhyrgwRaUSMLkOEqrb8mP/mrQTDhPSUMiO7ePTfRWx8zHo+9SF
	FXq0RxzjMXJRbSNUj9k6t76QWXpe+nHGwiDnmfhmKxfE2jmc9y+z536yC7Bcysu5
	CUvU7EZiE/O87gDLeIjsjEBkSKTKocwtkfcKH5nqiclFei+0ewpu1bIyVfZprMfL
	Yt6i2mIs7bQ4R6vMPCMuqOD8DlP8Y0fDlbjpAiF8zwfY0GG02po2EvWR4VbgOoXN
	K5mT5qIUO6zBNrdhC+dkfSSoufiNb1+TP1IGA/EzAkZCdJzYwnu9K+MRV4iGbMeI
	Vf6hCw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhum52260-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 06:34:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f29ae883bso25447365ad.3
        for <linux-firmware@kernel.org>; Wed, 07 Jan 2026 22:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767854080; x=1768458880; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pxMRCNAKq5xuuVRRuV7p9bJlKu8ZkGHFUabmLMbg6Cg=;
        b=PoMy5TbTm8a82wfI/ikVki4Rk1GJJws9+YN3tIPl/Wm6a27ofm38XVAysKflouy4y2
         GWAIwbKcpenhawoEA6FC4sTWm+juv1fRp2NepNAC0RQEaNFztfpj6yuB12zISW13vuzg
         QEq19q8ovXoE9GDBFJ8Qq9QYIUQnKPtELUv7aaauJEMiv9Jc9nHvfGiY5IzoZndHZod0
         wn0aAc9uIZEBuqKd2S8HekyHfLh1na0MqSGd5RE/oBDez63dT8ne9JBdvZDn7LBPtmEd
         2ZkmZSo73oK83PwzlJF3OpqUwMBj4s7XcCrVg/fI+TVatuuUTIqv/Ag20Q7eC5QZwXCX
         ptsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767854080; x=1768458880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxMRCNAKq5xuuVRRuV7p9bJlKu8ZkGHFUabmLMbg6Cg=;
        b=NQiZIMib5dgQQK7Eg14kSUyrXOfHe7NPB3xJr+/I2h4rvFEveUMtalT2H0ycoqkYep
         vw5Xnh0EG3Hz2Xl24bIJO88HoKMFkmCMGAubr5SjcuJwD+D0r22TKBcphKyFzAidnUam
         Q5Fo5z4OLpnH/I823VjM4LtkUmhJR05dhVqLwfpdDIZ64h+4qkofN1/c4pMOxBl6Agv4
         zdjiu14sroVSEjHyAJgKQgMKKQESiGFkjGYWtLgNF3FA62OrIzr8mOl/1xQcuUOnEUSh
         2a5v3Fs0LyvS2Dt9BTc8O1RWWtixJTcKLqjcYJNN8o7SFy3fJuENF9poNdCuAUC9SyhA
         kufA==
X-Gm-Message-State: AOJu0YwJyEJmiKXTGQtfJgYw2/Wfm1BPuEPSFqWqc1lTEnexI4ilCPGJ
	/2rDcHTqSKQ71CeeBowsCDbx9Vei07FgZcKM6GX8Hz1S2Lt3BPjFeNFcovAfc/cICe9oFGDS9vs
	XAUU38/4xeR3Rjh8dwp3FHfKjEXtrXGqCeeMGjFSn/Ui4XKqGCVrLls5LF/dtsbw=
X-Gm-Gg: AY/fxX7+2nl11ZHYL+pu80Br8njcmE9DiVtME0EnQLDtwWa/TERHxnEDsTwfOp1DHum
	LN9AzNdqRqgJAp/k2C+qQCW5jd6ZgngpP/Ch/E1Uu7lg4J6RYA6voWNzfaKC9I1xOxWbOzkwnFe
	akrqrd2q1xUxGx/hu8+LEb/v2evlQqS8wihVKAZvMV9Kp7u/x/M+BP6RGQW4u8axrzkNamLm9KI
	+y4+FJ0VRr3/dMAXxUJi7i41NqmcQWazD0zilKtPEnAlU10K3tifbxG9DNOlYEDG5Yt1EQ9eIpL
	LKOu/hNK9DiFTN0KBzqIvzO65b90SaWK+L/+XQ6HKA/MmG0mYmt9DRs6UBvYgtvOBM9sCG7VjuF
	KqJtGoek493mK+PL7tplqRi/RMS5In0gmjI+ZbZY=
X-Received: by 2002:a17:902:ccd0:b0:2a0:f0e5:3f5c with SMTP id d9443c01a7336-2a3ee4c0ecamr43454865ad.34.1767854079841;
        Wed, 07 Jan 2026 22:34:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXHwv/dqkloN/Gf7fLmxmpQJFaSuRIsSFaqCp7szCK+Hs4WFKWIQ7T9HgfBIUPYQibPNKkNA==
X-Received: by 2002:a17:902:ccd0:b0:2a0:f0e5:3f5c with SMTP id d9443c01a7336-2a3ee4c0ecamr43454635ad.34.1767854079297;
        Wed, 07 Jan 2026 22:34:39 -0800 (PST)
Received: from [10.216.52.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4893dsm66870855ad.28.2026.01.07.22.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 22:34:39 -0800 (PST)
Message-ID: <2229dcdc-73da-4f89-bd4c-40aeff1b39f5@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 12:04:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
References: <f4655e94-b451-4dce-8b25-e27b6749d9d8@oss.qualcomm.com>
 <fgnnquqncrkkeza3ch2tafondp6oc3zuf7fv6huljdvdxu5pxv@7ttzf5ixty4j>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <fgnnquqncrkkeza3ch2tafondp6oc3zuf7fv6huljdvdxu5pxv@7ttzf5ixty4j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Vv1XxURU9Np8SJVCpKNjZs-OxqH8vLT-
X-Proofpoint-ORIG-GUID: Vv1XxURU9Np8SJVCpKNjZs-OxqH8vLT-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MSBTYWx0ZWRfXzZAKnS0jJ0Kz
 64xyADEkSznq1OZWPpWKrNnsHbKgX0sYLwcbeRXjnK+EvX7mTG4I9lgxAxZFXqpNnoUaTgxuDgr
 ZlI1dvMyc8l/f62t1aWClw73r12jtyc4CryyMSbD5gq1YamebkMbNbBk8Y3Zx1SCMbRmfaP/BhA
 TYvWBRvzu+zmWIR0v2eky45Hx+y8492pbNGsgOWOf9n8iHxnnTVy6IMBcLDhhCtn4CZAncBziON
 xsq2Ds/jRbtxKssXBCNpBzFihHVcqZAaq7NvbiF8MbmU9jjKnwygE7VkZ7kw1NeJfohbCGUn4i6
 f9jXJwN4ItVJzsu/qfLqQ01J/vPYgpnFeBCUC21E4voQLnq2Nl9lDDWWEayx3YoWZnrMchtEDS6
 vQVu9GSx1ujQnv/pxiF5WKfKbUjgbV0xB5y9gmzu4hJGyZdukDMrH3IRjeKsZYcRAvAih9yPJ6/
 KlboqvEzEXi9zcjkNIA==
X-Authority-Analysis: v=2.4 cv=KNZXzVFo c=1 sm=1 tr=0 ts=695f5001 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=hTCCZgzncFoNZPr8m_UA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080041

   Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qcs8300

for you to fetch changes up to 83f681ab4e6e8b65f42900afd05ebe0b4001458d:

   qcom: Update DSP firmware for qcs8300 platform (2026-01-08 12:01:12 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for qcs8300 platform

  WHENCE                  |   6 +++---
  qcom/qcs8300/adsp.mbn   | Bin 6692864 -> 6791168 bytes
  qcom/qcs8300/cdsp0.mbn  | Bin 3096576 -> 3170304 bytes
  qcom/qcs8300/gpdsp0.mbn | Bin 5881856 -> 5984256 bytes
  4 files changed, 3 insertions(+), 3 deletions(-)


On 1/8/2026 11:30 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 08, 2026 at 10:06:46AM +0530, Venkata Kota wrote:
>> The following changes since commit e272e0d1edce58496c3917f7422b9531daeb0535:
>>
>>    Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dspfw-qcs8300
>>
>> for you to fetch changes up to 5ab272be8f8ea70c01587d8da51cde1ef40c5f86:
>>
>>    qcom: Update DSP firmware for qcs8300 platform (2026-01-08 10:02:25 +0530)
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>        qcom: Update DSP firmware for qcs8300 platform
>>
>>   WHENCE                  |   4 ++--
>>   qcom/qcs8300/adsp.mbn   | Bin 6692864 -> 6791168 bytes
>>   qcom/qcs8300/cdsp0.mbn  | Bin 3096576 -> 3170304 bytes
>>   qcom/qcs8300/gpdsp0.mbn | Bin 5881856 -> 5984256 bytes
> 
> You are updating gpdsp0.mbn, but its version is not changed in the
> WHENCE file.
Updated the WHENCE. Missed it.>
>>   4 files changed, 2 insertions(+), 2 deletions(-)
> 

