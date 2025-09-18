Return-Path: <SRS0=Tc6e=35=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6773FCAC59A
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Sep 2025 13:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33B52C4CEEB; Thu, 18 Sep 2025 13:51:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4A12C4CEE7
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 13:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4A12C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I7JqfX028314
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 13:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXi4Kp0qF4jt/E+mNh1SHLDVOxJWf9PZFEVfAepQPW8=; b=bLYdm6WXTguZGhxm
	iLQMLGPnv1vjMTEeC+KKQxMGqjZ2EY+r5cErQUUS5kE3QBTTP1u2lQLzPHVJHZ6L
	RwsJCxwIAHmE9auV+PuF8e63oH2VD13huo0JnHqjU60wJrvFNwu7Qk7OW8kFsN1f
	E3ns1OEAO1B+3inaS4nOUFt03Ly5OFk4F7UbH7nH+ZcBkKn1UuR3UcFGXsMGj0vB
	mRETpJPM3LSNLrdhoejDzIc9WrFbs/TZ5DFv9jxJhwh4a8i/6fiBDiOxzTvlzPzw
	CL2JJkWURnvjDFOPoyPIZ1l4/i5Zj2scZ6Jw+UsXuSGE1whWmtFqURRv/7ig1XX8
	ovnPow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jch35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 13:50:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458274406so18642015ad.3
        for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 06:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758203458; x=1758808258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXi4Kp0qF4jt/E+mNh1SHLDVOxJWf9PZFEVfAepQPW8=;
        b=sjtiajvdkw3waQtKGkjRPTUHlduW+YYTeA9cFxq11STMmJrs0cVD/RSB6AuN4IB2YX
         S7j0ouI4ahGQ3hPmdcLyUc1kQR2ZyeVVLnFxT7AzJWD1AP1ivD0q4cnu5xOZYAc4Si+L
         tfJHn3lZYrC+1pErjEIEz8MskdWJ/9rCFMmscOJBzjlXCIQzqRyVcIaYcVbw3hlMmUA0
         Rjl5aO+AoN1MgjbZqyrdVzHbSr9859t89GbQqVgih1x9UTiEIF9maOOaoUtWGw0+fmCF
         JsT9pWJeZHE9s1eb2TuU5F17/x+octm9fejsC7OajzsimHI0PqyCbeEOcI53UmS8uMiW
         6pOw==
X-Gm-Message-State: AOJu0YxGJwJKGjFdH7BqnmPmi6lk9MwaQxf2vfimJfy2lf4Q1XQ/Z0kU
	5uPPqdwF5RJNbbZrG/7WYQQVJkMWURMc112YdVKJxUja5GPegEiX3xiosI0e1F22X/6jaiVvF3i
	WGUqAsr8y8nnNC+LgTd9A3/5q/BKsl8f3xXnp1hF/41AptGf97SYWMBeFM2Ep7N8=
X-Gm-Gg: ASbGncsYCfYoFzZ686rLtbuitq1+sIp60FtTBIUc/kTe8pF4Qem93aybXPZujZTAW8j
	1qySXpeGXJPm0ouEW/nrXCdRAavAE5UZVjGpIwVwKGhioBKuHA08t9mMZCShU/NrbdYWmE5kCky
	wHlnAdxhEq+XT/EsFUTqbFQa1T9wTDsquuVum6w2MPeY4hdPTnCXZ5xsjRfVpdbVV7N/yCr6kDC
	S0bnStEpuaZMkATslSy7hOi3zqGOgXszMiKLbr7ECup6VRPPJtT3YxzXNidYOh2V717lI6jzcEs
	kmPXXd8dlAt1GQRIWcc5j+G5Is2vV+vVwdzLRR79o+1pDwzFJ1gcL/9xjH8gPi8dTTuLe/vm
X-Received: by 2002:a17:903:1211:b0:267:b0e4:314e with SMTP id d9443c01a7336-26812190fb2mr91915885ad.23.1758203457956;
        Thu, 18 Sep 2025 06:50:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjp+i6c0rtqzCzQSX1Bsvar4NyrVwIZzHVja62+RasdrgFNvNBnPT34+QnhSzS6poX4Svfng==
X-Received: by 2002:a17:903:1211:b0:267:b0e4:314e with SMTP id d9443c01a7336-26812190fb2mr91915415ad.23.1758203457573;
        Thu, 18 Sep 2025 06:50:57 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016bea0sm27165335ad.40.2025.09.18.06.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 06:50:57 -0700 (PDT)
Message-ID: <4264588a-93b0-47d6-a8be-9ffca550142d@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 19:20:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, ekansh.gupta@oss.qualcomm.com,
        bkumar@qti.qualcomm.com, kssb@qti.qualcomm.com
References: <fa431a1e-75a9-4c89-b790-81368f30733b@oss.qualcomm.com>
 <zzjkhxoizdb3cukpqqlrgkrwqrk2cgmsuc3bnjrq334pn2zxzz@hwqba3vx7lu6>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <zzjkhxoizdb3cukpqqlrgkrwqrk2cgmsuc3bnjrq334pn2zxzz@hwqba3vx7lu6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Wh4vZpWYjzCce_szZDM1C1Gy4gAqmrZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX0G/CL0dPeDew
 dvZHwZDH4KFgtAtLWPXVHqgZ0I5qhbiZmSc2dvYSMyOKTWaLFkb8wJLj7uNRtk08DGt0JkG1hML
 BSOofYQw6CZ/YJ7/iHoUNSxCxk5SzHgqyEP2Ez3JUNk8FR8IGqvkFltyp70GmanYIAL1ehWjvV3
 FFZ+g3ZvAssu+YvKtQJtHqD4nVLR/U4Z282diKib/HT0OwuNmWChIqEvx+ipEC1pBgpQswiCwEw
 jH4TtSY8s/UbFxEFMXSTI78RDzAffnRh2b+02byskG3VEIp+l+x57uU4Gzhctxmyl6yRygTZbmt
 2hUj/oB/6WjFP+6jByE9wb7/AC0SDLJdO9plCaa0YBiV9mXY3rAhhypuvM+MBx7Tav13nmU3CD2
 04zIEMNr
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cc0e43 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=E9engskmJXTCXNPQm9kA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: Wh4vZpWYjzCce_szZDM1C1Gy4gAqmrZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110



On 9/18/2025 5:48 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 18, 2025 at 12:09:32PM +0530, Venkata Kota wrote:
>>    Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-qcs8300_1
>>
>> for you to fetch changes up to 36da01bec9809f7bd96594db4885a86c286e90a9:
>>
>>    qcom: Update DSP firmware for QCS8300 platform (2025-09-18 11:49:22 +0530)
> 
> NAK, you are explaining what GPDSP is, but you are not explaining what
> and why is being done. Why do you add Audio PD to the GPDSP?

There is no specific change made to GPDSP in this release. This is just 
an update on the previous label Version: DSP.AT.1.0.1-00096-LEMANS-1.
> 
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>        qcom: Update DSP firmware for QCS8300 platform
>>
>>   WHENCE                   |   9 ++++++---
>>   qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
>>   qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3080192 bytes
>>   qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
>>   qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
>>   qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
>>   6 files changed, 57 insertions(+), 3 deletions(-)
>>   create mode 100644 qcom/qcs8300/gpdspr.jsn
>>   create mode 100644 qcom/qcs8300/gpdspua.jsn
> 



