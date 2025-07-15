Return-Path: <SRS0=9tZv=Z4=oss.qualcomm.com=akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C85C83F1D
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Jul 2025 06:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B406C4CEF5; Tue, 15 Jul 2025 06:28:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9B76C4CEF4
	for <linux-firmware@kernel.org>; Tue, 15 Jul 2025 06:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E9B76C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EJqZtf022513
	for <linux-firmware@kernel.org>; Tue, 15 Jul 2025 06:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGgRv4JZn4CHDiLTdhPgucOQKJNx8w3Qlq681WJ8XeI=; b=KHWjqgHDAnxw0BBj
	1O4gpg81/HGzWSsNYHd22EsGaiXAfEx3ypqkHhtQrE2zgmp8lt2WGc5l028KWNyi
	WAtJd7Fji3LMjao9oN2jvux2vHRYvYoONmdf6XftBsAqrzDrpc/6A9lZfK+QFk1E
	AYHBIAiV8r9VY7Nmw5aEKqAaDeZRmsN3dA7f2cud1ytATNTLTQk7EQmnFVfSvEVZ
	Pxgp4RfJSOh19MVlx7IrIE/Jy8RFDO/3nyS2YKC43POwVajHeyOZDIZaPQwXjXwW
	DEV2M0b24Rcp587XV/iZVj7+JyRVTaHudLKC//7NvhnuNKHh8q1MLdfyGlpqSJBa
	O584rg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxay4jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 15 Jul 2025 06:28:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-740774348f6so4459826b3a.1
        for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 23:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752560893; x=1753165693;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGgRv4JZn4CHDiLTdhPgucOQKJNx8w3Qlq681WJ8XeI=;
        b=C0SzigYxxOS1wBgIN8I8MF/QjoMjWbZsXEaSi+uuRPK+oQt2qMrHSjGYnRQ9BB5KQu
         wV4tO4t/FQ5OLyfMk2UJ5JywfAczH/S6jj9fsypkN/ATv3BKUqkotgRzmEP9S2d/A53k
         arKYHYAyCI2WIALeVfvUzACHcoAHWGNbROKjggZBmavRaQ3e8o5mE6bp8JJHPeCV+iiJ
         Yt9aL5Il9bjQE48hoEyS6KU3st6lJwspkk5MHHz+l2JcI2MPk+im+u+g1lRzWXzse9AJ
         iHADJ2436jrCm5mPN++M5Eux4oeOZNew5SsbdkyhROFzKNOb0TXE8Yk/7sTRC0qzK1RA
         zIcg==
X-Gm-Message-State: AOJu0YwWMqPRkXwtBuP0RLEB81B7PuqMQy/x4QRgsYXalDNJ8on257hb
	X5F9CSF8QTXvDHjMgLmtBzGPMwvl2K/YxhYqL3r6D4CLR//Vt0hGC7+ntxObQ1rX02kps44L890
	MenIvY1Sf8ICeMajXUf+0QRrJigoJLhMI1mZpTMlwZ2YYrcTRJS3AuMJ/cpHu27HVfUK7QhA=
X-Gm-Gg: ASbGncvtrAp/r2WFtx+SZum4e4/hQy8/AIhpyedmh25jVeHxAZsw76C2sRPMA3GT8aL
	j2eL9LemEffEyklW2PS0Qy/Ef9reZ0qu2WQwwx6mNfwgmO6deBCCobE4bPNezMWVKkuRqK2glce
	epa/TSAzMjlPcwmlsfH1Bf0bACyih5d0BxCIszyuHqINNY/ZwpRaYraI0RiSGwbLvCbxRsBlUeO
	sQaCTcQp4xHeQIngIriWbCpGSJriSz6oLoSFUZN9oKxD8Pa7jh5dvA569sxrzhXT1Ed+aA2UQNJ
	Of507oObMCRa6QUzt/iiDVq+OeEmx4SVhj6CqKq2OqrgaapJZVFv3VnMGVw=
X-Received: by 2002:a05:6a20:12d3:b0:21a:bc07:b42c with SMTP id adf61e73a8af0-231208056a9mr30059913637.30.1752560893090;
        Mon, 14 Jul 2025 23:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnGPyhVaqwN40huPlec2jLSaLKyvv5BvABdx6sO3AF1fKADE/+43CedCab+orkQvMjX66TuA==
X-Received: by 2002:a05:6a20:12d3:b0:21a:bc07:b42c with SMTP id adf61e73a8af0-231208056a9mr30059866637.30.1752560892571;
        Mon, 14 Jul 2025 23:28:12 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.230.95])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bc84asm11212929a12.44.2025.07.14.23.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 23:28:11 -0700 (PDT)
Message-ID: <27ae02e3-bb40-4bcd-a74a-eb228833add0@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 11:58:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update GPU firmwares of QCS615 chipset -v2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <d2e4501a-937f-413d-a58a-1a461c7947c2@oss.qualcomm.com>
 <cefhytvrazclwp3qicixaf3wh2p4vffhakt62of4cqua7rj7ok@r7gdz3nhgo2p>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cefhytvrazclwp3qicixaf3wh2p4vffhakt62of4cqua7rj7ok@r7gdz3nhgo2p>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2PLH22lYroSd6slzOgLgY49Lr8p0virS
X-Proofpoint-ORIG-GUID: 2PLH22lYroSd6slzOgLgY49Lr8p0virS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA1NyBTYWx0ZWRfX+4+p6xvFP1uj
 +x8d/dKH6/lO7sWGPEDROG2P1bQB3Y2/xSXid7btLivIp4OpyTKsN9weDG3wSiOIqQBHtZGIF5Z
 gxFXv2efCCuJce4+ZsZCANRZXmSsdqvY6U5NA+lhvlVf4wj1JG0Uh4/TRk5TjsLIPsKGQq/c9NM
 i2opSrCFoJWXNRz9Iv5PLKmYwt+PPrwv1WY78CrdpIvDV2iEUbOKG3noFaLGjWMZVpsYfbUFwPj
 HdwDkSz6MhQSZu/m9VOqjlxLJuAltpZQYBq0IX6ug+2oHTHnP+C64mEnZm8+I/L8ri57TMGvNz+
 g5FKATzQqn0iYcwaveIxXAAe5JMY4OuFVTayAJQNm529jdZn0S9XTIk1wpj7XHiYJx/8XAEpBQO
 8S/QHP6cxvq9+mp2c3gfUAn7Rm+jgwzDpqnMvkNlzaX6nbJ5vIaL0dH99LR1jT9psA1FuYVT
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6875f4fe cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=J4hHMLXUlZdx2gNTs44xtA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=zMgvP4d3KoRT2k5d9_8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=756
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150057

On 7/15/2025 3:54 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 14, 2025 at 10:55:03PM +0530, Akhil P Oommen wrote:
>> Hi,
>>
>> Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.
>>
>> -Akhil
>>
>> ---
>> The following changes since commit 99d64b4f788c16e81b6550ef94f43c6b91cfad2d:
>>
>>   Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)
>>
>> are available in the Git repository at:
>>
>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCS615v3
>>
>> for you to fetch changes up to 6907a7a381dd13d7fadc3a480ad470151c3f3782:
>>
>>   qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 22:47:07 +0530)
>>
>> ----------------------------------------------------------------
>> Akhil P Oommen (1):
>>       qcom: Update gpu firmwares of QCS615 chipset
>>
>>  WHENCE                   |   3 +++
>>  qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes
>>  qcom/qcs615/a612_zap.mbn | Bin 14256 -> 14256 bytes
> 
> This also sets several additional flags (OEM_ID, OEM_ID_INDEPENDENT,
> etc). Could you please confirm that the new file is actually necessary
> and that it will work with existing SM6150 devices?

This firmware file is for the not-yet-commercialized QCS615 chipset
which has a newer non-hlos which uses a new security profile. SM6150 is
around 8 years old by now. And it is not supported in upstream yet, so
no user afaik.

In case the sm6150 gains upstream support, a zap firmware that works for
it should be available at qcom/sm6150 directory. I think the current
firmware with v1 profile may work, but can't be completely sure unless
someone test it on sm6150. Not-a-lawyer, but in that case, I think
anybody can copy it from the git history of linux-firmware to qcom/sm6150.

-Akhil

> 
>>  3 files changed, 3 insertions(+)
>>  create mode 100644 qcom/a612_rgmu.bin
>>
> 

