Return-Path: <SRS0=m+4W=5A=oss.qualcomm.com=konrad.dybcio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314AECCD1BE
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Oct 2025 13:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09F49C4CEF7; Thu, 23 Oct 2025 13:37:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40B39C4CEE7
	for <linux-firmware@kernel.org>; Thu, 23 Oct 2025 13:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40B39C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N85KPN019068
	for <linux-firmware@kernel.org>; Thu, 23 Oct 2025 13:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNvE9iSxoXTP/UG2qG1WyVpzFpKobLzR+EucBkWbTNc=; b=b5HxI8CD5xDzQUTd
	CHhuxudUqqwfII+P4qSWjh6Zp7qVu2MzBPYjuWPt1by4Aq7LVpJiaSzDFGP+LBWX
	MUPmiTEZMmundJTBYrvZI8wX38F8WXbHCBzRvaZEfZPI9yYibRjjY5qAmEoUcGur
	fhfkrI7zxs25Kh4B7cR7t/TJYcL7CXeL1ua8tgipYDiACgM9BEzyGHcD/JaNRo4R
	73Vd4gk6UYaziqBzNeR3RZmnyGNeDbXwWOnU13wD8rbUfFAMW9COa4ZQ8agZwkfn
	dW0F2hgnBYK6bHrZGKUHzOszsgAJAo8ELtnudZjEt2vRzQUbnLAtS8LCh8bFGlTC
	zyp4vQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qjhm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 23 Oct 2025 13:37:24 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-793565df4a9so309982a34.3
        for <linux-firmware@kernel.org>; Thu, 23 Oct 2025 06:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761226643; x=1761831443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNvE9iSxoXTP/UG2qG1WyVpzFpKobLzR+EucBkWbTNc=;
        b=wyF494iPMYvgpZ3dC9F7on1i4XA9pGh2EHxsIPzMQjMnMcDjmCYbp+LI3yhplJxYhX
         fILzRm1gG4wfBLYQWips3reWfbFeZiZ3Egk7woo5eL5LezPIVwoNw/c21NXqBkKZLh6v
         tubGybp8dY+mTGej62G5HoS5k4+lyXX50npz7IbGHFM7jYN+oO7mkVZh9E2lLJ6zFYad
         FJf3T1A87eR5wDT/bodEAEq6SAsxXiuQeerkj0ec0GyShQAOeDnY3gds6ab8Wt7vOeo9
         2ckjdQ+Xo5IgTS4fd35BVpmeBNL73r0fM0zRuZ59k74+culJnUlXV/wAgokjKie/fRLv
         NMqA==
X-Forwarded-Encrypted: i=1; AJvYcCVP3nulK0ZveUfDQLd2R0MqrCxFcFSY5qUc+vJXElMp4B86d2OGQ+ey62Pmpkdthfq3/DxjXHWNca11+Wjupw==@kernel.org
X-Gm-Message-State: AOJu0YztJsgUmvWWvDjYxhlqweTZFt8TFyacnZFnC4EuljL+6Kzut68v
	MJTisMCJc2vuzeUmVqzqN+4Igjx5W4PovLIwF/9zD9IK6h73/MseCfeH6aehesZGxCiRedxb8Wt
	DJcus6BylxulxDpNWKzYrTw7XPuCd29ryDDuWlC+BiMcf908vmRdmiFLcMmIqEVg=
X-Gm-Gg: ASbGnctNOu+4fryXvh/VoWbAntAVhV80o1cZSQ4X/qSxpb33sI28X2PGfz0c2an0oOW
	bo79143+xHEbMMxIyYVZPTVHwAVwYttiUfEP36pLjEwVirCCx2FRnv670Fcji9axJzrNnSWh6Dx
	jpQL4N3RL82PkcXuMdgf+Ytcr6Tz4zojHYB9lWevJ74SzihqBVC+c34gsMnOKLkdpLBLkBsDgjc
	Jjn7K3SWxkENGDlocR8csF9V7JOuw4ZZ8c8S7g5svZ86BETxcZUu5dtQRqcXmlvLYyH3sFTx7hD
	C7vNns5bEyk1wYhqXRedxmPLoVOjtmaSQHBapyizb6uh6As+25+RobdFIrUIjXR5W8RfAmCYUMx
	iEvhzEl0jNP1foL91AI/oIVOW3E3PxCYCfspeMfMVHfYABYuem5FE36N1
X-Received: by 2002:ac5:ccd7:0:b0:552:40cd:4d8 with SMTP id 71dfb90a1353d-55685efb75amr1145189e0c.0.1761226307699;
        Thu, 23 Oct 2025 06:31:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqX+28d9ltJg5RXmi0zz1Laxbv+UmWM9hxqP0xoVRd+VBPPciaDezjwwmWDGu+5ZMh7iTJrQ==
X-Received: by 2002:ac5:ccd7:0:b0:552:40cd:4d8 with SMTP id 71dfb90a1353d-55685efb75amr1145173e0c.0.1761226307229;
        Thu, 23 Oct 2025 06:31:47 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144cfa4sm211886766b.60.2025.10.23.06.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 06:31:46 -0700 (PDT)
Message-ID: <41183580-b917-47c8-8612-426f3ae48e50@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 15:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <hsj3ravxgkhnbnks7wl47qqwsef3loi44jkgahzgx2m7k4sjld@endp4nl3h6ek>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX73i2+W5T/fUO
 OZW7+BOOOPMAaPIBLsr0K7Z7bkZxMN8MZHkIfcze2+gaEjPhZkCUDVCbOWz+v6gJOjnxfOchN08
 j8Mq7UJgI9C5Z91dqMXRZDNTuLs3/NyYw2TSbkwB6dkETIRHKm9wOzFrWzlHvCflufHTXKVN5IB
 +Uk+UgVc94sG5Wy4Jv3mgDVOP9zFQgQzM39cRd9OxgA7xKromsibe1a4HARM7C5tsl442xzYHxk
 wMuiOnbbWn8IIvcpPUihR+IPFRXO560fjoLq1k17PoSBK9m5jOlzrLurQuRHPkxiDzI/QKoRM/D
 HnjlTcEU/9oxBM+FSf4/k9nVRVrd9bgpoNrDWV08vp3heScZqxyr7fGU5WeYTQJoEFl9rEWWPgx
 arARxhmfuMtqtsSy7rrcoKbuOpi9Hw==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fa2f94 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=n1Ua2TvkZ0XBjMMAIBMA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: Y9QKTwTwZ_EBOQ5fPcKiIQyruumJFG6D
X-Proofpoint-ORIG-GUID: Y9QKTwTwZ_EBOQ5fPcKiIQyruumJFG6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

On 10/3/25 3:01 AM, Dmitry Baryshkov wrote:
> On Thu, Oct 02, 2025 at 04:07:37PM +0100, Bryan O'Donoghue wrote:
>> On 02/10/2025 15:59, Dmitry Baryshkov wrote:
>>>> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
>>>>    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
>>>>
>>>> WDYT?
>>> Well, I think that potentially complicates the driver by requiring
>>> support for both HFIs for the same platform, it requires detection,
>>
>> Doesn't have to be anything more complicated than a reserved string name.
>>
>> BTW you're right the main reason to support this is - in effect - ending of
>> support for gen1 firmware.
>>
>> But then in reality if that is the direction of travel, its in the interests
>> of upstream and users to make the transition.
> 
> Okay. I did a quick comparison. FP5 has gen1 firmware, is vendor-signed
> with the T2Mobile cert and I assume it is fused. We were going to drop
> support for sc7280 from venus in favour of supporting it in iris. What
> would be a migration plan for FP5 users?

Just like I explained, the iris driver would load in its place, it would
retrieve the firmware binary, decide which flavor of HFI it provides and
then decide which ops to use

Konrad
