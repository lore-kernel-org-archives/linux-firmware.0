Return-Path: <SRS0=93cy=34=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24B2CAC59A
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Sep 2025 18:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DBD1C4CEF7; Wed, 17 Sep 2025 18:36:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96048C4CEE7
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 18:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96048C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HFtb5d029878
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 18:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utGLpQngCoxcjUQ1yCZzE2D9tKU76LwKcAiBqq36ZhQ=; b=k/JPCWZC1Yroj9qQ
	z7YVvjHq4Fvr1NZauHDUiaeLGvRcJdwFME0sBvdSFu7fQTVt9HnK7WwRwSusm7p/
	Vv1G+8pNDm/pfc+LEj/HStQRdw4MMkuLB6nGhgSZP4QlLaQC7PgKLngwcHLGmVYn
	cWIXxJENmHLyGLnJLFGf4RgFY9psRehl/CCFi39kQ5M2WQzatPeFk9TsHxC8UmiY
	X8RMsri1JSy4oYVPKNjbO6YuZQxx121164AG/uV+pj2UvXQjSAOJoZXDUyE+Abw4
	pCB8W5ONE0n0Bo7ppeYkhHHOhYDi6EBIsfb7o16a6yomKDBpxK5SL8vqfPXgzPIC
	YLyCVw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxkh12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 18:36:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77618a8212cso1349343b3a.1
        for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 11:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758134194; x=1758738994;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utGLpQngCoxcjUQ1yCZzE2D9tKU76LwKcAiBqq36ZhQ=;
        b=FrMoOCFULdp1SRDHTM+gbgMuhsR+CK39IDue+OS/zW6G4nhvEGoO3AzGq+TZBJEN/s
         /f2XvfK5xP5XnLW1nnHYZWY1jAfwwkVIkWmaSAIPvyFFusqnseN9/hZRdWkv/WqCKo36
         qUwYdvSFxY+0mJt/n4sZvcPm6tegdU2QxfdQJi1+pZiMpMJfQzzlq6yHzOGPYoDoyXNk
         O4iIyKrf9hTud+9Z73dGANHY+T3UbCBajLANTLOmEho8V9us6nER9azfXEC7tZUINzUM
         TvvWyz8mEGQnIOX6zhTM/R7IAp36NWplu3CmzuIEFCQeaaLw9qy3GQldJLy+nY7nHyXq
         aMMg==
X-Gm-Message-State: AOJu0Yz/+ngOCJu0b6qbCruduhdqNlHS+UEwbLsoR2jfrQmcxfElhLPR
	a7oqFFlpgf7tbO65qT21Dy9f8cgoRcrHNYlwSTqY1lA2V2NHhdcXkYURGjaIG+4MsxS+saIppNk
	hRPXjP/RRTqz88ZFwXdjTAgUtqEXsHJGHTBFcpRKJnf/O7Eu/YPfIR3AApJlz828=
X-Gm-Gg: ASbGncuBJwlJ358Q9csCUytVjEDMD4j/Krly1d4hns+SLUHZirJHn5dQC3X6NPQumdp
	aBAmD0QO+sIobmQUyK1smvLIyCy2KEMZRoPdwE5ofNFAV6fdH2HqRISuLNR46As5PEl0wLvWFNk
	8AZuOnZqka3Z3sT87HDtgdCauinF8i8b3H6ZFDVKIJRgfzBo5g18qDgm6SrPOV8KCPyFBUfL8Jw
	I/f9PYWMgev/9IlsxEK8tB1Ew+/K3Qhek3Lz8Co+Dy5kiwGEUicSUQ5VeOSMqRLWQ9FJhatMdJo
	CRcSLmeLXfyq6M3PD2a+unP/RVioHt0bwOZkyKTRHXjH/AefYAhNIFrUgpVi8ptS2y27Q9+K
X-Received: by 2002:a05:6a20:12c6:b0:246:f1:becb with SMTP id adf61e73a8af0-2845641b8e8mr784460637.21.1758134194274;
        Wed, 17 Sep 2025 11:36:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6fj0ilA5J1JSi8r1NkoGdOEi/KhblhBq6z+KEIkAfzd2RFLzzaJjivTQzJqlE5wM4eOL2yA==
X-Received: by 2002:a05:6a20:12c6:b0:246:f1:becb with SMTP id adf61e73a8af0-2845641b8e8mr784419637.21.1758134193611;
        Wed, 17 Sep 2025 11:36:33 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb7ab97sm118391b3a.14.2025.09.17.11.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 11:36:33 -0700 (PDT)
Message-ID: <4d8f8608-4db2-4687-bf82-260ae32620f7@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 00:06:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bkumar@qti.qualcomm.com,
        ekansh.gupta@oss.qualcomm.com, kssb@qti.qualcomm.com
References: <3b566cd9-40ff-430e-bcae-1136cbabdf11@oss.qualcomm.com>
 <5gftkkb4i65gadzrnbzilsucrgcj76jj4ovu5yqt6fzfodiuva@eyctfaizlxy4>
 <3b21eb8e-4124-4ea1-a8a6-2190d25e2226@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <3b21eb8e-4124-4ea1-a8a6-2190d25e2226@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/1+jhxtItGlT
 XXBTgBGLCa5YfjGOAw9nHq8aRJx2sAxdCE7ElTN7DzjWRpE/M2vtce+PMg2FWRJ/o/nVm19EzgU
 BK9cFVRc9A4fR7/Mt2PfGm2H5hPwQ2YjmZdW12Bt5UnIg47klrraXkw2GuQM9RwUIbmpkcyjRhv
 AJMrZr5bQMkpPAHp07tOhJ4RoF816WYnLAqRm6YDgoe0wj8lYJTWEdP4wxUp8J0j5MKMItqAfS2
 ZnTzG7SKHWuTd1c3ic10E5tjlgEBKI2NdIySYtPX3ew92RZdUV9WUyf6nSvlTL7YCD6dDxfMlV1
 /u19832uxFZ/DhtBvUYUgqkZRs/vPvIOIU9yrbuZa7QhcnB+kNVtbgD/SCggtLnmAv6RAg/vY/A
 lP0vGqe2
X-Authority-Analysis: v=2.4 cv=MMFgmNZl c=1 sm=1 tr=0 ts=68caffb3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=GUSAshOaSUYLgpwjm9EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: NEddt9rCzUWnHE3ou336sUqmEsFH9U4g
X-Proofpoint-GUID: NEddt9rCzUWnHE3ou336sUqmEsFH9U4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202



On 9/18/2025 12:04 AM, Venkata Kota wrote:
> 
> 
> On 9/17/2025 6:11 PM, Dmitry Baryshkov wrote:
>> On Wed, Sep 17, 2025 at 10:31:53AM +0530, Venkata Kota wrote:
>>> The following changes since commit 
>>> f0f4634972f48c3330896bde5c94557b568a3a68:
>>>
>>>    Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>> dsp-fw-qcs8300_1
>>>
>>> for you to fetch changes up to f504dd64f1f5fde3aef24fcecfc165cf8845b22f:
>>>
>>>    qcom: Update DSP firmware for QCS8300 platform (2025-09-17 
>>> 10:30:17 +0530)
>>>
>>> ----------------------------------------------------------------
>>> Venkata Kota (1):
>>>        qcom: Update DSP firmware for QCS8300 platform
>>
>>      GPDSP has a capability to support Audio PD use cases.
>>
>> and? What does it mean and what does it have wrt. the commit contents?
>>
>> Please. Please. Write sensible commit messages.

Will check and update on the same.>>
>>   File: qcom/qcs8300/gpdsp0.mbn
>> -Version: DSP.AT.1.0.1-00096-LEMANS-1
>> +Version: DSP.AT.1.0.1-00125-LEMANS-1
>> +RawFile: qcom/qcs8300/gpdspua.jsn
>> +RawFile: qcom/qcs8300/gpdspr.jsn
>> +Version: DSP.AT.1.0.1-00125-LEMANS-1
>>
>> Do you see the Version tag under any other JSON file?  The jsn files are
>> not versioned, please drop the last Version tag.
> I have remove the Version Tag now.>
>>>
>>>   WHENCE                   |   9 ++++++---
>>>   qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
>>>   qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3080192 bytes
>>>   qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
>>>   qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
>>>   qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
>>>   6 files changed, 57 insertions(+), 3 deletions(-)
>>>   create mode 100644 qcom/qcs8300/gpdspr.jsn
>>>   create mode 100644 qcom/qcs8300/gpdspua.jsn
>>
> 

