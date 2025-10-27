Return-Path: <SRS0=W8R6=5E=oss.qualcomm.com=konrad.dybcio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60F2CCF9E5
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Oct 2025 11:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA401C4CEFF; Mon, 27 Oct 2025 11:52:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CBAC1C4CEF1
	for <linux-firmware@kernel.org>; Mon, 27 Oct 2025 11:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CBAC1C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8ocxL1132695
	for <linux-firmware@kernel.org>; Mon, 27 Oct 2025 11:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHpg2fTGBWhddlagIaYqymBjwAJW3dJLTk+wmzU2YWI=; b=gfyX076lO4wlB6e7
	qqmYtcGYaC7G9O3qnN4puNbzHeF6+6xEIxiP3J63ZnpcYD0TIunXhW3wJ84OfXar
	pCKR3oLliS7go2fCUSGPg/swtoSxYaTx+5cDEnjC2EjL55N1oSb6doTMEUcwcW4u
	iGInZja2lR6weUA96GbzwE6I6S5m7uaNSe41SGCjTddBddDvksdY9Y1Q9wbosVYH
	6Zxf6VK8CPuddANyQDKY9QUTHbQNoc3163s0QI0Kk+XCIdmzLe0PIRNqKg9QdkIO
	BnWcEkfxfmnahVl6GNmRjiB6TIIwaGeIZUTA8CAlxa0fOoRWVtKV7fpURnoTE5Db
	OdIC3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4g4duh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 27 Oct 2025 11:52:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecf8fad13dso2641451cf.1
        for <linux-firmware@kernel.org>; Mon, 27 Oct 2025 04:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565966; x=1762170766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHpg2fTGBWhddlagIaYqymBjwAJW3dJLTk+wmzU2YWI=;
        b=aws6cNnhqUIDTzZBd3Jppb9SnKJ9XSeEKGt066bGSKhxuuYPM5IcEsh7nDqjBUoRMr
         qE2LPcIeFJ7aTjXUZaA7nJjVOS75gx93r42chysgVSADf2qAX7R1dnw84IUW9M0txrGQ
         O0cDhdYv8KczpaP9t9xqpiqRblWLcBPdphdyalWWwW+bYDc/jchSgo3485sCngScnyFL
         1WQCeNEjAjU3r5UkDi4FU67pgiqZdflkQueefWygBNM83U08P10VYuaZ69r03M8/hx7F
         JyVWAaSTSB8bW/Eb3uZjt7vEkmmTdcaYy0wdVwdhKNyyDwVi0jk+yegk7p/N5kXs4xiz
         f9Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXwUy2nwQiTb1zDzrVTSJPVRlegiQf6jdyYntYbLDglVcOEL/r1bEQb0T+WrSEjbuFb/D2kGg/o4wO3iDWMMQ==@kernel.org
X-Gm-Message-State: AOJu0Yz1HsV7Y3Z01VUFW1rbarT92HbyeA9k8eUnpJJc+GJ+idFdWiMQ
	GbyAoHHshw04blLC5SDu/kh+9EPzqNHJPESBGx++w1s8hFrO1wYH2Qtii13kdSiq3IR+AM861jw
	xyOYmdlF3A6jwbswXW7cVlPB7S6wND1CZm8nm5ld7Wv7xJHXfwlmvSKpS2OFB2mM=
X-Gm-Gg: ASbGncsLSymJGDotMmpe507ke8koJ5LZKd4T5XEYn8zP07mYWI2m+D7F862hBN2Umdi
	MuO4SWoZl7jvhYItLNW0r1Ju2HZNNbpqCREGCxmh2IrFwELMKHvQ7GfMkzQmA1Q4DHjxmsXZfLL
	YmpI0yVc1YXSMXyI6G2XrmetMGh3OIejEqQBH9QQigMLvE0jXrT6U5jT3rCVmthQPIgFVSAsEjZ
	wfbVT+0LiSsWWQKPuLpJSuSOPgrLoGngMXbDT7ouOb6kOYYp27GFxl+IqKPv2OOw9vrnKZcAuMF
	C5iDWjZCcv+cjZt4FxkUeqT5A1gQLJ4hIvKESL5eyfQBm3n4Bd9BYAduvFjr7ayhe0pTjY0A1be
	jgRtSy/qraqDyb9FfSuhxalwDctMkhVvHDTeg7KtKFf7f4pDhWnpMjQhP
X-Received: by 2002:ac8:7092:0:b0:4eb:a0a5:1fec with SMTP id d75a77b69052e-4eba0a52785mr56202791cf.10.1761565966065;
        Mon, 27 Oct 2025 04:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1bXIUAGxXxX7J+Qmq1GmZ1vxQBAx/y5ySjRweSQs08Z5s/mRe3otQX4zuo0M1xG4ALSaxRg==
X-Received: by 2002:ac8:7092:0:b0:4eb:a0a5:1fec with SMTP id d75a77b69052e-4eba0a52785mr56202561cf.10.1761565965320;
        Mon, 27 Oct 2025 04:52:45 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077d2sm744997466b.3.2025.10.27.04.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:52:44 -0700 (PDT)
Message-ID: <952b4834-0991-47b3-98fd-f05c5fc8fb98@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:52:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
 <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
 <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
 <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org>
 <hsj3ravxgkhnbnks7wl47qqwsef3loi44jkgahzgx2m7k4sjld@endp4nl3h6ek>
 <41183580-b917-47c8-8612-426f3ae48e50@oss.qualcomm.com>
 <CAO9ioeW8oSLcFAx6G1Ji0=uNrWAQYUHz7L7isFdVyF02v5aioQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeW8oSLcFAx6G1Ji0=uNrWAQYUHz7L7isFdVyF02v5aioQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UuFCOitTWY_VAepfXl_8ZnZx-dssIa7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExMSBTYWx0ZWRfX3xvsqwwG8B79
 0heYCEO3R7RfYSBG9ePyIIscEeel1bVyXthlWSUVVWIE/ImvzOVRxj7Gd2Rjhc+apTS185xA3kp
 sX4sdOnILVP914Ln9eBwlaYZaYUmpkNG258H6eJvZi3LW6ufDwGJ4pBZMd9DSmXjp0pn6Z3h6PG
 ZxfW8P6rSWkqqQi8fWZ+cTL9fNwnDgeLvPKHeEJPHd5PiUNTaXuzEX0c6eNndWJDRNJNkNAaVEI
 4yAPpoJh4iquF72V5iHZ5J9JRYT8nt1KpLSAVQbypZ2vMtENLn7qBGJbq/t1ACaj/4bOBpDEECI
 1lJwQBuCj4/uluZaskjCUQBIRGlCgOwFkvUWxDbrwypCM+nZdihwFgVKfgfCNa12R7sVzP2vyks
 UHKhd2JHtDPc7/wq+B1Q0IY67tXRAg==
X-Authority-Analysis: v=2.4 cv=L9YQguT8 c=1 sm=1 tr=0 ts=68ff5d0e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=221D2xXFV8L-3VX8X_wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: UuFCOitTWY_VAepfXl_8ZnZx-dssIa7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270111

On 10/23/25 3:44 PM, Dmitry Baryshkov wrote:
> On Thu, 23 Oct 2025 at 16:31, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 10/3/25 3:01 AM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 02, 2025 at 04:07:37PM +0100, Bryan O'Donoghue wrote:
>>>> On 02/10/2025 15:59, Dmitry Baryshkov wrote:
>>>>>> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
>>>>>>    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
>>>>>>
>>>>>> WDYT?
>>>>> Well, I think that potentially complicates the driver by requiring
>>>>> support for both HFIs for the same platform, it requires detection,
>>>>
>>>> Doesn't have to be anything more complicated than a reserved string name.
>>>>
>>>> BTW you're right the main reason to support this is - in effect - ending of
>>>> support for gen1 firmware.
>>>>
>>>> But then in reality if that is the direction of travel, its in the interests
>>>> of upstream and users to make the transition.
>>>
>>> Okay. I did a quick comparison. FP5 has gen1 firmware, is vendor-signed
>>> with the T2Mobile cert and I assume it is fused. We were going to drop
>>> support for sc7280 from venus in favour of supporting it in iris. What
>>> would be a migration plan for FP5 users?
>>
>> Just like I explained, the iris driver would load in its place, it would
>> retrieve the firmware binary, decide which flavor of HFI it provides and
>> then decide which ops to use
> 
> Upstream-wise, the patches that I've posted for the iris driver use
> gen1 firmware for SC7280 / QCM6490 / QSC6490, providing a clear
> migration path from the venus driver.
> If somebody wants later to implement support for loading both gen1 and
> gen2 (which might be a nice idea), it needs to be implemented in the
> driver.

Perhaps that didn't come through, but that would indeed be required before
this patch could be accepted.

I don't know if there are any timelines for this

Konrad
