Return-Path: <SRS0=YJdV=AH=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49281E83054
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Feb 2026 05:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10B4DC16AAE; Tue,  3 Feb 2026 05:41:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9923C116D0
	for <linux-firmware@kernel.org>; Tue,  3 Feb 2026 05:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9923C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JIqQU3459143
	for <linux-firmware@kernel.org>; Tue, 3 Feb 2026 05:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5lC4sHElh6rbWdKkTmNfk93hFiMG9uZDk1VpYuSoOTw=; b=Nk9qYvu3RMuRlYRm
	Bo7AelGM/08r5AQvcJhmoWSsFeh96Zy3vzDuQTyUJ59815hW+JsR6xY4qJnurSV9
	NJh+Asv9/DjMia9Hf8tfJL0810Yg0ajEgiPoc5t2Jq3IdaJOs/HLhTER9wqP48eo
	o4Svp9N4b/e060bMaEGd2SvolAnVb98ohcTPjA24Qx+SAv5f/wIEfzZ9pM80qTcU
	Z6984r9IWZi6ijh0GiQMQQJDqJCcUMSHyRVKHRDyF0xtUYBBE7m75v/CIA4uR1BA
	2H8iMdiY4fVWy8SD75UFxp0IXFIQQ0MGCD7DpqwGRBh+0gr5gQm6ZFGt1V2DPjLg
	EMvngg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbk0je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Feb 2026 05:41:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c5539b9adbcso10812927a12.3
        for <linux-firmware@kernel.org>; Mon, 02 Feb 2026 21:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097271; x=1770702071; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5lC4sHElh6rbWdKkTmNfk93hFiMG9uZDk1VpYuSoOTw=;
        b=GnuEpovDyDmtYpfJoFZPeBG/H4BHDfhRtqUny3F7hToqIh1nZdRv+dGP5mkah0c6nh
         odiAtFmpsl0jSNRQmtSQqafooT54vlkVUShrgNhpQIf1ZL0HwGGygCTDYf3VPD54cDjK
         3Y4WhagoC6KfsfJ1n+O+qtP/9fsg2LlAtMQqkbqkLiilf09DIYQRqR/9VaZtUv7LfSG6
         pJERdxxZcwaRMyOZ/JODea0dHXtTWkCpZmz6H5jkj8LOxV1MT/2jFojFTQTadZpEFF3H
         2rFHQRv1tS1051xHkFUHlOb6r9tKk+JGGNawrAMzYwypZM+CotNTM7KzBpzgC+tdvbSG
         nl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097271; x=1770702071;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lC4sHElh6rbWdKkTmNfk93hFiMG9uZDk1VpYuSoOTw=;
        b=ijwReEanHBYSDsd255EY6ZsX3UL/DshU49v29W/S5ylCDgxTZcg0CM5Q4PxOnhdQFu
         nf2p40bB5TeEXg/jRTzT7aCm53pfkYQil37SCqg85HJDAKjQqIILUbGzmljqsMGnO5lc
         gFJg6syzxcXUwJk/v/T7NZuE216uK01WU9CZrHOWT0wJNVd3Cu2cv1PKIb65/1Tj/g1C
         hb/WcyWX4HYgIgZF3SlMxq2uD6XNUy154Bd2yjkjXUOHBvt43asDysNs0A2s3Gdr1M9B
         py1YoW20xzkE2cZpCHJ15i2SMZphkaK2wdROdWYfAzHeRQRm4ty7lbXYjEGtkHwsQRql
         4GBw==
X-Gm-Message-State: AOJu0YwGisj4AfI0Hy6/TRgDGDQZA8iRpcSSoaxfK4+vgro4RWHoeAxC
	iuDLBsC5ymJGIh10CO+BPflww7aA5sIkSkaBwWXnb8nk5U8eKz3qv4epGq+inQvoySzDDrb/g39
	j44RmEK27CHCSGfgvWifvY/9zK/gsW8uM65XlfOJ8H0Lcl2CxcJJcb3gTJVnUMupPCZdzyqo=
X-Gm-Gg: AZuq6aLKJrdg1KQEgRV4rjlR8/0u+MiOrOn2fVqArwxxz1nyQeB4i7FefLDJhWBBx9n
	8uxIK6iwDaFjAaxE56IqDbe4lb6l3/irktNR8fyv1wYUewd1kQ202neUpCk2MoFpH9C6IALu9I+
	mgh9ooLGlIpVtmY6TBp9d9K8Q9pHO+BACyruVfcvLlljXtqHyarOBL0VW3okHQD145I212IUQlO
	2QAu9V87y2/X4QHPMh2TcsUuhafjHQI0x7/8Mj2EYYNCcLkEIuJ4lCex/cyAd5d17AcQaNu48q+
	bJdz0DrZhpIFy+wExm8Ajte5ZRCOfIFFpFfyNRaKZr7WctNuuiuS8Ej0Gs9z+Yvke0s9fcYgBNX
	ebcL+PrHv8PjfAGLQJyjjyrZ+8QFy/U+sLo9moZTX
X-Received: by 2002:a05:6a21:9993:b0:389:8f3f:50d0 with SMTP id adf61e73a8af0-392e016ca4cmr11419118637.60.1770097271212;
        Mon, 02 Feb 2026 21:41:11 -0800 (PST)
X-Received: by 2002:a05:6a21:9993:b0:389:8f3f:50d0 with SMTP id adf61e73a8af0-392e016ca4cmr11419097637.60.1770097270655;
        Mon, 02 Feb 2026 21:41:10 -0800 (PST)
Received: from [10.206.100.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3547b1304a9sm606404a91.14.2026.02.02.21.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 21:41:09 -0800 (PST)
Message-ID: <c097dd43-f1ac-4e7e-b4ab-1a6f74193758@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:11:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Add ADSP firmware for glymur platform
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, dmitry.baryshkov@oss.qualcomm.com
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
References: <01d9e305-f4a0-42b7-ba22-5a9907577b8a@oss.qualcomm.com>
 <5b58bccf-ffa1-488b-bf6b-28e19b5fd5d4@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5b58bccf-ffa1-488b-bf6b-28e19b5fd5d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fccgzztZluJazn2cFRgjcGxnG4R742AK
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=69818a78 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=y0hHNGMWGZkkuLJjcr4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: fccgzztZluJazn2cFRgjcGxnG4R742AK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0MyBTYWx0ZWRfX3gynzuWOKODz
 6oFgluPqqDv9TqJKgcnTahOCZW8v8uekZBWehz+9y9VxyNw4/+MIM1jNZ3pvNNVl+bKYR07sArc
 VAjhJsaQfKlgXRaXTekfapbs/k+pLIe1NNHl04iSj6MyASa3geXJ1bK/ODDUsOrYHsZZRKQ5p0M
 gYQiqF0LfaS5zrXcL7s54ay/DXFyXdHzVhApQ+6j3FfwY4l9UCd563QcclQrVI0IEGn6Xe5V8fd
 TjywKov434d/x32XQ2h+184CY4FmMPFY1YIjjirDUQct8Cd+PQQfPMfVFgZXV/YMXDGeLKA8cpg
 KDhpujzNdWbV6Jnr/hOVV3GM+j5/GbuA53PGFJTYgNnsTNj5zQ/yNwHk0liI7TrOdEqrG57Ye3c
 9r3xPmAC2NM/AEoF9l0lCaFipUJGXQSO9W4+DkH84d2nHAmmXVWAZzzjnxAJKXPOWc3/mvY0LpI
 RaME/wy+y3w+0dtxnlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030043

Hi,

Internal testing for below patch is completed. Please help review below 
patch.

Thanks,
Saddam.

On 1/29/2026 3:49 PM, Saddam Patan wrote:
> HI ,
> 
> Please ignore this patch as internal testing is still pending and we 
> will update a new patch post validation.
> 
> 
> Thanks,
> Saddam.
> 
> On 1/29/2026 12:23 PM, Saddam Patan wrote:
>> The following changes since commit 
>> 0882248d05045565bfefe1f07cbfc22276c9f058:
>>
>>    Merge branch 'lenovo-ish-uspstream-clean' into 'main' (2026-01-23 
>> 19:26:31 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp- 
>> fw-glymur2
>>
>> for you to fetch changes up to 6b573904745830699030541b01003e6fd1ca294b:
>>
>>    qcom: add ADSP firmware for glymur platform (2026-01-29 12:15:54 
>> +0530)
>>
>> ----------------------------------------------------------------
>> Saddam Patan (1):
>>        qcom: add ADSP firmware for glymur platform
>>
>>   WHENCE                   |   6 ++++++
>>   qcom/glymur/adsp.mbn     | Bin 0 -> 18622472 bytes
>>   qcom/glymur/adsp_dtb.mbn | Bin 0 -> 7253 bytes
>>   qcom/glymur/adspr.jsn    |  22 ++++++++++++++++++++++
>>   qcom/glymur/adsps.jsn    |  22 ++++++++++++++++++++++
>>   qcom/glymur/adspua.jsn   |  29 +++++++++++++++++++++++++++++
>>   6 files changed, 79 insertions(+)
>>   create mode 100644 qcom/glymur/adsp.mbn
>>   create mode 100644 qcom/glymur/adsp_dtb.mbn
>>   create mode 100644 qcom/glymur/adspr.jsn
>>   create mode 100644 qcom/glymur/adsps.jsn
>>   create mode 100644 qcom/glymur/adspua.jsn
> 

