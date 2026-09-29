Return-Path: <SRS0=mZhp=HV=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8E3C9832A
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2026 08:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8CB591F00898; Tue, 29 Sep 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790670119;
	b=eE/7qPYhqnPUI8rnZ25T+Id7DcVpccTsmCjcu5eEXT78zh1mYjGDDoirX7HYHsadyQHa
	 WrmZsrB6qpIRZd0jk6nV6Uz98iq7/ZUkBHteSq+JFFMvExo7jiclAAYXLHn80FrxxQKe2
	 l7b8wdQJ4MU1QKvkhIX0OOIYY+Uveke2fzpeU1I/HfrIu8IlRD7Lzeezi/o9uMzfqcUJs
	 HvPpo96Y+2azHW6cwHjU238DI8jQwREYJdifHJUl9xYzgZfoV1RttalQHKtXVUg6V4u6E
	 nFZYlhp+ebXtnXfuUMUBrZVAoUdcjpVnr/lt3qNH5enf3HFWeAECPmpfrYdvd+C/Mww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790670119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MNBdF64+1f+p8wiOtAa+VblRYrICa5FVDQJhkBLgSt0=;
	b=1vmIueZggeGCy9hSp9tZMdQaommDTuLd42BTzU558gsHAW0oeCKTOb9qNOUVHWOBzCj9
	 et2gXRoYA+6x7BNR/yEFv0bcCtF1BM/dr5jL2ZUgWoxB94L7T6hKoQRjPF0i6IYSmJ7KV
	 UncM7s3bS+NGORBaqi81ZWcuDa64wRX69OzHYv25XuWCbASSzt01N+uy5sd5zU3pWoo2d
	 h3jk+fQLYefeeLp+k9aaufKAhI78c6HdsS1sqh20BZBrgctSZpQoSa8Aewbl98e7ZuHjK
	 +K5iIxXT8X35DVnymjLprIcAsyjUI7BxrFK2gAYDXqDr1aiVBeXV/YCMCqjRzi1AocQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z5mH00oX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VQVeJXxJ;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1D281F00893
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 08:21:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z5mH00oX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VQVeJXxJ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E1D281F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U15I2571403
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 08:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MNBdF64+1f+p8wiOtAa+VblRYrICa5FVDQJhkBLgSt0=; b=Z5mH00oXWVliSjjs
	uINBEdfEBIgtUdEpLleMwYzdOi5JVFRk6ROGEYnqtIjM3rjabScZXAcCJJPLddhD
	ZDbILucbldYDMXBOqGZsFJ7GAiT5HFtQxRCDOG2ccfrYzEgODKhHglCgBV7tA0Wp
	8nfZSCO6lYEDuY0ZiE6h5rFpDoue/2lLVhbQvLeIMwW80HEK55uNWFRjeUTGd6fs
	g4jv5RYH+ExoM8NRPECgZkni2r1T1IAcAnuuyJjTDQlAoFvGdUU/G7ZwUd6FavS9
	DOfdEp9uG/lwMYAm6c1UNtJiCEsChm188xzAdx3JNNcXQwENkQw72dSeM2RtqtAa
	42NlOQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mn9n5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 08:21:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso2300530a12.3
        for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 01:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790670117; x=1791274917; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MNBdF64+1f+p8wiOtAa+VblRYrICa5FVDQJhkBLgSt0=;
        b=VQVeJXxJIqdY8DE1F+Pg6RvwPzz7fbrkl1Qfc5DgQ4CyEr+ColZWWSFVqfrdkSBxOs
         g9x4wqFo5UOzinSN77GAw9m3xvlKXzwg4J83TIZeAknYgBKtdbIod649Gx2IjACQl1gj
         MCGACdyLyPpdcWIAmnlI+GXJn2glT4KP1NXus5DSrCambKLXrVPCEKbKaVuze2oHkC9v
         cEkYTQhtxHZTPsd/lKhOoVGZ5oxs48pNGBqs5W+KyQjU2rEIiGsHKqUAPDsykz1VuP2t
         Ie2BICE5TQOUv+S7dYMnTCK9WtMWPPTxRtAoFi5RJlHm6uM/KrpwQiJABqcDy4MGHLb2
         c72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670117; x=1791274917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNBdF64+1f+p8wiOtAa+VblRYrICa5FVDQJhkBLgSt0=;
        b=Cablow34xgANqjnudfGolInOeKYm/YImJE+QnPnXEnA7a3191u0ybyrMs7Oa+MTYmV
         T/edOVlOHFFoIUxb9oQnFy1ohjmf+xSRRMknXSD1zGDRIf0fLtijHXmW2H1pTl0AV5CM
         qRN8kqjJztOzP+w+57jiQRuBArl+vF2G+FEUW9l2zH1Ww8HFYLl3XFVLPNWOp0KUqLFj
         Fniuha4L9vPL46YrUw/5WCZRU/DAHD8+uBKol/E3HtPt+dK1ZaDYRWGC0Cc5VP0qfPVs
         AiWO7SoNm+5bw5Dqe+Z8Rpbjp1h4pzO6cRlyPPVF1hmApwC4PLaYX3AS0LRGO1ZasmwG
         DO7w==
X-Gm-Message-State: AFuF++nDoGF9JaF9gfagzDbwLwtjLQWd3gQ4hnnA3pRZY/Fx1TbxK65J
	INLDXAFlqiVMvqC2vEKh0I+sJmMFBEwvvZnez1w/uQhdSLE6GT2pqrV8qPFgDsdBWyjfwyF3wsL
	BZnE+zH1J8atLYj2qprF8KAvB3HCJSWf3Qnhdv5CLN5snszG8pghQeAb3kZpLOQzWW3mA8Ac=
X-Gm-Gg: AYBFou1BhE5q0wAzNa3h5W4LgR7LxLkvHBFeQnsmqnOt3Rh+TDw9G5nQFAFNLz8GF6O
	nsW4n/BNdUIkel4MXauv4uXjMby0KE4b7JQzRbHc5VrdCD4UZZ6b5p2REmxiVNVCrVSn2gQR+hS
	WlXVdhgVscbnsncyPGTTb6xHRyzVGFUhkJi0Mr7nwq9kGgXI3+CpASoVd+nDDhVCJhLA64oM2jz
	AFUpkNSQaqk8plirHikhX8m24rIRVXNftT11+mDWuq4tVKXWhahFcaqsAC0M0h0kf6kHIW/HuUw
	7p36+fgPD/na/2B2V0WXA2p7t352OxE+S38Fg/wAD7cNy0wfDchOHV9tADrfq34h8xrDoZqWFdP
	htbdJ9s69u3dNU+KVUAzYSoBi1VNLrQ==
X-Received: by 2002:a05:6a21:398f:b0:3dd:a195:fa25 with SMTP id adf61e73a8af0-3de0e9d0b50mr12595716637.74.1790670117552;
        Tue, 29 Sep 2026 01:21:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:398f:b0:3dd:a195:fa25 with SMTP id adf61e73a8af0-3de0e9d0b50mr12595687637.74.1790670117062;
        Tue, 29 Sep 2026 01:21:57 -0700 (PDT)
Received: from [10.219.56.173] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7b0f4ab05sm2886859a12.29.2026.09.29.01.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:21:56 -0700 (PDT)
Message-ID: <4ebb1053-1272-4338-821d-9238d7a96d17@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 13:51:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update ADSP firmware for x1e80100 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
References: <131468ab-ba9e-467b-a5b7-c645320965fe@oss.qualcomm.com>
 <bpwercpslsyla3njf7wdhg6maqvshmswpt4dbcozhmwd4lxvjw@yarcocckyqdi>
Content-Language: en-US
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
In-Reply-To: <bpwercpslsyla3njf7wdhg6maqvshmswpt4dbcozhmwd4lxvjw@yarcocckyqdi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb7526 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qC_FGOx9AAAA:8 a=3-SPzAiU4kjaD3ggdrkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: uUP-j8JrWfNzT14FuI1zVb55QbQhQBEM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfX+MqRzvYf16N5
 59wkySoreyaOYwhB82EuOPt9pxfNyBD+ijX1h18hI5MIiirA0hMNwVhbh6EAEUv2TMwDu3yNjHc
 M7pC3vrlsnX7rShqIfcr76KpZwf3u1I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfX1rvh5ZxoCyuQ
 vWpwFR0RkKHISUVy8/82o4R7PptQLmNJL7bgOtTpZIoUf5Ulk+9TD690CncggiCYpGdNBOkvXjH
 rJABO3aixnAf4WD0+BpouVEU5bV9B4G4tQHRhMcDc45gjD3fc7wV3UHvtom+yOAjUtAkJwTywLW
 oCjwRYL4AFpeVnxqP+Hd0vIP5I5jCUBpNuukXkA5NP5659dx4uevSC4WgAMhLXfKJ6Dnk4wb+kQ
 Gdwi/3YdizxOP1szfvvWXHOCSIJB74tT05NpOdIJBBDvPaiP43iO7zqjqDR3dndMrd6PGEUfxkN
 dLogC1d1UOzRzNdm7msdDnDrgAMmAYl00zJRRlSsHBvG82zhzbYygw5DYQPncSAbVNqLeIxsKjy
 UM/4+1duwZOLZFBKSiG/TAMsLh2fW4fvg60AC6bxFMEtPrTHmMoUzhQU+7/pYmKjKjb3QrybXqE
 huVuxx+4kK4kbILfOnQ==
X-Proofpoint-ORIG-GUID: uUP-j8JrWfNzT14FuI1zVb55QbQhQBEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290033



On 9/29/2026 1:45 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 29, 2026 at 11:13:41AM +0530, Saddam Patan wrote:
>> The following changes since commit 58a9869598b606fc2e5531298932b8757292f9a0:
>>
>>    Merge branch 'robot/pr-0-1790653747' into 'main' (2026-09-29 04:30:30
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-hamoaradsprtm
>>
>> for you to fetch changes up to 4a4a017e7cace118dbc110007a44778f3d12f080:
>>
>>    qcom: update ADSP firmware for x1e80100 platform (2026-09-29 11:07:25
>> +0530)
> 
> Why did it get the .c7 suffix in the version? What does it mean?
> 

ADSP.HT.5.9 is shared across HAMOA Windows and QLI and there seems a 
huge code churn coming in Windows and we dont want this code churn on 
QLI.So,we branched out to ADSP.HT.5.9.c7 to maintain for QLI.

>>
>> ----------------------------------------------------------------
>> Saddam Patan (1):
>>        qcom: update ADSP firmware for x1e80100 platform
>>
>>   WHENCE                     |   2 +-
>>   qcom/x1e80100/adsp.mbn     | Bin 17922440 -> 17930632 bytes
>>   qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
>>   3 files changed, 1 insertion(+), 1 deletion(-)
> 

