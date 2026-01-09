Return-Path: <SRS0=aqd8=7O=oss.qualcomm.com=vivek.sahu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B707D232ED
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Jan 2026 08:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B85AC16AAE; Fri,  9 Jan 2026 08:33:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FD57C4CEF7
	for <linux-firmware@kernel.org>; Fri,  9 Jan 2026 08:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FD57C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098M3fS3727466
	for <linux-firmware@kernel.org>; Fri, 9 Jan 2026 08:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9B+2NwKBGjnxvdgRmMOYm+hqueHSdEoTKzOXKeN2Uo=; b=YG6pzQaDJV31+iul
	2QO0jYmAjRycmq8l67Ax0FLn5TIApvap9lNE2iLATIkRla2NSrqquGS8XUVA3525
	EC5HxxI7xvBtXfydgE7eDe9EVMc1m/yn4s5/kr+j0XhfdRzvXE7fp0BpbOo6nH2b
	5W/bnUOQfBAetqEM4bswLx8dYIQM16dRnlpd0ZE5rElpWMqaAE/ttrBIncj/GTDB
	1Bu5FjcpnVXR3XLffnFu2r2BncWQjX2duA+EujAFGLyxJyj5Gb/9E+kkL/bB0ho8
	mA8tbcGFqz8FOxnhlFyqyddvwY9U6986YACeFNTzNJFTILjDCScHTJQZya16XGzV
	CaNX2g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkh9s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 08:33:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f26fc6476so59069885ad.1
        for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 00:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767947634; x=1768552434; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9B+2NwKBGjnxvdgRmMOYm+hqueHSdEoTKzOXKeN2Uo=;
        b=EzQRKifFXQV4HjGLy86+x64KVqSxWM0i70TYVsJQVx2DTV/q7C0d1Aq3zjfhPdr+Ir
         AVQ4R24DikKVAhZOq5Zit5BVipirj0+giUzdM+b4d+6vd3EGbp+jCLeGaruOQzYA/vKA
         DbQzIHcrEbltlt4cfNJSs6wG81cQFdOKSe+bxAc5oSqrJmEyXUMH8tj86LdFHiCFT40G
         OSIFHn/XOfbVOO4BJEmh4qGpOGVsJ4oTQH1fY1DWyDaB9N8C3IDm27o2MQmhYFofmnKS
         Jv9qL643sa664UftWW5irpcvcOaQhrgKdUB+0si8uqE/u8tPnj3tx7G9WWx31UP2a9AG
         abbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767947634; x=1768552434;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n9B+2NwKBGjnxvdgRmMOYm+hqueHSdEoTKzOXKeN2Uo=;
        b=erVjbIR1TF+7lsk7u9Sfqq9T7YwVZd59gdt0/5Bb2bxEOm8S5zAjyG0ifnLhNuuvFm
         JsJFtfVmGG58ZMsHw+bD2bnZD+AtN0MMLemfAo/x97k11mO1hIrgN/kJaXARARK9jUMt
         pK/V43rY5qVLP5rtMPDHw7TzrHayEtaaIq4xa7ldoAzN8hPCELBYr+6RyRIkoCii7pkR
         k7o1y6eH2Z2A+5C/33UwSCI5YTWigdMlogvD6qJffJkIaxK5sB7Euk3bnW/DhUKHfo6Z
         CxHT04miYVjmtGADpt3hqA38pu3gmLxAz+LB2RtO/Cr903IIxzThCXuccGTH1u+f4eGO
         Ssbg==
X-Gm-Message-State: AOJu0YwB8jPVn3+stNUAh4YDruhEG2p0bG+kFE0s9RMdu4RMIsJNxEm5
	fPBR4Izvts5SBVqJYOGZ0He1XrRMTAxgtx0/aDLU7fydr1SzqAtCmclDR59ullgbcx7Hsamlrl2
	rdNj1TAtC5hVCpXIeJ6Jj2ONcXde+8w5tVw0JLC9wyvU7U2Vdv6+jRxcT5ImnHTw=
X-Gm-Gg: AY/fxX737FK/sGmf8j2b81QwAPpKlwwIJriUOrAFMDVkxhCJiDGe3z9pM7ABKNTx4SW
	tc4+C1ql0/eq9MiBPUCDJreg4lk1xF5fBjTP6W5/KmDzPgEuklBcPfBC5GBztp6uRmfuWuXTIMk
	3rrb+Lwsb9F/GjvGzRGjE9uaNlKCxkqppsZYONFss2GVy9OVhkw1umqkz/+3Ploea34W2dlb8j2
	/8B+EEgoeJ6QatCJS2TQMfNkIZoXKFToAZqF18iRO3jOHYX2F1RLcu2o3+TFSNSxuQ5jDtu7opi
	XzLDZYBgn2qytLFwcQ1MP2RiXyYumP772gRlwwGhjtXDZ/Lgz/rxkOxQzGFe7eKcLx5VZPuG2mr
	BAOXRCPx2sbYfD13/wbH9xDAnW4yvBrHh+NcJ
X-Received: by 2002:a17:902:cecb:b0:2a0:8972:d8ca with SMTP id d9443c01a7336-2a3ee491c20mr85387595ad.35.1767947633511;
        Fri, 09 Jan 2026 00:33:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2gZtTpDUiDLaQbbTi0lbUac8iFxBDRUiyuHBTHLlnl1AnAhPfj0xiLgJKcUHhLDtwHARyPQ==
X-Received: by 2002:a17:902:cecb:b0:2a0:8972:d8ca with SMTP id d9443c01a7336-2a3ee491c20mr85387385ad.35.1767947633006;
        Fri, 09 Jan 2026 00:33:53 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a311sm100780235ad.19.2026.01.09.00.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 00:33:52 -0800 (PST)
Message-ID: <cf73c9a9-e29c-438f-a2b2-20cf9d3f49b6@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 14:03:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Add Bluetooth firmware for QCC2072 uart interface
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Mohammed Sameer Mulla (QUIC)" <quic_mohamull@quicinc.com>,
        "Harish Bandi (QUIC)" <quic_hbandi@quicinc.com>,
        quic_janathot@quicinc.com
References: <ade99252-a85c-4399-92f1-56156f509814@oss.qualcomm.com>
 <iep7i32ovru6j42fx5l54rmw3ihhoetd4isvwpkvvwlekujcx3@ytwjeawwqz6w>
 <ead2a8c2-c466-4f37-a9db-79a54bcd6a22@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ead2a8c2-c466-4f37-a9db-79a54bcd6a22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960bd72 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=LztL-b_-35AR7FUTdG8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: zpJYwMeVGF74wf3NeLClNN678LUvXrKF
X-Proofpoint-ORIG-GUID: zpJYwMeVGF74wf3NeLClNN678LUvXrKF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1OSBTYWx0ZWRfX5YUhTqVKSvQN
 BbuX1IiLG6AiKQtXKyM44U1Vk90PwFVGBi0NM9OnLspZZeKj0jqXKNPNcmkPE7KqdB9AR0ligxh
 ebUd0KOYAOkhGmDxkXmkemJgIx4A7JSN2/3CxD3ev/r43q189c+TOGUJk5AY5dynBGGZNXIPtjg
 cMTR9oUCAaY12DbBuZ7Kdlz1eI9QoegvWMx6ZvaOerqP26RlH2qsoCOStpvcAEbcyTq9TveSPZ6
 a7EKvJfwALgeGTr7CYLxX6xp0VdC9Yo6fBeRHtOFqZQPVzwg56Jf+J/e5mddnikUQVmacKsQAvb
 lCLHHNGQF7HikC2AMYIkB7ffHmRcVvgZH45Npzp7jDcEFOz/+hwtKrWdSML0rZ+r9/1dkLKvoHO
 JXo1PLu18rbhElYQKHAfRmm7gc1Q6TEvmlYjtmCMBFw1MuXgR2Yj3SBBXajzwkfuJVlmLKpw7QU
 wioKaOnBNEJ4BRABmaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090059

Hi Dmitry,

Please ignore the previous commit. Below is the snapshot of the new commit.


The following changes since commit 59df6ceeb259a81eb13cae36a44179981e95abde:

   linux-firmware: update firmware for MT7922 WiFi device (2025-06-06 
15:21:11 -0400)

are available in the Git repository at:

   https://github.com/vivesahu-huboss/Cologne_FW_Upstream_2.git HEAD

for you to fetch changes up to 56c89c0197463faa69f2f94576eb8b9a83de3580:

   QCA: Add Bluetooth firmware for QCC2072 uart interface (2026-01-09 
12:41:38 +0530)

----------------------------------------------------------------
Vivek Sahu (1):
       QCA: Add Bluetooth firmware for QCC2072 uart interface

  WHENCE            |  10 ++++++++++
  qca/ornbtfw11.tlv | Bin 0 -> 216274 bytes
  qca/ornnv11.bin   | Bin 0 -> 10880 bytes
  3 files changed, 10 insertions(+)
  create mode 100644 qca/ornbtfw11.tlv
  create mode 100644 qca/ornnv11.bin

regards,

Vivek K Sahu


On 1/9/2026 12:24 PM, Vivek Sahu wrote:
>
> On 1/8/2026 6:18 PM, Dmitry Baryshkov wrote:
>> On Thu, Jan 08, 2026 at 02:33:22PM +0530, Vivek Sahu wrote:
>>> Hi linux-firmware maintainers,
>>>
>>> Here's a pull request for btqca bluetooth driver. Please let me know 
>>> if you
>>> have any problems.
>>>
>>>
>>> The following changes since commit 
>>> e272e0d1edce58496c3917f7422b9531daeb0535:
>>>
>>>    Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 
>>> 19:05:06
>>> +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://github.com/vivesahu-huboss/Cologne_FW_Upstream.git HEAD
>>>
>>> for you to fetch changes up to 
>>> 5fce4edd5a84b09c670918cfcaa0705eaf1c2b60:
>>>
>>>    QCA: Add Bluetooth firmware for QCC2072 uart interface This 
>>> commit will
>>> add required Bluetooth firmware files for QCC2072 uart interface.
>>> (2026-01-08 13:20:45 +0530)
>>>
>>> ----------------------------------------------------------------
>>> Vivek Kumar Sahu (1):
>>>        QCA: Add Bluetooth firmware for QCC2072 uart interface This 
>>> commit
>>> will add required Bluetooth firmware files for QCC2072 uart interface.
>> Oh. And your git setup is broken. How did you end up with the SoB not
>> matching the Author of the commit (yes, I really want to know, how).
>
>
> my gitconfig file was not updated with oss mail id leading to this 
> issue. I'll update it in next commit.
>
>>
