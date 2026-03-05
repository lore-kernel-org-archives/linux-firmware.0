Return-Path: <SRS0=lGKA=BF=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF862EEF319
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Mar 2026 09:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BBE6C19423; Thu,  5 Mar 2026 09:20:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6A6AC116C6
	for <linux-firmware@kernel.org>; Thu,  5 Mar 2026 09:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6A6AC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625941Fu3160367
	for <linux-firmware@kernel.org>; Thu, 5 Mar 2026 09:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5M7wzsimtBWpnFvVYbTSKi7hGhYOb91aaXZNb8BKTM=; b=FrptuJnIZFH5E/Fp
	ClxNQ5/OXeuTqxxXybH8Wc0e+BY/7wceB/DC7uwXa9AlNmDruQVaMIPVvSP/2RBY
	ybdnhyQD6EPRAA/WtTj7xNTIYcD24vLrNr/QfGdRt8UTV5eMDSz8gGE2lbH8sJk9
	I1bpJOxtYkWlCKAL+M4TzWmhgtLeGGQYvJikdKUGE9ozEtVrSKbRjyRYIrntghud
	TWV+uoyRHVHqXmtk4OSCf7OS8zcYNSfeuRjpO1aVvhx97EN5FBtEzPQmlOPyB+7x
	fzbcjKaMOBoG8EetDUNOlTycxA8gfRpShzTakcAb7H9gMl8HBWzvrvxSro9E3EC9
	W0Z4VQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5v12d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 09:20:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824a1d441e7so3554690b3a.0
        for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 01:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772702412; x=1773307212; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l5M7wzsimtBWpnFvVYbTSKi7hGhYOb91aaXZNb8BKTM=;
        b=UIRrYTDRcvDPZAIgYb+ZSGjA0mnb9zuED98/gECDItzSP/rYG6X4d9TMs8OpsZLSDE
         PMVo97g1NVALDeHjaaOz8lEWTVhvBgQYcyRihBgqPdeLk4KOIUjhZ6O85Botk3OqSMcZ
         sRbtzjO+AQ2+9hQYiTPP/3cvLJY9hNQt61SmkcAw6mq9HFzyWAIMv8hzvEbHw8MsQs7I
         cCkemu6miENBOwvW6AmNg4CLQdbVoqEDGBbvU4SyBMDb3ZECiK+BDeLlgd3Wnlmt0c0C
         sjnpbv51UKFCK6wJF2Z/T1bPen2Xc8p+CntsnNhY31JpsiiagHOx+pnod0su/JfPjkOv
         zlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702412; x=1773307212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5M7wzsimtBWpnFvVYbTSKi7hGhYOb91aaXZNb8BKTM=;
        b=PiuExkjOldhPdGwdHT1wN8/Clh5wYsWRr36CvGmhBKv8KFkw8q654u5s86OIdaHD+v
         ZufuRBWWqywpIxPTfCQCyDCnEZ7qvw9+jIQGl+1sP8hVBCx1ZVGCx/qwPoivkfuUaP3H
         wL7xwyx0Af5S43p+6m9WvNZAME8naM+fhHvHL1YSL6CptbjJFs/K0ffwGvPAT6UpKv6A
         QAeMb0kp53i5IdEMsuNHslJJx4kAeo9/4I3O7ikYFJLjWAQfmiUYZwtgWGNv1CCJORyO
         CuJf3++ldjlFT8FhE0Qu9eGs1dmWvrk61RIUlucEciKq6BWlvfzO4VpMAttcxKGCj8Xg
         29UQ==
X-Gm-Message-State: AOJu0YyTgvVYIBD+iBHdpwTKKRzmPqe+/Oh8xEPvLmxgaj3BmLOy81dB
	JRcVxmiUZSMUrfu0/AXnuVI+1j3M/t7PqFrIKP3qMAe0ix6//f6/A+WHh3VT+ymw+GyNu/ptC8+
	OjNHL7mE2YodycsRRC/HZjlA7aADM1cADiM4isu5AwGNNhAf4NlDL156E6+VR+3E=
X-Gm-Gg: ATEYQzzgvpCKfozNaDB4+hlZH6+svhvPHOt3pgqw3WiIhaHsAzESw8m0F5StlZDN7at
	sCn4sUzKY3421gfoXX7zlIRbfHh/3QB8nBdtyiiyaBwABUKtL346zUYnrGnp3QvNvjk6yr1304s
	NFtQNwbdy+EAK8ho3P//N98P8otQgomCFbJLJhUb2rtKBX5tPg9E3QbzpRbAnioaQ4Sb3P66cPL
	uv5T8RrO1J0AKaJA5R/8zU3QNcriaDCm4QRjyKodts9GZXxWjB0Fab6kAwQY3dIValzBbhDCwZ6
	NBMaDWOCX+36iM2eCbtZPw5WRPpMEp8cmt0NSePPAFoP8zGOlm9Cia1vGR6rbT6xbGvCVP6eKEt
	Zddq8OldSiaCmKZSD0iKX7xx7o3k4YdUFZ3paihQmMLpbsDZ5Dg==
X-Received: by 2002:a05:6a00:39a7:b0:829:6f9f:ea3b with SMTP id d2e1a72fcca58-82972b8cbcbmr4393367b3a.20.1772702412217;
        Thu, 05 Mar 2026 01:20:12 -0800 (PST)
X-Received: by 2002:a05:6a00:39a7:b0:829:6f9f:ea3b with SMTP id d2e1a72fcca58-82972b8cbcbmr4393349b3a.20.1772702411673;
        Thu, 05 Mar 2026 01:20:11 -0800 (PST)
Received: from [10.204.86.14] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829898e1417sm1255692b3a.62.2026.03.05.01.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:20:11 -0800 (PST)
Message-ID: <5b389c60-d090-4e6d-830e-eb1fb677921c@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 14:50:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add ADSP, CDSP notice files for sm8750 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com
References: <15774628-953a-49c0-8a21-543524cbf643@oss.qualcomm.com>
 <sjlerimbkmclb6tmax4jfy7edq73nllotla6oheebiny35jqeg@ungsnspduk5b>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <sjlerimbkmclb6tmax4jfy7edq73nllotla6oheebiny35jqeg@ungsnspduk5b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a9wRNKV3wtqQuv1q7fMagwHunv2TPl2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3NCBTYWx0ZWRfXx4OinKx30viF
 NDoafs6yGi76qTiDndYvNA2D2WXjCCq67v3Qb2Qxeti3AP21s7+AjqBob/y2Z/iaIk9U8YricUO
 D5qkAcR23nZZvx8404PwTk1TGYy9zEdmsf+Wq1HU4rlf8cICMJxIkArh0l+m+Myiqcu1Rk6Z9PI
 LJUTi+YIl98lzohLc6LK6U854uJs1ngdkz+JxKV27TVxWPFcrbNzCRqj79ktfQBxw9DmhO0069Q
 n1LUl/WQk7UM4LvssMuhDDwUleIt45OL6nqRDB35S0Q7l2BoirIPE76P4Rn6dbowAmjiDZ7Uekz
 dSqawSvjwHJNs75QNkiWogiH8NjfQpurZWw4rLlWxCSdyTFeQoZh1nmKteXWBmqN1/WrRvEUxv/
 SQfqC/2+ebjt12jMqadCgnzdkyLoNnuOdoQgp2uQaKue2EWnNbLJuPXPq52vsWQTJmsA4On21EZ
 JHEmF4fU34xvZTgLbxQ==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a94acd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=TXWdVL8VjTwA6YmSUOwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: a9wRNKV3wtqQuv1q7fMagwHunv2TPl2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050074



On 3/5/2026 2:44 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 05, 2026 at 11:48:16AM +0530, Saddam Patan wrote:
>> The following changes since commit f69a5e73c0c0c927a5bea53ce707ef17afae1964:
>>
>>    Merge branch 'audioreach-tplg' into 'main' (2026-03-03 19:46:20 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-pakalanotice
>>
>> for you to fetch changes up to aa05d14567ea5de6790a4ae199b4ab2ab1025fb4:
>>
>>    qcom: add ADSP, CDSP notice files for sm8750 platform (2026-03-05 11:46:08
>> +0530)
>>
>> ----------------------------------------------------------------
>> Saddam Patan (1):
>>        qcom: add ADSP, CDSP notice files for sm8750 platform
> 
> It's impossible to comment such a pull request, so could you please
> send this next time as a patch rather than a pull request?
> 
> Also please check the comments that I've left for the DSP binaries PR,
> and apply the relevant ones.
> 
>>
>>   WHENCE                      |    2 +
>>   qcom/sm8750/Notice_adsp.txt | 3214 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   qcom/sm8750/Notice_cdsp.txt | 1270 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> 
> Are you saying that DSP binaries and DSP firmware have exactly the same
> set of 3rd party software in them? That's very, very suspicious.
<Noted> The Notice file is generated for the entire CRM in one shot. 
These are not generated separately in the build for binaries and 
firmware.There are typically dependencies between the firmware and the 
binaries and in a way some of them need to go together and the overlap 
of dependencies on the 3rd party software is very much a possibility.
> 
>>   3 files changed, 4486 insertions(+)
>>   create mode 100644 qcom/sm8750/Notice_adsp.txt
>>   create mode 100644 qcom/sm8750/Notice_cdsp.txt
> 

