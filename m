Return-Path: <SRS0=DzPH=4M=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F0CCAC5B0
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Oct 2025 15:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68424C4CEF7; Fri,  3 Oct 2025 15:38:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51056C4CEF5
	for <linux-firmware@kernel.org>; Fri,  3 Oct 2025 15:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51056C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5939W7jx004869
	for <linux-firmware@kernel.org>; Fri, 3 Oct 2025 15:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVGuUxrm+BlI8HB+w3BK/Zndx0BmH8/ojnx6s3qaBYo=; b=CHE3+w8/gEFda1yo
	HgX8aL5hz1hHY+QPKyLMsLOC7pda+sqIXE8QSTtIMBHLSuisi2VQILnLXeSda0XM
	BgY0ltaVCGQw6qMDx+tMuJt1QrpCcjnNClnwpgStIvEHWfAK3mWLXrj6gC1S31uq
	VdTnoRg2zsmticJ+EdjjGkqO0y/kfXpKY5FAz4jPNWknUnKchqGBklGxhSwkyRlo
	sUOyEyeZmLDbzLQIy6i907o2bXGc/Fm0Kjhit7Lhqkye23faNcJSPgq2UjU9XAsj
	1Yl0J4zj/LhQVccKQfaneWaNvxOqMMyR2VwOPb5EDphBHh63KUN60OuODft4CZf9
	mob1jQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrfcr0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 03 Oct 2025 15:38:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2681623f927so22717185ad.0
        for <linux-firmware@kernel.org>; Fri, 03 Oct 2025 08:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759505914; x=1760110714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVGuUxrm+BlI8HB+w3BK/Zndx0BmH8/ojnx6s3qaBYo=;
        b=TBRzFKtMMSt/fzPhJ/5s5BCFHUpXzQDiPvVDBldQcDu/e6/NtwGz/niZCgqAZNXe8A
         CDzcesC7EHg/Iak6zAFee7QbIQtwYE8QynAMJMCQE/dENc2jq6s3M7Y5DM8z+zcDfq0A
         /1wMpv1sRkD+PyOWqF4PvNheUPvTkhGAEfrpK9cw8H8HhII00xg7rTD2LulgL3BLMlJD
         6x8+PX0aKSU1f9KauUEpegGdtjlQHe+fArHuERLk0dsEIW29PVP3TML7icWMSbt7t0DK
         lLKsuzYhalYeachNsnaGLP0qSNDjxxAy2TLO2i8dbw+JKXzG1vW5z9jBXTPBYY/CBYse
         SgMg==
X-Gm-Message-State: AOJu0YwrslhZFgIjvbFLW6cQLjWg0N3kYHmRhq2ncglZnxQERsiI2hLc
	N4nQklDGSsbsa7GmvskpG64mjb2A9TrLpi7jAGJSM70Ia+ZlW3C6No0rfTnTaadUFeTUpBcpGhQ
	xB5eJ2KemjKX4nBnvVKuH4BMqFdZnhS6gW9Nf70u44KSmXALCxSMCmRbTFRbk5j0=
X-Gm-Gg: ASbGncu4ZaVxK2PG9knJgy1KOBVNa2WJTXxtP9kIqUWudF1MOuZmTtY5cYAz6Hta5S1
	EvoyctCoGCTNbc4FaAGZ4Eimbmxd1+/SEY7f9NnDAnl2AjL/0OfVAZv3CA0mYJzTEnG3HOkMAdq
	8vupJkAOH6xT0lNKWfjcg9u5dMrV1HZIlW/jR/WzPEJzdYHyPCaweOT/MnZP2l2H5qG9Hb0I8XT
	7BH1DtBVOvGSAO0lywUYqvlqbmo11C3t4AxbkdETegrt8lT01Z/e15aQ5CdPr7fCDTLc8vVc2Z6
	uohrM0oXZWfpn9WXJnGi34lYApsts06MPpC1TOmPMDMmPWZX+FD0mDJm8IrQVA+vCelh6b3psZg
	BTMY=
X-Received: by 2002:a17:903:fa7:b0:256:2b13:5f11 with SMTP id d9443c01a7336-28e9a645c5emr44078615ad.40.1759505913543;
        Fri, 03 Oct 2025 08:38:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUcx8uPmPULBfxVf0RMCcEP1qNgqTb8cTZU/TcdgmgQHVReurRJJNvFQHDTsQU0DdNb/YdEw==
X-Received: by 2002:a17:903:fa7:b0:256:2b13:5f11 with SMTP id d9443c01a7336-28e9a645c5emr44078375ad.40.1759505913002;
        Fri, 03 Oct 2025 08:38:33 -0700 (PDT)
Received: from [10.0.0.86] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b922csm53359875ad.66.2025.10.03.08.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 08:38:32 -0700 (PDT)
Message-ID: <d44969ca-2e1d-9848-ff8c-59e85aacf794@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 21:08:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: add video firmware for Kaanapali
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <bbd5acf0-e985-1f55-052d-8d3ecf0aa910@oss.qualcomm.com>
 <e2wyi33p42lsq5f6ihuw54k5q6czbt2en5ocijswypjgw52dbg@wz6x2fojxvoa>
 <0c9f7619-acf1-3927-0caa-00ce9f696129@oss.qualcomm.com>
 <CAO9ioeVgWoGy6YhdDvSR1_Ri2HnqD4gToJZ4eKm_vs1Z7EEexQ@mail.gmail.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVgWoGy6YhdDvSR1_Ri2HnqD4gToJZ4eKm_vs1Z7EEexQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EnnkhYan12iHSXVevwoOnxbCYXJaAtli
X-Proofpoint-GUID: EnnkhYan12iHSXVevwoOnxbCYXJaAtli
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dfedfb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=Z2p5HR68Ycd4JAASAEUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=fsdK_YakeE02zTmptMdW:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX0zeNYRlkO3ix
 0K43iqO7DLlk9Dq8i+gcXc818u3+NadhhZSXw078BSMxef+XWaZx7zKtJGbaoBFWt3Oev3gUXWv
 2ED6iuDk0eoQ4jJdh0vPW9Trz1HJ9rColbLHE8T9o+hUZ4DQMXLy9FDWK9uCVUa9DGNvFEARZh3
 Kf38k8hxKhC2Q3pMFSKxcvlT26Hw3bx5thrjc5kWPEbQeDxo5HWqyUyvAILJGHgPfKE51TbvsaW
 njj5JBULvHskg8+0fp1h1tOtnrs0zvxOumeJOieUUMUi5Hv2gzUCkdkMwCT4xAQshfiNdNy7O3p
 khyFFh1D6qdZfY0zKt/q01IsrOKMjuTqCZkmEAEGONizdBohQJDQAGSgeMgIZKwuyMg0JIK0J4s
 R7DkUUCJ0AkVBonltGDGgIuBAG8osQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175



On 10/3/2025 7:52 PM, Dmitry Baryshkov wrote:
> On Fri, 3 Oct 2025 at 09:55, Dikshita Agarwal
> <dikshita.agarwal@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 10/2/2025 6:18 AM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 01, 2025 at 06:36:11PM +0530, Dikshita Agarwal wrote:
>>>> Hi,
>>>>
>>>> The following changes since commit ed924f6db3c973f941fd6c6317c0d52664e83e5a:
>>>>
>>>>   Merge branch 'robot/pr-0-1759253351' into 'main' (2025-09-30 17:36:46 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> video-fw-kaanapali
>>>>
>>>> for you to fetch changes up to 7c2d4d41e96fdddfa360c0740e8a8ee9b5efb572:
>>>>
>>>>   qcom: vpu: add video firmware for Kaanapali (2025-10-01 18:32:02 +0530)
>>>
>>> +Link: qcom/vpu/vpu40_p2.mbn -> vpu40_p2_s7.mbn
>>>
>>> Can we please drop that link? FWIW the driver for that platform is not
>>> yet merged.
>>
>> My intention was to keep the naming consistent in driver with other
>> platforms which are using _s7 firmwares but driver still won't have this
>> suffix.
>>
>> eg: when I upload the patch to rename let's kailua firmware binary name
>> with adding _s7 suffix, driver would still have the name without the suffix
>> and soft link will take care of mapping
>>
>> Any concern here?
> 
> There is a difference between having backwards-compatibility links
> (yes, we carry them for a long) and just adding a symlink for a new
> firmware that didn't exist beforehand. Extra symlinks add extra noise
> for no particular reason.

I understand, will send the PR to remove the link.

Thanks,
Dikshita
> 
>>
>> Thanks,
>> Dikshita
>>>
>>>>
>>>> ----------------------------------------------------------------
>>>> Dikshita Agarwal (1):
>>>>       qcom: vpu: add video firmware for Kaanapali
>>>>
>>>>  WHENCE                   |   5 +++++
>>>>  qcom/vpu/vpu40_p2_s7.mbn | Bin 0 -> 2474696 bytes
>>>>  2 files changed, 5 insertions(+)
>>>>  create mode 100644 qcom/vpu/vpu40_p2_s7.mbn
>>>>
>>>> Thanks,
>>>> Dikshita
>>>
> 
> 
> 
