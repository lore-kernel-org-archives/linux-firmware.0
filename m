Return-Path: <SRS0=FPJa=7H=oss.qualcomm.com=kishore.batta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1E7EEB57A
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Jan 2026 06:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59AC4C19421; Fri,  2 Jan 2026 06:27:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BBDAC116B1
	for <linux-firmware@kernel.org>; Fri,  2 Jan 2026 06:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BBDAC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601Ns9FT3347608
	for <linux-firmware@kernel.org>; Fri, 2 Jan 2026 06:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHWbZiSKZZ4TkZn8ICzIr7Yop81XYnpZUnrHdm90/eY=; b=WzwbWUfi89nKgQe5
	JzDGRkfXReWAkaxJ+pkLCy1BiBN8RC7c71dXnrhansE4u1iRzNOmP42+6gwPSpq1
	cF/oomfuxWtPjM1vsXu86jbMA/TwxZ5aAOyKBViBCnVOj6RnwJdKOlfFnYyxYfBZ
	g8k1EmJc4AIiEGpEG8AmZ5Ca6slZwnCPzS6a0uOJpiefAn8lXtVeuQHDV3N6J7b7
	MsX0GDn1kgGvaUAm+IGzF3P7veV49HvNAiJcZYvMv6JzZvB7iQ+vYpo6LJONn4SA
	jbIzjPBX04ZtD3n0LGdc4S4rGM10weO7u83zc8MYnSpdyxmYgHciOpFdsCZhOUyM
	2LoYpA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtjqd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 02 Jan 2026 06:27:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0bb1192cbso235454335ad.1
        for <linux-firmware@kernel.org>; Thu, 01 Jan 2026 22:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767335274; x=1767940074; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHWbZiSKZZ4TkZn8ICzIr7Yop81XYnpZUnrHdm90/eY=;
        b=KfiWTQVvcEPOYL+xozhSInbsK1qZtWvzFjfOcuBsfCc2Nn9B11OZbOe5MnXBc91NaE
         kbzRgtpBrDKr7qIzKvPxyhGQ/oiQkYhk8qdTbwtjg8XpCc9hQoZatls2E6Jeh2rox8b0
         ImbtFtyTXfD3tA/NV5SMeC6RAOZdspkWSxLjsdFF7S7MYgtB4Koj3tIbX/AneNpQwIt0
         l2o3ehv9LEw69pUrRKbPW7w5rm3HAgYlw7jrITiMX3HiZiX9QRS1Nyaay3vJFIlBOJ9F
         Sfmhwr1o6OxbSMOtTsog9vKn3hDjJND3VLyVtnC1V2pY/o2Pm9CLkIlfjirIGStQQ64D
         FDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767335274; x=1767940074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHWbZiSKZZ4TkZn8ICzIr7Yop81XYnpZUnrHdm90/eY=;
        b=fpKDJph0R5wIUq2ab0EQTBoqgP1DQOqTyzRSSguVGDzb3/BAahzHhry+OtWufpZpX5
         QHumSx5Y2RjtCIs88uY3e7wCxcri3Wyl7YNnLShxEoferccx4eCzRiD9+rMoXZAaQQKP
         7BysEoNb/3w1VO1ijIdYU9soU0WC/MNkQmd9+DCn2M0KORFyKWy2a2ScHTYVKreOfBMd
         rZ3+29r55lMWHFUY0D/GkF/OKyN9+iR3xP4Ir1klILbPsBYpCX8ur9LYHo5KxZjuLmFv
         8vgKv9G+jyuhJMhdElMXB+LF0xooaxja3bOEgmxwdiSZeMaNQ+Lk521oY0kzw8sziIwM
         USjQ==
X-Gm-Message-State: AOJu0Yx4iSeHNIxYRxBPhyul7TvREL+t/1aIo8x0jjD9EZiKhoeRZT/j
	e6Y4svE2Bg+9hAvdTk5ANZIQHJgq6c7hRhLKdzzCuULuwTqkC5cSrADn5gigT2Iv0vKeWAtGq8h
	s9gQVJs2P3NMeskEHkqn4xMppO/AhScbxhPcrSb61Aq+MzyHx2NjEotJQDXo3H/g=
X-Gm-Gg: AY/fxX49TCTeFrGrgbeSsC4XuECNx2VxCx/qNybjoVMt/qAxMLCuHfMrJjijd8FvYee
	kroZk1dTCW/+2cTAgpPAFA0TD973nDVaMhdJkO1QazRmVPFGAPiXidnos/0/TnIyrMum18i/P6a
	Sagny32KZKVuTPgnEehy//SJaS8ujS07PpmRnb8Bmg/8JK/1aQhtMBfY4RWxLwFpD5QIXvGa5DV
	rJTC2JU3Y0xxHNG4ZiSqGKs9Ce2gKCZEugeneMaxXepW7WT+NftcGsSj1Q8PvTPCjEBdjYLQt51
	EmpQevljzdTlSTK68saTTqkkVyvxuwZ4bLvsaigih7vLeWXmJykPMQ85NkUTfaQLGRnQ1fcdGR5
	rSCcDcUiTddHy4AN8HsYNYkPy4iH8Z9emnmtSCkEOkwY=
X-Received: by 2002:a17:902:ec8b:b0:2a2:c1a3:63df with SMTP id d9443c01a7336-2a2f2830da5mr413339495ad.31.1767335274224;
        Thu, 01 Jan 2026 22:27:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnbLPCgtNXZXdLybCYLMmD1BsDMa4AaJEJzabFOb73C6xk4thRmWV3ybv4+oRhrG4bkq0Zkw==
X-Received: by 2002:a17:902:ec8b:b0:2a2:c1a3:63df with SMTP id d9443c01a7336-2a2f2830da5mr413339345ad.31.1767335273704;
        Thu, 01 Jan 2026 22:27:53 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666casm363705165ad.3.2026.01.01.22.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jan 2026 22:27:53 -0800 (PST)
Message-ID: <b1d8f7f9-3e01-4055-8d6c-13a6f3f6e124@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 11:57:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL]: Revert QDU100 firmware binaries
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <deea8617-b699-4f48-80aa-69f78ccfe852@oss.qualcomm.com>
 <rt5k3ufrjpnaqfcomvapznnpg76xs3az3pz6d5reh5yldydvkk@irtjzqbfdbvs>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <rt5k3ufrjpnaqfcomvapznnpg76xs3az3pz6d5reh5yldydvkk@irtjzqbfdbvs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6957656b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=uIFtOAFOVHeFwMFbwjgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: nTiscFo-JBj3XsmKwWokDXn4IBym0KPT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA1OCBTYWx0ZWRfX+0Oab3Wds0gZ
 s65vTwTxdM65fMn8tndUBviFAtA7deJPnIMVtcqzGLaKl+RYmqDYW6dWkVzuHwSMNL5ScuCdWKs
 9ngQC3gu8sSrt5VDwbrHGgQv9PmRV3F4RZTTGt3NMI1MIG80rBcIitJCmjOwEQxFeodkAYOo2AV
 RP0H9RkQtXbyOIodVo809bvfWROqkTqZ/4WGL8QGU9GLGu+qQwXcvowY/+Cku2pYrzfpzBS4Rgq
 WKs9sFF0oyJ1LddA1OinIXXNHlKlZVMOnGIVZUSdN5sRmNYJkWm64n4rLBSFZN5Ts5RR9oWn+3T
 XPsvMJiwUUlmdTcUAzS4auzNJHV0FWfAjk0zOJLW+OYlQtKhifS6xDmAdlD9FZpKS2E1YXVMaut
 /F+1TYIICS6aumqFI5evmdNjT1U9zcv2kok21pGl1JNeUJRwqYiq6fE4Ez0aQJpZsUNkWbVMJjF
 koC2BMF42XaNM48goVA==
X-Proofpoint-GUID: nTiscFo-JBj3XsmKwWokDXn4IBym0KPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020058


On 12/18/2025 10:01 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 18, 2025 at 08:48:16PM +0530, Kishore Batta wrote:
>> The following changes since commit e66d9269e773a553a99f7771982a4bef06c562ec:
>>
>>    Merge branch 'robot/pr-0-1766039412' into 'main' (2025-12-18 13:28:40
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/kishorebatta-ossqcom/remove_qdu_firmware.git
>>
>> for you to fetch changes up to 1b13c94137c81ae21d81065ac94c27e71c51bc96:
>>
>>    [PULL] : Revert QDU100 firmware binaries. (2025-12-18 20:36:55 +0530)
>>
>> ----------------------------------------------------------------
>> Kishore Batta (1):
>>        [PULL] : Revert QDU100 firmware binaries.
> Why is [PULL] being a part of the commit message?
I will remove PULL and use a descriptive subject line in the next revert 
patch.
>
> Also, more than a month ago, when it was submitted previously, I asked
> for a list of the affected software. Are you saying that you are unable
> to compile it?
The affected component is the kernel_boot.elf image used in QDU100 
firmware. No other modules are impacted.
> Also, why are you mentioning some random NOTICE files? This is a licence
> breach, it should be described and treated as such. Write a sensible
> commit message.
I will remove unnecessary references to NOTICE files. The commit message 
will cleanly state that the revert is due to license compliance issue 
and will describe the commit message properly.
>
>>   WHENCE                          |     22 -
>>   qcom/NOTICE.txt                 | 268885 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> What is this? Why are you touching a file which supposedly applies to
> other firmware files?
I will ensure that the next patch only reverts the kernel_boot.elf image 
and does not touch qcom/NOTICE.txt or any unrelated files.
>
>>   qcom/qdu100/abl_userdebug.elf   |    Bin 212792 -> 0 bytes
>>   qcom/qdu100/aop.mbn             |    Bin 510944 -> 0 bytes
>>   qcom/qdu100/aop_devcfg.mbn      |    Bin 12136 -> 0 bytes
>>   qcom/qdu100/cpucp.elf           |    Bin 68576 -> 0 bytes
>>   qcom/qdu100/efs1.bin            |    Bin 512 -> 0 bytes
>>   qcom/qdu100/efs2.bin            |    Bin 512 -> 0 bytes
>>   qcom/qdu100/efs3.bin            |    Bin 512 -> 0 bytes
>>   qcom/qdu100/fw_csm_gsi_3.0.elf  |    Bin 20328 -> 0 bytes
>>   qcom/qdu100/hypvm.mbn           |    Bin 1358672 -> 0 bytes
>>   qcom/qdu100/kernel_boot.elf     |    Bin 49004344 -> 0 bytes
>>   qcom/qdu100/mdmddr.mbn          |    Bin 81960 -> 0 bytes
>>   qcom/qdu100/multi_image.mbn     |    Bin 12088 -> 0 bytes
>>   qcom/qdu100/multi_image_qti.mbn |    Bin 12088 -> 0 bytes
>>   qcom/qdu100/qdsp6sw.mbn.xz      |    Bin 5589248 -> 0 bytes
>>   qcom/qdu100/qdsp6sw_dtbs.elf    |    Bin 7992 -> 0 bytes
>>   qcom/qdu100/qupv3fw.elf         |    Bin 56432 -> 0 bytes
>>   qcom/qdu100/shrm.elf            |    Bin 82428 -> 0 bytes
>>   qcom/qdu100/tz.mbn              |    Bin 3186640 -> 0 bytes
>>   qcom/qdu100/uefi.elf            |    Bin 2666296 -> 0 bytes
>>   qcom/qdu100/xbl_config.elf      |    Bin 225368 -> 0 bytes
>>   qcom/qdu100/xbl_ramdump.elf     |    Bin 749464 -> 0 bytes
>>   qcom/qdu100/zeros_1sector.bin   |    Bin 512 -> 0 bytes
> Are all the files in the list affected by the Open Source Software
> licence breach?
The license compliance issue applies only to kernel_boot.elf image The 
previous patch inadvertently included other QDU100 firmware binaries 
because it was based on a full revert of the original commit. I will 
correct this in the next patch so that only kernel_boot.elf is reverted 
and no other files are touched.
>
>>   24 files changed, 268426 insertions(+), 481 deletions(-)
>>   delete mode 100644 qcom/qdu100/abl_userdebug.elf
>>   delete mode 100644 qcom/qdu100/aop.mbn
>>   delete mode 100644 qcom/qdu100/aop_devcfg.mbn
>>   delete mode 100644 qcom/qdu100/cpucp.elf
>>   delete mode 100644 qcom/qdu100/efs1.bin
>>   delete mode 100644 qcom/qdu100/efs2.bin
>>   delete mode 100644 qcom/qdu100/efs3.bin
>>   delete mode 100644 qcom/qdu100/fw_csm_gsi_3.0.elf
>>   delete mode 100644 qcom/qdu100/hypvm.mbn
>>   delete mode 100644 qcom/qdu100/kernel_boot.elf
>>   delete mode 100644 qcom/qdu100/mdmddr.mbn
>>   delete mode 100644 qcom/qdu100/multi_image.mbn
>>   delete mode 100644 qcom/qdu100/multi_image_qti.mbn
>>   delete mode 100644 qcom/qdu100/qdsp6sw.mbn.xz
>>   delete mode 100644 qcom/qdu100/qdsp6sw_dtbs.elf
>>   delete mode 100644 qcom/qdu100/qupv3fw.elf
>>   delete mode 100644 qcom/qdu100/shrm.elf
>>   delete mode 100644 qcom/qdu100/tz.mbn
>>   delete mode 100644 qcom/qdu100/uefi.elf
>>   delete mode 100644 qcom/qdu100/xbl_config.elf
>>   delete mode 100644 qcom/qdu100/xbl_ramdump.elf
>>   delete mode 100644 qcom/qdu100/zeros_1sector.bin
>>
