Return-Path: <SRS0=Y9Wp=HB=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E889DC79FAD
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Sep 2026 09:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2CEC1F00A3E; Wed,  9 Sep 2026 09:41:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788946901;
	b=eNbIGlZSH6weMfI1DnRT8I7qMXJ+aFtdlr1izYW7BA9R/DpBBAgvEk/F0U766PNILdbW
	 laBC8hl30ZSltIkzfAKYbpp1zXrlzBUvfCoC+HwQ48i+vqXo12hjauIGdhx0btsVd0q7B
	 HN3FYb3UZtEojcbO16ROx30YQV58Shz+cfRVJNXeHuoQKWtgC5gPIZd5k8tmKwFBbjXwD
	 wuzZgtdKr7av0jMdZLaRS3ZfBcfO01zSnhXSsH6+RbcbDgDcnDFEiU8nZsyGyqlsuMgeA
	 StKUlLZQrMx2EymqOLlLg8OmGbEA8kFObePvIeLLee469Lc9Yxtye2STsM0ZUKxwRfg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788946901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S+xxOve01xgk7UJqhNuzeIbkhNi7skJmuaAc91LkHJs=;
	b=jHvxuE87V+t9V6pFe91u/lgqcGrA5qTxRs5w/8BXN+IMmXs54xlSWiEpm1Q2hyqmizNz
	 F6JHSSnmjGoBEUjX5+X6hxUzBNm3r1hNfy7FHd+8/9SkX7WgyhHT+0aRjWGCjVKFWiJOS
	 FW80aFYjbkoANsPu9oKLLJdxUXeqtzhrhvrvjiA5W+PhSzC4ZKKPP8QP0TkSlTEaRbPik
	 zQQSz5q+W7EYAtzfJxaXBQWSBy8PyuleEdXkO6+lSptN/THag9Zj+ndsqP//V0BHHyuuw
	 Ix8PNttasmzTOQ94kGDnRD6PGEJRON8K/ZTYpIKDaJr7MTQF75rFd98T8KFu+jVDwcw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lPEbR6Uq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZTM64txK;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2EA201F00A3D
	for <linux-firmware@kernel.org>; Wed,  9 Sep 2026 09:41:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lPEbR6Uq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZTM64txK
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2EA201F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896ZmGF965188
	for <linux-firmware@kernel.org>; Wed, 9 Sep 2026 09:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+xxOve01xgk7UJqhNuzeIbkhNi7skJmuaAc91LkHJs=; b=lPEbR6UqBCXed3p9
	w/j0hmd2HRutW9bKw2rm7vRMBuAiNo4Gu8TkdAsSZZNnaT1YmWKNoHYFNuSOklQ6
	6FvjcLKLMnsx8vcegvhWCvXKL71PPzTqVeLS1LjwkFcwo5QYvDSdx9zxN81mmn3G
	eihyMbzlmBuGKKy/3feVsLGEhmoic+FmmmWOwBxMn2DmxK4DTi3gUYwRAliJimjF
	cBudLZ2ms+HAgQT8WkCWKCxKVOUdRZVVYK5noDroB1JfTmlNd58JDGwSnH3XhVyJ
	wlUNcVyPGVBx3SeCt9vdgjbW72j6JLARWptlLzVT1vZIrlmTCvyieoyVn1rzyPK2
	gaH27w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha3cw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 09:41:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-855f662439aso3893077b3a.1
        for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 02:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788946900; x=1789551700; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+xxOve01xgk7UJqhNuzeIbkhNi7skJmuaAc91LkHJs=;
        b=ZTM64txK+Dxt90aMEUHkVehhE4du1qs7KDuzfhb0lYOOUaXYAtaz8rHJyXGRk2LzVs
         pJwb+Qb0nvx76KKGqB2/S4M8fXeSZdPUz4h/JaYgQ24Qpxl1/tAgsqVUK4SEMXxjUVSo
         g6zWCtuU/DJzYcL9Rrt2GVMQM6pnpMl8Llpn6jD5lp7XwARXedgqGFOWzdhjDo8LCHPd
         cGaChh9mM8NZkz3MjvzfIDvYNDCC7mKComFc/OUgkAqL/tZs2DhlPtaCTc7rFQ8rHXz2
         o1TNkfYM5Q2aufof/3LllSqNGgF6MkNvhHtkHdK5hZXvwj/SjEe5N0nzHbJ7cl7GJNmG
         d+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946900; x=1789551700;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+xxOve01xgk7UJqhNuzeIbkhNi7skJmuaAc91LkHJs=;
        b=LnmRjlCDLHiGRle+reL6GScK6PvkgsR07HnDWQ8IuDCEUwWE+oKGoj3Rz133Csl8DQ
         rrc8BeDryt20hBt0VKQW9vZTvKyG5hWwkFQFSJWusykbChGmoITpK96IuVjBX/ZSUoIF
         rNSQTwKYeplhMnR6cdYxyFfoa6uYm8hxU+YJSNluDTLCf6uPJVclb7VGzHMKM4dkv8c4
         YPiP2qFOWxvtSpv0VHA8pzG/bphHnOWLROnLEf137i5HoXfEuq5X7CQbbFuB2R9AHEOT
         NI13/DqUWppnhpC1B//njq9nOuWXlgedhpFD7D6PQVRWpEYyPyto9t1xbrw287BB7vYS
         mz+w==
X-Gm-Message-State: AFuF++mdNuAxd+uLCEiEKPXkkTu7B4JmPA6WXO4wYllH+mz7e8m76k8/
	/SIIXdIfOYoSxWQj0Y09XG+8ctetN/nGzixDU/FDai5kB8BpPGw+kUToWNWE2/MuH1t2krQBPGG
	7h5EHuAGnzEixgKvc4L1fo5uT6PH15bpf/ElWsMgNIj+WxoJaSpX9buXE/k7izZ0=
X-Gm-Gg: AYBFou0KCiXDBzTN29F8eSkrmMe89rUYy+XlmyAYHsb2LqU7pLdYsoUs03GZaxHUsx3
	/0A5/XR6NIk+7vL5hbl9Vc2efsp/FqARDnjOi2VvLaHi15CBCRyxQHRxsU/TRik/zKqgmwXcCzF
	L9nkCbvKy7NBDNWYQ9kl+lDn+tx+HHzd/N1duj609bol8nyU7ij45t9FoB13Pzh/6Wo9cFAWOdh
	8wNG0TvyAcyqGJuB3vPQOMmW2J/W/hy6rrYP6j7Rxtuz+gopvINoqQ6g7Az+wICw7Z58mCmEfPa
	cw0M6KP1uv5eD3wamk3c8ICmNyR3ykIUg/WIK816dkiF+8yTeVale/clw62LTDkWo3+gwJiFJx4
	Pp4JCZkkfF0oRwkZ6fUWtzZ+yWugR
X-Received: by 2002:a05:6a20:5481:b0:3d3:ae50:97ce with SMTP id adf61e73a8af0-3da3a217562mr54952446637.27.1788946899973;
        Wed, 09 Sep 2026 02:41:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:5481:b0:3d3:ae50:97ce with SMTP id adf61e73a8af0-3da3a217562mr54952385637.27.1788946899572;
        Wed, 09 Sep 2026 02:41:39 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm36414595c88.6.2026.09.09.02.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:41:39 -0700 (PDT)
Message-ID: <79fcd875-2b53-4938-8e8c-8c4c3a384989@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:11:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update ADSP firmware for qcs8300 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <a17c7a59-0711-44d1-997e-8973c4849590@oss.qualcomm.com>
 <wnsl2r4wkf5yhtxwwfethkszj3oxjkumcsal5czkztsei3cohg@frldhrx2wt4h>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <wnsl2r4wkf5yhtxwwfethkszj3oxjkumcsal5czkztsei3cohg@frldhrx2wt4h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfXyIqSwXlIkKMb
 mbPKtta6AWwj4KGrHXVyDZoHF2pH8sAjAMani7yVBsO6ygnWvcazlGSxZxzbrhHudZF+tC9k4tV
 ozURSlzkslxh6b8f6MKoL+U1sWqe8vB9byj8rbaEb8veFy59zmFjoRFR9CD8SqbaAND/eSO5c8k
 /QmdmiKHbjEJ4clSkdfb0XirXN+NMZAyHIMCwCpFvyBHbmmEwy+2+2zngnIzK3L7RV5GN9gCA6+
 okvxiE8nIlt3ApbQVVP7cZdTmMrqf80ZdorR/+6qukLY89cv4KT0cKJC65QijxZF4/br5rT22Sq
 frHbtiA83Dso1ocNxFRkMFvpOTfwQGeRsDlRdo69a1aKM2IILlEzU/mNAXCZgOjY3MTeEHGkwiW
 n2kZJBXr+MFsgpTvtrsCQB101gYpiDtEbshZzm6x9NpjkkMRo4W01sWxzcrdFw/8s/7T45njG5T
 lcgFAtGbeISvWDqf99A==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa129d4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=qvf3wFXFuW-mFknEdkYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: H3CY9AeLUF9TkZyxpcGnz45RkothQFnG
X-Proofpoint-ORIG-GUID: H3CY9AeLUF9TkZyxpcGnz45RkothQFnG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfX1fn8tUFLdQcK
 sRKxBNmuLG4IfjJXB6bvRObQzjflc3/rbgyWDu+LqI2XIvD+pMi4s3wijpJa7VK0Kq3Qnarpu0s
 oDZGhFUI05vK6G3VlSfb7YywZYUIm8o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090107



On 9/7/2026 5:29 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 07, 2026 at 04:18:17PM +0530, Saddam Patan wrote:
>> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
>>
>>    Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-monaco205
>>
>> for you to fetch changes up to 21c07e735653365e87e09b5cf2c288fc8bd48a5e:
>>
>>    qcom: Update ADSP firmware for qcs8300 platform (2026-09-07 16:14:15
>> +0530)
>>
>> ----------------------------------------------------------------
>> Saddam Patan (1):
>>        qcom: Update ADSP firmware for qcs8300 platform
> 
> I've opened [1] instead. Please ack it there or explain why it is a bad
> idea.
> 
> [1] https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1218

Acknowledged there. You can merge that there.
> 
>>
>>   WHENCE                |   2 +-
>>   qcom/qcs8300/adsp.mbn | Bin 6803456 -> 6844416 bytes
>>   2 files changed, 1 insertion(+), 1 deletion(-)
> 

