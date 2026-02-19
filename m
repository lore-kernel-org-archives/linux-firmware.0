Return-Path: <SRS0=bFuW=AX=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F38E9A03B
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Feb 2026 12:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3A12C116D0; Thu, 19 Feb 2026 12:32:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C869EC4CEF7
	for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 12:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C869EC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JANiQ62004899
	for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 12:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TiOMz2YQJF6Djr02qWmpSKM1qp+9E45r73x4qE8RM9s=; b=QaHyKVAhWX/GTi0o
	E9y6Wo9RrbYsFlMFzzimHaQENwmKZgujsS26sg01hJjidWwcepX2auGEJKtOfYbP
	bPomqlvmCzEjrci47ffFHlWRsJI6Tv3JJmvIAKHKo47PZDyD1EPvC/zwGEKSSuQO
	zu712CkRoZAGDGgRA5bjwVL+WPlFcggFrgUIIv64fnp3tGLxUm+BUuZsX0ilLbh9
	AfSNCvkGXQLQGsEAtXGNTuJ49EiGT1JHOzgJKuKp0jvFlergvP1978LVeV4O2x8g
	QCwpZOIklAwEM0R491towz8PBicJf19/f9OwmgpeSbTOZyjx1vW0PEr5u8Pthx+B
	0BWmlA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdn1qhvvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 12:32:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a75ed2f89dso9244335ad.1
        for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 04:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771504365; x=1772109165; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TiOMz2YQJF6Djr02qWmpSKM1qp+9E45r73x4qE8RM9s=;
        b=cHworIZ1W+PUhXC2panzVKPnqLiBK5zMTlnfJncx2ESp2nfAGKnZwAK5F2PyadkyfG
         vUnCyJ3jKTY1Nee2/Ytc7yNscrs1Mu6zVZ4xlfQninXwOTcM8cd3IQFg0iAjbsi5iE6K
         lEqG7/92EQ/jpsgt9GZCemn8vWfr/IkcFhn2JbBnczdTu+WS6x4dfzr/RQfQg2BBfd7r
         7/GQpdPWK9CXkE90hbPb00b1zJfRyneJ7v0xtddH4/ihdDfeQr3Cf3W47hMYzEQSVfAF
         cCG8Kpuktb7JZeee+GhigOejT+SsUiTAPafDpNaZdikSM6dNgBdHCaKPfDULomMDQ8m5
         ixCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771504365; x=1772109165;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiOMz2YQJF6Djr02qWmpSKM1qp+9E45r73x4qE8RM9s=;
        b=o/gH8LOvPZ9zUEJz5/vrVw9UqG6elOqByVhx4RZK398zqVY47gWoSz9VeWRVoXvxtq
         +sC5oBLUIX6dDtWY+3Ih4GHZuIK4KxJvABMTKo1jQXX2MS3WnSZXmNupNCtiu7EX69JB
         z1DvFWQWhp4ahn31MowAiINN19FvAvYG1HMdheKAjUNm+Cl9qmMdGA4Ud0Ul4MSDpbQI
         bNlCAtx9U4vMO+2UKBg2SYAZ3tBClGJriEZ0B1A6wMXQsO3uX9jVR2EY1gBEeLsFtdAQ
         VzNnz4tvov1wNlD2crcLQNHYO/IRi3VXcIy5fRn/jvkSnLjTH0wtJEdrDzreg4nbeMue
         lNaw==
X-Gm-Message-State: AOJu0YyoNIWTaZNc9o0zdRcXyjPo5H0caDnN+YwyN6Lkod8tvQNXfOIB
	SqPBoQJAtF2/CXj/BTp64Aj9+BcG3OT2zSl/I8e11h884pv+eth4XdpSaDF5/givbs7+uB8n3oJ
	0qlIm3WybfsUS1UzALRwoUlcIW9st5JOpofwP/wSxkWqAtkWE5PzTR1eR1FhhZCi8LUhXDDE=
X-Gm-Gg: AZuq6aKTSz5d8bM+vVohqR8jUGFmML1UWzaC9GGYygJh/Oa8lQuBJQH4uedBcvWdfwA
	Nqhdg9a7a7MCoif/mDTjwCl1XQ2aehuIRRUXSx3uQq8ZisPFeXyRJgJ5sWuUgxRkx1IkrXRQRfd
	x/ANG8bnmZj3SYEk79VSKCfdfSaibFE0ciKP1lrI0SDqGZ4FCEf7uY9yJPQS1DXIWf733qwzFZF
	siH6JSA8XygWqecRF/PDYSIdQWubNJc9087jFGa+vMdgIDze7rgvyufvRuUmm67Zbb8XJZ5dZYA
	MqyA7tcnS3ISwhDQdWBmXLYpA00wKj/ZoWxQ1EX7YSljUmteLrpS9bGZ5hQQ/voalJ8gidMh7kb
	aUWrRYJKYYRtHqJQbH9q+/ZlYWcN3/0hLse6FxcpMp0blCItnj6k=
X-Received: by 2002:a17:903:1c2:b0:2a7:9ded:9b4a with SMTP id d9443c01a7336-2ad174dcf04mr194554105ad.36.1771504365053;
        Thu, 19 Feb 2026 04:32:45 -0800 (PST)
X-Received: by 2002:a17:903:1c2:b0:2a7:9ded:9b4a with SMTP id d9443c01a7336-2ad174dcf04mr194553945ad.36.1771504364523;
        Thu, 19 Feb 2026 04:32:44 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d58e7sm171087255ad.45.2026.02.19.04.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 04:32:44 -0800 (PST)
Message-ID: <b3bcdf45-bf16-b334-964c-daf338f5816f@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 18:02:41 +0530
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
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <4gw7ghocmugk7w7urjat2kfsragtqvtq2obnxaq7buibnktbho@o2jkqxbfutpu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m7_Ys74xswL0Gr0vaNBIvAWKR5UQGBaB
X-Proofpoint-GUID: m7_Ys74xswL0Gr0vaNBIvAWKR5UQGBaB
X-Authority-Analysis: v=2.4 cv=c7umgB9l c=1 sm=1 tr=0 ts=699702ee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=vgTJ3uqYKia970mDUHNZug==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=SWR6FsiEr8PHFAUg5IUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDExNCBTYWx0ZWRfX9xYjXfLv6pCa
 peRqAhu9jdFLEeoiZxyEsR+ak0zuAq/ukQOSv4eP7SEZ441P8hxVanbjk8w1Y2xA3U+tzhcP4Ah
 gLbRZ453Hn21qI4sIcXl5cbeAXi+B+mbu+CAs5O8J4j5LgkyJKI8294IVk577EVgU4W7KzTRo5f
 K16IO3ku2y6PSfz5M0zD+C6+u6cY2SposvYPgJMb+y1h+THHJH84y3PQIk3cWhncOh9wtdc9bXn
 s3zuCKtioQeNKs6kjofAvQ99aAEtJhVamml+xNRr9XvPLV+9HI1iDz1oufXSCld2rsZe8f+BZac
 A9Xz+swPAd+B50ENaSaH/AZPf73LsbnN96L+X4XaTzUj/7QWsn1ztsmfIiCfVCs0TrmckX50q6Z
 FOxXKm6IOxFulxHYokKIX3mWAbJzcYjhAOO27Culq5kIHmYtN4KE0DdeiayDLkQrN/hGVqpIjiZ
 eBzz/AqCEu0M12FdzsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190114



On 2/19/2026 11:46 AM, Dmitry Baryshkov wrote:
> On Thu, Feb 19, 2026 at 11:09:29AM +0530, Dikshita Agarwal wrote:
>> Hi,
>>
>> The following changes since commit f2dbd7a7a74be0d309d8058a55308dcea33a41d6:
>>
>>   Merge branch 'robot/pr-0-1770355730' into 'main' (2026-02-06 07:17:03 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> video-fw-kodiak-gen2
>>
>> for you to fetch changes up to 3da84f1b4bb062f18d7f08807beeb46328e06d46:
>>
>>   qcom vpu: Add video firmware Gen2 binary for SC7280 (2026-02-19 11:01:56
>> +0530)
>>
>> ----------------------------------------------------------------
>> Dikshita Agarwal (1):
>>       qcom vpu: Add video firmware Gen2 binary for SC7280
>>
>>  WHENCE                        |   4 ++++
>>  qcom/vpu/vpu20_p1_s6_gen2.mbn | Bin 0 -> 2030620 bytes
> 
> What is the difference from the existing qcom/vpu/vpu20_p1_gen2.mbn?
> Why did you use a different name for the binary? Why are we not
> providing the backwards compatibility with the previous name?

As I mentioned in the other thread, the earlier binary I posted was
incorrect. It contained an MBN v7 header, which is not compatible with the
SC7280. The correct binary should use an MBN v6 header.

This one uses the MBN v6 header, which is why it is named
vpu20_p1_s6_gen2.mbn following the same naming convention as other video
firmwares.

I was initially planning to drop the non‑working firmware vpu20_p1_gen2.mbn
in this PR, but since you already raised a PR for it, I didn’t make any
changes regarding that file.

> 
> Granted your comment on the previous binary, was it actually tested?

Yes, it is tested.

Thanks,
Dikshita
> 
> 
>>  2 files changed, 4 insertions(+)
>>  create mode 100644 qcom/vpu/vpu20_p1_s6_gen2.mbn
>>
>> Thanks,
>> Dikshita
> 
