Return-Path: <SRS0=WwDY=7R=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B282AD2502F
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jan 2026 05:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7260FC19423; Mon, 12 Jan 2026 05:48:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EA93C116D0
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 05:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8EA93C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNAhW44176567
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 05:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wLdCheBS/o25CcYY+V5THXF5qJQWvR+81azpKrfJCs=; b=DLqOYwDzaz7T+MC1
	1UONjo8ILCfUau390zbbgCeCTYkkB6VHY4aXnqww2di/D2Z1u6UrqAHhE4lzxIXN
	wXDIBKgDG4cFbiiZgqb4PWUyipWf8ivXW5qNZhKwjlM6FgkS/BmGmXAzhjnx3aZ8
	HUmBNmYm0s6qa+KYQIDKwhbZfdv+RaWmGJoI9ieYyOxJSshU/vUfl3x0yatYBLvi
	x+fc0BVgKDk7lqec2hdpqRiC7U7dml7IC/50ZD4iCh6wAZD7IISPniveTnZIAOQm
	aq1UfFIViO2gp8D/iYmCK4trourZ+lx1rzidbB58bwJTkKX3hcGzSse+f4aK3Q2T
	9BgPZA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu3qd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 05:48:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34e70e2e363so7341521a91.1
        for <linux-firmware@kernel.org>; Sun, 11 Jan 2026 21:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768196912; x=1768801712; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9wLdCheBS/o25CcYY+V5THXF5qJQWvR+81azpKrfJCs=;
        b=Os1QQgNeD4vJLW1OGuPG6SgzhuMOdBazvYRr7YPLfxH8oFnxoM+61Ze2Jvg2DLliQF
         95E3bByYH8K3t19tu7TUaqPCVlY8ZU6qzEWCk6YLjejGr/LLRdJV90kIZR0xNQMe+pj2
         o0Gyi5zEi4UggUXLQMKkFVxiJV1TxnOrIhupg7ltUHI0i97bO1FJkS9rvSCz/uChGJqP
         llGt21UqT8QLongvY1yTUlyeMcLI3vZLfVGm8K66L2WU9JkU+tmPsfnSG2xGCSBZ9Gya
         AzFLmyIV63jHtyajf7Y2hgoiWcKzf5/KRBjLeaYNGgCxIxSNxu6yIJooAtQPnaOAJTl4
         8nyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768196912; x=1768801712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wLdCheBS/o25CcYY+V5THXF5qJQWvR+81azpKrfJCs=;
        b=OQ5njl3Bda7wvYyd6f4YXXRtZS8lIyJb5AbDaVzWR0JlPaWzCC0NkQzTeyOAbwNhti
         w4opfiw5CKl8rCJO7ZWP2YQtwaRSfjeDITlKb39F7pgqKMfjV3mQ5OT0CPoI9PdtFFVb
         J351feGyP0g+bt+gP1Bretht5h2p+CpnhGYbQnss7O67cSS5lvlsW8PKu5WwCcDHr/hp
         gh1fh3hq9ERZvc+KQl+aUE9/S+E4M9kO4VDXhfoRDt/2qtHoiiSvP7e58Pl+m8yB5qzi
         eAlq0SkA0h+Y8gIsHCuF00gKAGWwWHLYATGwqUeYBLr6GjPi/V8BqQNG0lJSETTZ40ys
         dcvA==
X-Gm-Message-State: AOJu0YyjfB0rOX/DaveUG888SYpvSHp4ZPGnw8OeusGTvGXF0IhrVhOV
	2DnydJaaJbJXuLPyKF0c2r8Z/HVRGt5JQoWhZOanlPzg+N14rIDXHDcgoBQG+bP91OK+Bw+Id/Z
	udrKOoA9g+1iUagy2b4Aw4uKyqUawTSl07jSXPPyyhIAcwhuSY/nZnU+4NQQ2+4flRXQovWM=
X-Gm-Gg: AY/fxX570DJK0y7f020ES04R8teQGHugnV/Fxj0yvOHakgL8/JWLZ/C09C+JOj5LDkK
	hAVyuz/BjBDJegUbNogj/PLV8J8FEXIdbs7qn9FASzVuP0Z1uipb3ROcn0TZuw7kyqEjgOyZThf
	7u+kSyFB1fQ/363T0GFfX3KWMdNW5INSJVABvN87TGyQW1IGh06VslAWmh9A3wVaVjxrgV57NCt
	iK60EjvahgBbrSH4mwE6J4Zn6N+43jQyycF6E7HSeCpj+QAKvg/nVWgTOQVhyqqr+iRoVL6PVPn
	KLUmXe/fH/TT8tQMYERSj0yLSqzhZmyyF+vICQdJKcBM8voH2g7DnnJlfqzuUMnFk8duQUbMe3u
	B2K50k2pHIj0eH029NQsX9QxemT/0RMzPxxbn0g==
X-Received: by 2002:a05:6a20:3d05:b0:366:14ac:e20f with SMTP id adf61e73a8af0-3898fa7d224mr15183774637.77.1768196912150;
        Sun, 11 Jan 2026 21:48:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUNuWVCcMVmTS8WSGeyBdbyrouJFqY3p1/GeQzjg6yjw3YdlfQAb8psakYjCKq64GVx7cl2Q==
X-Received: by 2002:a05:6a20:3d05:b0:366:14ac:e20f with SMTP id adf61e73a8af0-3898fa7d224mr15183762637.77.1768196911682;
        Sun, 11 Jan 2026 21:48:31 -0800 (PST)
Received: from [10.204.86.35] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c49037sm163689705ad.36.2026.01.11.21.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 21:48:31 -0800 (PST)
Message-ID: <162744c4-4624-4371-84d7-3db767b40989@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:18:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update ADSP firmware for qcm6490 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <89b5d0b8-9928-40ca-b8eb-f40080b6f3be@oss.qualcomm.com>
 <CAO9ioeUTNWu7YirxV-qnU3q9ot=Z1UYZug2Q4ArQBd+smQ+0mw@mail.gmail.com>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <CAO9ioeUTNWu7YirxV-qnU3q9ot=Z1UYZug2Q4ArQBd+smQ+0mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ag_vQz991NWjDaQxbpJYSknGxBxRwVVf
X-Proofpoint-ORIG-GUID: ag_vQz991NWjDaQxbpJYSknGxBxRwVVf
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=69648b31 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=2PSe_dt0r429mVIOYyMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0MyBTYWx0ZWRfXyHeYekPZUo/e
 sN8Gm7v7iq76HYAPEL+R6e50U1L+5oGTh3xPNWWhzt/O5D7S2Uwsi4GjCrinEvooyLGKWExDLP7
 Cm7j9ooa6DiOlquu8WtzzemD6Aq3NakfVeQ6bPbhky+kTGVIFEI1yDlX8dfWKPF+P1fbSNYLXaC
 1Cve7w1KsRo2iPNfCdoBpkpbjCyXQEX/0grFLjIVJI0m5S5kVK43parLySnlORScONUOfc/2DA0
 ne9EmLfbPJyQRQKNoskE07C7g1lbXAxLbI3xcwUbmFNfvoqCKEeYxoQHg+G/yFpWIMoxtA6j6XJ
 ogRe9iCflgkH/0hu2xEbOSW4gXZr+CIxq8tT5UzlFi+hzj+tO/4jgA8F8rRNM1NffHUXkFGazPE
 EIFg4DqiDs64gX/MZcXDIRu5uUddUSMpSngTmCAwyw+3Bi+ewW3Aeui0rna9Od3ySpEGFrDitoy
 Hy1/vAmx4mMyehS2p1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120043



On 1/12/2026 11:14 AM, Dmitry Baryshkov wrote:
> On Mon, 12 Jan 2026 at 07:42, Venkata Kota
> <venkata.kota@oss.qualcomm.com> wrote:
>>
>> The following changes since commit fd6473795fc677b981a076e12ff10044d3e5dfa3:
>>
>>     Merge branch 'main' into 'main' (2026-01-10 20:55:47 +0000)
>>
>> are available in the Git repository at:
>>
>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dspfw-kodiak
>>
>> for you to fetch changes up to 1ddcf07a2c4859c6914660a077c5649dc4dab281:
>>
>>     qcom: Update DSP firmware for QCM6490 platform (2026-01-12 10:42:59
>> +0530)
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>         qcom: Update DSP firmware for QCM6490 platform
>>
>>    WHENCE                |   2 +-
>>    qcom/qcm6490/adsp.mbn | Bin 12693084 -> 12095036 bytes
>>    2 files changed, 1 insertion(+), 1 deletion(-)
> 
> "Update adsp, cdsp firmware for Qualcomm QCM6490 platform."
> 
> Where is the CDSP firmware?
There is only ADSP update. Corrected the message to reflect the same.>
> 


