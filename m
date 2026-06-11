Return-Path: <SRS0=rQ2E=EH=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC365CD98CC
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Jun 2026 12:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3BAA1F00898; Thu, 11 Jun 2026 12:28:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781180896;
	b=F+oJrRXolM0roC0pn19LXKiZqAua3NBKcU2W5jlIHxwVV7ES4TcZtMsO5jH98z8Hfk9R
	 ExN7d2UqgSHvcU9+iYHgDykz548j6tO3Jybz6u8OoHDzmNsOj8jFCP9U5laLTGBjEupkW
	 yibAAUwSRn+LkHrFlrYm/6Npq5TJW1qoDU9mRUuyw7u4C0hIxLu8apO+VJrQk//IjCMtB
	 Bt/IHgcUCTcwS9KLG+6Mpuvdj36mw2zoyh9w/6te45ZjsaZNb3FomYNjjzo1qAawEW4ol
	 eDnfcRw0bK3GZGsSap58NwWfA/XhVLIiyxg6qpI1q5DVC66HBJyrSxZGrQd9/SD5rpw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781180896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9ITov0tzXkfzk2f8dbbtzjop9oDH8DYyeGfIwmHizOE=;
	b=iN95vvpZaDiuzPYa/OCsTx+EccaW4uiUhgV8rDFDireFxHYfoCxaePia36f5JzqMEL/e
	 xxzntETLRe/+SqBjAJSPcej1tlEJbpecgVJB0LFQRvfCv2qMpAEC+SqFTdovZoWEY94W/
	 Ub8IeevdFx5Mp2bZ7yt/+62gVPTSVEfc8BSsxvi5lJmBYqtW3FE0B8k17PB8Tkp8Hk6y6
	 7x2lLPhO+1BNGYZ5d3Y+FZZ3NE8hbd2HVlgthv9dSJLMeGOLJFfRxzkEehOadM49NhKGB
	 qngDyW5USmqKTRoDrPvJMAujYvX6NLV+T6TMv0WRxNAXZifF8oNnEXoN+r1R2LLyFXQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aiGLsTx6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXgedQ1p;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02B951F00893
	for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 12:28:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aiGLsTx6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXgedQ1p
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 02B951F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xqBM214491
	for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 12:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ITov0tzXkfzk2f8dbbtzjop9oDH8DYyeGfIwmHizOE=; b=aiGLsTx6wdpei4V8
	O4mL5Jm8W+G8CiPwlt9YzzObcx2i04tJGTpcIIiCCBbJVM/NEdkCm3+AJmDTzfPB
	VydS24MAIi+7T/ei1e8bzfKHYqfnHWta26WbCB0sccBU1+aEq/RLztM7NxB0Y2d5
	+8onKm1QfqqiQwMjvM56zYRQdVJ+IgeHBVkD4TAzuJ9wNrnInjH0Ig5xttSeO+1W
	qVfQrRi0byQQtts8RKK/jr1GsUeH8oC75wSUJzrprDWyro06ua1UMHgJlxSRtQTE
	4t0ePEjscQSvMEG2FhpieFIM9OO9l61vobfXm/tomSfRhlVzfI7Midua9W0eJHKL
	QxvU7g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6skej4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 12:28:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a366b61fso4565125a12.3
        for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 05:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781180894; x=1781785694; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ITov0tzXkfzk2f8dbbtzjop9oDH8DYyeGfIwmHizOE=;
        b=NXgedQ1pTv3I8HmbfZvZ//c2ZKJwXuUS4z5jg7H8qzGqfky0CLZAxQjTquExIv5Qck
         8S0aTzPeCo/uhOpfQ7UDF/LKuDElDs6km0iEBDKgIuO0Fxy8VDp2F/NahsRxzNeCrnE+
         wKjgAmIC5Rad2zlUoprfjrZi8N5bGql/cBoEi0NVDvLKU1N0HcUmiIc3WUnjLcPQWiZm
         ngRlcZi7m65Mac8k9Hl+C16ABNZFDJYXcZJj9ScmSJcNo801D2rI/m+8DbhjrIrZzXTv
         fY/8gb8WEbXUQ3wmhZoPzIOJ77TkDbSmPkbvOHeBJNAr4EAqZ9H3SiTTgp56pO1f0oZf
         BXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180894; x=1781785694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ITov0tzXkfzk2f8dbbtzjop9oDH8DYyeGfIwmHizOE=;
        b=Sw284ycLvP/7/QnUWn9wuTODYP+fxPbwYjHpeTth9xAa5HpNyIuSLT9p3XRb9pjNWi
         7MHFCnvHghKmwYJrMSNpFwU4fIw9Va1IzNeKyy1JBO6XZPxPzpghHSim8yv3ERlcOt82
         i20s8hnNs4GbGvY2/mXOUJ6PXaGvMz0ZesNh7qiao7H2or8+kGKFqKlfbfIsV/SFZy7I
         3HoC2GLOdLP1LUusCuqcJ928suv+ShpY+3voGR84zmVgen9SeX/bwwecjpVDbON+1jwy
         5jKWkgCiVCBtQqf0jOUq03zCFpNY8NOP1flTZwcvapfumF1JDdC72aS29nrTREjGTGZ+
         b1TQ==
X-Gm-Message-State: AOJu0YyWmwb4yVkq01lMS1qppbRgOPckO6kLanvCmSH8ES6Sb2SQsFJs
	hqjjN/70uxjSmAdqysRPpbqzkNvr/M8ihHfFkQqpClVmKYqEVq054r8IeWntJv2Tlc14lKQ+fPy
	HGajDgc0XiuHgpQTYLvpUehgtVH0PqUeJBPUk2QL2OLKsIsayCtuuOD9e35KOVJQJ3e32EJA=
X-Gm-Gg: Acq92OHv7hftoDD6QO9nroDLV6VsXOTs4drpBoZPdjyP5GiwP2A5CLpDRJ/J78/PSKm
	QzEo8gmq3hWyvbPAEhBqhpZ9VUj0ArcuZdtzp0xtsdCPOlXr+vCEI/jUcJ7afIf3cFBB0VyOL83
	/S13NnRdUZzN2A5JpxXwsszRAdbg6CCwglCIRIf0M63anI/9jwgsIDwEGqdyYA7nHYqirMiuDwf
	oqvqh3/kootm7c01TBFr/+l4nTq/8oUQzsdkZAlcfSpLDb6IPULiWumm4poOmC72YQBXVTfWF/k
	FckHZTNiyIBPnHffNUr6gIffzo1B3tTexgqsDyYsF4Z1SUm3YSCdun/3zBqwlRBL1XbheRDSjHk
	v7uoKKBF3WFvsH3wL4+RUiEq0GP1wqK9LTK6tfr7F8Z1AQdS6DGINJjsu3Wpd/Q==
X-Received: by 2002:a05:6a21:a394:b0:3b5:52b4:87a7 with SMTP id adf61e73a8af0-3b5e312f41dmr3076488637.6.1781180893845;
        Thu, 11 Jun 2026 05:28:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:a394:b0:3b5:52b4:87a7 with SMTP id adf61e73a8af0-3b5e312f41dmr3076445637.6.1781180893352;
        Thu, 11 Jun 2026 05:28:13 -0700 (PDT)
Received: from [10.216.44.111] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8658811b30sm1655735a12.25.2026.06.11.05.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:28:13 -0700 (PDT)
Message-ID: <2058ea0a-1a06-4810-a564-e7ad6ab0ccde@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 17:58:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update ADSP firmware for Glymur platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <cd48d687-d403-4b40-b23c-8eb3d4f5708e@oss.qualcomm.com>
 <CAO9ioeVpdtrrp54wdFsk4AEoMzvFsPYJWgN8+nDdwFiAJaUt3Q@mail.gmail.com>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <CAO9ioeVpdtrrp54wdFsk4AEoMzvFsPYJWgN8+nDdwFiAJaUt3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2aa9de cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=paJJ_crR07ZMNDLcmn8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: S3Jhya79UmueVD473HGn91Xv2QAZsayg
X-Proofpoint-GUID: S3Jhya79UmueVD473HGn91Xv2QAZsayg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX4v16oEsGsVQ8
 NCY6vkdHO/4A4qoe7KBQfz5VYHaEwILQ73sVEANf/CcQU4Kt9iWB0w/B1BWsfK/9aI3val2BWkr
 RTNBlgaS5ZfI7KWx5eUavIdWY+a3N8KIojIpEdF9ksKU+7hnWgXK3JOd9RU2NGFIrIC3//nkx8x
 4kRcJTLhGkqDEvFRq9E5JW2TMFchu80iu0cge3GD/ig58bXUF38qGrca50KBODIegJDpeDmN2dZ
 /9SiwzZcIwygA/zz6lmfQitJgtyDzYtS+vR7PU1JUXjVomv7+tV4caVlG9vmHLYni0YE0Lfry1Y
 9PyhKEUOhki/eipJ/BAfrYvDZfgtSH4k9kdsr6Fft2p5nPcWB5bS6GX3CZvfdC0auZkt9zMQIvh
 bEwIFIAuxutM4r2/NxavaMBns8+XqNy8RPfhbPOYp6fQp64mucMhhMZFSIxDh44qZB3kIWGlE7+
 0ZLIwBbkt8FXxSMxGdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX1tve2H148c1i
 98MSDotrBOZz4kkag3QAqQiINrNNgzEs2zU0K6YxUr7YWX/QlMgKeI7xB8haDcG+SfmuHmmXPOt
 4Wr15ZHIN2asyWe9xibLWpiym+ciRXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110125



On 6/10/2026 4:20 PM, Dmitry Baryshkov wrote:
> On Wed, 10 Jun 2026 at 12:18, Venkata Kota
> <venkata.kota@oss.qualcomm.com> wrote:
>>
>> The following changes since commit b672962ed4ea6f9de52bc7bf9e04e96585eb512d:
>>
>>     Merge branch 'superm1/unknown-license' into 'main' (2026-06-09
>> 19:38:15 +0000)
>>
>> are available in the Git repository at:
>>
>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dspfw-qli-glymur
>>
>> for you to fetch changes up to 2cc69912d8d7eecaf0be8e19baeedf3fd163b94e:
>>
>>     qcom: Update ADSP firmware for Glymur platform (2026-06-10 14:46:03
>> +0530)
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>         qcom: Update ADSP firmware for Glymur platform
>>
>>    WHENCE                   |   2 +-
>>    qcom/glymur/adsp.mbn     | Bin 17049560 -> 17053656 bytes
>>    qcom/glymur/adsp_dtb.mbn | Bin 225080 -> 225080 bytes
>>    3 files changed, 1 insertion(+), 1 deletion(-)
> 
> I merged the previous version of the pull request. If there is
> anything to be fixed, please send the fix.
> 
> BTW: Is there a chance you can start using gitlab directly instead of
> sending the pull requests by email?

Thank you.
We were not able to get this done. IT team was busy back then and now we 
got busy. Will start another conversation with them on this.

> 

