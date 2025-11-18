Return-Path: <SRS0=041a=52=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A28FCEDD97
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 14:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39C0BC4CEF1; Tue, 18 Nov 2025 14:21:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D46FC19421
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 14:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D46FC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAPR8m027645
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 14:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JmHbNSl2KSxuinHSDVTLd9VjMtz4XWkwcjIvvRyqjo=; b=HQv3uVJAwhvdKAaX
	2bW8Rxv++fv9TQUHZrq7vEIxcSIl9VILIicGLh2pmNPmKsFXsmH84uNOfkAaAiuc
	hClfLjFHda0iUIq13GMaIq4/C+X4702/I/auKmEGJPocXwUM5n+atp4ODUXy9YKS
	PkYVROqTph/0Nq27mQppC0LOQaWSfPDneBw1HeARxkK9C6sTVjWz/Pjue1oxkDXJ
	w1UlKYLWpv1DFp4XZX4hKSGzYkhpY7RxOshPaKyWN2dW2vR9+wJTEDU3Vyp1G6TO
	Q7pbkvLKq8JMJfF0Y152rgaGpqWwaI/q870WLqYTqLBuLupUnXoGb8G7sLer57Hi
	0v3DQw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t3bpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 14:21:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b609c0f6522so12823487a12.3
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 06:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763475665; x=1764080465; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0JmHbNSl2KSxuinHSDVTLd9VjMtz4XWkwcjIvvRyqjo=;
        b=Ce4REFro6djTGzEp/sHuIiOqIzei9SqRqAnngRPNvmdLIAPVXh0jFFVRpFx7CnKKvC
         7rQwTlvmDRYsMMTZSRFq/Te86f+xFQgVkjMgQOt6o3xwoGWRcB6laeEEMzE8PpvQp/3c
         AyMQxOJr6vLHLA3Qkq9lTSbseuntRUL0OJXZyiADncIf+fT0PYZDtMfZmT3z+Ah7QufD
         h7Nw9MzOwX+V3X3TCZrZklN4J8H8oAUwMcPLmzBn7REmi3e1zP/VYyIuoPUyrzekW80h
         2op+UZ3Tao7N9AoSocUA8kUMxp97oN5VIfLLbA58kbzgrq4wB1DDF0It9Q86DcXwgr1s
         5Vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475665; x=1764080465;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JmHbNSl2KSxuinHSDVTLd9VjMtz4XWkwcjIvvRyqjo=;
        b=sQFeRtU07aFPS6QAx/vu9mmrZKJeib6WtXMsRCKNFF5Xb2v5YLB+1UcuoMYuLUML+m
         KlMJppVj52x0P3xgjR1u7VdtsfAbmLn//9zt4d6aqs5pr4qx9AbcZzDjGvRw74NGVxZp
         2znN5nYt/RroEd1opZ4asj6ucaLB8r2ACEagHmr4k2JgYDSi2KvqkFOc6EM8GTfXM88q
         RiQOjQfhgccWGQHrx5j4jAITDCQS1faJha54tw8HjD2Y4oeuLKkDSiapQTX4ejPp0SuG
         yDWkEZpyoq5YIM9aRVqcxh+zuETySbCFw3EdeZqQXiRm120iNXXbijjIpmLeGO5Ru+ba
         FmRw==
X-Gm-Message-State: AOJu0Yy3n0OdXv5iOx25SWt2qAnh80rOv/Il5+KtgApFOBLL9ghYppsG
	r1niLVEFUC3M3hoH1htri5fqPrk7Ph6JKR3onBCLB3KYZsqbqmtjWe3c7inK5gEJx89kYuDGMso
	NUHIO5VGIhBmUcLCuLSIW9wnm9msvX9m0W7CNHM0N6yGAvi6GOzdaIhwmWoh9VX8=
X-Gm-Gg: ASbGncsRHI/Lxv6Ton1csGG++wjzFch2gSDNnh7jffvbWVUICQa6fDlWiuhVNDUYOe3
	rPkq7rnc9zmJ1naV5+UFacqGS1xaGnf4C14hpI+CTAi45YhuPLSvb2qjQY27AHp3iSwWkVfDKtb
	1N4xWeLvSZr3s/6U/Dg101i+A7Djipg5bBcE3VERk/kAHsx21R+DEr8CRh/auxTEMWZokY0iGbl
	tnuxh0iJDgsEhO014YFsdE9155+ucwTH0HQei4rPIRoA1qw8WaJeUwPPkNb+xFlRWCFptyueicy
	7Q3lwSjmE4Eoz8BW+512JDvQS+y7ZmvKsyaeLxTTvv2qGatXrwIX5hrViFkZky3Jn0GW6DRLVp7
	q8wyEeY/QA5nN80romOZk1e4aZ19kAZU=
X-Received: by 2002:a05:6a21:9988:b0:35e:2a82:fdf4 with SMTP id adf61e73a8af0-35e2a830598mr12919549637.59.1763475664792;
        Tue, 18 Nov 2025 06:21:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBoJPor54xlOPuTKj8c3x8vVRuOGUwpfvuEEo9CoXeCV35JMcC4xtzu6fNQVJWQ56eW2z3Ig==
X-Received: by 2002:a05:6a21:9988:b0:35e:2a82:fdf4 with SMTP id adf61e73a8af0-35e2a830598mr12919506637.59.1763475664251;
        Tue, 18 Nov 2025 06:21:04 -0800 (PST)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36e8a58c4sm15315189a12.9.2025.11.18.06.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:21:03 -0800 (PST)
Message-ID: <c5de392e-9c65-4021-b7e7-3a81329f170a@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 19:51:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
References: <384a6882-c95a-499c-9bcb-35af092118be@oss.qualcomm.com>
 <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com>
 <ypeyd37oonsm55cenq5xl4lpxtdyhuqlt2nlgweottnwagujjr@v54m5ki367wl>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <ypeyd37oonsm55cenq5xl4lpxtdyhuqlt2nlgweottnwagujjr@v54m5ki367wl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExNSBTYWx0ZWRfX9akr6H+nC3K+
 hGCw2tJVhXCIUIfVFznuoOO2J6gxQCPurLMK9riNK1aWLgEHA/az3nRUJmHGdhdorINpQ7exlJZ
 mg/yZ4+fPCwijpDMtVtpYv+fZwnJImCBfRdypxf3Fj9Ty+JYoGdptrur3EtFGKzvzxo5/LFJsyj
 zXy2O5SPLrF0ucHU41Jlz8jJtsTdA34gkP9PfCDkE0Uf6bu7i2h2On5xXXr9f5jAxol9XCmMMMy
 xXiLr4mIFqu6JElnca9X9rxwr4ejNYYdmItOC/ztKTM6hkG+WgBZurOviI9IEmcXFJUKDH6BHWO
 aEDqI2CLHdpwUKyZVcJcCIA70kX4LFoLCYWhZEGrpzrZ51cEu7WgKumRFReALgwrkxdmPdtRqVc
 LC9jKO8uHPFEkWRwkCnjtNU1BlXsNw==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c80d1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=N538q8cOb59V2MHOybMA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 05Zoc2mL4aAIMcQpeDDaYMYX_bQwfCpD
X-Proofpoint-GUID: 05Zoc2mL4aAIMcQpeDDaYMYX_bQwfCpD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180115



On 11/18/2025 4:28 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 18, 2025 at 10:24:03AM +0530, Venkata Kota wrote:
>> The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
>>
>>    Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-kaanapali
>>
>> for you to fetch changes up to d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:
>>
>>    qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
>> 10:20:00 +0530)
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>        qcom: update ADSP, CDSP firmware for kaanapali platform
>>
>>   WHENCE                      |   4 ++--
>>   qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
>>   qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
>>   qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
>>   qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
>>   5 files changed, 2 insertions(+), 2 deletions(-)
> 
> Should these files be covered by LICENSE.qcom or LICENSE.qcom-2?
The files should be covered under LICENSE.qcom-2 Made the change to the 
WHENCE file to reflect the same as below
The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:

   Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-kaanapali

for you to fetch changes up to db069c95dcc16ea84dacb80488464e843ea252cc:

   qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18 
19:45:11 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update ADSP, CDSP firmware for kaanapali platform

  WHENCE                      |  22 +++++++++++-----------
  qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
  qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
  qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
  qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
  5 files changed, 11 insertions(+), 11 deletions(-)

> 
> 

