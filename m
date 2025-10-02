Return-Path: <SRS0=aRI8=4L=oss.qualcomm.com=konrad.dybcio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC51CAC5B8
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Oct 2025 12:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9062CC4CEFA; Thu,  2 Oct 2025 12:38:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BAD3C4CEF4
	for <linux-firmware@kernel.org>; Thu,  2 Oct 2025 12:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7BAD3C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929PG65018676
	for <linux-firmware@kernel.org>; Thu, 2 Oct 2025 12:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ka4vSUaqedydTrNivypQmftzrwbGugZn+Pmm7FW9LBE=; b=XR5+Rxpp1fQ+fCXT
	6QYnzklnGKEv92aF0Q63t/KX+nPqKUsOGeGwQkyWm9xTeXKE6mZ3yz7ZWxWtX6CE
	YG4Kg5hJfdiT9xTMG2TMxjbvwG8fuLoDefDCXR9MVs/VCMuYPCVDZNVHHhOF795f
	9uXeob1WhRoL99V3xR/7s3epXuQ9uAA0HPB8X4S7yIrknExl8lGT5B5Jjwg5//We
	xc+v35GEbHt1n99Gn/9nGxlJmrLNaSEfkhN6Oanvcdu4C1sgJz10jMmpKa6DX/rG
	hJGCD94doa2l9u5m3D36Xf0jML1wNve4L8lA/ZHMKOPsRCVP/xJkU2qmm46zr/HJ
	Vmab0w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49gyu1c1cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 12:38:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e231785cc3so4016001cf.1
        for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 05:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759408723; x=1760013523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ka4vSUaqedydTrNivypQmftzrwbGugZn+Pmm7FW9LBE=;
        b=f/WFvmlvF+JhAo2+ab8ltkyF/qIdXBRFZk+M7ZkX25hKkoNpk/W+XP0TyL1gCQopBR
         phoHxaSE/s4QHh9aalpqmrBg3PsJg9BLXwv+mfN9E/30M1YpslsRuBvbGYcMen5XjdJW
         uHZQQJ25cqR2odhonPmABpabdFfJXvtIwnig3GV+p0ROpdCt3HlBthxK2tnkKqsU4om8
         8lhSOknsXorpsZTvbelS8KQ0N+x7HxRDwPG/CY1YGm960TwmWW0uY9eWKepCXOJHxntJ
         fnqvT69rDlUSNotSvpLgXDkRgCPZoP6NEqNw+nJxJT2K10t+je34r0AI+QQYAwp+nQuL
         FhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQzt40Md2u8f/FAdmGp9Dqs8Nm0oBqhJAI3H1/Kun2+SV1E/5iVUUotxHVjm3kTNkILLxk5zVw11CbnBRIFQ==@kernel.org
X-Gm-Message-State: AOJu0YzPDALevdIVXKKT8uji7tBt4TaFILiU+25Sn7uQ//eKNAzccNiH
	fMyV/IB1Ic3MaoFla4QaqF9qNHZDy3GvF9sd1+Z1AEnEaXJn97Vx6EghkNnLU9b36/cwUduoZgP
	/+NRby1o4VDnUTa5GRs4zhHSONIE+OoeEADLthB7abLbJ1YZnl6LDSMJWUnftxzM=
X-Gm-Gg: ASbGncsCTpBN1UdHr1MiuXRmiS8patSBLpJ1Qm1odROq1hhDqO9aJhz5iPhAHmwMsxG
	HMAhWYzF0WUevtjmd4nM9k74SqxTkAefNXAuBgT86Uirp4dQwZAyQjOIkSZg2jLqKBpa3Ju1sfp
	Rscq920y9ugXUP1/P/UCRPhOgIkZ5pEvrE6B65VTwb6YvbQNzbydsWpaIcwaXQkS3PtqWstV2Mh
	EeCPHv6wA9nGwZRGl+zRFSji6ZCSr/rdoCjZCLVovDaOOR5QMWpU1UbN8XLB3YZTrAzrsW7pwFr
	RPsJh1JwfsRF8t3iViQljYiUUGD6EzqaKn9Ba1UkqKrOre+U3lCiKYQGQzt9l3szqmc025yr7f9
	30oOvak6zPvjUF48uwqZIl4VPbS8=
X-Received: by 2002:a05:622a:1885:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4e41ca1d0ffmr57975881cf.7.1759408722409;
        Thu, 02 Oct 2025 05:38:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkp00Jt4psYTQ5776O18UueNYH08Ny4s0mfMgd2c/IbEteEXwJb+TanpI9sUG5rEVJVw+f9Q==
X-Received: by 2002:a05:622a:1885:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4e41ca1d0ffmr57975531cf.7.1759408721613;
        Thu, 02 Oct 2025 05:38:41 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm198669866b.62.2025.10.02.05.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 05:38:41 -0700 (PDT)
Message-ID: <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 14:38:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfGdyltv c=1 sm=1 tr=0 ts=68de7254 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=WSL5uPrEunBkvogVw_sA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ItghAmQI7ixFa9YTo1-i1ogMBT-BUWuD
X-Proofpoint-GUID: ItghAmQI7ixFa9YTo1-i1ogMBT-BUWuD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA1OCBTYWx0ZWRfXwUG5Cl+LcVL+
 FNse5SJh0OxevrYcYezxV5xEgHtwh6V24Y+B6EhuaC9gFqvo2YsaiZxh5S4E4x0TtriOgPovGD+
 1SwD9RMEyeSyNrH0Xqt3MaE8NwUf/Ww6z9clCO8EOvmSDfHMEhR1SC915cG1nf/w1BA3kfvmvoj
 +c6MwibJVUxNCvTDGya6ROQaVuCzNI4ruoaxb0oDCmD5ak810IUAt2R501/SkOeQg/gfieXpNDw
 iH3Vlg8sJ1Ui2hhHsgQKHYNEUe/rgHXqSQKRxzET3forWJpDMBemYNmL2IPl42bH86KnB7HmsDu
 f5ModwHW/ocnMS3wPJMf1oVnXUPjC2hxgvyHoK8uCkiyNCorNzlV0xQSA+OY00pI8FPC7ugMW9+
 Ab3XQoSM52rKDstf/P1+7kyyiPzJpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510010058

On 9/24/25 6:16 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 01:55:22PM +0100, Bryan O'Donoghue wrote:
>> On 24/09/2025 11:43, Dikshita Agarwal wrote:
>>>>> I understand your concern. To clarify, we are not removing support for the
>>>>> existing Gen1 firmware, so backward compatibility remains intact.
>>>>>
>>>>> We are simply adding support for Gen2 firmware for this architecture. As a
>>>>> result, QCM6490 will support both Gen1 firmware (with the Venus driver) and
>>>>> Gen2 firmware (via Qualcomm's video driver [1]).
>>
>> I agree with Dmitry here.
>>
>> Its not possible to disjunct upstream HFI6xx @ the firmware level between
>> Venus and Iris because the DTS would have to point to a particular firmware
>> depending on which driver you wanted to run, which would make the DT
>> dependent on the driver, which is not allowed.
> 
> The only possible way to make that work would be to:
> - make iris driver detect the firmware interface and then use either
>   gen1 or gen2 interface
> - make that into the upstream kernel
> - drop venus support for sc7280

We talked a little internally and the benefit of moving 7280 to gen2
is basically that it would get more fw updates.. which is utmost
desirable from our POV.

My understanding and recollections are that:

* Because Iris already supports 8250, it's only a short walk away from
  supporting 7280-gen1. We could then also add support for 7280-gen2 and
  detect the supported firmware interface at runtime.

* If the Venus driver would be loaded instead, it would also be taught
  to reject gen2 firwmare if that is supplied (before eventually getting
  sunset, hopefully..).

* The current gen1 firmware could be kept in linux-firmware parallel to
  vpu_whatever_gen2.mbn.

* Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
  that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)

WDYT?

Konrad

> 
>>
>>>>> Additionally, as part of our plan to transition all Venus-supported targets
>>>>> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 firmware
>>>>> to maintain backward compatibility.
>>>> Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
>>>> interchangeable for the hardware they both support, until the venus
>>>> driver drops support for V6 hardware. At that point it's expected that
>>>> there will be no V6 support in Venus driver.
>>>>
>>>> You can not simply upgrade to Gen2 firmware as if nothing happened.
>>>> Consider a device node on SC7280 / QCS6490 with the firmware-name
>>>> pointing to OEM-signed firmware. Both Venus and Iris drivers would
>>>> happily consume the device node and try to work with it. One will work,
>>>> another one will fail. This is definitely not what we have agreed upon,
>>>> when you started adding Iris driver.
>>> @Vikash, could you please chime in?
>>
>> It would OTOH be possible _only_ release a HFI6xx Gen2 firmware for a new
>> SoC that doesn't appear upstream yet but, that's not the case with
>> 7280/6490.
> 
