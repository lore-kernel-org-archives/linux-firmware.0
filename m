Return-Path: <SRS0=j60s=53=oss.qualcomm.com=vikash.garodia@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BC7CF3955
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Nov 2025 16:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30E16C116C6; Wed, 19 Nov 2025 16:19:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 300E9C4CEF5
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 16:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 300E9C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJFkO0c2061019
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 16:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+5Ce6NS6D40SFEh/2YQoO8Tt467IhpWFfOd00ssAWn8=; b=DZaxiFTVk3Of0PXv
	t0rdPGphdspKnxqfWTIG0G8sDAqIjSjDUG53+O1j1yxujZDIQTpy+RC1lX3ymEWe
	Lg5pyhykWr4p3IO0g+R93lwcmKMMcjW1BFQEPSqjesl90dielqZht2B1b3+2Mxug
	founii2/8aWBcBV6iJake2JbZD3TXdrZ3HvnUot1FMNAoHYHLySFzau0ztiHFOKl
	do8fhqhhy5lCAj25uPHMWj8/OZ8YBqjBehoswERFYAOsfuUfcL2psqN3D01asNWK
	nP2ej23L3OXB2BEWXojdvpn25aBmy7nYwXB9SZCumNAU7YhFERzS59PMMIxO5MZa
	8DeqfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9fu9kp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 16:19:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-343725e6243so1149379a91.1
        for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 08:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763569164; x=1764173964; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5Ce6NS6D40SFEh/2YQoO8Tt467IhpWFfOd00ssAWn8=;
        b=O4ckRlE8H4iKzqTTwuh3Z0Lt8DnOV3OT1YpCUNI7JVffm8hQKCrX+mFWFILr9dK482
         lb1Atq/8jqNR4yfI8siVquQEsfOIvI7KOoU0LwucfKXF1047tMLzdmQw4PXivLK+XCII
         iIE8P5XG2/YPo4FoF1Rp+gTVe6xbhCzW3VWg/7o4Qj04EBJlX+jo2d4yLp0/RNK+xs74
         cAnF7G6cgOSfkN0RfoksiQFcw8cH68UDgreOs6SOX+n5Q2D3/rlOBIGHr3JhFQAChDcV
         MffOKQgBKySMWn+J67YDXsBNnUmRMFngy0abeaYlGB5JdXK5nFmz9c0ZFzfmokIi/RlE
         SmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569164; x=1764173964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5Ce6NS6D40SFEh/2YQoO8Tt467IhpWFfOd00ssAWn8=;
        b=lO1IDzcqDUTZb2DsF+eTACTj+PJKbt1Q4Ve/BUqEjKqdI/eQpyMUtpzazi0d7hgOIa
         kbI6mxF1oF/kU+KXX3bTMBmjZDfLEBo8gACsGWfUbwC5xmRLiO8Ks47mkVvuGbXaVnYH
         3NZTTpiYqL44arc6BZAvyMbD0zhOqMK0nhTwyV2rQPm/DrPBvQ4X4nvryYXjDK4TgB3G
         /EIGPnw8kDTYyPcUi9enrqQKeJp6TvoZVqg8m56naHlm5b9oRlOidqQzt1R8gpmITcIo
         Ofw9euM/7d54Ebj8VSqg7ClGxqKb6HWAPIA0XqerZ+p0F1LRDR5YXRhNM0h+HryLC0dI
         pUaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvChS1hFIt/EIwx/L6glEpJRVbKE6ZOitLLEeV9LQYwNduM+0bk19KihfKixlIlhXUGBH6/RA3Jw5l/ZMrMg==@kernel.org
X-Gm-Message-State: AOJu0Yy67oyCexz+RQHOE0g0w/+zwcNxq+abx4py41mTkqYjnLJqRR1X
	exzzYC9qhVSTtpsMZh6reXyjKqnlo7Yfg/10ZFe6GxPys3R36KZVrBON+zBPg5KKczU8X5B8AEx
	qHB7yZsWCmfgWRVCpaDuJ/uKaMU2Jw+lexQQpg6Yc94aizAht+Va3pDRGct1wrZo=
X-Gm-Gg: ASbGncuInJeaKXPAkxE7U1C0jvS0d05u5rg6V1KvRgwNqhNZXuG0r/7ywr7FmY0JAfK
	ufZIs3GM7cuJtj975cn5hXOQ36buMlsf4HJa+bkS118YXPWuM51i7Ll9xe+G/+DHGWW4R71YGb3
	c/Ve0p96PUxv2cbM40vfPLOqNQzvP+hxYTrnU9yk4xrkL9Fiq1b408CT0bLurEKf9T46ExgG3ZG
	npgZx4zV75rgOf0AQmKu2+NucoBEsvP0NsmZOGmJJFZbwfpH/yuiU//uv2cT6qNzu+wS9vhmTEo
	zDlPmnP4nFJSB9m1Prouzt89CraU9SqfDpI3TsqjoTpkx2v1z16FfvKiFxmBLOmXHs1Ita7tft6
	hycWd8ez3Nx2jCX7q8RBK2r1UdruLzBWZBzRxXLwjZA==
X-Received: by 2002:a17:90b:2807:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-345bd46daa3mr2988788a91.15.1763569163701;
        Wed, 19 Nov 2025 08:19:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcJJl9lM6eQqEgv/soWEC98fV6mEHq22INrtk6xDD/KqtFeKFVP2HGUlSc8tRPmUG7TmdEmA==
X-Received: by 2002:a17:90b:2807:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-345bd46daa3mr2988764a91.15.1763569163025;
        Wed, 19 Nov 2025 08:19:23 -0800 (PST)
Received: from [10.206.101.67] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b03971fcsm3152847a91.5.2025.11.19.08.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:19:22 -0800 (PST)
Message-ID: <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 21:49:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: update firmware binary for v5.4
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Renjiang Han <renjiang.han@oss.qualcomm.com>, linux-firmware@kernel.org,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
 <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
 <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyOCBTYWx0ZWRfX42WBR/1SCOEn
 ppcSp1d+Vo1taqQP4nV/U7vTmFInBHt8sDHjdLBVw/qqveXF8qnewPTD4zsTtG+Ywcm2h591U54
 Fnan4Ka+qLexoIwgV7i/AAw9XYynLpHPT3ULE6bnCi3w/+x1eofTF+6KzQIgoMrIHE1hLDsw+YP
 oTIUd0jhaHOi5+8BSIgqpd3ItveSPhDKBP1DLp35m2jVpiM2k7Fx6P2qloRTRx8XKM42kSTMQWk
 DIB41brMFNjeIVBOduC+A+5dnk9Ss+N47FO+lxaXg+cmYjLKQGnaaLeuy8/6mMgtLKpZ639hSKS
 tOJEU8eXlsX2d7F8ypeCDNhJOBVJG9IfZ/6RL6AcQ==
X-Authority-Analysis: v=2.4 cv=KZTfcAYD c=1 sm=1 tr=0 ts=691dee0c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=7Gf6bYMOrQYgeIsB_Q4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: lPCV5KalDieJMuQpQYMrf1QLEnlUi347
X-Proofpoint-GUID: lPCV5KalDieJMuQpQYMrf1QLEnlUi347
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190128


On 11/19/2025 8:22 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 19, 2025 at 07:57:30PM +0530, Vikash Garodia wrote:
>> Hello Dmitry,
>>
>> On 11/19/2025 4:55 PM, Dmitry Baryshkov wrote:
>>> On Wed, Nov 19, 2025 at 05:39:43PM +0800, Renjiang Han wrote:
>>>> Hi
>>>>
>>>> The following changes since commit 6fc940781a013ad837ed8fea326d2b897467bbc3:
>>>>
>>>>     Merge branch 'robot/patch-0-1762826844' into 'main' (2025-11-11 12:02:02
>>>> +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> update-video-fw-sm6150
>>>>
>>>> for you to fetch changes up to 0a6f987b7b07a6fec2d4fd42ac4473c0523d3af6:
>>>>
>>>>     qcom: venus-5.4: update firmware binary for v5.4 (2025-11-19 15:04:09
>>>> +0530)
>>>>
>>>> ----------------------------------------------------------------
>>>> Renjiang Han (1):
>>>>         qcom: venus-5.4: update firmware binary for v5.4
>>>>
>>>>    WHENCE                      |   6 +-----
>>>>    qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
>>>
>>> And this firmware file is also going to work on SC7180, correct?
>>
>> Yes, we have got this validated on SC7180 as well.
> 
> Thanks for the confirmation.
> 
>>
>>>
>>>>    qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
>>>
>>> Vikash, Dikshita, could you please comment, what is going on here?
>>>
>>> We have added venus_s6.mbn, then dropped it, saying that a normal
>>> venus.mbn can be used on QCS615. Then Renjiang added venus_s2.mbn
>>> (why?). Mario merged it despite my NAK, but that's a separate topic.
>>> Now we are dropping it again.
>>>
>>> The firmware is the ABI between userspace and the kernel. We can't
>>> randomly add and remove files here.
>>>
>>> Which file names are / were in use by the upstream kernel? I tried hard,
>>> but I couldn't find any mention of venus_s2.mbn in any of the patches
>>> on the linux-arm-msm mailing list.
>>
>> venus_s2.mbn is not used anywhere. It was earlier planned to be used on
> 
> Ack, please split into two commits, each having a proper explanation.
> Please make sure that in future we don't add completely unused files.
> 

Ack

>> qcs615 while venus.mbn would continue on sc7280, but then we wanted to use
>> same bins for sc7180 and qcs615.
> 
> What is the status of the current venus-5.4/venus.mbn file? Does it work
> AS IS on Talos EVK that is being in process of upstreaming and on QCS615
> ADP AIR aka RIDE boards?

@Renjiang ?

> 
>> S2 variant can be produced now by re-signing this venus.mbn itself. To
>> achieve this part, there were some elf alignment fixes, which is done with
>> this bin to make it re-signable with any vendor specific #.
> 
> I thought that this already happened for VIDEO.VE.5.4-00060-PROD-1. What
> is the difference between it and the new one?
> 

VIDEO.VE.5.4-00060-PROD-1 had ELF 4k alignment issue [1].

0x34 % 0x1000 is not equal to 0x0 % 0x1000. This part is fixed in #62.

[1]RuntimeError: Program Header's Offset, 0x00000034, and Virtual 
Address, 0x00000000, are not congruent modulo the Alignment, 0x00001000. 
(Offset % Alignment) must equal (Virtual Address % Alignment).

Regards,
Vikash
