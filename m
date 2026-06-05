Return-Path: <SRS0=0dEZ=EB=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488B4CD6E7D
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Jun 2026 15:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29E7A1F00898; Fri,  5 Jun 2026 15:18:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780672703;
	b=vAfPNa8jFrJZWw3j6ryzfgEZXBctTr59TxZ/kDj5dhWcOuGa1W7bQWYcIyh6sKJJiYfS
	 7nq6iloc8nJ53tlORGQawPGZL7YGBHbHVzSUr13UDBtsPu0vtxM5Ukaw0xkLJYCkMDKMF
	 IHwRVXWsx3WZC+72Y30u2vO6aKmZIynVMYg4u6kaq5sXwiw2xyuLBHyEvBZj4MY5nHlvp
	 6lDfi5nq+nWZ885wm5DFcKrE0SD+GbAJMzEAADlxeF3s5ZryHi0pBOjVRIMluCP42oz9M
	 YxHeWTe8OsZha+rCfRLHEVa/+Ogdl45v7JlLyb8uo92Rgn7yisXmo+0usOLccN4sb/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780672703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Joap4b7akfkWadQyUv0zn1p+VdZ2cCgOBlXZV3JqGUo=;
	b=C4AkNhE78aIf92Hm8gnizPyPyPVfESyIIVNlU5T5pEk4voBIxSEH+8lQOoL+M2vyWEnE
	 gT+aeTouG3eL/2mQ31Cfn+QfI3g6ZnlqsJ9UsEv7gFuoX1VYLQv44KcSnB7v+NtougB1u
	 LvrwJQOnyMXhGgf9J4Bg96f7NoN5JgX1xxQvvXqTqF3LEvVIbruETVSoTaomfdV6uK0kC
	 HV335pDmy21IMIu+0mqyZkjl1HjahXA6a0aAt8y8MLvayDnVMi4+HTnbMVTNuBxcb+5ra
	 YlvJIaOUeZVHvERgc9koVVGxOesmqJ219aaUKScCoDgITKKdVdGQ0xC1zUmkrrO/cUQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OTsrTvHH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ElonVbkc;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BFCC1F00893
	for <linux-firmware@kernel.org>; Fri,  5 Jun 2026 15:18:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OTsrTvHH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ElonVbkc
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7BFCC1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655FCcuk3603414
	for <linux-firmware@kernel.org>; Fri, 5 Jun 2026 15:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Joap4b7akfkWadQyUv0zn1p+VdZ2cCgOBlXZV3JqGUo=; b=OTsrTvHHzyoJ8QH3
	GixHUTwllPLUzJLFbHoOO9CU1XLmxyshDvYe0IShyoHnHFbj0EluA6ewBjAWjjRw
	t2dggF34agKRr9nlV0syXsL0lBYdT6Fe97AWCL9mK5DeH13BLwzvtuchnmpD+Dhh
	ld3oq3UVvZBXNu9NeRb5kEGFersGxhx0SrleKGFWVps16aKvtALJXVoMUs1Z/eO4
	QiLVVoY8+Ghlo9YV9GVDIA9Rllm9fnbT5hIpkAgoAvdt59Kv6ebNhmiRZz+FGCZf
	Csk5Px6HfYhK8tn4wJ5pFXRBE7x0eX9RFwL4zwXhgphsNunavdH4AWHP+1jIOCkz
	itOMbw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekmhfb413-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 05 Jun 2026 15:18:21 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7ea35baee37so42532797b3.1
        for <linux-firmware@kernel.org>; Fri, 05 Jun 2026 08:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780672701; x=1781277501; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Joap4b7akfkWadQyUv0zn1p+VdZ2cCgOBlXZV3JqGUo=;
        b=ElonVbkcYdVRmbbnwueYhatq6AnLOErsQtZi6IHkHOzWUsHA1c8qMu8akxf0eitRRy
         jEJuHu1LR11q25/QXT7s9EX6RjKzVJUufDzMGkRmwzJIc+pr8LVnvQL9PSm3D7q5SJAr
         LDsO3LeqtvGQxcqt3QdvLWaPEdHkLyAHud7Md0UQTDsLHZzbFShgfHpPxq9a6uY8fz9T
         oyjg0Y+mpwapH+6bInO7VpDa2iSBHUYmoD9wAUl7/22E+Ab4AUxT0tRDk2+wbEZgZ8gX
         WkrLGr56mfQQ7w+N7Te34OvIFfttmbd3DMSv/VLp6YCutx2EvIsNguXasHBlyYybnleI
         W1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780672701; x=1781277501;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Joap4b7akfkWadQyUv0zn1p+VdZ2cCgOBlXZV3JqGUo=;
        b=Wjn1Zw5mt0t1hZ2TNELdT+V1Tc1pSy7Z50U2PFs3bjJYFPzOhFeD7jddsRql/7fKdb
         nHuE6KZvkrq/QmcnOhBbakUYwTLOf2bByiqXRCFQuliv5IpeggrhOqiLO+sxt/kINUpH
         jGVm3C3t/gfePnpDMZCWSzIT7s6NiNTbI5TcDkmYDdM/BUy6mb8ycBJeuFAiQrD+yYrP
         arjKbPSWCxVZStxQvPdGz4MkIiUT5SN4kuRnuV87UURjUZOYAL6LCAChYUeM0sfblhou
         l0Fqmg5ipwb9E0S9bRjBBfnkH6pZ59ag04RLQ6IYv8gsfVEtGlY6bDBAFExHnjgMNMLk
         g4+A==
X-Gm-Message-State: AOJu0YxgSaI+tEmanBIFHqv9XT9aZIZwKQCJ8dn1PezNC4VCHAV6YsYr
	aKcvqr3d3FFyNgDgboApIHIEG+uyVMeNAEKgv7rdhASVMhaY4XU8bylLq0O75/ibkjGwNhQ80qv
	5rrY7ZWWj0O8hyspNGgJZLEaLiBEW3qH1UQpDhx+OZ5QSxYr03cr/QcO0gb+9gF4=
X-Gm-Gg: Acq92OFhOI1WtnP2VEkzo8n0UsVIrsLDwMfWb+kCSoXgpyjcxeSiP6nXPftfYnSfBY3
	uXmclCcjfYrNGwFOydEHg/cV+JjsZToL0apm4Nan0GQ3GpMMQDfeZaiF52wPoBWtrQ1vCOr0h8u
	Mnq5N5bwaoUXTM2tA0arKrpsKvb+0Kll1dVKxQVDBnV/FHn9s2J0kzq08YsPDOqRJ9rnWgACBbW
	YEZA7hu7D9jbN+WcAmL61l98KBzHBj7wV813rtKwhDLCp9vmzYiCgDzAehC358fRkUW0LX68UB8
	QfBcMRLzOSbsinBBz9liiHSiUOVTWE2T6p2R1QcI9O1y6ywfgacRKUO9aIKKMuBaSTD3Vb0c0Kn
	hhLzSRlQxyUoWyLAmS7kuOme0+y6hjKFFw7zPXmOAqM9eESqaSHFl/TfZ4uk/Gg==
X-Received: by 2002:a05:690c:4447:b0:7bd:a6ea:c507 with SMTP id 00721157ae682-7ed0dd9304fmr39335357b3.25.1780672700845;
        Fri, 05 Jun 2026 08:18:20 -0700 (PDT)
X-Received: by 2002:a05:690c:4447:b0:7bd:a6ea:c507 with SMTP id 00721157ae682-7ed0dd9304fmr39334867b3.25.1780672700390;
        Fri, 05 Jun 2026 08:18:20 -0700 (PDT)
Received: from [10.216.45.215] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea235885dcsm52211537b3.30.2026.06.05.08.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 08:18:19 -0700 (PDT)
Message-ID: <57d9514a-ef53-44c8-bfe4-36e5ab14c2ce@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 20:48:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for sa8775p platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <c5d3951d-dd2b-449d-9850-7a4a0f0e680f@oss.qualcomm.com>
 <CAO9ioeX_kSma8sZOqqVBvDRdoqGqKSUzH+GJK6+9qj_=hX9qpg@mail.gmail.com>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <CAO9ioeX_kSma8sZOqqVBvDRdoqGqKSUzH+GJK6+9qj_=hX9qpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDE1MCBTYWx0ZWRfXwECZQiEtjGHi
 Pprzp6wOPntZEm4Gp00Oqfed5HcvpdhQNXBbuhnvlDV5OfHSueNY9B9YdEjONClVgIObFQqC/lU
 cwGQenthJXX0Pge3N4mwPs7mrhBE9ZWJqx4HZUH2gxpsV7bda00hgIdIMYs/uKvB79xCQnwHQ/L
 VdX+d39fHHBJCUuupalZcWfeiO5pwd+4xnCGDm4l+w7MTM87C7fZkZGGuvAaI3ynJRt9xwJD9IU
 Vci8JR9Tvr2xk4+jOUtdOaC3YXGq3Udy5lfyQsGUu/FgQqa3X7UPriyPht//iiXoDtZdmCmw8dD
 4cLHak83PhNnDdCc3WQa7RbrI69CA+NxZLS/caOT3EyOIojTYrLu3ylJMUIpoQHVk732HubHB/g
 wbC1DZOWsCPEeshAJAm93mdE/v/AM/1xzpzfwYAlaoExaWjMDhOFDQrsiW/Pn50mm6+QZn8ZN6L
 11WHcapFlmJKQ+phhvw==
X-Proofpoint-ORIG-GUID: WKLem6-ewVY28C-n99MvvWTFrXJgRN71
X-Authority-Analysis: v=2.4 cv=dfmwG3Xe c=1 sm=1 tr=0 ts=6a22e8bd cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=hzbaPkWvt59gAIitkiMA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: WKLem6-ewVY28C-n99MvvWTFrXJgRN71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050150



On 6/5/2026 6:41 PM, Dmitry Baryshkov wrote:
> On Fri, 5 Jun 2026 at 09:47, Venkata Kota <venkata.kota@oss.qualcomm.com> wrote:
>>
>>    Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)
>>
>> are available in the Git repository at:
>>
>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dspfw-qli-lemans
>>
>> for you to fetch changes up to 8ce6db8cd6564895827c199635fd94401a9d4d98:
>>
>>     qcom: Update DSP firmware for sa8775p platform (2026-06-05 12:11:41
>> +0530)
> 
>> Changes to support Ubuntu 24.04 and Python3.12
> 
> What does it mean? How does firmware support Ubuntu or Python versions?

Noted. Firmware does not support. The tools used with in the build 
updated to work with this updated Ubuntu and Python versions. This was 
an effort to move all the tools with qcom to move to a uniform toolset 
across.

> 

