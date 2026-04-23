Return-Path: <SRS0=a3Dy=CW=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA212F99360
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Apr 2026 09:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD311C2BCB2; Thu, 23 Apr 2026 09:22:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5749C2BCAF
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5749C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u22C366232
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7wwt5eTgDrYVMhV9UXbeH0FYYVPwsjmLU33yMqtWa0=; b=bt0ysVM1ujtOTYMK
	r8H3hc2JW2TXt6L+Fl8XFdcRLNaJZxp03J6+6RZZ60N/iSN7T5wc5ugvmIkUzNH7
	PBK5L9TMXXTCaDt+Md9v5fa2klYTI2+CGxEebT53alt5xZYBC8ZJXk4w0PtPlk7t
	erIQk2SUijoHVFbUL/7LRflJLM0+W0f3I98JHlov1kk9LhEi6tAqfHZrrI4h6k/c
	Fetrjues6GOQdoF6oBjoKw++BTFeixZU1nsbdDP0sCV6LWtfjt1bwel1PCCqATkk
	tHTPJx2pTsjhRj1FG6VnXn4puNeVjPH+KEJc/JYUa4WeGgP/G2WPGw6+SuAS3akO
	TTb9mQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rar0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:22:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242062308so117399035ad.2
        for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 02:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776936146; x=1777540946; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c7wwt5eTgDrYVMhV9UXbeH0FYYVPwsjmLU33yMqtWa0=;
        b=SrAcGTN6r7K/33/l11KmuCIV2F7fZqp8x8VWl8RyOtG05JciCiWsHGKKBHBujMGDVZ
         hFuiLj9fCnpGKof3aafzCbUhsmU7fdk03gJO1/xSs2owJ3Ua27WbxCg+YDXASqAPvuQf
         fSrGsyW0w+e4wnv50qqvd+gbfpbRjmltiw+rYlJmgjJLjsttfzlLCwC2npT+4aAb+7dr
         diRKT7HH1WOWDWSYDD93UmZukDlTvN0JTTBftAAtIo0Ytr3925rfghp8eZYs5pwt52sD
         DXY7cRhI9y4WRNMsGMlPwD/yuUoLAGEx+KUKECOp5zmjXyjllnNNf3CtD1X0nJi4R1cj
         AIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936146; x=1777540946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7wwt5eTgDrYVMhV9UXbeH0FYYVPwsjmLU33yMqtWa0=;
        b=P5kH0Fc5PoS/ag5zAtHOI80dq2idXtEwByE9gQyDhXbPxkNqwHsyXR7Z0HgyLlHEWy
         Fhu36Niuvke96EyRjWNfMUrun3ZLvD6u4uQGxuIviRCBNEvLuY6kDw1qn1+KW73liQ/y
         fTZQe4YWbDr8CHNTFpamSCT1o4vqAe1fhGWzssBt/G0624UOkt7xhL2QuLJDD9ObTx18
         rZ6hr0ZfkXlXmebCMOzL7SABx2sTaPepK5nzXeu5tVtQKc81t2johoF5H3i9RRy0vESa
         JMjw9WkKhbqZcjw5orpYIxddHjriCMWhy3aaJubBtinRjJRM6N9ARv4JGRUvw3h6yUh9
         rM2A==
X-Gm-Message-State: AOJu0Yw7vhawE32T7W25/1npdrOdMCbSpB1TK49DKOkYlPTL0k4Ue44I
	jWqIWIFJ3T7vk7w9ueBHyVuBeav8BrgzXAvWiABy5F3jp+3M/+OXyE6m1M0jtDAI/y3WSkHgLv/
	ws3tqCvT0dGD4cJ9/vwXPJuSNo2Bl7yLmh4v5q3Elx2fbHHnUqCB8ts5wDnXGA08=
X-Gm-Gg: AeBDievHcvKm5iUwXtIQUJafUqS47vt0HRwbilrEBh9vN3rnigeU/DO7PS4ATPgv+fu
	6Hbl07z5KsPKG7BDRccnsDBy7xdhFHiKk35BJA4gXMdietihhZrvgNe355hN38dcrD0ityRACjM
	AJ9k9ldNLbu1WJngMI/4ZnvWhhFqgjs2QrlvVtTQXIUNCfE5czL/mDWRkD+rGDBT7/7Dyl1LDmj
	b7tguaA7fLKbDou+wlvBfEoZ4GSwqz4nu6B03nt4LBNM2ptaGQTvT4C98FDprxZQv8vaF8xahBK
	usfY9IguRB81ekZhdPyZ8dK2OITPDJsphkEVBf46PPOiUdqZox8VN0IcxCkhIKi2e3opyy/c+0Y
	CH7kU5d3JQGW1jKIJ5Q8h2QLEJ+foKpxXZ40M+r5UJFgmET18q8Fs8ChacgyCiw==
X-Received: by 2002:a17:902:f70e:b0:2b5:ef7f:a47b with SMTP id d9443c01a7336-2b5f9f4e150mr297269435ad.21.1776936146473;
        Thu, 23 Apr 2026 02:22:26 -0700 (PDT)
X-Received: by 2002:a17:902:f70e:b0:2b5:ef7f:a47b with SMTP id d9443c01a7336-2b5f9f4e150mr297269145ad.21.1776936146008;
        Thu, 23 Apr 2026 02:22:26 -0700 (PDT)
Received: from [10.216.23.234] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff409sm239134955ad.14.2026.04.23.02.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:22:23 -0700 (PDT)
Message-ID: <90e0e8ba-7d68-444d-9a0f-c3bcf9fda212@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:52:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update ADSP firmware for Glymur platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>
References: <a53ffa62-1501-4225-b864-cdb1788beb67@oss.qualcomm.com>
 <CAO9ioeV_uqq2dKafV+XZAEgjV5sN_jk_r3s6aR=SMju1rpmQdw@mail.gmail.com>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <CAO9ioeV_uqq2dKafV+XZAEgjV5sN_jk_r3s6aR=SMju1rpmQdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5MSBTYWx0ZWRfX8KA9MkHipR0m
 vIyJn3KX2sPZ8O8NRBk7FbPPj20BhnDqLuuyqE8hUrIBEOjTERS4a+elty3rxYQ2pFtgzrSUE3D
 bGbhQAGZE0cLJjq0bbf2ObOUgATE9zLxUqKOzU5FFon+XQ4SlqfVK/qcoPmymwsO9ff6p76tNvH
 ABxGRk56HvcQXrd/1dwb9VJhJhkhrNP742wwYFrx0XW6jYNp0z8OIGXQUpd6y2X3+RCW4PVr4rm
 BWsIVPz+oxeB3XQXz69ViEGaawaM7I+tgPGbmgYIuLXN/mZaBnZ4afzCxF9kmKAfi/ezsegKwY9
 r2WisFcCuDr8aex11zHvWGZiXKRZXvxYE5bopuRJ/720AqhNnfzP5PmYMFB/EH62wVKCk/8z7Vt
 CT5U31oz1nNTbxsGjQBOH72YGMN2zNHSuItQSR/bCGQ0VIuOG1pCEzQ12IVrq3zYVpRFGVzTkkW
 fl1HF2VPO7jGK9KLnGg==
X-Proofpoint-ORIG-GUID: EaH4TE7Jw3Ao-n8gbUmqf3v5ERhKCuOu
X-Proofpoint-GUID: EaH4TE7Jw3Ao-n8gbUmqf3v5ERhKCuOu
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e9e4d3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=LGp3kRicbL1lL48o6f8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230091



On 4/23/2026 2:38 PM, Dmitry Baryshkov wrote:
> On Thu, 23 Apr 2026 at 09:51, Venkata Kota
> <venkata.kota@oss.qualcomm.com> wrote:
>>
>> The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:
>>
>>     Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)
>>
>> are available in the Git repository at:
>>
>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dspfw-qli-glymur
>>
>> for you to fetch changes up to 4a74616a3522816f6f33297219f9f27cfa4e3268:
>>
>>     qcom: Update ADSP firmware for Glymur platform (2026-04-23 12:18:50
>> +0530)
> 
> You forgot to push the tree to the repo
<ACK> Thank you for pointing out. Done now Please check
> 
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>         qcom: Update ADSP firmware for Glymur platform
>>
>>    WHENCE                   |   2 +-
>>    qcom/glymur/adsp.mbn     | Bin 18622472 -> 17049560 bytes
>>    qcom/glymur/adsp_dtb.mbn | Bin 233272 -> 225080 bytes
>>    3 files changed, 1 insertion(+), 1 deletion(-)
> 
> 
> 

