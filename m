Return-Path: <SRS0=9QRH=Z3=oss.qualcomm.com=akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94241C83F1A
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Jul 2025 17:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75345C4CEF6; Mon, 14 Jul 2025 17:20:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DCD7C4CEED
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 17:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DCD7C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA18UU032000
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 17:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaQZ5Y1LGknPrflacO3iRDSf+5EXaeeopPmJzAJUTps=; b=XTHtup+xTv0jxFVW
	ezvMypXGBldkVqN3W9cuuW8p1UqPygeXR1rqYdoeRtdTkdSi280NAEfQsxIo3s+k
	F41FOrpmaj885QAJ2ZW5OeTvj0eCQlOYlpaOui0YcgGPcB5mOjcDVr7qxLh8U97f
	aeivsJzhVtCf1wuv5f0CIBcvYuvkI9nRa6vOP8gJ3Y1obLmmf3vVb/CO+bIs3t/Z
	hs4t9ewTIb9yE828UltcN768gHBfs5UTvl0yx/IRV1kl+8sJ5OC279cAXZKzKps+
	6Dw1xA1Vo6jGIEFDinmoTZMpu6aQvh9BYJS6V4SuTFGEPAIjTCyRkhMwObyXP+bU
	A8BFjw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmwqdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 17:20:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-740774348f6so3898195b3a.1
        for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 10:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752513620; x=1753118420;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SaQZ5Y1LGknPrflacO3iRDSf+5EXaeeopPmJzAJUTps=;
        b=P7ikOfZaxI6A2PUuby1V/yh2ya6useKsXCrJTmkvIyDWmHq3g/0d1R4LyqEGfqS5EB
         9XGyGe0flR3cCh/4fO+7S1Oa0F/PIae/X2O81+MOvUxJnPs7S1DIEXcq/b2q67C+f/Dq
         jDkB545lGnKidp31vU1YEmObwbh7iBPvSDFv5VG2LhZcrQtb/ZkgxJsLF+bymzd+DtRr
         WqJQw5g6inN4Jh4lby23MExFR0+F9MO6MRDQTxs0lAzFTMpGSlGb+7e5Cx534mhtwghk
         f5mMNltH8RUuT9+ptuW97v5lCqKXOqMFTYxBRld1j79wq3Zxx9Y/7ivPGBWGorLC/jOx
         8ULg==
X-Forwarded-Encrypted: i=1; AJvYcCUOu7F7WXzR9x2SZ76Kcb/DacZ409sl0fNVeur8mL+sQtJx2ZBajkRx2uYigWNpR4s4LZNiGo+okfxAwRxW9g==@kernel.org
X-Gm-Message-State: AOJu0Yy7Ul1R335fIHrlOhqTvuzNPg726K7y5sDQxxcd//Xw2l1UsQEU
	cg/bKazvQ+q3d/12JS+efZfqP4Z5kHd2XEecylrBVGu7qL7bnSE4FpbiAo3J8nC4z7/mDlM9iq3
	3zgYPefaPpZ9AabwmHkBQ1aY1YortChsnUZBfTmYl2fwImbIoBSED8vq7wFd1rC2zbl0sFvc=
X-Gm-Gg: ASbGnct7BL7wnrOf4zcxxZAPVjbfGcI5yLHZe6fl6KAhkL6Y0Ch7dBBPwSBA9BIYbhK
	JF1Z1of8oeS7L3+6cpsm/ew9PwWOsoXUkQa/YDuxuI44sbU5tJCkh5cc+HsPOdiPcBNYmiiXHpj
	ypJxekIvoMIJ8cuYGatYHHx2fJY1/3f0K5eogfXHA5ZQrXQbXgjdbe7pUhq93uBm3k8fEWamcyU
	pC+wQv2f5xE84fV8YZhA7SVPgl5q+nXpV8dWIHJTMFKXCTF17soj7sof4q3Qm1e6u0HaZcgK4NY
	lvzqdsUAFSWxjMGPUJKa4Z6CWBSwpdufCyBlGVTRcTRCHWvfRnYdz+OVdxA=
X-Received: by 2002:a05:6a00:2d96:b0:747:ab61:e4fa with SMTP id d2e1a72fcca58-74ee2c50e6cmr17603147b3a.14.1752513619541;
        Mon, 14 Jul 2025 10:20:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAbL/12SM7G9F64F5nEjbaiIefm5SR9OefQIB7bAsNSIgmSp7pV9M/KFWAffNZDwJmAexzrw==
X-Received: by 2002:a05:6a00:2d96:b0:747:ab61:e4fa with SMTP id d2e1a72fcca58-74ee2c50e6cmr17603124b3a.14.1752513619013;
        Mon, 14 Jul 2025 10:20:19 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.230.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1d34dsm11227803b3a.104.2025.07.14.10.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 10:20:18 -0700 (PDT)
Message-ID: <d052562a-008a-4b80-b1ac-7340624bd596@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 22:50:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update GPU firmwares of QCS615 chipset
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
References: <10ee301c-7549-4a97-8e74-45329737222a@oss.qualcomm.com>
 <a4b0a5d1-ec5a-4812-970c-018cf9c9f0a2@oss.qualcomm.com>
 <2d9634db-3b2e-4f49-8206-8ce4c88701cc@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2d9634db-3b2e-4f49-8206-8ce4c88701cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IZd_Ca5bJSxXcy5quNIzP0aa1E3XugLK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEwOCBTYWx0ZWRfX60MCuIwMF8IL
 wodUTCO+IrK/khUkNBjRRJGn6HJX58xmwXcr3ACvY6mRLr0l7GDUFSTfDo66AKauqDi+j5eGvrA
 CRARB7gaqEnhuVOS66iLs8n/qnC/Nm767eOcCf3P0ke6kZo4C2bNbN1y+SABCWVQc9am+4n43g7
 mfy92FnGn+8GID/Xj0B/sgwSiKO7YkcpTeaIuWxnay2u0wPQPrnoP2CYMZYe9mTusHwJig8Iber
 EzTSMZ3FtqFyaHCKrlHUlVdeBT2DtstcMlQBX/OT/BMJ6FbpINpf0EG3eopx4aEskKMu2/E/5a4
 Hj7as+fJZ7ElM75GAFBcirgf1AHP6clM60eaGYLGnP3X4fDn5wE/+ziE9Ie962HiE1j5iMYQIlk
 ET/4Fy3duIoJZiFoxqyQApPydU5th0DcN+GP0RXMMQ09tzaY3kRp5ZQiahh3aEoO4iM+mULK
X-Proofpoint-ORIG-GUID: IZd_Ca5bJSxXcy5quNIzP0aa1E3XugLK
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=68753c54 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=J4hHMLXUlZdx2gNTs44xtA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=ooOMP87Z5b7c2ymlKzMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=646 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140108

On 7/14/2025 10:32 PM, Akhil P Oommen wrote:
> On 7/14/2025 8:41 PM, Dmitry Baryshkov wrote:
>> On 14/07/2025 18:00, Akhil P Oommen wrote:
>>> Hi,
>>>
>>> Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.
>>>
>>> -Akhil
>>>
>>> ---
>>> The following changes since commit
>>> 99d64b4f788c16e81b6550ef94f43c6b91cfad2d:
>>>
>>>    Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-
>>> fw-QCS615v2
>>>
>>> for you to fetch changes up to 9e60f646cafc202d2a3613be7ee277e1a84c1cec:
>>>
>>>    qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 20:16:48
>>> +0530)
>>>
>>> ----------------------------------------------------------------
>>> Akhil P Oommen (1):
>>>        qcom: Update gpu firmwares of QCS615 chipset
>>>
>>>   WHENCE                   |   3 +++
>>>   qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes
>>
>> I think the consensus was to skip RGMU for now.
> 
> Yes, there was a consensus to dummy load the rgmu firmware for now, to
> force userspace to always keep the rgmu firmware around. That way nobody
> would complain about breaking backward compatibility when we really
> implement rgmu support in future.
> 
>>
>>>   qcom/qcs615/a612_zap.mbn | Bin 14256 -> 2977 bytes
>>
>> This file is broken. It's an HTML instead of an ELF.
> 
> :(. I might have messed up when I downloaded it from the internal
> repository. Let me check this and get back.

Lets drop this. I will send another pull request.

-Akhil

> 
> -Akhil.
> 
>>
>>>   3 files changed, 3 insertions(+)
>>>   create mode 100644 qcom/a612_rgmu.bin
>>
>>
> 

