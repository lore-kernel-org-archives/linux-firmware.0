Return-Path: <SRS0=j60s=53=oss.qualcomm.com=vikash.garodia@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1921FCF34AD
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Nov 2025 14:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97514C2BCB1; Wed, 19 Nov 2025 14:27:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3527CC4AF14
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 14:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3527CC4AF14
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJA2eb63165137
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 14:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqMAxk0qRPsUMXwcPv9EN8HaZ17OrQ/8mxxE1nP9cPE=; b=E1BtxtqsrrPzt+0a
	yD/nHQ2JRjx/6GRkugxq5wL+QS45hJ1+D4Ham4U4erX6HWMRTdmNEor5tH+NPiPb
	Zi7ayzrf1Vi5vqfL/xjPTs5O6M5WtYvEbcW7Ymgl3zuoKsSR2h3NcEpRyiJYIUw7
	y/5X1XyWUEZUTmDj6qmVpiEKV0/+gQbTWPrHhwm3k/D6VHL2izHkG++GlaYZY1gS
	MBVY3d1OVgPmH34sdLLpYUZyasrhZ38t4Gs5CSNfkIma3wlQuGXOcrwcbjDC1w2e
	jFy+jASX0HCEI33NmfFKAYvnP94B7YCPCMjdPfvpYFiMGzBkIKqwbaK2Y7lijjzj
	+7X6PA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agvqgufdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 14:27:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3439fe6229aso1291426a91.1
        for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 06:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763562455; x=1764167255; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NqMAxk0qRPsUMXwcPv9EN8HaZ17OrQ/8mxxE1nP9cPE=;
        b=XDFh5Xs5HbkTBNlFE2rQBjZNkwh0C2reCGJ8emJg+8UZwxi7zeBTgqbFfWflKwyq99
         ZAnovV9B8elofhpByEA+Y6NzqJE2/LanzyLsITy+1KD5qMlcIzyanBItAXjiOvCEy95V
         nKYmbb3XAq8IZRVlLaN8eY7q+3WyxIUEOitR1E1pVzLqblBLeGgWtrq7wFlnlNioXIml
         9YUyjMVvZ3TGT8DO1WJJfHUPgXFFi5djN7ny6qZ3XGs1VHIx0MmMfJMh5zrdPc3VWVD6
         gcmSEHY+bigcdRYZiXltQ0cMEAiIL4WFioJIqUArgLEJQaj7jfQmSYDs21xOwqc1XIPq
         2Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562455; x=1764167255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqMAxk0qRPsUMXwcPv9EN8HaZ17OrQ/8mxxE1nP9cPE=;
        b=avHLFj4EWjSbP70hhyQMlcuRmORQI24BVefxahp5KkoeXwff1tmDac1TveBXyKzavl
         3otcW393HVXS8vQr0/2VDNfa70HlUoiWvzTLuG1rRKB637Pb1680Wyri1qIVq1SJZKW2
         W/IoR+L18zZohburuLCCtjCeuBFni4vrIDeeQaxyv98oHD+fj9dkhsd1QFh6rv9hyjcY
         pTnOQ9tyEmkutZbeAPtfiJwfr781turMbrRfYLur/m5kCGfSSUs4uLEpwwMgO2b0iCv0
         7JkLfIcu11yED1EjBmWuc9E9M2jw0QezRlfo02gLStv5nE2ovcbYxJRWS1pcCo6kc0Ez
         J0BQ==
X-Gm-Message-State: AOJu0Yz23Mc4vLZSwwellA/wYNnLdegeW3diBZHIRc5+xu6Bccv6sRn8
	FjDBawsKNA7AoO0iYYbZ7UlYnROrdRChIFGMq5fZnLR04XnxEo/n4B8Ho0bgM2SOZY0ztAOoT7V
	VY7xMz04gOa64iqJRcdwdMhrHd5BomY9c5jhL6yRBIfn/LxN2+kOFFMU2aXzWyK2EbnlXctY=
X-Gm-Gg: ASbGncuH74POQRkxF6JwkvkFnHVPWF6tJ0+dipmKyIjO7HxHM/c4sbAEH7rwcDiB1Bk
	4ixFlVe/0B7FndDv4WwEm6MUsPBIPogZt7A23jU8FB8FuxJnbO6CHdnj+xfN/dM6URFEB2FsHaK
	c4bO5GRHJ275VT3jHIYdXmCiD6HHr2YI8u2Rw40NzB5aHJsXr8KL54O67O25LINwrRtV7hM4TyL
	n8NfBMEa9ziUwcL4Y5S1yoTUD4haWRnPyTvrqSJfYxFgyORSG1k5AOX9Q/CA2FDWIPeUYRbx6Q8
	FqVRzXVtg005mhtneT+NIj8Rt+MgYkJBwI0w/+9iaaxFfO9NezfI/+4Sgies5+ppwc6Dm5KDsJK
	1VU4nqLgJgfoFnJCINoo7hyWzLYXq5WXhRGI+q1BMrQ==
X-Received: by 2002:a17:90b:5403:b0:343:78ed:8d19 with SMTP id 98e67ed59e1d1-345bd18ac41mr3156766a91.7.1763562455094;
        Wed, 19 Nov 2025 06:27:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjqJst94Eq5eGqy/NsOVCatEDY/GmLtS1fEINAaWXj2o+bsWE0GOwvwTyux8EpnB4EpEYVHA==
X-Received: by 2002:a17:90b:5403:b0:343:78ed:8d19 with SMTP id 98e67ed59e1d1-345bd18ac41mr3156718a91.7.1763562454506;
        Wed, 19 Nov 2025 06:27:34 -0800 (PST)
Received: from [10.204.101.42] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c24254sm19958495b3a.64.2025.11.19.06.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 06:27:34 -0800 (PST)
Message-ID: <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 19:57:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: update firmware binary for v5.4
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bYVBig36aD2XjYK2xaXvH9NVrbg8zyGT
X-Proofpoint-GUID: bYVBig36aD2XjYK2xaXvH9NVrbg8zyGT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDExNSBTYWx0ZWRfX7f4eCZeQzwsI
 KEurp73FoCZB7kkpUJKS1tATpcpwA06Kn+TcgtLYHxtoQAWHWbSXA6f7d123hlAm6RNGuqAUixX
 KCFWqyW0H374Qq2fVkUCVB/VQEED9807Hdi42YJQWwMqHJxGNBQo3UHCsaPBn+FOuot9ss1/BdV
 d3Qh9nqRvm6yoU6yq42ESduviqACgOySJysPlapa1ZFN9GN4XVGOgbORUhEeNJLVQKoqCTfuJrK
 9rkIZosSB6C/SSS+xGk8dCiY1cq/ySqHxkfZNBIxT4TRar+MzQ2pSAg7Cs3Gld24in9tYJnBnsS
 aTkEOANuSSeMkn5g/gAaiaWuJx1NoH/MO2xXXqUGSXy4L8y3akfD0LAhDcC3xPbkxPU39Oh/Grt
 bmho0szlxhxIw0pIYpOTaqT6p+6cfA==
X-Authority-Analysis: v=2.4 cv=LMJrgZW9 c=1 sm=1 tr=0 ts=691dd3d8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=Z42K7QwYiLQL7T6oQP8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190115

Hello Dmitry,

On 11/19/2025 4:55 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 19, 2025 at 05:39:43PM +0800, Renjiang Han wrote:
>> Hi
>>
>> The following changes since commit 6fc940781a013ad837ed8fea326d2b897467bbc3:
>>
>>    Merge branch 'robot/patch-0-1762826844' into 'main' (2025-11-11 12:02:02
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> update-video-fw-sm6150
>>
>> for you to fetch changes up to 0a6f987b7b07a6fec2d4fd42ac4473c0523d3af6:
>>
>>    qcom: venus-5.4: update firmware binary for v5.4 (2025-11-19 15:04:09
>> +0530)
>>
>> ----------------------------------------------------------------
>> Renjiang Han (1):
>>        qcom: venus-5.4: update firmware binary for v5.4
>>
>>   WHENCE                      |   6 +-----
>>   qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
> 
> And this firmware file is also going to work on SC7180, correct?

Yes, we have got this validated on SC7180 as well.

> 
>>   qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
> 
> Vikash, Dikshita, could you please comment, what is going on here?
> 
> We have added venus_s6.mbn, then dropped it, saying that a normal
> venus.mbn can be used on QCS615. Then Renjiang added venus_s2.mbn
> (why?). Mario merged it despite my NAK, but that's a separate topic.
> Now we are dropping it again.
> 
> The firmware is the ABI between userspace and the kernel. We can't
> randomly add and remove files here.
> 
> Which file names are / were in use by the upstream kernel? I tried hard,
> but I couldn't find any mention of venus_s2.mbn in any of the patches
> on the linux-arm-msm mailing list.

venus_s2.mbn is not used anywhere. It was earlier planned to be used on 
qcs615 while venus.mbn would continue on sc7280, but then we wanted to 
use same bins for sc7180 and qcs615.

S2 variant can be produced now by re-signing this venus.mbn itself. To 
achieve this part, there were some elf alignment fixes, which is done 
with this bin to make it re-signable with any vendor specific #.

Regards,
Vikash
