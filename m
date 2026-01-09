Return-Path: <SRS0=aqd8=7O=oss.qualcomm.com=vivek.sahu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD60D232E3
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Jan 2026 06:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E752C16AAE; Fri,  9 Jan 2026 06:53:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08E76C4CEF1
	for <linux-firmware@kernel.org>; Fri,  9 Jan 2026 06:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08E76C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6094t2Bk2706815
	for <linux-firmware@kernel.org>; Fri, 9 Jan 2026 06:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lE6vEC9gZ84x5KtmUKpMZUakiv4Y91zFDjBIq7miEwI=; b=XhFIwPOkn6pdEph+
	cXj4KzxYukATfvPMVI+Y7rsSAxy/uwDO5xKnk3W9HO/ypF0RJM5EMoPK91OP24u/
	mk0ecp26boOJL1yUGrE8EAjpPU52jdyDtSSqsgnohMvJJK27ee3/FotPLbdMH7Rp
	Of8rO4+VJbMcJhQ0/RBc2WktlU0p1SvBnR1MVSFSrFaAjqW73grG4G8IqQFPaHFr
	nDpyNW806c9S5rtXiY6atLtOXgv6uAoeqny66ULg3uvByyYya6yI7ETLKfIjpXSr
	1nRTSbclaXUoEu0wAkJ6mfR57hCZAL94jl7M0s22qFyfW97K7Yqc0zhWWv8ELMP5
	mJO2LA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj9hqujc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 06:53:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f13989cd3so91882055ad.1
        for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 22:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767941610; x=1768546410; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lE6vEC9gZ84x5KtmUKpMZUakiv4Y91zFDjBIq7miEwI=;
        b=dPnHbjRTx6NcuvDsNLdmyCaAyiEOD3+zw2aK6fEhpxu7W6XPh/K8AEmi8gB/lhqr37
         z3dYSYkLyBZnxMyvZ3KMB7ATNVLtynQiLx4Oj7wJXBuyavTzFJzOsUVLzDbnqFOLZqgb
         HmsW/E55T8OKG6galLLZ6L2RyaVRte9Odk4HdKr8IOLXWSY2yVQ2qQXuCSu8lGLCKcYJ
         rua11uVK/5nOf1aRCnwOFxX5AJ9TZsePNuDMKeAc9o9VcMSdqMMom9gtbEOws9SMt1Nv
         OsLvdSor9MZ8XNjNx2DGR7Alw6krvzpmkMBWxpqyCGxQuLab3dhJSB8LkzmipnvnUHE9
         FDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767941610; x=1768546410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE6vEC9gZ84x5KtmUKpMZUakiv4Y91zFDjBIq7miEwI=;
        b=fDj6M6IU7jWBA45SkgcWD1sIk/4PIzP+TmUke2hzxE243ZIZgHmLHy8oRtxxnDZJg2
         xy3ogYN6k0A3HLSuFipzdWTPmdgFZYliPu/JGci+shD4NwSMod6lJ1V7sJbNvZnzVQcb
         CXAE59D/BTfHnG2rWJJlrJtLBQgwEjop1VciHAvqTHz2o5kcAyKn8ydflsyL85woXW86
         EFy9NI9xHaN7KbY5W6HbcIyVBmfnq0y3NgQlGtm9bsmsVjuFH14P/7ErVeJC/QpBjG+6
         eGbdU3QxxZjDnn4aNH3uPcDqXyAPsrsLO3XzOAlasTtyqT5l0PNvAxVN+xsK1Xs3qE16
         YBgQ==
X-Gm-Message-State: AOJu0Yzl7fbpFyxYn9DsLiNli4M0ycNfqKK2xMQRi0L09GpZwxA298Eu
	FsOMnN+0RbfHRJkRtrIXVoSNbVq07+AAGN+2c03fUO2mKl1EYmi/4rMIMuWp3bLt+HPIEJu4tiR
	lB3MB+JPidmpDKOFC9Teg3N60EiZadGchW1WJ6ABhuh446WaHuFXfkpYWTRUqX/0=
X-Gm-Gg: AY/fxX4KsPP+OPHovHQK6QlXOM/OCB2urd35jO7rNCNmOq6smAjkQW27IE83INOjeyw
	EJVEmnwqvbw2apzVDFyrvTmoZ2YB758CRDXcHZRz8NS0vfrcvU/5AVoAJiKS0XGy9e3pTMGpGaB
	YD98mAYhQ2eqRVgNtkAl16lt9WVnp8lG+22YnypfGkQNPkdww9KSoKYt5DwDMkXnCggXiWeOXLu
	GOgKMAOTSILsDEM9OY7ecFW91cpThaND9t/rEvNU8KLMO5SZ/oe68n0j6BFHsahSL7AXL56JCvO
	bSL9BDCQi3qW4fsyu1XfwJaVVy5Mq1g7shRg5RxsJiZWV3yPPRZaTFzIEGmjDCL8F+pcJVfy6rV
	l0+y/QeoTet5hCY2X64IjXiEQkpCXXto72TiR
X-Received: by 2002:a17:903:2481:b0:2a1:3cd9:a737 with SMTP id d9443c01a7336-2a3ee4850acmr57075755ad.36.1767941610283;
        Thu, 08 Jan 2026 22:53:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExiP5DIyUBRiKitf2m0KatEXOPohSOHcmPTRX3znHADHh+8Gl4Gv4qDPs7mALXEKKu7ey6Wg==
X-Received: by 2002:a17:903:2481:b0:2a1:3cd9:a737 with SMTP id d9443c01a7336-2a3ee4850acmr57075595ad.36.1767941609886;
        Thu, 08 Jan 2026 22:53:29 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc87f8sm95285675ad.77.2026.01.08.22.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 22:53:28 -0800 (PST)
Message-ID: <ab28fdec-a767-4dfc-a540-b7c1e4e4d278@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 12:23:24 +0530
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
 <lqvojfgvfubj5gtsqksyzndlzfabrs6oqexoz2tb232opeqq22@s3k5ur53oecl>
Content-Language: en-US
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <lqvojfgvfubj5gtsqksyzndlzfabrs6oqexoz2tb232opeqq22@s3k5ur53oecl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GN8F0+NK c=1 sm=1 tr=0 ts=6960a5eb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=oe_Umk9MVVVvuyi6fYwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: swfF9_s2DP65X1t4ON1hsAB2zi2e-HOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA0NSBTYWx0ZWRfX/jr3WHO8H+Sp
 u0eHOw+evChVlm/Jd8u4kT9508IjPxLhx2qq4z+xz3HdaaR2PAl1AKJ6tHkHtYj8MzBogwDnOuB
 v6RMjDIvwz17DqKwPStCrmsr+uqjW4Z5qMTe8GzQTsdswGjGgKENpPEy6wpm0WHdvxvDQbsoxuB
 v/u+myAXoRRzAGM+RWOBp8BbMNpn6aYgJmQzpIZ/U6chRuxsky/7mr94P9Mn3qT8qiOyHc+NtZn
 q9N/ostywmNDheIvsW2zb9Hglph6k+xt2Jcg6BIxXlNo6ue0bIKUmFenTPuojRuBajrw0ncKKUb
 JXWT5r61GN2T6leoAARuOoCWwHZxstg3lVz3Qbmk81Fx06GqZTassmIErMs0SEKKQ2zDyP7EfmJ
 oNoBFxeIhcl5RZ0zVtn43WjkYADY9VhRCYE66B3uFGyxdR2zPJVZxg5emz4dmCewnbP0+WW9SK6
 TQuurwjqCOR75SvFEqQ==
X-Proofpoint-ORIG-GUID: swfF9_s2DP65X1t4ON1hsAB2zi2e-HOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090045


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
> Please format your commits properly. You got subject squashed together
> with the commit message.

I'll address this in the next patch set.
>
>> ----------------------------------------------------------------
>> Vivek Kumar Sahu (1):
>>        QCA: Add Bluetooth firmware for QCC2072 uart interface This commit
>> will add required Bluetooth firmware files for QCC2072 uart interface.
>>
>>   WHENCE            |  10 ++++++++++
>>   qca/ornbtfw11.tlv | Bin 0 -> 216274 bytes
>>   qca/ornnv11.bin   | Bin 0 -> 10880 bytes
>>   3 files changed, 10 insertions(+)
>>   create mode 100644 qca/ornbtfw11.tlv
>>   create mode 100644 qca/ornnv11.bin
>>
