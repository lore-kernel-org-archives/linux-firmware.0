Return-Path: <SRS0=dr8J=ED=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96207CD8C88
	for <linux-firmware@archiver.kernel.org>; Sun,  7 Jun 2026 04:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F9761F00898; Sun,  7 Jun 2026 04:31:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780806718;
	b=br6t7gp32UZlhEswUz+H2i/RSIvhAis1pCs+bqf9PA9nreIncfwkLLzTp7Wt/sZDtWWH
	 q1vib1IWBz/kaX7uzJsOnTYRF6OnJ/wIUUEqPmlBCMikKZZxEsGpHs/AgvGrmcQ3rcpXj
	 /v+iB/35gIDii7/Wjl+4UH1qNsVYFrSIz9UG+f78IbtzOVYcwt2J5bPIbTkLpzpnZl8N9
	 9VtsuW1X0MURtbKG9c1AhFRP2Jl7I5esYrtRnhDoOankBXLmAlRZlWLGb1H+V0/M2bgFz
	 Ykl5SSQDSlXy7inNr6VKVFKM4lvXmkeJXCZxZaGV30uh7wO0UEuf3z8GHCVqAkVBQbw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780806718;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J/zYQYGfNZmaWYzoa25E1vHHQ3U6hHDsFn6g0e3slFQ=;
	b=WZSSjb4O3yrPDyz8KRf513UyQOGol8ch1TuQzKDi2L493fbR51Gaq4Vcij9Z9L2uEPU/
	 RbNEBW0jewubj+FdCV18hDmbneOfFOUqtS2D8IrG2OxdYYoYOc/Emg9gpJH1PkPLCEWTV
	 SJPuWz+LapsXvCMO6Ad3v+8Wf76vj8H1N7WFzphtZ7eFeTI67UxXcD5HjgFKCc16Pj3EY
	 kV4jssa3B1tA3x1EZ4rZ0qmeIBX+WVJYtZJSa4jvx23fggbTIVEGUzbSR+Z1UER7bMBFa
	 ttArU6RCrektFu5bvzNY/rCTwXoz2l7WxS0HRsqZ2mv3HEFwrpfng7DRuj1qJ+q7R0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AY63gn6+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCzh9deR;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC4181F00893
	for <linux-firmware@kernel.org>; Sun,  7 Jun 2026 04:31:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AY63gn6+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCzh9deR
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AC4181F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6573VmAI3685070
	for <linux-firmware@kernel.org>; Sun, 7 Jun 2026 04:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/zYQYGfNZmaWYzoa25E1vHHQ3U6hHDsFn6g0e3slFQ=; b=AY63gn6+UmqAC+SQ
	UTgeVEGyeRUW2RPcrBOTdOaFrAN1U4ZGvyzwh/IdGNQ8hxbDUF23o5YSfkkMEHxU
	y0VaC76ABuo5/oG0zIReokgKhc4txhWE9UItqURA8j1I0mYmqalCDAxsG4HKXCVf
	xucxNBALetE4hBbUQmWlgsJr/7EcHnoxqBz+LAZL4KqiGDKamFMFVhC3j2lmH3KI
	ieeKqKORSLPhse/hu839zXh5VPzi9evjHkkur1/9526fJJJo9d+RMUmIwXv+bvDD
	jNLpOttZ5wsvCH/JgbYSnQdXuhg9/uV/a3Rm0m2frEs1Q7FYx4dxJYnwviMqOdOh
	utlAsg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3kc33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 07 Jun 2026 04:31:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bc380fbf9so3135923a91.3
        for <linux-firmware@kernel.org>; Sat, 06 Jun 2026 21:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780806715; x=1781411515; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J/zYQYGfNZmaWYzoa25E1vHHQ3U6hHDsFn6g0e3slFQ=;
        b=gCzh9deR5cibjkiwqnRu8wWGLCtGl1wAiZfUAsZvO3ipk2ZCKsWJBXSFwuzgppj/ow
         VMiBZM8E5CndhhBhCWhwir3PpFD0sAelJoNbYdjvD/ElJeJ3z73RVBvQWq/oo0qmp4C9
         q+hupC3VRZcVBRaJwFYL3c4YfM0kH379Zasd6kxmdKk5stLNoqlpgj7ojs5UtUwyxgIS
         ycgqYHMBMUg39kN891rPZtWmhBi2njPHDT6b8pN+1Ah2+Q2y2UnRER0B+CW5Lyat6Bg3
         g9T7rmfDAwNb2+FHm3CyucNpD9Q9yZ2u6EWsfcl6smIam9tUzBGxP5sHVGrc160njCVo
         zy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780806715; x=1781411515;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/zYQYGfNZmaWYzoa25E1vHHQ3U6hHDsFn6g0e3slFQ=;
        b=EBK9O1hnHzu70ZGw+Q0UVECQcFBqt00itV385cTTgZKC/xAteizTAN7bt5TRv7dW9J
         YWpYYW9yPodD5y5B34OkqC32hMKY0Qi8bHqs6XopNm/RUqG6fdr6J1/A5FfXOr2Oe7Az
         7ozfuaKuDC7hALkyxLQn4Xm0E8vbaCu2sReDZxW7xfdqh14AmKx8Y9WW/47Q9URu1G7l
         kt3nNDHkK5I+tvvpQjQy4a7UrLWfardCLsrnmePtYokloGTaEzW2xMJJbqAWsc0ELyxz
         9g4CBf1C7CM6D8TTNIzIyPrMUNmCf6D+J1SK/z2KcrKuaIHePMdsquiWRro3nxe/jt/w
         3s4A==
X-Gm-Message-State: AOJu0YxLGh5PdJ+yRjKta13fcWhHMHSkXWYGqCY5f4bRphTR+F12ZCTQ
	y67sdtb1ohBSfdZYRPo8e+ke/BfLyjVafdwTQEpysPXNHROoowN0QzqJwWIpa1K+uQ7bEF+9ERk
	9VqxMQ4wIZk1Y01V5ky6RXIga7anNcRTJ/SpmxDa8QoYIeFG7OL0O/MON8Wp1nMA=
X-Gm-Gg: Acq92OEcqxOH6rADpvEBlu/XnUxxvYrDoklEJqL6zLJKcMidp1mNbIhQF7uWowuIEFu
	sELdV1c7aXaDZImiY/fSjKTCFIYPy2D02uViPjlBSjKB9OpOXc9ZZ/YtwZ3OpZMN6T1RoeI37Jg
	v+Wwu5CcD3RNtxO/RvaxioboWDcxP3orkGfHLTI8MaMZdV56ZmQOOE5EDQo1nVqdflVOBUkaPDa
	qChbofvtWbqGKTutQaRrbD9GIGVUVa0DKmJuf2pY/dvC1Q42hgrBVElYq/SPJXXYiflYj4x4Pcp
	0I4uIvralPuE5EYsGg7QSXdiN/wKfRQlmRcw4iv7JycCvNj/TThNnDRBl2n2DktEVuTa3RGlTxg
	W6B5SY2R/cyr3zJI8oCq4H2EZg7wFPSEGb6fxTxP7D+y0cVmaJz4yVMcB3W21Ag==
X-Received: by 2002:a17:90b:35c1:b0:36b:71e6:3e01 with SMTP id 98e67ed59e1d1-370f0678ed1mr10920310a91.16.1780806715424;
        Sat, 06 Jun 2026 21:31:55 -0700 (PDT)
X-Received: by 2002:a17:90b:35c1:b0:36b:71e6:3e01 with SMTP id 98e67ed59e1d1-370f0678ed1mr10920287a91.16.1780806714871;
        Sat, 06 Jun 2026 21:31:54 -0700 (PDT)
Received: from [10.216.45.215] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668f90sm14267348a91.6.2026.06.06.21.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 21:31:54 -0700 (PDT)
Message-ID: <f2644d05-ec91-4a96-9f92-6993a7bf078d@oss.qualcomm.com>
Date: Sun, 7 Jun 2026 10:01:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for sa8775p platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <24b6e1e5-5d2e-49f2-8d63-a921eaf3ab3b@oss.qualcomm.com>
 <CAO9ioeXOROr4rQvkGWmy3OG-03Dq-P9B1XnJXutVOzVn0dEC0g@mail.gmail.com>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <CAO9ioeXOROr4rQvkGWmy3OG-03Dq-P9B1XnJXutVOzVn0dEC0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDAzOSBTYWx0ZWRfX7ztMLbRxUJPw
 D0PVjaVzoxlkSLQh7DhwjEuydD5h4sSlKgaQsp96oUKseRi25HAv5FZ9YPbVg9Dy1xANhSobYAV
 P/1HYuLZFeFVqG54UMT3+Pp+16tmjUZ2gaWSafFiLypeLL14cAas5wcRBBZ2KdhUlXUUK6Tdw7r
 FlkqAyJf8VDmu2qZhaH693LdFbnbDJB/OWpJRZNPG43WzTjrK1ZCcFW3XpYi9l8ljrRgK67oKeA
 /iMpfDiMOxqWnzWbx/r5qrmKHyz1Nx9kXd/444AByF4CLoiP0N35pAdcB4uaUp8qoWCVirK59oK
 Jd3Lv3sB05HQc1dMoKHteBZgX8AVNDe2ocSS4ygqgn+9nOdw9+wVVin1zhwmMW+gX24fZIEPCdu
 ken93tRjMGdnDXMTd1vnkd96x1AIUNaCTyloKBCk8oxwxxhpP8SwaFMOFpkw9/A3gFRcvB+A3nc
 m082nPSAkAW5GfXd9dg==
X-Proofpoint-ORIG-GUID: xSxaH7ozjsq_yfOa6oANM3ujwmQTdKEt
X-Proofpoint-GUID: xSxaH7ozjsq_yfOa6oANM3ujwmQTdKEt
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a24f43c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=F5dlWWj_lBmt9Giunt8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070039



On 6/7/2026 2:34 AM, Dmitry Baryshkov wrote:
> On Sat, 6 Jun 2026 at 23:56, Venkata Kota <venkata.kota@oss.qualcomm.com> wrote:
>>
>> The following changes since commit d953ad875636676424a622ab91cab51b97a0f50c:
>>
>>     Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)
>>
>> are available in the Git repository at:
>>
>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dspfw-qli-lemans
>>
>> for you to fetch changes up to 1aa3b79c6c4d0cc5df27be6cd6ecd3afb380c477:
>>
>>     qcom: Update DSP firmware for sa8775p platform (2026-06-07 02:23:32
>> +0530)
> 
>   -- Added Fluence_module_fvxv folder and updated dependencies. -- CENG
> Driver Update
> 
> What does this mean? Which folder? What is CENG?
--There has been a change in the folder structure for Fluence Module 
compilation to go inline with the Fluence changes on the latest 
mainlines. The corresponding dependencies across needed a change and 
this fix has been included here.
--CENG is a Compression Engine. This code needed fixes from Static 
Analysis and they have been picked accordingly.
> 
> 
> 
> 

