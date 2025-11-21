Return-Path: <SRS0=8/BF=55=oss.qualcomm.com=renjiang.han@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE801CFA46C
	for <linux-firmware@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD047C116D0; Fri, 21 Nov 2025 03:57:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A47E6C116C6
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 03:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A47E6C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKKAXTc1987797
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 03:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVppmwAgdJOCkmf0KlVOp6TXVDKacNB8XLPtc/mUL9E=; b=Kj6KKl/s+8lvi5nS
	1eP910qoq5j1hVJccpHEik59ex80O056vGK72jt7ZGjBau00hSBkZBUTlQ3cSz1f
	CX4sVlJWI7xQ6BS3rnrAKnsl6x4zTzMt2Dc4rnjYGPl5FzZB+ZpoaijTixsXjMAO
	E+k/OcfS7tewmx6tZNKGFqPB8/z4P4CazGAC7HwG3TjhzvhjUQ4XM3I9gyMwIFKU
	eiQeQbDRfTlBR0anxsEkn22nZZgIgGYJ3LEaoVDiRPXd0ssw24AlEbGb0Vpffhf1
	RANRkhkJ7AsUzKAoZyY1dFO0hQl4S1VdypPnw9wYpaI+NZYSNoEauurLrj8n4vDD
	cyBd3w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj1vaat01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 03:57:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297dfae179bso46845395ad.1
        for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 19:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763697470; x=1764302270; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KVppmwAgdJOCkmf0KlVOp6TXVDKacNB8XLPtc/mUL9E=;
        b=OC39diUp8z0czoHrUy4J5vWA/AsCk4r42UdhjH0OAexQj4hpnQflSxiItEZtFMkZ1J
         5LEkKyx/ALu87TCCaeu+Boq8seBfW4WHjicusPehO45hWNq4Nv1367NtD6qOMGCR1aLT
         CnglUONvwW6K1pT+YXkDcjFOhclKY+aUnmEai4IJMW0G7Xs1fcsfLe302h9JRifW9u/n
         liutFK25bFTBh0I3gRnu2AP8zyQyDEzW8bnaSgsXnxq0Fw8+DqPJFx9zdXQQBRUnzZ2r
         pQ2FmY6LEZn1uwIKVOQo9HCYVZ+HBC7dyMciq8b8gMWMbLSvQ6Ho2iJW98LlaivkLtnm
         92tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763697470; x=1764302270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVppmwAgdJOCkmf0KlVOp6TXVDKacNB8XLPtc/mUL9E=;
        b=KYenKRbsXAtTMCnbK5O4WHcP65VLPk0tmn2LDGBC5m1aG5MTNGeyG4Oh+A3KqQuzl2
         1pm+Sc4L39XzVHElKmZn5utcWVzFRmQSRkzacwUFDHUnt593S63a+Kz1Y8vCrh9c7r/5
         ZDEjE+SE0ftMePLtoNKNH0ugy2Ssj3HOymgXLYswwFYdIGLjIhrRXRHAlOOKLnLIsYEM
         bj1edVhvMOSL7aQ6FocvDJTk9hU5NnR74y+M64mVXdls+Q66YioNnfHh0tNmx+ctjm7A
         aMgp054Z+++SCeSylR1SDthUdwp+XXcRQNwhOLhFrs5BKCO0iKAaAYEhHAAgOShcuLFw
         +p6g==
X-Gm-Message-State: AOJu0YyT+BdZdmAY9sQM6ao26NzpxxIlL9hJje+mpsCzKAUynAnB3enF
	xpd6H8Gr4kWgcz5XuDwj1g8BunSlP0RZu0mswuZVqmijj7TW6FfIGSwe/GuEDa8Qbf7II5STiJZ
	dHSWdOhmsjwvU7eZpsHZY5/NM1p2RF6m2ZRpXBwRutT4sYLqCR6T7L84Cm/p2i+E=
X-Gm-Gg: ASbGncsB6sPmsXXWSnif87t5czUhMBwOORzyOrEyIddnvVN4vbxo5p2JDGFG9hk1Yjz
	LUlAoqZYgKRzdbuTwCTXXAV02NS4EbZ32WfDjqWFSyxRQL1ufDXFqpeW+m+WEoZ+2PPb4E6Ghp9
	K6Si60AROranQ9bHTuNdagtF6cvAStb9ImpWwknysApeZegckr0ThI9i1d8/K+fxAr3lGw+bW+Q
	YCsuZnUx5KMRNq2brx13FPqSHlPQRH2zAF2rlWRlIq7cZ7q/h61b7ewpw4lpBAQOq4+KcvmkL4/
	izzpkoJ0iGGdytXKMvdZRxwhW+Z0IUzSNXO0eJZc/VQKT0ppZvkhA5dULuNuhWriSHrVwlU/uGg
	jgyIgvy15ARMsapvs9gRWxN4Fb6AILbVoTWkDbeO9k4ttmWYXnQsXeSxx0TSOz5SBW5gd1pwo6b
	2OsjVERQ==
X-Received: by 2002:a17:903:17c5:b0:298:485d:556e with SMTP id d9443c01a7336-29b6be8c774mr12207585ad.11.1763697470278;
        Thu, 20 Nov 2025 19:57:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5wkNr4aKnnNaQSO91UWYBrgOs4Vli9JLD/9Nd2x9SMewu8eTTm9rU5HtYbTu/n0DwteXseQ==
X-Received: by 2002:a17:903:17c5:b0:298:485d:556e with SMTP id d9443c01a7336-29b6be8c774mr12207275ad.11.1763697469707;
        Thu, 20 Nov 2025 19:57:49 -0800 (PST)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e7e6sm40709595ad.40.2025.11.20.19.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 19:57:48 -0800 (PST)
Message-ID: <fa44f063-0f12-473a-98b1-cc601b4fade3@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 11:57:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: update firmware binary for v5.4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
 <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
 <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
 <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDAyOCBTYWx0ZWRfXzYv44DfyUj/6
 YoIzbkZWpaRPOl/Z/rsymslvaxymcpuYmyniqmt499VFx3Si4ETrGhVbXE05wHyfoM9MnYluE/M
 JrA8lzoHaJ/nTaxWsX5Q6vlJnwlrJR6soosv7ONGcP0P8Hhej+clGeZDyschTd2UWHKedY+3tee
 apWQvZgnxNLSpQpwrKev0COKCGFc90v52hM2PAXbuFDCxhqejaNU5WexReF7uVC/4guiTIVGtgm
 mvTqvdDHniBJ4X5wcdDj2pOf5yIX6hOTOMwCyySA/lK+HilP6gI0fOSvpqj0reTHzJX189oMDj7
 ZEDRuwkmbWhZ/CZh0wKCSI3lwJY1WtFgODwwvIuuAPlR5Gd283ehle7vUuvRaqvF4hrZFTHn8Tg
 DVaWi3oTGSrnj0WtKbrRQmomBsbg9A==
X-Authority-Analysis: v=2.4 cv=Vpwuwu2n c=1 sm=1 tr=0 ts=691fe33f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=lYd7cUxnd4GsNVZFnJwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 2yxCrG8Y55BAwrJq_-UUBYqVKRGZXE4V
X-Proofpoint-GUID: 2yxCrG8Y55BAwrJq_-UUBYqVKRGZXE4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210028


On 11/20/2025 12:19 AM, Vikash Garodia wrote:
>
> On 11/19/2025 8:22 PM, Dmitry Baryshkov wrote:
>> On Wed, Nov 19, 2025 at 07:57:30PM +0530, Vikash Garodia wrote:
>>> Hello Dmitry,
>>>
>>> On 11/19/2025 4:55 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Nov 19, 2025 at 05:39:43PM +0800, Renjiang Han wrote:
>>>>> Hi
>>>>>
>>>>> The following changes since commit 
>>>>> 6fc940781a013ad837ed8fea326d2b897467bbc3:
>>>>>
>>>>>     Merge branch 'robot/patch-0-1762826844' into 'main' 
>>>>> (2025-11-11 12:02:02
>>>>> +0000)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>> https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>> update-video-fw-sm6150
>>>>>
>>>>> for you to fetch changes up to 
>>>>> 0a6f987b7b07a6fec2d4fd42ac4473c0523d3af6:
>>>>>
>>>>>     qcom: venus-5.4: update firmware binary for v5.4 (2025-11-19 
>>>>> 15:04:09
>>>>> +0530)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Renjiang Han (1):
>>>>>         qcom: venus-5.4: update firmware binary for v5.4
>>>>>
>>>>>    WHENCE                      |   6 +-----
>>>>>    qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
>>>>
>>>> And this firmware file is also going to work on SC7180, correct?
>>>
>>> Yes, we have got this validated on SC7180 as well.
>>
>> Thanks for the confirmation.
>>
>>>
>>>>
>>>>>    qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
>>>>
>>>> Vikash, Dikshita, could you please comment, what is going on here?
>>>>
>>>> We have added venus_s6.mbn, then dropped it, saying that a normal
>>>> venus.mbn can be used on QCS615. Then Renjiang added venus_s2.mbn
>>>> (why?). Mario merged it despite my NAK, but that's a separate topic.
>>>> Now we are dropping it again.
>>>>
>>>> The firmware is the ABI between userspace and the kernel. We can't
>>>> randomly add and remove files here.
>>>>
>>>> Which file names are / were in use by the upstream kernel? I tried 
>>>> hard,
>>>> but I couldn't find any mention of venus_s2.mbn in any of the patches
>>>> on the linux-arm-msm mailing list.
>>>
>>> venus_s2.mbn is not used anywhere. It was earlier planned to be used on
>>
>> Ack, please split into two commits, each having a proper explanation.
>> Please make sure that in future we don't add completely unused files.
>>
>
> Ack

Hi Dmitry & Vikash

I have re-submitted two changes, please help check. Thanks!

The following changes since commit 6fc940781a013ad837ed8fea326d2b897467bbc3:

   Merge branch 'robot/patch-0-1762826844' into 'main' (2025-11-11 
12:02:02 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
update-video-fw-v5.4

for you to fetch changes up to bb28dcbcf9867ebeda6a41d575656a737c24f32f:

   qcom: venus-5.4: update firmware binary for v5.4 (2025-11-21 08:55:41 
+0530)

----------------------------------------------------------------
Renjiang Han (2):
       qcom: venus-5.4: remove unused firmware file
       qcom: venus-5.4: update firmware binary for v5.4

  WHENCE                      |   6 +-----
  qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
  qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
  3 files changed, 1 insertion(+), 5 deletions(-)
  delete mode 100644 qcom/venus-5.4/venus_s2.mbn

>
>>> qcs615 while venus.mbn would continue on sc7280, but then we wanted 
>>> to use
>>> same bins for sc7180 and qcs615.
>>
>> What is the status of the current venus-5.4/venus.mbn file? Does it work
>> AS IS on Talos EVK that is being in process of upstreaming and on QCS615
>> ADP AIR aka RIDE boards?
>
> @Renjiang ?
>
>>
>>> S2 variant can be produced now by re-signing this venus.mbn itself. To
>>> achieve this part, there were some elf alignment fixes, which is 
>>> done with
>>> this bin to make it re-signable with any vendor specific #.
>>
>> I thought that this already happened for VIDEO.VE.5.4-00060-PROD-1. What
>> is the difference between it and the new one?
>>
>
> VIDEO.VE.5.4-00060-PROD-1 had ELF 4k alignment issue [1].
>
> 0x34 % 0x1000 is not equal to 0x0 % 0x1000. This part is fixed in #62.
>
> [1]RuntimeError: Program Header's Offset, 0x00000034, and Virtual 
> Address, 0x00000000, are not congruent modulo the Alignment, 
> 0x00001000. (Offset % Alignment) must equal (Virtual Address % 
> Alignment).
>
> Regards,
> Vikash

Best Regards,

Renjiang


