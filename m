Return-Path: <SRS0=p7bb=CB=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FE1CC6B00
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Apr 2026 05:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B050C2BCAF; Thu,  2 Apr 2026 05:47:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B23BAC19423
	for <linux-firmware@kernel.org>; Thu,  2 Apr 2026 05:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B23BAC19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4HuA1965355
	for <linux-firmware@kernel.org>; Thu, 2 Apr 2026 05:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qu7YFACwM9okzBUHazzZN4dfOKcTY5XDCg5TwikTepU=; b=JGqcY2VTzTJvJAsu
	h54w0ImLzk9GhveTXaZ3kbu1PBgOoj3Q9H+wYK3U/X21B5Jy6+4yUJqEwua66iyy
	OtjT9Rp00xSTn3XmAYef/h55GDbRKh6yOYHMJj/U9UOgkEsA/hmA2lKXC2YfNtgG
	QX9ggHyZ4HRAAkaCvEhzkA0kUizTGDz81nkmMNLPjYy4OsG4Pi4q3RjUoI6JtExq
	ha9ysSN0NH+vvSTX+k4hfFP1zUoPzSDu9mKk4KbOwxJShWBWfMlLcDOpOUNUztLP
	Ty0mf+L7wpLqLh3WRjiE03fFn94IDmS/rjE2RIilMsJeL0nEoVl7pRTZK+3egx59
	lrIlxA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h1d6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 02 Apr 2026 05:47:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0be75dfd4so5614405ad.1
        for <linux-firmware@kernel.org>; Wed, 01 Apr 2026 22:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775108850; x=1775713650; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qu7YFACwM9okzBUHazzZN4dfOKcTY5XDCg5TwikTepU=;
        b=HG33QbuAYtwCcF+hOJVpDsVWaVPKxZMV/jw0e3ohGY2oumI+XzBNZzSaTNah0J/wxX
         DkLByM8Wu5VGIZ/KxsZ+MGr9nRIBv2WcfWl3fnodqwLuNdLXz0Yt2ubetIOtQ89NXNNe
         ubaDhpDERpG9Mdb4zDD2jprp+ofmJ0TVTSntWSgFN0tuQCAAPDVP6PQzl1vNgLOMJrOz
         FJOGEj4YcCgzvhMUbTb65FaeRzg6+P5NDq3JgkovX3uAY4gjsCw6f2MKVOtNaCzUKPRB
         vpM3F7uVC2pMMAKWiOdA+bwrEBQbnZvkClNS2UiU1aTNCZ7OSQfnzdeOXTV+zPc/b9YG
         y3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108850; x=1775713650;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qu7YFACwM9okzBUHazzZN4dfOKcTY5XDCg5TwikTepU=;
        b=Sp6Eb0lANBfe8lBnLsLFMcIjl4J3vlZ2BFCydUbPTnXV8LZCeoZdmXsC9m6idofnke
         Lt5csIUg2sB9xzRQEfGCql0vE3bKRmcaplYLi8ly4g70KLEWlJo6EfMLKIdFTsRGU3hV
         PYSWEspmAKUo9+AZTdvSdZ9qS8cLAy4gYcz7e7idZo+bKUXzQtx1RvUgsblC3Q4sBr+5
         Iz5C+WDbctmZBlS9gQyKIYllnijmjrCNAYbuEAvS78YAd+zrx+A7LibUTJEI77Mq7vPq
         DmqcqiLv8owy+UnHkbcFpkrLjcXy2x0OdY2NrBR4USfq0dv09DQ44ZWfQ7BgVnaiKUco
         ML/w==
X-Forwarded-Encrypted: i=1; AJvYcCV9BDgU/uVwL/hmYSjI5E1doxxokZqB46CyU7NUU5fDmOZAcYKZXeMG1BSOHY6GC3wKp+uEGCv15kQ4MBR1Eg==@kernel.org
X-Gm-Message-State: AOJu0YzUtGauXtTWibCyojvcbfDp4496Tvexe+AxFcHgxVjY3iGhgfoB
	qK14MGp/YMeIDUGHAm2hjsVgPPnMnC47za5jKoKDhRGE1tfFvS2xRM3adOB1niMPEcWlYnB3Q+M
	xM9QxSZMh85BwtDOVgNwohZts8EXfAvfIJsN42xY4g2+EpjyOxqcl4tv2ibU8Z/E=
X-Gm-Gg: AeBDietBHSfJApOrV6QmaOk3e50Hng/KVLz+myUGSamffI0CCZGxMMQoLmeWVsMB5ly
	WuGeoYJMXRsxvZHp/ylJ4V8OcCtAEe1GefBQUA1ikGKr054aye1VbqboTjzFQ/UH8LOXOKYHQlX
	jQ95ip44XdUCTO3tW9290IVZjMp1veKl8tUHPEEp7Tfv1FbdeEwTrSvUfM9SPKrgzJRbZUl2ftn
	9repMBLGnnJS1Qy8Hsh5nEEt+LkgehlO+EcYgYgF1tDFyiruSgwL9V0JyWtgd3W8qckirMKuZk3
	mQE+EviaUVQk9gke39uBfvxAYbB5cLmffEeead+gUWIEnc85Czii+rUp7xmskrxF/7fTwjAGu6Y
	ITy8v/dRWIupqSVuKwhMOGqS1Bv6ghLKZQfDoKKb0qeV/QW34Cg==
X-Received: by 2002:a17:903:1b50:b0:2b0:b1e2:583 with SMTP id d9443c01a7336-2b269a9c89dmr67729095ad.2.1775108849825;
        Wed, 01 Apr 2026 22:47:29 -0700 (PDT)
X-Received: by 2002:a17:903:1b50:b0:2b0:b1e2:583 with SMTP id d9443c01a7336-2b269a9c89dmr67728735ad.2.1775108849299;
        Wed, 01 Apr 2026 22:47:29 -0700 (PDT)
Received: from [10.204.86.92] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbcafsm15824225ad.77.2026.04.01.22.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 22:47:28 -0700 (PDT)
Message-ID: <0e65a15d-099a-4716-a085-18a931eea090@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:17:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update ADSP firmware for sm8750 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>, linux-firmware@kernel.org,
        kssb@qti.qualcomm.com
References: <e115ca3c-33eb-41a5-95fb-42d5767d474e@oss.qualcomm.com>
 <cgn3jvjyutddglx46kvckd6frqkxvlnx3i6qrtzyr2jggqhuk7@tnfevwujk2zn>
 <0cd00caa-a626-4d77-96f4-232db9e5fef0@oss.qualcomm.com>
 <vzavddb4f3uvsqwbchcvkwqs5ddgsg5ffliufbocmnbs6xfmh4@4dj6lsufgn6i>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <vzavddb4f3uvsqwbchcvkwqs5ddgsg5ffliufbocmnbs6xfmh4@4dj6lsufgn6i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce02f2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=qC_FGOx9AAAA:8 a=I85nMPj-mlEaVSiBv6kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: kbE1M-uqN_VbJChFeAlvTPICMqwr60c2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA0OCBTYWx0ZWRfX3fDJbsbxp/QR
 JhnvDff1BzM6NYvx2Q6EKFyJhsvqBO9gzFnCQvxglKf4tEISxWjlUJz21Z+KZAnoX8vnihmgTlw
 6gcI0jotImHqSYhR9iBx/gAEYTQjL5xDEeuch0OVsZuxrceSf2XAYjfSZoXG296PWYFxWWmpNYl
 59l+Gb78FPvstyOePO31sYuUCQ8w0fMy/mq03kOWqlhNKDORSYvGnB4IJUPL3HDa+m+CUpZ8tZD
 ETI6wMkz123n24dWo+82L3ei9QVhPZXwwJTQZnsPDhjSegYeigBlVGO8/r8nLR6WJc+/I/VHJ0a
 lEr3NCYwWPHRaL/Q8YpIxHXPKpQPfvvb3tvCcNYHCFdEdGav5ejTW6yR0Ipn82nb4XPzAl4qe15
 YzQuAMPffce3SbmYN8Qo6VGr1iB0Donq9gDR0QmCSH7MEmcyFj309Nkfh2amsgU7McWO9a3y6Ty
 9wKCWHcmx5qjDny7p1w==
X-Proofpoint-GUID: kbE1M-uqN_VbJChFeAlvTPICMqwr60c2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020048



On 4/1/2026 2:51 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 11:09:38AM +0530, Venkata Kota wrote:
>>
>>
>> On 3/31/2026 8:19 PM, Dmitry Baryshkov wrote:
>>> On Tue, Mar 31, 2026 at 12:17:21PM +0530, Saddam Patan wrote:
>>>>
>>>> The following changes since commit 85786b4413fdc486e3bc0f4f6cfedce7802ed041:
>>>>
>>>>     Merge branch 'amd-staging' into 'main' (2026-03-27 17:22:24 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> dsp-fw-pakala_adsp_18
>>>>
>>>> for you to fetch changes up to 47fcef3409cea1043a33ae74ba1a98e55877eb09:
>>>>
>>>>     qcom: update ADSP firmware for sm8750 platform (2026-03-31 12:12:45 +0530)
>>>>
>>>> ----------------------------------------------------------------
>>>> Saddam Patan (1):
>>>>         qcom: update ADSP firmware for sm8750 platform
>>>
>>> Why is the new version lower than the older one?
>>>
>>> -Version: LPAIDSP.HT.1.2.c1-00450-PAKALA-2
>>> +Version: LPAIDSP.HT.1.1.c3-00018-PAKALA-3
>>
>> Internally, LPAIDSP Image team has created this branch to support all QLI
>> and Upstream on Pakala.
>> The earlier branch 1.2.c1 was being shared with other SPs and we cut this
>> branch to restrict code churn accordingly.
>> As far as 1.1.c3 is concerned we aligned with the original main branch
> 
> Well... Whatever happens, the version should not go backwards.
Noted. Will make a change and push
> 

