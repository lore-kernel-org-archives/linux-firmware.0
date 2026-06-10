Return-Path: <SRS0=nzoo=EG=oss.qualcomm.com=dishank.garg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C08CD8CB2
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Jun 2026 07:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63AA51F00898; Wed, 10 Jun 2026 07:33:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781076835;
	b=PwZ7GOFS9xhJnvOXg/ibtgF9elHF8VBHgfWBC1gxHGgP6vhjaZXc43a/nvL1TqwXcSki
	 dEOjmZdNSNJQ++PsDodD6Nx8VZ4WSv5Nh1buJSwUtUf8MQ2mYwtZ+WfAg14D/E49YjanO
	 vTlfrtvDDBxVAphQHuNBp6MuGQEa4dVQkBp98qXtmxOrKwityB/9eTuJqPDSeoK3RbFZm
	 LOUIUW+jpNDXufWCjmR0ekEJMyqOnhauVQ2S0mbwuaBkolmHtmnJU7Z7eYgp7Iu4/vxwg
	 dhlS7AlGSvb/Tc9XMzkqVy/sf4YfwFZJz8t74gDyvT+XMlxQcQBqKSm+5EhEkWZsjzg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781076835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kRgbH7SNd33MGmHip+kaGVu07qAvBZIGkUtFbFUNHHw=;
	b=HnZGlqFE2bgeDdBWnxwJMMAEfk9Qkxjx1Uw2pcnM8GRhEZj/Ieo0TEFSTCYtNPZrPjgc
	 GbQuZUIN9BiuN9eviBCIW2hqP/JDEwX01GcE7stnToeQHyqqKRVGWyAY7Ejk/TULEby98
	 tnCH1esuDfeIsTkXbqhzfo48RqIUyY5W8CiAFLJbNTqPezF1npGA4LcqtM4bgDZnmLETU
	 59mcD/Gexhrzz1mJVx83GBbjLMuXtIHj2UPfb+H/eTYsF6LCCMBZwyBuxsetnrWo8/4+r
	 Kbh01wJoY7n22/fhwtJhUrAsDfCJjJLAUC0L5nTmsstbg3YriIK7to/us64NhRhcVHQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oM2AisvG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b12PTe42;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3F831F00893
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 07:33:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oM2AisvG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b12PTe42
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B3F831F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2ehJM241139
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 07:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRgbH7SNd33MGmHip+kaGVu07qAvBZIGkUtFbFUNHHw=; b=oM2AisvGszUNZItN
	XizPxVkNcA8yKHDjTDqo4mNx3b7TCTk8P47McW1v+SkfQ/egays3JJ+8fBD2Qa1M
	UJBVGXYPXmficFb3Kr5jjxd33eheKFjtLGJfisiiexc4Ofz8F9j2A43PYm6/r6z/
	lcyEinK4z0TP+WKD5bTc23Z5VLn5snc1bQJVB1tSTf9Vd4eV93iHNptj32DR4VkN
	lKeq5lQ6+9mEKChk9FypcUbwHJFICr2C5rdDCfR+Xg8fAo/rLXvTZfvj+q6unAzG
	EX64zaAMvNeYfZudn9isf9x9WpYcySZ14Ie4QUfZo9Tst9BYYRQoge3rISfJvfDx
	EiJ9vQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epukestsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 07:33:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36db995d083so4630044a91.0
        for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781076832; x=1781681632; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRgbH7SNd33MGmHip+kaGVu07qAvBZIGkUtFbFUNHHw=;
        b=b12PTe427zi76YQ7Cbi2cbeG1lZ7reyEPpq3sC905MuWKAqnGW+iWNl7IkTwAw4OHa
         IvYKDUIVFVGIYVkua18m7gqw5V7dZnA9uuEk+d3hcXFqYuPIrI2Y8X8A5r6UhExL2d3P
         d2QhVza2sJ+om2oYAvEKbkerLL05jXeTqrOYYImeYRciCIvMAw/WguAQcDMdVUB8bpMI
         esUv3rX6jcqRxqgeULkKfFuO9hDrP+BJyIvNXiQXbtSeW6D1JdtFTJdIuB4tjV7VT0tY
         Vs7PqTzZnIIrg00Izjk49dttxkWDBHlPn1J3qHtq1w98DPbMp6aoqyjLoZa8FSJuK/9s
         i7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781076832; x=1781681632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRgbH7SNd33MGmHip+kaGVu07qAvBZIGkUtFbFUNHHw=;
        b=mfVizrr4iviFOlX4GmecAmoD7xzOEjLwnL4XklPkMps5/rzNRFdOZOY+iGLWDuS1o5
         f3iY/u0+fP1ZkoiNhWuilrpVV1gyI75g6OUNhnL5VPwpUleNv2AJDWA2jUG0syEqx5nW
         5rAB/3f++1dwhLSYzanLfXZ8u7UB+m6d/YNw3QDGtx5Ln/pi5+z1i3Md4O5pmufxr9ZZ
         VjUfPHgrrLkjAUMpQxX5fEgsCdlorLlQqVWOJ5cLWB+9s8CGBBeP0yajyJgmIf/AY1+A
         HZMX8Igx00ZzHTZSjhcfHReO9vlzjCPseN8wfotfKd4I+rI+Qfsjm0jIA0wy7hkCkaLY
         JEPA==
X-Gm-Message-State: AOJu0YyxkeQPSYLnOBeRO5opSVvGpGayovUi2az11Avc7YsXkOye9R4U
	PoqiXu2Uim3v1pRafK9xf1KxVjxN0qbeBH6+fo+rYXuGYos9Ph+Gd/eQzeQ1XDMcrQRJBTZ4AFa
	MoROluyC6Ba5OOX7a06QxlmQEwONPaiza/eCPCOyeI6cL5OLwHoZVr8IJN7eizHI=
X-Gm-Gg: Acq92OECfNROGbWSTPW3fdH5gIsJWGKw0hVoP9rqTd1z4yiO7DF9ZYSQQN7gZXGir4l
	TVrwLp3/tSrGh0rRpLebmH57elaFARwBsAc8rDQNgHpkstTz9z/VyuSvrGEOIC/7bGyvVVaU5vM
	QOpVzKnnc+wQLXmbqJcQp18GI6PIkQxLBFVi1CZ8sf9Y4d5CsYJiFDacmbhQbKUb1dS6SxLGt/h
	SNdHJSXZVwh3ZI78oLSPiWymENbl33vMUhZ4Q19pOsnaPf/Gp/+fyk0bGOxeEc/TycyzXyWxgX8
	itj0fTne2zg1N7HHLdyC1X7fFIloTs8YOTGU1Kgm/MZiRvm3/1M1AZ563pMIQp6BtdZdli16NDg
	vIVOi9ZhKmkKXoCoAEDk7Z8Pczoy+E9gu5GzwaPBCAB6oDeRJ9Tq10Tcy/Fo=
X-Received: by 2002:a17:90b:4b91:b0:36d:5dbe:2a0d with SMTP id 98e67ed59e1d1-370eeff5d43mr26743455a91.7.1781076832394;
        Wed, 10 Jun 2026 00:33:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4b91:b0:36d:5dbe:2a0d with SMTP id 98e67ed59e1d1-370eeff5d43mr26743432a91.7.1781076831900;
        Wed, 10 Jun 2026 00:33:51 -0700 (PDT)
Received: from [10.219.1.97] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376212812ffsm1842779a91.3.2026.06.10.00.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 00:33:51 -0700 (PDT)
Message-ID: <a2f30968-d28e-4a02-9ba6-9e88afbb123d@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:03:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] QCA: Update Bluetooth WCN6856 firmware 2.1.0-00666 to
 2.1.0-00669
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hbandi@qti.qualcomm.com, dbaryshkov@gmail.com,
        mohamull@qti.qualcomm.com, samana@qti.qualcomm.com,
        ysiddu@qti.qualcomm.com, dishgarg@qti.qualcomm.com,
        harsnaga@qti.qualcomm.com
References: <fd56f9ec-cda5-4d04-8eb2-d25016a476be@oss.qualcomm.com>
 <pppnkufmaqg3zcfv2fbxox6mklo674q2lfwyoxbi3blvvwzrax@a6q2zszdnby7>
Content-Language: en-US
From: Dishank Garg <dishank.garg@oss.qualcomm.com>
In-Reply-To: <pppnkufmaqg3zcfv2fbxox6mklo674q2lfwyoxbi3blvvwzrax@a6q2zszdnby7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3MCBTYWx0ZWRfX7R3/XMNEYQWa
 QzSIm3pXdodx6gTJA2AaJfYhwNw8ppXHQq8FSnCkxLWrkSg4ogX+aBIkmZLsC2tzkvZNFLl1AyF
 VNo6PbicOnh3NMvTBXU8asYyRbDRx82BLdYgLY58G8ksyRSnjN37YfLddG0cKTt5eX3zt9OfkOU
 EdHNAi7i7Zc67Z/DztMU7tuhvrWraAJiZcl2vxO4hsi/8GKeD7wQTuCRhCOu6XB0Ncb4/n33y9D
 jTuv7IDjtqLsj61iKnbeyi9z9kD9eWqaVacdWCFUBV08hm1BhR5aSEAE8QCRdCExcFcXDqUUKn3
 2in1xu9w9IPgBU6v7ZKeWCbTgxG4zSf1lRiYt+Msy7XOMUQGKgs80QhOrb9230FQ8r9CN8TshOt
 1wTFVQX0lqFApqAjz4gKkbiNOHdJYiAQYJGeFXVa7bZc/Q3z9uF9eyiMjYu97BbJXluNE4tURWp
 bevhhO8sxvrUtuS/ayg==
X-Proofpoint-ORIG-GUID: 7w1ztCdFS9OVNczgycQoqlLGbUNZDG0_
X-Proofpoint-GUID: 7w1ztCdFS9OVNczgycQoqlLGbUNZDG0_
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a291361 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=p0WdMEafAAAA:8 a=poUWKDKcYdAOiLx6MrwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100070

Hi, Dmitry
Sure Will take care of it.

Thanks,
Dishank Garg

On 6/10/2026 3:15 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 02:54:57PM +0530, Dishank Garg wrote:
>> Hi linux-firmware maintainers,
>>
>> Here's a pull request for Bluetooth Firmware. Please let us know if any
>> issue is there.
>>
>> The following changes since commit e9504bffad1f551d4e251f5fe184a16d86b3bb9d:
>>
>>    Merge branch 'robot/pr-0-1780891185' into 'main' (2026-06-08 05:40:10
>> +0000)
>>
>> are available in the Git repository at:
>>
>> https://gitlab.com/dishankgargoss/linux-firmware.git HEAD
> For the sake of the archive: thanks, merged and pushed out,
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1086
>
> If you open MR at the gitlab (which is appreciated), you don't have to
> send the email to linux-firmware@, we are getting the notifications.
>
