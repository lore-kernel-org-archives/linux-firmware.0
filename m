Return-Path: <SRS0=aqd8=7O=oss.qualcomm.com=vivek.sahu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC1ED232C9
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Jan 2026 06:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45678C4CEF7; Fri,  9 Jan 2026 06:55:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 264E8C4CEF1
	for <linux-firmware@kernel.org>; Fri,  9 Jan 2026 06:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 264E8C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MplXI3220044
	for <linux-firmware@kernel.org>; Fri, 9 Jan 2026 06:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKIWk+2oH8858N/ep0jL+W0qsBM4qxvQRU9jTqK/PoE=; b=loUqXfRy9Ap2XysV
	6YrL0C0ii+bb3WY622WsQ8sv2VZo+3KmmSt2FwyoNfWhHOd1Xpnm32txzvUWci8N
	tgr4oMEurDyM/2eXnk4dcTk5hFiAjCFRPN565ERGNk5aUfjhqsgofeGFJhOT3g+D
	LJN0urSN0ZVXnzzyUoCf8ccnSCThhj03ZOwtI0W/3QcTz0LzgoZaBbgswDoApe9g
	9iNm/6TqnQEbSX3ZubAK53m0i2lSZ+0XtOtRMVR0KrL1BY90ExnQIei4TM9G+lip
	5hRU0U61fRLJ2SVnEexGomMQiTdZfrT8Vv1/XqemPaa3/tzILuIoesCV6S1bv3g2
	sjW2Vw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjt0hgup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 06:55:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f47c0e60so86358635ad.3
        for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 22:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767941702; x=1768546502; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKIWk+2oH8858N/ep0jL+W0qsBM4qxvQRU9jTqK/PoE=;
        b=ezn+Hc3OyoFtU7NKT5lSG7DF0t6Ix33a1is1bhuFpwjLZvLASz8MQIeUu5mHo+WQZV
         OriR/xmE782qF7tXCi2vBFaKpE1EC2+oGn76Pgi7VciunbvMZlSx1ugetE2WWJ8uG+Vd
         EQWDPO3yX6NjBxt+JsYEqmbkB3rRUDeYeNU76zbXkxQXkgI+oXlBQG5iU/6YTgTp/gXS
         Wn2L6+FSR6CePBzWXrfAX3yd5GGUDClD3phhQns4sXMHlDMXGfrSQyhe1UKni18BjCgD
         1CCfIIzDgLPASJhVDRduHng5+Jxv9u9xTIWbTt2oxdLs5p0wSCLbT9gRNspQd31ceSha
         sQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767941702; x=1768546502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKIWk+2oH8858N/ep0jL+W0qsBM4qxvQRU9jTqK/PoE=;
        b=qfwoXeApy8pWqHGYL6pW1Egfc/0FL1+hr8GFmb9yS/xt5Fl921kKCeCbrHWTrKgFr5
         g2Uq4B9vWnFVihNvsmQ42MJ5KbB0mC2KrGK6HnZLbVPtUca8boTmm+un0cZrDGgpPEbg
         5SqRysvnhhL6A2GmQ2yQGiRaOsVRIdzLCSTbjFRa3lSl44ts7X79PkzVsCBj8fwQLU7L
         o53wSSu1NVL/fQMwiKKp7lNAstiAocdd25houTIMiyov7z+M1Rch8dN7SvyB7msuNZM6
         UaFRU75JZGZ08byD8dkjHQdxP58Ow2SGC9c5bwRCzMdBTY+y0lalKs4oCqk1icasbuw6
         Ez1Q==
X-Gm-Message-State: AOJu0Yw4q3/hobnhIfFQKE+cDGiV5omnL47meGt43d3IKkyLZVVobZ7P
	ld0jStzGyffezGifY6PZl6UYcK+7w+E8yuzd5L6EEo94W0ubrw/QA1wKAdu4pB1yXHjZ9w7OUaP
	Pr3TX+3RgeXoW+SCAB67G3IatY3eruNEhutv1LLopeXfGnOpEBe/VnGpOfSumjpM=
X-Gm-Gg: AY/fxX5yyB0nFK5oCQS4gno55SB7KNFm1kc71r0Ht5v44ICp6pSzRQb9n06FT5g9dgy
	+iImaOnl6Wj+ZEfvMb9mzvlmnJI8vDjaoIiw03hEAXWDHV+2o/0mvwm1CUq0cwj6IBn243P/caj
	RSSMdOuyk/7feN3FpM3TtaeSh27c1K9ZvE9P5U2ZBhg+w9wxmfUL9b2ci4z/zFiC90AJId9MuxY
	jLXsDywGq/NKvzha91MUbd3yQhtADAbJl3FVGmjPOuE0KDsTf2ILkV+u1Nhhur6vaiuF/y1cDbM
	oyYtx0ZXLtqlLul77g9R0ribk697nmV8elfS4m+L1IHhZZEDySN45pcQmuPCFAHlitDGWFRKU9L
	B6VO4pWQKpf470OmmV08zVbWQHw0d3rcRcaUV
X-Received: by 2002:a17:903:1983:b0:2a0:d403:a2e3 with SMTP id d9443c01a7336-2a3ee48ac8emr82953775ad.37.1767941702066;
        Thu, 08 Jan 2026 22:55:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDnUzvJ/QHfHWe5G8BbsxhJky1p5vtioFnU/R/Awb3HZY3/lx+M9WGLnhalrM//MznISaxxQ==
X-Received: by 2002:a17:903:1983:b0:2a0:d403:a2e3 with SMTP id d9443c01a7336-2a3ee48ac8emr82953545ad.37.1767941701578;
        Thu, 08 Jan 2026 22:55:01 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c5cefbsm94094145ad.43.2026.01.08.22.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 22:55:01 -0800 (PST)
Message-ID: <ead2a8c2-c466-4f37-a9db-79a54bcd6a22@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 12:24:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Add Bluetooth firmware for QCC2072 uart interface
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Mohammed Sameer Mulla (QUIC)" <quic_mohamull@quicinc.com>,
        "Harish Bandi (QUIC)" <quic_hbandi@quicinc.com>,
        quic_janathot@quicinc.com
References: <ade99252-a85c-4399-92f1-56156f509814@oss.qualcomm.com>
 <iep7i32ovru6j42fx5l54rmw3ihhoetd4isvwpkvvwlekujcx3@ytwjeawwqz6w>
Content-Language: en-US
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <iep7i32ovru6j42fx5l54rmw3ihhoetd4isvwpkvvwlekujcx3@ytwjeawwqz6w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TIBaP2OA_NoPzLwKgOiFAHrOpHXGAthU
X-Authority-Analysis: v=2.4 cv=VJzQXtPX c=1 sm=1 tr=0 ts=6960a647 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=oe_Umk9MVVVvuyi6fYwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: TIBaP2OA_NoPzLwKgOiFAHrOpHXGAthU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA0NSBTYWx0ZWRfX9Zu5TksaRaTU
 oJ+eRmUsKD6DUYPt4IVvqt7jiPqajSozbyofcwuU9BEfcCelxrZL+oY9wAfNeORRcFQY/eguCnx
 VFi+s0Jf2zSCFpSt4N/v3J72b4LxxEw1wdaBkTXodo0kFh1o0twgJE1I0FLvOxdUj4xzZfyc/ds
 8Qup+ba+WypiF0zNtMmnyjjRDAdQ18yyYvRqtyxbgaWFm8f6PpBfKJ2S5tukfFLg3Y6lCF8fgDb
 4xuwjxh/9nzIa8KhNGnhY1oq9cKQPQ0k/OfmVm6uqS1ZveW3poLbjBvdKpOpGyVWABl/w22tl8A
 AyH1eyZu2hEVkaZSHN7R10qGcmwQ4nPTFHLFKxcacU/FQufKc9/1WB7QzW9V8Vtu1nHduYaV8Z7
 jDg+4KHqSdZZNgZ3jfatywT6B6HfASqTZGy0AlXD5j5BGIQ9KNgANyV8kqNfLBt4GySTguHJUjC
 SxidMxCPQlG3E0PwqFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090045


On 1/8/2026 6:18 PM, Dmitry Baryshkov wrote:
> On Thu, Jan 08, 2026 at 02:33:22PM +0530, Vivek Sahu wrote:
>> Hi linux-firmware maintainers,
>>
>> Here's a pull request for btqca bluetooth driver. Please let me know if you
>> have any problems.
>>
>>
>> The following changes since commit e272e0d1edce58496c3917f7422b9531daeb0535:
>>
>>    Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/vivesahu-huboss/Cologne_FW_Upstream.git HEAD
>>
>> for you to fetch changes up to 5fce4edd5a84b09c670918cfcaa0705eaf1c2b60:
>>
>>    QCA: Add Bluetooth firmware for QCC2072 uart interface This commit will
>> add required Bluetooth firmware files for QCC2072 uart interface.
>> (2026-01-08 13:20:45 +0530)
>>
>> ----------------------------------------------------------------
>> Vivek Kumar Sahu (1):
>>        QCA: Add Bluetooth firmware for QCC2072 uart interface This commit
>> will add required Bluetooth firmware files for QCC2072 uart interface.
> Oh. And your git setup is broken. How did you end up with the SoB not
> matching the Author of the commit (yes, I really want to know, how).


my gitconfig file was not updated with oss mail id leading to this 
issue. I'll update it in next commit.

>
