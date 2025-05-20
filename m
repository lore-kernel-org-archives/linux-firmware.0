Return-Path: <SRS0=W+U4=YE=oss.qualcomm.com=viken.dadhaniya@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE3DC3DA6D
	for <linux-firmware@archiver.kernel.org>; Tue, 20 May 2025 07:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 180A0C4CEEB; Tue, 20 May 2025 07:21:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 185AAC4CEEF
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 07:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 185AAC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6nfU0027861
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 07:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4yuuNlmBB7a4JiQWMFhP5jyyEJc5JRpp1eKWiFdvHo=; b=EpJxM2V406xnU1qN
	qyAji5mfjoSeQUBd19dC0g0vSShvQcOyTEsktKw56RpSBZI69jDJ1RaNgfA/aYAc
	/hdJdiEOVuZOPpE2827JstpcvPuFs234G9plCGulTBzGi+OAf07ctqg7YaCvsv4u
	MkU7uAJBd1PwJPfa1NK9N3jHNLhKTwWKUWtevBseGgV2R+KxU+h/aoSCKKXPoJ/G
	//CNmsc29kUDyhob+s+Xwu3ORWRKnDkJSamntNMkkwv0gnio0k72eUzD0Rnk8Dew
	pPFqc8cbmmJ0WJyeon8TTMdUoo3HR9E4fjpYy3His7BNS1DmGSs2HteYuqdljQfL
	xXYxhQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4xxsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 07:21:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7394792f83cso4040711b3a.3
        for <linux-firmware@kernel.org>; Tue, 20 May 2025 00:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747725696; x=1748330496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4yuuNlmBB7a4JiQWMFhP5jyyEJc5JRpp1eKWiFdvHo=;
        b=NnOMLSptb20Hj63lVCqe5DLuKWL8QWP7ozN1Ryn+OkhfEehsrVQwqmzs+bEsu2RRMu
         QHBMoQiCZlMBrViiuM0eTs7MwGYGe5NHX5kmxIbPWQhozR76e4HIz9oXZCujj636mdzK
         pPKrvJfBAS1WQuutxbR9HVyBuc2sBWrUxhwmC8pd5rt+chOwkLqSBw/L0JERj1hvTyw3
         4lfgVGpK72r3/mRYCTIc+4ffTj9n9fItwA9RbRrQvBQlAqj5rFyzw0KqHjbs+qyEgE/N
         r1+6+7ErGHdTM018c/cECzi/73C/9Vm98rMzLPoAtNXZ6rH+eQzg/GHtQnNTC2QPToUT
         Rjdg==
X-Gm-Message-State: AOJu0YwPngRHd/c+rD8hO1tM9pZfBv3nWWsIE8eai2t37QnfhYLUoLWp
	mLgqT4JglKQMK6xkZ+18Iniy86UuhP50YRcl6be63VnuljIXw8+pzw7EQVSy7z6Yx/PqzYxAi1t
	RM5UyGqvGcRIGAQumTGqE9cBZtGvMg/OgWfK9zGU0bHHK/IK8ltQFBqxHtYM3LJE=
X-Gm-Gg: ASbGncsuJdK9s6EI4F5pVfeNewzEgXd9U41rwqLTcCufmoZzAUK/5OvB9sNhw0y/Lub
	MacBcxSiM8okOL/5k7Q0ohRZHnuv6kj2orFf5WmSdvUkumWtmb8Jg/cGVY3+VDvpFj0KIMeT6nY
	BvIWAnFaVqaVe/yFOdYaoSBYzCKCu0QPENGXA/IuVUUghp1JnjXi82Jd60fBNil6uG3QxYAw66O
	d2qurHbTlTZ/Usn7DMvLuhD/0pRpJlDx5/WpbbsYaRBAq7+o1KgYsOvM/w/OCeK6m8QCsbI2z2/
	ZP9TMwVlJPM5xJVOVDSGz9TDfOcAB3Jw0A/2+BXgBZeE
X-Received: by 2002:a05:6a21:4ccc:b0:1f5:5aac:f345 with SMTP id adf61e73a8af0-216219e24ebmr27874632637.36.1747725696207;
        Tue, 20 May 2025 00:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/Ct5BPkttEPFTj3VjRVWD0DuTkAvRMS42lKTo2i/mm8TDqn1KlKbMbX0OnFguSIdBOxcWvA==
X-Received: by 2002:a05:6a21:4ccc:b0:1f5:5aac:f345 with SMTP id adf61e73a8af0-216219e24ebmr27874606637.36.1747725695822;
        Tue, 20 May 2025 00:21:35 -0700 (PDT)
Received: from [192.168.0.105] ([49.205.255.212])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a357sm7365654a12.10.2025.05.20.00.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:21:35 -0700 (PDT)
Message-ID: <78f8cf43-f942-4e24-b383-05b16f8c1c1a@oss.qualcomm.com>
Date: Tue, 20 May 2025 12:51:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add QUPv3 firmware for QCM6490 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, mukesh.savaliya@oss.qualcomm.com,
        quic_anupkulk@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
References: <ef16e66b-9cb8-4062-83fa-96b2aff1f0ed@oss.qualcomm.com>
 <diiztiu3oixbdx3x73th4z5nnii4gvb2caauxrrbvo25e55wuy@gc5a6utum3sp>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <diiztiu3oixbdx3x73th4z5nnii4gvb2caauxrrbvo25e55wuy@gc5a6utum3sp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682c2d81 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=4V33KkNKHzWXINH6/GgMzQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=ziODY_wEjFGPL4d0N_8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: bjpxzuqH56F1WEWMMX3qd29ASLl9P-Db
X-Proofpoint-GUID: bjpxzuqH56F1WEWMMX3qd29ASLl9P-Db
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1OSBTYWx0ZWRfX574B18VzSFfu
 QjbJsh46QKhTjUJ1/IL5xMtDJNdTKtKxtxY3FNtoOnhvNFLMfXCidA4ZmOAN7PVkL+q9UXSyE0b
 tQ0dp+8Wh4eizhJ4Sf/DyYzEBQaL1+ewu91nnX9EKaR9uEo2UnqeSNn0q2bDOF83c7VSGAGffOz
 HOR5ut4SUGsif/9JGuBeJv3mUemRGH9+K6GmtgkHmXfNXK6HwTqlU+TsPRIjuqp4zCdohKHoYqN
 VIdzdSoxxWPyCCB++hu7HDDASHVhfyKwRQXR/ai/0LSzV6xXBWcLk4xgCwoDols7Ntk1kVtnlfa
 FNyc3oN5mkYcIsQfP8br18OsXhEUn00JBRP2auh3cReylGv/AQqbeqAakfQqvOJPHiCUn7080w7
 dBgQe24AR36drOzFC7S4CZWAhZpnlp8MrVgJgjD4xggpzijHmAuiuvl1tFdzFRk7F/JeWlQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=717 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200059


On 5/19/2025 3:52 PM, Dmitry Baryshkov wrote:
> On Mon, May 19, 2025 at 03:45:28PM +0530, Viken Dadhaniya wrote:
>> The following changes since commit 759c4acafb4a80d76885e4a1542229a27d677322:
>>
>>    Merge branch 'robot/pr-0-1747425243' into 'main' (2025-05-16 19:59:07
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> qupv3-fw-qcm6490
>>
>> for you to fetch changes up to 29f3300a797063fafd32e1ab45badc12ea81feb8:
>>
>>    qcom: add QUPv3 firmware for QCM6490 platform (2025-05-19 15:05:34 +0530)
>>
>> ----------------------------------------------------------------
>> Viken Dadhaniya (1):
>>        qcom: add QUPv3 firmware for QCM6490 platform
>>
>>   WHENCE                   |   3 ++-
> As you are fixing the driver name, could you please fix it correctly: to
> 'qcom-geni-se'?

Sure, I will update WHENCE and raise a pull request.

>
>>   qcom/qcm6490/qupv3fw.elf | Bin 0 -> 57269 bytes
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>   create mode 100644 qcom/qcm6490/qupv3fw.elf
>>
