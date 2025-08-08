Return-Path: <SRS0=ZGgR=2U=oss.qualcomm.com=kishore.batta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1D5C87FCB
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Aug 2025 07:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8756C4CEF6; Fri,  8 Aug 2025 07:26:35 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD01BC4CEED
	for <linux-firmware@kernel.org>; Fri,  8 Aug 2025 07:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD01BC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57878850011872
	for <linux-firmware@kernel.org>; Fri, 8 Aug 2025 07:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yk6vxxzlH7djvNnD+eUahxYNtQCU7TsrRz3aMWyqmms=; b=nbhtqSP5L7YqPUZ5
	u/JDE9YkIyP+M6Rh1u6rgzAUM7suA1ChrlrOWcSiLbh/k3DqtYvFLda/0jGJ+BsA
	D+Zdw7TOFmRfj4A/MDFr89Exk7GbhmIjrsvouQRwzedPx1Mpdc+gBB6bTAngU6/1
	sIS4NDcLm5ALMC0P3oXc+hGB5UHKNtwRfGUBuzcJGOjFqtK9ojbv7gx98NwN7guU
	7mIOvxVNcdAs4MrRta8F26+CX+bDJ2bCvW8VJ2L/tUm7Xslj8GL+qIgvNTKjxC0X
	Z6/nrzHfb5E5PCGcYdmZcofccmgJ2zjIaVJ9v4TmQAAQ0wdGs3zMN2GcyNysprG0
	OtQHBA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cpvy3sue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 08 Aug 2025 07:26:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3f38d3cabeso1501458a12.3
        for <linux-firmware@kernel.org>; Fri, 08 Aug 2025 00:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754637993; x=1755242793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yk6vxxzlH7djvNnD+eUahxYNtQCU7TsrRz3aMWyqmms=;
        b=sZs9jgQejRqxwCSrjxcJmL/F01ksxBJYSzJ0xZ1t+NbpsmNMSI8xAwYxOkedFjenzU
         oKLVfrrGizPqPfez+9bMnltDhS07P5wIffWpAS33ppBlXHPmkaA9XcVg+0mma6bX7ueL
         TuxEUryS7DlBxNUIzv3I9RH7n2/ycXqv+PfgFO7oMf+zDL/r9X4zgXjjWURFz49j7t7a
         LnGBhqgKwegMflphU9oyiNLl6nxw9FWY7yXrIi5+hIh+WveBCkPJ535MwMOI8YaiityT
         LbPg2aE8ao/2D2v6Kc23VUCp1ECMi7vUHiq3yYOBlOWvf7h5DWww/vlNFmFhZhHY/Itl
         e5Xg==
X-Gm-Message-State: AOJu0YxxNzsuZxi4jBrn0mgqGv/vzR8YQBDMCD6tPWMlmEAW9xexv+8+
	odj7mKvnzkQ2hSYcjGHUZDKAAV5lI4N/u8vfeE1NONTwZviCmtJDPhscM5P/0tRa5tYmVevT01L
	e8tAida9YQ+6wqU6iCVKVMVO0R7OZ/LGp3obH43/rByvhzi4o1jcePvmVdgDKTPI=
X-Gm-Gg: ASbGncvnxaKCU49Fj9slAzzdjBgNoGV5jwArdiQNUqVw98dGLIxgKuIbTzloPuFXsuq
	AcEKne257cv2eAjpKWlJM9tq60NI/8BNc8pUpFGD3GobYQYoAfn2vlfAnLDi8i1CtpgFLfeJzOb
	bxV9zQfoJOP2Hhdtz0T57NkcaUTdYLTTZXBIgZ7GPtjPZt+0rFFTU4iu6e2A9xu+LWSqpzBDNRJ
	hbuqF/O0uW+/pBnBPjmvNOrjLo+51k9KbE8zKBGhQluZvavbkCT8E4mPOAtMJx6A2vhS8+Qgjhx
	t0vOupzHFF/VFgPSsGUsyT/rzx1hZzljUgthjcqSi/8j32BqPtTSifNXddl+EvyQ7myhVZw1vso
	h2Q==
X-Received: by 2002:a17:902:f602:b0:23d:e2fc:6fe5 with SMTP id d9443c01a7336-242c225d474mr30053465ad.49.1754637992941;
        Fri, 08 Aug 2025 00:26:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTB3wC1FkQbbG9FudXw24rQYOmtsfzlbphRedP9gwY6J1Df0qQOJMHpZWcpjpcsfhwCgscyw==
X-Received: by 2002:a17:902:f602:b0:23d:e2fc:6fe5 with SMTP id d9443c01a7336-242c225d474mr30053045ad.49.1754637992372;
        Fri, 08 Aug 2025 00:26:32 -0700 (PDT)
Received: from [10.25.214.159] ([157.50.102.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef6e45sm200796355ad.22.2025.08.08.00.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 00:26:32 -0700 (PDT)
Message-ID: <421e8647-08df-4168-a69b-8a62389a5517@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 12:56:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Guidance on Submitting Firmware File >100MB to linux-firmware
To: Mario Limonciello <mario.limonciello@amd.com>,
        Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Mario Limonciello <superm1@gmail.com>
References: <57b6539b-b8c4-4adf-a806-d5e4a2da46b9@oss.qualcomm.com>
 <CA+5PVA76WGu2tXjxkSj9kEt_YS9zQ2BV1iYspWWmwjSraxoYGg@mail.gmail.com>
 <66b60373-ae40-4f0b-8549-6724a607a35f@amd.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <66b60373-ae40-4f0b-8549-6724a607a35f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TJpFS0la c=1 sm=1 tr=0 ts=6895a6a9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=4PD3CLIvPSJ82Sfhp4wA8g==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=HH6iLopBG2-w5WcTNwwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: QlcetgrRTpuhJPJqBXicH9QCJVbMrvfD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA0NiBTYWx0ZWRfX8BqlHOdAwWDB
 obVEAK20oFq+GtL46R0OZDFySuhb9OcFMDg8hFu+8lXwHiLAEj14cHpfOGVVEx3Acf+q6/QDOwr
 j/DCIcQfM3Psf75kDCOj/RA/JyYOcfPghlX2EpiTUoIQL1uXGZHiLM5JiqqDG2ZYCByj+En4V9W
 UadHLhgIK/CPcab02vKjKxZN7N5YK/9E8dGA1tZ6kjuQMB7pnpGsTWV1uf5kZPGzdRA/24m+VvC
 vn0JmXQFsIX6aRRXNAIniWRH1fWyzRfYBKTkWbqK7ZFs+XJdGWvS88ZY7vAiig+pwjGaeRDfang
 kp0pU3qnTr+Un8U7H8caVE9izdmE4BDudXZ9DDoeDPfHWWyJ8ZXGH3lQVRsRCKRXFrz75QOcWOp
 xQByRcid
X-Proofpoint-ORIG-GUID: QlcetgrRTpuhJPJqBXicH9QCJVbMrvfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070046


On 8/7/2025 1:04 AM, Mario Limonciello wrote:
> On 8/6/2025 8:21 AM, Josh Boyer wrote:
>> On Sat, Aug 2, 2025 at 6:24 AM Kishore Batta
>> <kishore.batta@oss.qualcomm.com> wrote:
>>>
>>> Hi Maintainers,
>>>
>>> I’m preparing a contribution to the linux-firmware repository for 
>>> the QDU100 platform, which includes a firmware blob (qdsp6sw.mbn) 
>>> that is ~110.88 MB in size.
>>
>> Obvious question, likely with an obvious answer: why is it so big?
>
> Yeah I guess I'd echo the same question.  Is this like a recovery 
> image or something?  If the hardware takes this image and spits it out 
> to a SPI chip (or similar) it would be much better to flash it with 
> fwupd.


Its a Modem firmware image required for Modem to boot properly. More 
details are shared below.

>
>>
>>> Since GitHub enforces a 100 MB file size limit, I’m unable to push 
>>> this file directly. I understand that the repository does not 
>>> currently use Git LFS, so I wanted to ask what is the recommended 
>>> approach for submitting large firmware files?
>>
>> We could enable LFS on the Gitlab side, but I don't believe kernel.org
>> repos allow this.  I can follow up there.  Assuming they don't, I
>> don't really have a great solution off the top of my head.
>>
>> Mario, any thoughts?
>
> That's right; we asked about this before and there was no LFS support 
> on git.kernel.org.  The options that come to mind to me:
>
> 0) Beg and plead for adding LFS to git.kernel.org
> 1) Abandon git.kernel.org for linux-firmware (move entirely to Gitlab 
> and turn on LFS)
> 2) Come up with some mechanism to split up firmware files and let them 
> get reconstructed during 'make install' time.
>
> But all that being said; what system host architectures is this 
> firmware actually intended for?  I wonder if this also pushes our need 
> to start indicating which firmware goes with which architecture/which 
> subsystem.
>
The firmware is intended for the Qualcomm DSP firmware for a Hexagon 
core on ARM based systems specifically used by QDU100 driver in linux 
kernel. Due to Github's 100 MB file size limit, we have compressed the 
firmware using .xz format which brings the size down to 5.4 MB. We have 
verified the corresponding in-tree driver uses 
request_firmware_no_warn() API and supports compressed firmware loading 
via CONFIG_FW_LOADER_COMPRESS, CONFIG_FW_LOADER_XZ options. The driver 
has been tested with the .xz file and is able to decompress and load the 
firmware successfully.

- Kishore


>>
>> josh
>>
>>>
>>> I’d appreciate your guidance so I can align with the repository’s 
>>> standards.
>>>
>>> Thanks,
>>> Kishore Batta
>>
>
