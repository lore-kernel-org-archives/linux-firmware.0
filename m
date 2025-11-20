Return-Path: <SRS0=Q3qO=54=oss.qualcomm.com=vikash.garodia@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AD2CF857C
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Nov 2025 10:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E363AC4CEF1; Thu, 20 Nov 2025 10:15:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D986AC116B1
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 10:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D986AC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4qFKM4185330
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 10:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yJwmqZbbnscPw0RTwavup6Uzzu7Jt9Phs6iEorjJTP4=; b=MdfV+pAQIRWeePv0
	LD0I3opY/uEsO9poFw8JyHVtiENhSxNAQh6JC7iODUmC+UrzUi0FG5g20T9/VrqO
	mbS7pHOVHmPrNi9XaB5MswyzjrrJ1UMNl/uHw5Z2dgm3MbvO+6z/mVsXHgswA1Bw
	RudvdZBjBgTpUQ6JNsHOCrM2UTHXCT1em8c4ISD1Sl80Gfa8Rt48GyDCE7NzaAAJ
	41Hxt80tWujlyuNhW0M/Wz2PELghxmXflKRiA0CKCESW++MpOWKwIblZDYUkscMB
	sJld1Ec+nuCvBDmBCf10iJXGY12fHv4VZLyWSyktwuuwxyCUU96Er3Lsp7SUJQSk
	+kCfgw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahbt6uy5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 10:15:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-341cd35b0f3so2117234a91.0
        for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 02:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763633709; x=1764238509; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJwmqZbbnscPw0RTwavup6Uzzu7Jt9Phs6iEorjJTP4=;
        b=bdkTUFmXhunUP2dLUW7dZIa52PB/IpXmtNhXNG2dNUIdQy9BheNag3Geu6LIpp3bz5
         TSzWgGQ1JcAhefPXllhHaVWcrLq49RgrmL8w2Ut9E7xRU/ST7UKpRpFE2JncQDkWChkE
         rSjH3TmwE0s22jZDortgo04AExpmN3YvDsbLDUEMCtfG7JJVlLDO43bG3QYbn2kHFZCb
         ZXEt+V5TjBTa7ZUMJUgLImaXzjw+fXrKt1ryautiphjQbfNvrWa7cHkOI0325qFgeLqL
         aelo2EFP+s/Drldfp9xC9NmziCOHPSUZ7Qj6lXEyyhzoETLjeZMbtWN5dpdlxnGuhTcb
         2sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763633709; x=1764238509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJwmqZbbnscPw0RTwavup6Uzzu7Jt9Phs6iEorjJTP4=;
        b=AXdvpBkHDzKFtwpxQ4GKa1RqhjCQgEplcK5pQmxmxeJmofYn3O+aO9YtwKevbULjLM
         2bMuwWEELkC38HyDbACJuosfBz21ZeUjXDCaHENuY1YJzYRZplxkIJDjHJjlWHV6/8mJ
         8ZgPcI8RgFmVONWOGVBzml4SaXEDO9KEG9JdtLYq9XuMRZd+6EcFuBC1naaK79TX1mKp
         dkXzsQnn+05KHwamgEJy3dkjPvDwK8LFTnBRFe1dQ7wbTSqiCheLNy2/S+EQyHKeROEd
         wZCv6KHd0gfsK85YzPzDuzr83+AEGG3HXjUdFPQ3pnjDzmIU3zfHLGgYqthsH9OuR6zx
         DDEg==
X-Forwarded-Encrypted: i=1; AJvYcCUWaM2gnwktxQ+DoBC7zArDlxHqBJ5nc/0gQBwNAYPlBktXHRndmsg9ijGnBY0EZQMC+yM0IJArqZYpjXiW1A==@kernel.org
X-Gm-Message-State: AOJu0Ywjgbph2GbBzVIBzhz6z4R1UTIDq1rooTr4qAH66ESJAvoLmpOc
	YXV+OyzWkarAU5ho/Yu5IFqocN8r28+qHjrBFGADPYlDCDixS3+DD3h8fDMy75+g4o1yhoDMHl8
	5cQTAOzEtW/SwxGhJ3Fjil5RiTE2xEKuniOwsxRG7K/88ofk0tMRX0b58jbQpXak=
X-Gm-Gg: ASbGncvp719eXCaiBKQvDEKxIuovVUhZyOXYZheTURstnBEjLRoSUypge8/D9BQZhAv
	fskJVISn5988OrCzmjmA9plx9UTVMApr7rbZTBo1TFSk73lZN5rVODXd1jvLpawOAH8PNoJh/V0
	zKSJC6b1wha4o67WQZ3VbvRN2Q2uDA/jNlUowoQRN7h+Ylveo6IOjPPWYWuF4ic2nGWSk1xHLPB
	NLv+PFMfbQPcoacLwaAC3ceugr2xLR+h0hjLp+HvsrhpiJYmg2B+FBUNHkxj6VkiLq6CBfnepyL
	bzs8Z6O0YAaM0458u9e1Bko8bLeR7iLSH5T+ej7S6mVzM5tfog8GGkY5DOnNM7FcP8agwRHBd8o
	1tjsFRHBBHhsfVyeuFqdtypy7Uh0UVKI87omyILVw1w==
X-Received: by 2002:a17:90b:4b92:b0:314:2cd2:595d with SMTP id 98e67ed59e1d1-347298510c8mr2304708a91.8.1763633708699;
        Thu, 20 Nov 2025 02:15:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWdyJpjHVvVuegyCqvjMfQmD8Dy/38YHOaPQPg8FRY6Wa5SPcuxld7oGLf3GxaaK5roTNDJQ==
X-Received: by 2002:a17:90b:4b92:b0:314:2cd2:595d with SMTP id 98e67ed59e1d1-347298510c8mr2304673a91.8.1763633708125;
        Thu, 20 Nov 2025 02:15:08 -0800 (PST)
Received: from [10.204.101.42] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d6f48bsm1946506a91.17.2025.11.20.02.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 02:15:07 -0800 (PST)
Message-ID: <0befd966-1db0-4b47-a8fe-a40a400a7103@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 15:45:03 +0530
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
 <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
 <iznnjuldjlzscbasoxxwgemtd37pemtpo37dw2q7fj3pfct5y3@iepxxugydewz>
 <1db4c5a7-74f8-44e3-bb56-cf075e4391bc@oss.qualcomm.com>
 <lp6zqc63rznqakiyixdjnzwlaesvoelcmbgrxosq76ijufuj5f@gtwleb2fz6hh>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <lp6zqc63rznqakiyixdjnzwlaesvoelcmbgrxosq76ijufuj5f@gtwleb2fz6hh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DSBHh2d9XpvWt_-zkAFbZZEpnGMxoT6_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2MSBTYWx0ZWRfX6sh7sgtXoAD9
 Pj84sCDLDwPIxJdfDupORAWlM2zTWjcpch3HmE79tfrpxZO+478ykhDQ34tYJpUxBuEbKBPQ/mI
 U4/47XBWklROe00giJvurVl3aEKGcbvF0DSDBOBaLrxYtYuWjfi3e+EqJIeVCVTlU8fFIXGO3JP
 1Qne2I6bhglFhbktu0QzQQIMtvJ2cewKiBew2ic5+BjneGgFCexbwIpwyGGXEV1c047GoX50aYr
 NT0vLddiLJ779vdh2aPMH/FhoqtnUQwODHtkbADE9Qf4OnuZSYF4VS1U4WcYFmjKiITIvwhkgfz
 g0MrTqGUpjGs0B4MVkJ4smH61aa8F5yuIJ7Ac877K/SaNWOdn5FmS9vIo4MSRJWFN6RBV11dh9w
 1UTwvRWXoL/nnejHMtuzLLp0IbkzFg==
X-Proofpoint-ORIG-GUID: DSBHh2d9XpvWt_-zkAFbZZEpnGMxoT6_
X-Authority-Analysis: v=2.4 cv=PJICOPqC c=1 sm=1 tr=0 ts=691eea2d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=LaHa_10REsm1bV9XySgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200061


On 11/20/2025 6:33 AM, Dmitry Baryshkov wrote:
> On Wed, Nov 19, 2025 at 10:43:14PM +0530, Vikash Garodia wrote:
>>
>> On 11/19/2025 10:10 PM, Dmitry Baryshkov wrote:
>>> On Wed, Nov 19, 2025 at 09:49:17PM +0530, Vikash Garodia wrote:
>>>>
>>>> On 11/19/2025 8:22 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Nov 19, 2025 at 07:57:30PM +0530, Vikash Garodia wrote:
>>>>>> Hello Dmitry,
>>>>>>
>>>>>> On 11/19/2025 4:55 PM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Nov 19, 2025 at 05:39:43PM +0800, Renjiang Han wrote:
>>>>>> qcs615 while venus.mbn would continue on sc7280, but then we wanted to use
>>>>>> same bins for sc7180 and qcs615.
>>>>>
>>>>> What is the status of the current venus-5.4/venus.mbn file? Does it work
>>>>> AS IS on Talos EVK that is being in process of upstreaming and on QCS615
>>>>> ADP AIR aka RIDE boards?
>>>>
>>>> @Renjiang ?
>>>>
>>>>>
>>>>>> S2 variant can be produced now by re-signing this venus.mbn itself. To
>>>>>> achieve this part, there were some elf alignment fixes, which is done with
>>>>>> this bin to make it re-signable with any vendor specific #.
>>>>>
>>>>> I thought that this already happened for VIDEO.VE.5.4-00060-PROD-1. What
>>>>> is the difference between it and the new one?
>>>>>
>>>>
>>>> VIDEO.VE.5.4-00060-PROD-1 had ELF 4k alignment issue [1].
>>>
>>> Commit 891a8d4fdfef ("qcom: venus-5.4: update firmware binary for sc7180
>>> and qcs615") left me in assumption that at that point the
>>> qcom/venus-5.4/venus.mbn has been working on QCS615. Is my assumption
>>> incorrect?
>>
>> Both #60 and #62 works on QCS615, while if any OEM tries to resign #60 with
>> a different signature, they would not be able to do that with #60, while
>> they can do that now with #62 with the ELF alignment fixed.
> 
> The commit that I mentioned had 0059, not 0060. Also, if the ODMs can't
> resign the binary, how could you sign it?

ODMs can re-sign it, if they are also using sec tools v1 based signing. 
If they need to use sec tool v2, and tries to use this binary to sign 
it, they would face the ELF alignment issue.
So, it would be like
- For  sec tool v1 - existing binary would work, no ODM have any impact 
with fused firmware.
- For sec tool v2 - *same binary* can be resigned with v2 security 
profile and can be used.

> 
> Is the following correct:
> - 0058 works only on SC7180 (does it work with the SM6150/Android?)\

No, for SM6150/Android. There is separate bin for SC7180 and SM6150, and 
hence venus_s6 was raised earlier, but later converged to use same bin 
for both SOCs.

> - 0058's venus_s6.mbn was signed with MBN v6 to work on QCS615

> - 0059 was updated to work on both SC7180 and QCS615

Precisely, at this point, both the SOCs were made to work on same SOC.

> - 0060 was uploaded as 'yet another binary to get it working on QCS615'

This was raised to make it work with sec tool v2 _only_ for QCS615, but 
later we could find a better way to use the sec tool v1 binary alone and 
if any ODM wants to resign it with sec tool v2, they can do it at their own.

> - 0062 now it's another binary, which works on QCS615 and can be
>    resigned by ODMs
> 
> Is that correct? 

Thank you for putting it up nicely, and i completely agree to have this 
in commit to keep up for future reference.

> If not, then your colleagues need to start writing
> better commit messages and being less shy about explaining things:
> I basically wrote the summary of the commits chaning qcom/venus-5.4.
> 
> And if it is correct, what was wrong with 0059?

 From 59 to 62, ELF standard alignment issue is fixed. ODM cannot use 59 
to sign with their own signature if they need with sec tool v2. There is 
nothing needed at ODM end if they are using sec tool v1 and having 
boards fused with either 59 or 62.

> 
>>>> 0x34 % 0x1000 is not equal to 0x0 % 0x1000. This part is fixed in #62.
>>>>
>>>> [1]RuntimeError: Program Header's Offset, 0x00000034, and Virtual Address,
>>>> 0x00000000, are not congruent modulo the Alignment, 0x00001000. (Offset %
>>>> Alignment) must equal (Virtual Address % Alignment).
> 

