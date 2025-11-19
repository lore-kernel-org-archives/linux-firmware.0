Return-Path: <SRS0=O/6F=53=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC19CF2564
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Nov 2025 03:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9FFAFC116B1; Wed, 19 Nov 2025 03:08:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2721BC4AF0F
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 03:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2721BC4AF0F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIJEAC52803692
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 03:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nOnUoDYTkx3PkLmq8eDystScZ7lKa2qyVBnlFUXG9To=; b=DBPSSndzDcPbNFqU
	HlNqKHpBs+gVPeH7SLxbbUBFmmYgAYwWeGIgGCpU/7C5WfJzREUOHBFMn1EkD9J1
	gNRaR+sJf/9bGdNPr0DCZDpwb3T55WW5nzcS/vXYIJO5rG0R9yP6UrBFfMG+F4ZC
	kmtvwC6eslhQD1cuNQCuwNvxHNxTuFudB8ol8Gxw7dEA//HGrtDITrAozvt/ZcFf
	0ppiXcfJ+8GvgNwLjveCJhb/0aklEvYaABJZcoCAR6ZjPXeoX0UEpoFxiPFvz0zW
	DpAA+3Jb00aTxYoCGIaMBXx66VODq2plHkqqYxnKtXs4MhBXry2JubthyMKUF6zn
	R2pLZA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk22chq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 03:08:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e5a18652so73360385ad.1
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 19:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763521699; x=1764126499; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nOnUoDYTkx3PkLmq8eDystScZ7lKa2qyVBnlFUXG9To=;
        b=fkfKvR7IrRXALEON97xGm1cJwIweCZARRf7CGN924zjjS2BpNv4qcjJ9FnsDiyvi0B
         Rib9JB0hJHU1qct3pl1kbgabYglBQHWxaqmnglOlZb9MBktUMog+53YgjG/PocehTMgH
         ljWJUQS/F2DsvOfRlxkriiW6kpzTLld18gQMqN+vdxknlWMhTy0pFVt1FK5BqhDutDya
         PIABFibvMA4MwGW7TGzOTdjeOxX3bSUg6m5fgT2rgMu+m7iHw0KtHTYmvf9Yxr5bF3aY
         OGhi5vDEebLs6nqH9F2Gez6FNM5/pbohVKY14ozaMuOjLsu7mbdvdJgZZaeydzmBBKDS
         NYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763521699; x=1764126499;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOnUoDYTkx3PkLmq8eDystScZ7lKa2qyVBnlFUXG9To=;
        b=FpgBxi40Nnqs17rM1zzb5yG8WploqEGqAQI//Sh4EfcocP1Vd1L54eESxwQHQ8c3FL
         gZYtRTkB2GVkqYrfStFAZ+R/eRRRay48fc98+DYlnT7zDjeXMYRcYysFavip9Y0fY5br
         0DXLttnQQf8fxUQCcwl0tKxL9geA5QsG+5MQ5LnXkqBU52J38XSSXGcD+qVeEd+CgcwX
         wXjRrjO5wLA3fQvlN5SM47jNzGvmZPgZTF2XaJvKlKvPQKRuDXMjI/ZpgCnk+4XWcadX
         2mKfgwZhsFj9SsBpjXz3IR/1vV3XPQK6r6pZ6+ULxRfdGHjapN0yHMxviIxfkQ7QLK0u
         /v4A==
X-Gm-Message-State: AOJu0Ywsij4SqjDbg50oYGCfWFGGvrgz+Jl/olFIn9wX8ZIpAlmIH0PE
	pi9gpafbF0UkOltgKqeEe1/Aqu4jZyzPfTEvKhiAee9gRGLgq1OBP1sxQszP5jQClCDFg1YA7pj
	2adSATqV10+VaEplxfxFks9TjLYU5KKDosjZvhjO8BTvnGTdsDI4AWc4MmlVqGfI=
X-Gm-Gg: ASbGncuyDGlnhqG8MCrKUsp/gWc0Sv9bG0yvDCHJ3LGz1JDUyYE80Qav47gWt7gzC+I
	BLmTli4/LdlxCVj9CrTg0wMo06mmO4zIwLieZkrRHSRfgB6Id5Lf0LT3AWguipjklrOVNq1xTfp
	1KiMnsZBbhtPqZQAmmLt98F2KJKyrBb8wuYQodxzDjtJo8FJxnbIdRQv4mQ/tMhQ2h8S+I/pte+
	p2ViBuHJnTQufGi8ayiAw6dJbSAbJN1h6/9p1F6bXA3rGi0qxWBqkz3KKOlxyR4RcJDR9IjOrsw
	6kcQA7vl7LmWxDxiblYWojdqlvGQl0h7w6NehleYLXCN4/JFlu6DnCs+82dhJqeZuNNImu38r8p
	elMAjfQepGiRd7gSgP9hdQ92vZKLsVsqwRMGfKYo=
X-Received: by 2002:a17:902:e74b:b0:295:fbc7:d282 with SMTP id d9443c01a7336-2986a6f081emr220627235ad.27.1763521699154;
        Tue, 18 Nov 2025 19:08:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7HOvOEcCp2+R6VxhEkVKtQHRD+u13ga4IOPsEJSsUoyOrvOs5EhhNEmeao6MOWEC1lYKjRw==
X-Received: by 2002:a17:902:e74b:b0:295:fbc7:d282 with SMTP id d9443c01a7336-2986a6f081emr220626855ad.27.1763521698608;
        Tue, 18 Nov 2025 19:08:18 -0800 (PST)
Received: from [10.204.86.168] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf0d8sm187558045ad.85.2025.11.18.19.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 19:08:18 -0800 (PST)
Message-ID: <a47b8001-b63f-4711-8631-d8851f409b5d@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 08:38:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
References: <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com>
 <ypeyd37oonsm55cenq5xl4lpxtdyhuqlt2nlgweottnwagujjr@v54m5ki367wl>
 <c5de392e-9c65-4021-b7e7-3a81329f170a@oss.qualcomm.com>
 <CAO9ioeVYMOR_+QdkQk6YM0YdH0Hvi+TjmUfQ6-X7=nLfnG9JbQ@mail.gmail.com>
 <3a84fa28-e4a8-4875-b655-293011d3ce63@oss.qualcomm.com>
 <tqpvpnh7f2gbkhw733aux44vzfcd6fd5i4e55zxidj6rl7jafh@6y7776gkbgyf>
 <217efcc4-2b34-4c57-bdda-16adc064a5ed@oss.qualcomm.com>
 <lxldmx2ulavqsijroufa6btxf67t2bocjovnjzxeeqbdd35ri3@dhouz4i7so42>
 <d3646263-0ffe-4a16-9baf-81202d481ea8@oss.qualcomm.com>
 <2b6b8cc3-ece6-485d-8295-e7fa039f5093@oss.qualcomm.com>
 <yh2aitnbknjfwp4h7j2v3d6epaqjkf2tk4vlaxuqpmxozios7m@4vnxsqlqztfo>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <yh2aitnbknjfwp4h7j2v3d6epaqjkf2tk4vlaxuqpmxozios7m@4vnxsqlqztfo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691d34a4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=HwEGzQYRFmYvsLMLzh4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: OMEdpY3M1wFEhLlEq2Akav-WGwqZ1q3m
X-Proofpoint-ORIG-GUID: OMEdpY3M1wFEhLlEq2Akav-WGwqZ1q3m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAyMiBTYWx0ZWRfXxdWmw6lGypBb
 ZsUMvWusNCj3UYr4r347bCYy7UrEOOKOubzG+ge0pjbjoyw3AqGzyE0GtoCjqZjD076RbiAR43q
 3WT225y04LjVzqAATpgrq2Pa/gYqSK06rSuPYF/8ZXpuBunvce3k63yRkW5liku9RaK9GN8G8qE
 Q9nLKxRhGGvDrXqA5/hmNgATzyV0rx+cnSl7cf+tFZ+4PB3X49b4O+tCNdTdRKHyWifF6qfMQ7G
 4/+g9Djq2QIhjYH42+BHTP7Mx6K1cfEozPBP8SsJA9shV8UclvoU4YIx7GVsvNmS1xeX2xVY8eA
 S6zKatgMzGcTR01xe15Mu/TEjpU/kfqmAwYT0aAX/kRoaFrtwzDefnL0tZqQk2MAvLSBjsZ+E3w
 AUUOkYLN3kZ85+YzSt6fVHmAL2IkjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190022



On 11/19/2025 1:15 AM, Dmitry Baryshkov wrote:
> On Wed, Nov 19, 2025 at 12:20:03AM +0530, Venkata Kota wrote:
>>
>>
>> On 11/18/2025 11:40 PM, Venkata Kota wrote:
>>>
>>>
>>> On 11/18/2025 11:26 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Nov 18, 2025 at 09:20:23PM +0530, Venkata Kota wrote:
>>>>>
>>>>>
>>>>> On 11/18/2025 9:04 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, Nov 18, 2025 at 08:05:04PM +0530, Venkata Kota wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 11/18/2025 7:56 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Tue, 18 Nov 2025 at 16:21, Venkata Kota
>>>>>>>> <venkata.kota@oss.qualcomm.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 11/18/2025 4:28 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Tue, Nov 18, 2025 at 10:24:03AM +0530, Venkata Kota wrote:
>>>>>>>>>>> The following changes since commit
>>>>>>>>>>> 53adb2085ca81337df2db20b96898b1980e310ff:
>>>>>>>>>>>
>>>>>>>>>>>        Merge branch 'aic100_1_20_2_6'
>>>>>>>>>>> into 'main' (2025-11-18 03:16:11 +0000)
>>>>>>>>>>>
>>>>>>>>>>> are available in the Git repository at:
>>>>>>>>>>>
>>>>>>>>>>>       
>>>>>>>>>>> https://git.codelinaro.org/clo/linux-kernel/linux-
>>>>>>>>>>> firmware.git
>>>>>>>>>>> dsp-fw-kaanapali
>>>>>>>>>>>
>>>>>>>>>>> for you to fetch changes up to
>>>>>>>>>>> d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:
>>>>>>>>>>>
>>>>>>>>>>>        qcom: update ADSP, CDSP firmware
>>>>>>>>>>> for kaanapali platform (2025-11-18
>>>>>>>>>>> 10:20:00 +0530)
>>>>>>>>>>>
>>>>>>>>>>> ----------------------------------------------------------------
>>>>>>>>>>> Venkata Kota (1):
>>>>>>>>>>>            qcom: update ADSP, CDSP firmware for kaanapali platform
>>>>>>>>>>>
>>>>>>>>>>>       WHENCE                      |   4 ++--
>>>>>>>>>>>       qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
>>>>>>>>>>>       qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
>>>>>>>>>>>       qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
>>>>>>>>>>>       qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
>>>>>>>>>>>       5 files changed, 2 insertions(+), 2 deletions(-)
>>>>>>>>>>
>>>>>>>>>> Should these files be covered by LICENSE.qcom or LICENSE.qcom-2?
>>>>>>>>> The files should be covered under LICENSE.qcom-2
>>>>>>>>> Made the change to the
>>>>>>>>> WHENCE file to reflect the same as below
>>>>>>>>> The following changes since commit
>>>>>>>>> 53adb2085ca81337df2db20b96898b1980e310ff:
>>>>>>>>>
>>>>>>>>>        Merge branch 'aic100_1_20_2_6' into 'main'
>>>>>>>>> (2025-11-18 03:16:11 +0000)
>>>>>>>>>
>>>>>>>>> are available in the Git repository at:
>>>>>>>>>
>>>>>>>>>        https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>>>>> dsp-fw-kaanapali
>>>>>>>>>
>>>>>>>>> for you to fetch changes up to
>>>>>>>>> db069c95dcc16ea84dacb80488464e843ea252cc:
>>>>>>>>
>>>>>>>> You've silently changed the licence without
>>>>>>>> mentioning anything in the
>>>>>>>> commit message. That's a no-go.
>>>>>>> <Noted> Made the change to the commit message accordingly.>
>>>>>>
>>>>>> Could you please add a word about it to the commit subject
>>>>>> too? ('update
>>>>>> firmware for kaanapali platform, change the licence')
>>>>> Updated. Please Review.>
>>>>
>>>> Now, why do we have two groups for kaanapali there? One with soccp and
>>>> another one which you have just added.
>>> I am not sure about soccp FW. DSP team does not track that firmware. Do
>>> you suggest to have all of these close by. I was not aware of soccp and
>>> just add Kaanapali fw below the rest of the DSP FW.>
>> SOCCP is for RISC-V and the DSP FW is for the ADSP and CDSP.>>>>>>>
> 
> And what is the difference for anybody outside of Qualcomm? It's just
> firmware for remoteprocs on the Kaanapali platform. Neither does it
> matter, which team manages the firmware. Please group the entries.

Updated the same now. with below.

The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:

   Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-kaanapali

for you to fetch changes up to 62db06fe95b9755837ba2faf1df6eb0983e4990e:

   qcom: update ADSP, CDSP firmware for kaanapali platform, change the 
license (2025-11-19 08:32:24 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update ADSP, CDSP firmware for kaanapali platform, change 
the license

  WHENCE                      |  22 +++++++++++-----------
  qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
  qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
  qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
  qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
  5 files changed, 11 insertions(+), 11 deletions(-)

> 

