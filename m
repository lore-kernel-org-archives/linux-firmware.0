Return-Path: <SRS0=Zcrd=AY=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B058FC54EFC
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Feb 2026 06:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CB95C19421; Fri, 20 Feb 2026 06:02:49 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D534C116D0
	for <linux-firmware@kernel.org>; Fri, 20 Feb 2026 06:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D534C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5SJ8r2380873
	for <linux-firmware@kernel.org>; Fri, 20 Feb 2026 06:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoMHpO5aNhD4nAfUrAbRwe2wsxQh+lFJWbTB/hah8S4=; b=aHrtb7CGgCtI36wG
	giZ27JwN2Q/aEo8SqcjJqqr3lbJe6PUlXcMQMY60pr8/l596EpRcBCjzkVndbN2h
	Q6oJ1eJabDlBdNcXXOMKbwG9A23RgXwv7AiyX59KxG1VgUZHqGjtuNcxwhI/9cCb
	QVEaQgZGKGNH24TIjLZB3v0Rj0OE/pOTLTdTB4sm/ZweG+vP0d3KLYpvFgx1i7XW
	DID/EFt5XPC2iferylNfF5uHj6x0kLi+lT6foyih/WvbrcXaUF5OYZNQKv78se9L
	9oN3tlxw67h+V8h/IeYCv22VWe2e4PRRPrH851Bnb/gQaTV2HFTbwEtj+d7wqP9z
	MdGvXw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cechh8snq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 20 Feb 2026 06:02:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3569ceeb335so1664149a91.2
        for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 22:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771567365; x=1772172165; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zoMHpO5aNhD4nAfUrAbRwe2wsxQh+lFJWbTB/hah8S4=;
        b=PMIIj41gGwVofAUoXqceJod63NvwdaNHH0ugLS3upj8gcCSuqAaoqNReCdBaqjlKu5
         b4SPNA386M3uWgSGxAZaMtyaHR5m4IxRS8ca7Hwa7NVfzmenF9VOMmGQIhYYsghcIYs3
         s8/DuTJfaLu6YdaQh3Z0JPTdjCzVhqk2H5fI6n5/3URLGsS6/G6cwgBalW21g3uTz7qs
         JqaM9dSyOx2Gn3NrIygWh8E2AcWAPZG8dKVwbQ3i9rVDxMkgTDW5CcCLE9US+pfv9vDN
         +ND80eKQOTu36f99witZXRf51/guYyxwawJKY8JEkNOkfksoTdFeuZipKoVy/ba2IwQq
         Mq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771567365; x=1772172165;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoMHpO5aNhD4nAfUrAbRwe2wsxQh+lFJWbTB/hah8S4=;
        b=oZ3fFrNy/ghfwknEsupiCZtTvWIkOL4DU5aUCP3VqfmXPswDDmxtyXIbpuv2YYer2T
         Ikt1nJ7msHCD6fVdOS6/T8YBE9XXDtl9lkiMHzEqnVhqAdBFNxSOBhjv65OtLevNbdgm
         oGfifVFGgSPNpnJnnUIB/KpemR4/D4BEaNvg6Yi4EmvPhumYX2jR0H48XGW8t0NKwsff
         KWEPsfV8JXGgyjmf/5VMcdsoDo1atbxOaYQBKRu9ZVHXDWKHVnsR0dEyqPPjc8A4r5v+
         1Iff9vcFNk1gNELXCYZ8DEf0qgftIDXdFmuXhfhYqEEEu2yCXUvhFxZ1G+TmGCCKcS6P
         pkIg==
X-Gm-Message-State: AOJu0YzI9WKcMJxnXuKQabc8BGhVDKdyvpoTuiyn1bukwVHMYwHK+V2p
	chM6ONBk5a49ZoNg+TfJhiKdCauQoQ3uYn0q37EMG0FHqhkXaN9KGcEDa+K6AbZYzNTeVrkEHnB
	bcNoEmiTJ/hqzuYRPho1czr5DeVmmEV9CNPFxjQKjGiVvPnZ8SHi60RYjFVdo47qiIYplmgk=
X-Gm-Gg: AZuq6aKf9zoF5RuXssWwUG+/EpH1XYjye2CdWl4UHpyC8+p24DgMGFxymBQaRAIw4Ej
	EJNM854HxyKW5uAikVxEBqQcakGJ1oAL2Knk2FIM4kg9GXXuq4xpXS6TXGPt2YB0uHF3htBtZOt
	X5VWRB6wJnGUfUtjZtR0iSiZJ8dSwcWOCE+U54QcWXZb7QJCTLrQkeQp2v5j5iZgzbcZ9UK1yfA
	nB1gCWwysFWc5rButiJBd78uHjBQ0UlTtOy/FqGHvhBusQUbgqCvnRNnp4TdDeU/5mzATZGsPt/
	Wfp3AEcHsahyxtj5yH0d/4t5tQCBGguZbGAia4ITDseBXaCdWm8+MCp3XrfHSKCpe6+viPkCAj4
	uHo809NEEQHAio1yhF2nSH4H7zIbJUQYVTWBFPH31HqR6qRuYXBI=
X-Received: by 2002:a17:90a:e190:b0:34c:aba2:dd95 with SMTP id 98e67ed59e1d1-358891567e6mr6193658a91.26.1771567365524;
        Thu, 19 Feb 2026 22:02:45 -0800 (PST)
X-Received: by 2002:a17:90a:e190:b0:34c:aba2:dd95 with SMTP id 98e67ed59e1d1-358891567e6mr6193626a91.26.1771567364984;
        Thu, 19 Feb 2026 22:02:44 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a2a3c04csm592107a91.3.2026.02.19.22.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 22:02:44 -0800 (PST)
Message-ID: <25d3176b-f5ff-f3b5-d482-f2f7c8a5626f@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:32:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: qcom: vpu: Add video firmware Gen2 binary for SC7280
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <fbc5562b-6b15-141f-0039-6c1a5931d555@oss.qualcomm.com>
 <4gw7ghocmugk7w7urjat2kfsragtqvtq2obnxaq7buibnktbho@o2jkqxbfutpu>
 <b3bcdf45-bf16-b334-964c-daf338f5816f@oss.qualcomm.com>
 <ksf5fwfvot5jwrxq5l3kqq7wukj2brdadldq6vbomqw4x4rydi@rqi3a3ija36q>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <ksf5fwfvot5jwrxq5l3kqq7wukj2brdadldq6vbomqw4x4rydi@rqi3a3ija36q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _8vSMz6uepxQgOt_Qq0mu8Me7Ds6Ez-k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1MSBTYWx0ZWRfX+EVKmomJ6SQ9
 7zdQ3kjF2K9kYWvnxTHIzOUyGrYNwZvb6sEJCG8VIraF7Q7bHQzugQYT58B/69F2noB5N8H6IDx
 W3/By8h5a5+2RHdlBu7lK1jQmestlLeRGyH+FtjYBHyZ7hgLoYoi95demZa/gwHTVQV266c31fB
 TunUc8WJjvOyZwq2w8Lan9J6L6gobknTkNSn/n0BXc0IRdwT3sFGEq56+k3t9fDD0ozw43b1qor
 JXxMJRl1DRZnv+MvciKjZAhhoCno9zhiaKUB7FbXUQ31nQoi5mzutTmS5dqAhJYBivu/WxHEQij
 Bh1gf1ncdhPdPXxqxvnqC7UEio0k2XxOy7xBkigPBbhgVK0Y0jNY0uBUVCrYp/McQmeqEn/dsNx
 /+U/NHYAwMx21gcjX7es/X96rYuxmAsAGkgJoZf/mk7NYYxvDnTPRugr2RLeRDG4f09ke1gk3Kd
 zh0rjUrlRQs63/30Ziw==
X-Proofpoint-ORIG-GUID: _8vSMz6uepxQgOt_Qq0mu8Me7Ds6Ez-k
X-Authority-Analysis: v=2.4 cv=KYzfcAYD c=1 sm=1 tr=0 ts=6997f906 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=vgTJ3uqYKia970mDUHNZug==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=W0aLRtTeAf3Dn9fgWlkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200051



On 2/19/2026 6:15 PM, Dmitry Baryshkov wrote:
> 
> 
> On 19/02/2026 14:32, Dikshita Agarwal wrote:
>> On 2/19/2026 11:46 AM, Dmitry Baryshkov wrote:
>>> On Thu, Feb 19, 2026 at 11:09:29AM +0530, Dikshita Agarwal wrote:
>>>> Hi,
>>>>
>>>> The following changes since commit f2dbd7a7a74be0d309d8058a55308dcea33a41d6:
>>>>
>>>>    Merge branch 'robot/pr-0-1770355730' into 'main' (2026-02-06 07:17:03 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> video-fw-kodiak-gen2
>>>>
>>>> for you to fetch changes up to 3da84f1b4bb062f18d7f08807beeb46328e06d46:
>>>>
>>>>    qcom vpu: Add video firmware Gen2 binary for SC7280 (2026-02-19 11:01:56
>>>> +0530)
>>>>
>>>> ----------------------------------------------------------------
>>>> Dikshita Agarwal (1):
>>>>        qcom vpu: Add video firmware Gen2 binary for SC7280
>>>>
>>>>   WHENCE                        |   4 ++++
>>>>   qcom/vpu/vpu20_p1_s6_gen2.mbn | Bin 0 -> 2030620 bytes
>>>
>>> What is the difference from the existing qcom/vpu/vpu20_p1_gen2.mbn?
>>> Why did you use a different name for the binary? Why are we not
>>> providing the backwards compatibility with the previous name?
>>
>> As I mentioned in the other thread, the earlier binary I posted was
>> incorrect. It contained an MBN v7 header,
> 
> Well... You didn't clarify why it was not working. Nor why did it get submitted this way.
> 
>> which is not compatible with the
>> SC7280. The correct binary should use an MBN v6 header.
>>
>> This one uses the MBN v6 header, which is why it is named
>> vpu20_p1_s6_gen2.mbn following the same naming convention as other video
>> firmwares.
> 
> I'd rather suggest vpu20_p1_gen2_s6.mbn. Consider other firmware for the
> the same VPU core with different signatures, vpu20_p1_s7_gen2.mbn vs
> vpu20_p1_gen2_s7.mbn. The latter points out that it is the same
> firmware, just signed differently.

Ack, would rename accordingly.

> 
>> I was initially planning to drop the non‑working firmware vpu20_p1_gen2.mbn
>> in this PR, but since you already raised a PR for it, I didn’t make any
>> changes regarding that file.
> 
> What is the firmware name that the driver has been using? I can clearly
> see .fwname = "./qcom/vpu/vpu20_p1_gen2.mbn" in the current source code,
> which means that we likely out to provide the old name. I'd say, you
> either need to pick up my patch in your branch or just remove the
> existing firmware file on your own. And possibly provide a compatibility
> Link: clause. In any case, it all requires a better commit message than
> just "Add Host Firmware Interface (HFI) Gen2 based video firmware binary
> for sc7280.".
> 

Sure, I would remove the earlier non-working binary and explain the reason
in commit message clearly.

Thanks,
Dikshita

>>
>>>
>>> Granted your comment on the previous binary, was it actually tested?
>>
>> Yes, it is tested.
> 
